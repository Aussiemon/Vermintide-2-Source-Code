﻿-- chunkname: @dialogues/generated/special_occasions_honduras.lua

return function ()
	define_rule({
		name = "pbr_gameplay_elf_downed_3_times_11",
		response = "pbr_gameplay_elf_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_all_stairs_conversation_b",
		response = "pbw_all_stairs_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_all_stairs_conversation_a_01",
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
		name = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_ameplay_soldier_potions_above_half_health_01_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_another_is_bunnyjumping_01",
		response = "pbw_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
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
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
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
		name = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
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
		name = "pbw_gameplay_elf_downed_3_times_02",
		response = "pbw_gameplay_elf_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_elf_downed_3_times_02_reply_01",
		response = "pbw_gameplay_elf_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_02_reply_01",
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
		name = "pbw_gameplay_elf_downed_3_times_05_reply_01",
		response = "pbw_gameplay_elf_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_05_reply_01",
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
		name = "pbw_gameplay_elf_downed_3_times_06",
		response = "pbw_gameplay_elf_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_elf_downed_3_times_06_reply_01",
		response = "pbw_gameplay_elf_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_06_reply_01",
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
		name = "pbw_gameplay_elf_downed_3_times_07",
		response = "pbw_gameplay_elf_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_elf_downed_3_times_07_reply_01",
		response = "pbw_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_07_reply_01",
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
		name = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		response = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
		response = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		response = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
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
		name = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
		response = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		response = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
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
		name = "pbw_gameplay_elf_killing_spawn_melee_01",
		response = "pbw_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_killing_spawn_ranged_01",
		response = "pbw_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_killing_troll_melee_01",
		response = "pbw_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_misses_bomb_01",
		response = "pbw_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pbw_gameplay_elf_potions_above_half_health_01",
		response = "pbw_gameplay_elf_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_01_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_02",
		response = "pbw_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_02_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_06",
		response = "pbw_gameplay_elf_potions_above_half_health_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_06_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hanging_help",
		response = "pbw_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		response = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
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
		name = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
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
		name = "pbw_gameplay_hunter_downed_3_times_02",
		response = "pbw_gameplay_hunter_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_hunter_downed_3_times_03",
		response = "pbw_gameplay_hunter_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_hunter_downed_3_times_04",
		response = "pbw_gameplay_hunter_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		response = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
		response = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
		response = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_killing_spawn_melee_01",
		response = "pbw_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		response = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_killing_troll_melee_01",
		response = "pbw_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
		response = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_hunter_misses_bomb_01",
		response = "pbw_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pbw_gameplay_killing_a_second_rat_ogre_01",
		response = "pbw_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_killing_rat_ogre_01",
		response = "pbw_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		response = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
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
		name = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pbw_gameplay_ranger_downed_3_times_07",
		response = "pbw_gameplay_ranger_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
		response = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_07_reply_01",
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
		name = "pbw_gameplay_ranger_downed_3_times_08",
		response = "pbw_gameplay_ranger_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
		response = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_08_reply_01",
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
		name = "pbw_gameplay_ranger_downed_3_times_09",
		response = "pbw_gameplay_ranger_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
		response = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_11_reply_01",
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
		name = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		response = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
		response = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
		response = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
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
		name = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
		response = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		response = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pbw_gameplay_ranger_killing_spawn_melee_01",
		response = "pbw_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		response = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_killing_troll_melee_01",
		response = "pbw_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_misses_bomb_01",
		response = "pbw_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pbw_gameplay_ranger_potions_above_half_health_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_02",
		response = "pbw_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_03",
		response = "pbw_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_043",
		response = "pbw_gameplay_response_043",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_078",
		response = "pbw_gameplay_response_078",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_082",
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
		name = "pbw_gameplay_response_079",
		response = "pbw_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_melee_01",
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
		name = "pbw_gameplay_response_07_b",
		response = "pbw_gameplay_response_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_06",
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
		name = "pbw_gameplay_response_08",
		response = "pbw_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_08",
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
		name = "pbw_gameplay_response_116",
		response = "pbw_gameplay_response_116",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_caught_by_slaver_3_times_02",
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
		name = "pbw_gameplay_response_117",
		response = "pbw_gameplay_response_117",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_123",
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
		name = "pbw_gameplay_response_118",
		response = "pbw_gameplay_response_118",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_125",
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
		name = "pbw_gameplay_response_119",
		response = "pbw_gameplay_response_119",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_caught_by_slaver_3_times_02",
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
		name = "pbw_gameplay_response_120",
		response = "pbw_gameplay_response_120",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_124",
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
		name = "pbw_gameplay_response_121",
		response = "pbw_gameplay_response_121",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_127",
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
		name = "pbw_gameplay_response_122",
		response = "pbw_gameplay_response_122",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_caught_by_slaver_3_times_02",
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
		name = "pbw_gameplay_response_123",
		response = "pbw_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_131",
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
		name = "pbw_gameplay_response_124",
		response = "pbw_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_caught_by_slaver_3_times_02",
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
		name = "pbw_gameplay_response_141",
		response = "pbw_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_melee_01",
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
		name = "pbw_gameplay_response_142",
		response = "pbw_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_146",
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
		name = "pbw_gameplay_response_144",
		response = "pbw_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_melee_01",
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
		name = "pbw_gameplay_response_145",
		response = "pbw_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_138",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_146",
		response = "pbw_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_melee_01",
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
		name = "pbw_gameplay_response_147",
		response = "pbw_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149",
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
		name = "pbw_gameplay_response_148",
		response = "pbw_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_melee_01",
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
		name = "pbw_gameplay_response_149",
		response = "pbw_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_ranged_01",
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
		name = "pbw_gameplay_response_150",
		response = "pbw_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_154",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_151",
		response = "pbw_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_156",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_152",
		response = "pbw_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_ranged_01",
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
		name = "pbw_gameplay_response_153",
		response = "pbw_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_147",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_154",
		response = "pbw_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_159",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_155",
		response = "pbw_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_162",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_156",
		response = "pbw_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_162",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_157",
		response = "pbw_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_ranged_01",
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
		name = "pbw_gameplay_response_174",
		response = "pbw_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_167",
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
		name = "pbw_gameplay_response_175",
		response = "pbw_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_melee_01",
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
		name = "pbw_gameplay_response_176",
		response = "pbw_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_melee_01",
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
		name = "pbw_gameplay_response_177",
		response = "pbw_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_180",
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
		name = "pbw_gameplay_response_178",
		response = "pbw_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_melee_01",
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
		name = "pbw_gameplay_response_179",
		response = "pbw_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_186",
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
		name = "pbw_gameplay_response_180",
		response = "pbw_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_melee_01",
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
		name = "pbw_gameplay_response_181",
		response = "pbw_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_176",
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
		name = "pbw_gameplay_response_182",
		response = "pbw_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_ranged_01",
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
		name = "pbw_gameplay_response_183",
		response = "pbw_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_ranged_01",
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
		name = "pbw_gameplay_response_184",
		response = "pbw_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_188",
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
		name = "pbw_gameplay_response_185",
		response = "pbw_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_ranged_01",
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
		name = "pbw_gameplay_response_186",
		response = "pbw_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_190",
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
		name = "pbw_gameplay_response_187",
		response = "pbw_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_195",
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
		name = "pbw_gameplay_response_188",
		response = "pbw_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_ranged_01",
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
		name = "pbw_gameplay_response_19",
		response = "pbw_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_misses_bomb_01",
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
		name = "pbw_gameplay_response_199",
		response = "pbw_gameplay_response_199",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_143",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_response_20",
		response = "pbw_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_misses_bomb_01",
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
		name = "pbw_gameplay_response_21",
		response = "pbw_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_misses_bomb_01",
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
		name = "pbw_gameplay_response_37",
		response = "pbw_gameplay_response_37",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_second_rat_ogre_01",
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
		name = "pbw_gameplay_response_38",
		response = "pbw_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_40",
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
		name = "pbw_gameplay_response_39",
		response = "pbw_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_38",
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
		name = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
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
		name = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
		response = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_05",
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
		name = "pbw_gameplay_soldier_downed_3_times_06",
		response = "pbw_gameplay_soldier_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_soldier_downed_3_times_07",
		response = "pbw_gameplay_soldier_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
		response = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_07_reply_01",
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
		name = "pbw_gameplay_soldier_downed_3_times_08",
		response = "pbw_gameplay_soldier_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
				"bright_wizard",
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2,
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
				"times_down_empire_soldier",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
		response = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
		response = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		response = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
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
		name = "pbw_gameplay_soldier_killing_spawn_melee_01",
		response = "pbw_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		response = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_killing_troll_melee_01",
		response = "pbw_gameplay_soldier_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_misses_bomb_01",
		response = "pbw_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pbw_gameplay_soldier_potions_above_half_health_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_02",
		response = "pbw_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_03",
		response = "pbw_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_3_special_kills_in_a_row_01",
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
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_3_special_kills_in_a_row_01",
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
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_3_special_kills_in_a_row_01",
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
		name = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_03",
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
		name = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_04",
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
		name = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_05",
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
		name = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_06",
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
		name = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_07",
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
		name = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_08",
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
		name = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_09",
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
		name = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_10",
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
		name = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_downed_3_times_11",
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
		name = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_downed_3_times_12",
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
		name = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
		response = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_14",
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
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_rat_ogre_melee_01",
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
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_rat_ogre_melee_01",
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
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_rat_ogre_melee_01",
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
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
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
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_rat_ogre_ranged_01",
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
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
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
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
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
		name = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		response = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
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
		name = "pbw_gameplay_wizard_potions_above_half_health_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_killing_a_second_rat_ogre_02",
		response = "pbw_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_all_stairs_conversation_a",
		response = "pdr_all_stairs_conversation_a",
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
				"this_way_stairs_up",
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7,
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
				"friends_close",
				OP.GT,
				1,
			},
			{
				"user_memory",
				"all_stairs_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMESET,
			},
			{
				"user_memory",
				"all_stairs_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_all_stairs_conversation_c",
		response = "pdr_all_stairs_conversation_c",
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
				"all_stairs_conversation_b",
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
		name = "pdr_gameplay_another_is_bunnyjumping_01",
		response = "pdr_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		response = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
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
		name = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
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
		name = "pdr_gameplay_elf_downed_3_times_12",
		response = "pdr_gameplay_elf_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_elf_downed_3_times_12_reply_01",
		response = "pdr_gameplay_elf_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_12_reply_01",
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
		name = "pdr_gameplay_elf_downed_3_times_13",
		response = "pdr_gameplay_elf_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_elf_downed_3_times_13_reply_01",
		response = "pdr_gameplay_elf_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_13_reply_01",
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
		name = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		response = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
		response = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
		response = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		response = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pdr_gameplay_elf_killing_spawn_melee_01",
		response = "pdr_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_killing_spawn_ranged_01",
		response = "pdr_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_killing_troll_melee_01",
		response = "pdr_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_misses_bomb_01",
		response = "pdr_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pdr_gameplay_elf_potions_above_half_health_02",
		response = "pdr_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_03",
		response = "pdr_gameplay_elf_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_04",
		response = "pdr_gameplay_elf_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hanging_help",
		response = "pdr_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		response = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_01",
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
		name = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
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
		name = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
		response = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_02_reply_01",
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
		name = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
		response = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_03_reply_01",
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
		name = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
		response = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_04_reply_01",
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
		name = "pdr_gameplay_hunter_downed_3_times_08",
		response = "pdr_gameplay_hunter_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
		response = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_08_reply_01",
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
		name = "pdr_gameplay_hunter_downed_3_times_09",
		response = "pdr_gameplay_hunter_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
		response = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_09_reply_01",
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
		name = "pdr_gameplay_hunter_downed_3_times_10",
		response = "pdr_gameplay_hunter_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
		response = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_10_reply_01",
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
		name = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
		response = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_11_reply_02",
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
		name = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		response = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
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
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
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
		name = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
		response = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		response = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_rat_ogre_ranged_01",
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
		name = "pdr_gameplay_hunter_killing_spawn_melee_01",
		response = "pdr_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		response = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_killing_troll_melee_01",
		response = "pdr_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_misses_bomb_01",
		response = "pdr_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pdr_gameplay_hunter_potions_above_half_health_02",
		response = "pdr_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_03",
		response = "pdr_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_04",
		response = "pdr_gameplay_hunter_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
		response = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_reply_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_i_will_tank",
		response = "pdr_gameplay_i_will_tank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"surrounded",
			},
			{
				"query_context",
				"has_shield",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				7,
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
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMEDIFF,
				OP.GT,
				1200,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		response = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"query_context",
				"weapon_type",
				OP.EQ,
				"dr_crossbow",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_killing_a_second_rat_ogre_01",
		response = "pdr_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_killing_a_second_rat_ogre_02",
		response = "pdr_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_3_special_kills_in_a_row_01",
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
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_3_special_kills_in_a_row_01",
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
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_3_special_kills_in_a_row_01",
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
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_3_special_kills_in_a_row_01",
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
		name = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_time_02",
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
		name = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_times_03",
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
		name = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_times_04",
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
		name = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_07",
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
		name = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_08",
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
		name = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_09",
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
		name = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_downed_3_times_10",
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
		name = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_11",
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
		name = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_12",
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
		name = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
		response = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_13",
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
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_hit_by_goo_thrice_00",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_hit_by_goo_thrice_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_hit_by_goo_thrice_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_hit_by_goo_thrice_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		response = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
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
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_rat_ogre_melee_01",
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
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_rat_ogre_melee_01",
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
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_rat_ogre_melee_01",
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
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
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
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
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
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
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
		name = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_03",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_03",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_03",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_04",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_044",
		response = "pdr_gameplay_response_044",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_054",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_045",
		response = "pdr_gameplay_response_045",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_055",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_046",
		response = "pdr_gameplay_response_046",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_056",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_050",
		response = "pdr_gameplay_response_050",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_043",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_053",
		response = "pdr_gameplay_response_053",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_043",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_054",
		response = "pdr_gameplay_response_054",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_044",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_07",
		response = "pdr_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_rat_ogre_01",
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
		name = "pdr_gameplay_response_079",
		response = "pdr_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_melee_01",
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
		name = "pdr_gameplay_response_080",
		response = "pdr_gameplay_response_080",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_079",
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
		name = "pdr_gameplay_response_125",
		response = "pdr_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_caught_by_slaver_3_times_02",
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
		name = "pdr_gameplay_response_126",
		response = "pdr_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_125",
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
		name = "pdr_gameplay_response_127",
		response = "pdr_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_caught_by_slaver_3_times_02",
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
		name = "pdr_gameplay_response_128",
		response = "pdr_gameplay_response_128",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_126",
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
		name = "pdr_gameplay_response_129",
		response = "pdr_gameplay_response_129",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_caught_by_slaver_3_times_02",
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
		name = "pdr_gameplay_response_130",
		response = "pdr_gameplay_response_130",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_128",
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
		name = "pdr_gameplay_response_131",
		response = "pdr_gameplay_response_131",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_caught_by_slaver_3_times_02",
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
		name = "pdr_gameplay_response_132",
		response = "pdr_gameplay_response_132",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_130",
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
		name = "pdr_gameplay_response_150",
		response = "pdr_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149",
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
		name = "pdr_gameplay_response_151",
		response = "pdr_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_melee_01",
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
		name = "pdr_gameplay_response_152",
		response = "pdr_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_150",
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
		name = "pdr_gameplay_response_153",
		response = "pdr_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_melee_01",
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
		name = "pdr_gameplay_response_154",
		response = "pdr_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149",
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
		name = "pdr_gameplay_response_155",
		response = "pdr_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_melee_01",
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
		name = "pdr_gameplay_response_156",
		response = "pdr_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_troll_ranged_01",
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
		name = "pdr_gameplay_response_157",
		response = "pdr_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_156",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_158",
		response = "pdr_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_ranged_01",
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
		name = "pdr_gameplay_response_159",
		response = "pdr_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_ranged_01",
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
		name = "pdr_gameplay_response_160",
		response = "pdr_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_ranged_01",
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
		name = "pdr_gameplay_response_161",
		response = "pdr_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_159",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_response_162",
		response = "pdr_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_ranged_01",
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
		name = "pdr_gameplay_response_163",
		response = "pdr_gameplay_response_163",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_157",
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
		name = "pdr_gameplay_response_17",
		response = "pdr_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_20",
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
		name = "pdr_gameplay_response_18",
		response = "pdr_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_13",
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
		name = "pdr_gameplay_response_180",
		response = "pdr_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_melee_01",
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
		name = "pdr_gameplay_response_181",
		response = "pdr_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_182",
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
		name = "pdr_gameplay_response_182",
		response = "pdr_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_melee_01",
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
		name = "pdr_gameplay_response_183",
		response = "pdr_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_178",
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
		name = "pdr_gameplay_response_184",
		response = "pdr_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_melee_01",
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
		name = "pdr_gameplay_response_185",
		response = "pdr_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_184",
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
		name = "pdr_gameplay_response_186",
		response = "pdr_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_melee_01",
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
		name = "pdr_gameplay_response_187",
		response = "pdr_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_180",
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
		name = "pdr_gameplay_response_188",
		response = "pdr_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_ranged_01",
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
		name = "pdr_gameplay_response_189",
		response = "pdr_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_183",
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
		name = "pdr_gameplay_response_19",
		response = "pdr_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_misses_bomb_01",
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
		name = "pdr_gameplay_response_190",
		response = "pdr_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_ranged_01",
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
		name = "pdr_gameplay_response_191",
		response = "pdr_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_178",
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
		name = "pdr_gameplay_response_192",
		response = "pdr_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_ranged_01",
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
		name = "pdr_gameplay_response_193",
		response = "pdr_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_192",
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
		name = "pdr_gameplay_response_194",
		response = "pdr_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_ranged_01",
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
		name = "pdr_gameplay_response_195",
		response = "pdr_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_188",
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
		name = "pdr_gameplay_response_20",
		response = "pdr_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_misses_bomb_01",
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
		name = "pdr_gameplay_response_21",
		response = "pdr_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_misses_bomb_01",
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
		name = "pdr_gameplay_response_22",
		response = "pdr_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_misses_bomb_01",
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
		name = "pdr_gameplay_response_23",
		response = "pdr_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_17",
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
		name = "pdr_gameplay_response_38",
		response = "pdr_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_30",
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
		name = "pdr_gameplay_response_39",
		response = "pdr_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_second_rat_ogre_02",
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
		name = "pdr_gameplay_response_40",
		response = "pdr_gameplay_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_a_second_rat_ogre_02",
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
		name = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		response = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
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
		name = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
		response = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		response = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
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
		name = "pdr_gameplay_soldier_downed_3_times_09",
		response = "pdr_gameplay_soldier_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_soldier_downed_3_times_10",
		response = "pdr_gameplay_soldier_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_soldier_downed_3_times_10_reply_01",
		response = "pdr_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_10_reply_01",
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
		name = "pdr_gameplay_soldier_downed_3_times_11",
		response = "pdr_gameplay_soldier_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_soldier_downed_3_times_11_reply_01",
		response = "pdr_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_11_reply_01",
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
		name = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
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
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
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
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
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
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
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
		name = "pdr_gameplay_soldier_killing_spawn_melee_01",
		response = "pdr_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		response = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_misses_bomb_01",
		response = "pdr_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pdr_gameplay_soldier_potions_above_half_health_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_02",
		response = "pdr_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
		response = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_03",
		response = "pdr_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		response = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
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
		name = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
		response = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_05_reply_01",
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
		name = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
		response = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_06_reply_01",
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
		name = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
		response = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_08_reply_01",
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
		name = "pdr_gameplay_wizard_downed_3_times_08",
		response = "pdr_gameplay_wizard_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_wizard_downed_3_times_09",
		response = "pdr_gameplay_wizard_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
		response = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_09_reply_01",
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
		name = "pdr_gameplay_wizard_downed_3_times_10",
		response = "pdr_gameplay_wizard_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		response = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"dot_type",
				OP.EQ,
				"burning_dot",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
		response = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
		response = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		response = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
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
		name = "pdr_gameplay_wizard_killing_spawn_melee_01",
		response = "pdr_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		response = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
		response = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_misses_bomb_01",
		response = "pdr_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pdr_gameplay_wizard_potions_above_half_health_01",
		response = "pdr_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_02",
		response = "pdr_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_03",
		response = "pdr_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_04",
		response = "pdr_gameplay_wizard_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_hunter_shoots_rat_ogre_01",
		response = "pdr_hunter_shoots_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
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
		name = "pes_all_stairs_conversation_b",
		response = "pes_all_stairs_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_all_stairs_conversation_a_01",
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
		name = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_another_is_bunnyjumping_01",
		response = "pes_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pes_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
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
		name = "pes_gameplay_elf_downed_3_times_08",
		response = "pes_gameplay_elf_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_elf_downed_3_times_08_reply_01",
		response = "pes_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_08_reply_01",
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
		name = "pes_gameplay_elf_downed_3_times_09",
		response = "pes_gameplay_elf_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_elf_downed_3_times_09_reply_01",
		response = "pes_gameplay_elf_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_09_reply_01",
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
		name = "pes_gameplay_elf_downed_3_times_10",
		response = "pes_gameplay_elf_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_elf_hit_by_goo_thrice_02",
		response = "pes_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_killing_rat_ogre_melee_01",
		response = "pes_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
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
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
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
		name = "pes_gameplay_elf_killing_spawn_melee_01",
		response = "pes_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_killing_spawn_ranged_01",
		response = "pes_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_killing_troll_melee_01",
		response = "pes_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_misses_bomb_01",
		response = "pes_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pes_gameplay_elf_potions_above_half_health_01",
		response = "pes_gameplay_elf_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
		response = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_01_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_02",
		response = "pes_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_02_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_03",
		response = "pes_gameplay_elf_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_03_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		response = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
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
		name = "pes_gameplay_hanging_help",
		response = "pes_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_071",
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
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
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
		name = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
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
		name = "pes_gameplay_hunter_downed_3_times_05",
		response = "pes_gameplay_hunter_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_hunter_downed_3_times_05_reply_01",
		response = "pes_gameplay_hunter_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_05_reply_01",
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
		name = "pes_gameplay_hunter_downed_3_times_06",
		response = "pes_gameplay_hunter_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_hunter_downed_3_times_07",
		response = "pes_gameplay_hunter_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_hunter_downed_3_times_07_reply_01",
		response = "pes_gameplay_hunter_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_07_reply_01",
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
		name = "pes_gameplay_hunter_hit_by_goo_thrice",
		response = "pes_gameplay_hunter_hit_by_goo_thrice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
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
		name = "pes_gameplay_hunter_killing_spawn_melee_01",
		response = "pes_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_killing_spawn_ranged_01",
		response = "pes_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_killing_troll_melee_01",
		response = "pes_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		response = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
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
		name = "pes_gameplay_hunter_misses_bomb_01",
		response = "pes_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pes_gameplay_hunter_potions_above_half_health_01",
		response = "pes_gameplay_hunter_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_02",
		response = "pes_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_03",
		response = "pes_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_i_will_tank",
		response = "pes_gameplay_i_will_tank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"surrounded",
			},
			{
				"query_context",
				"has_shield",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				7,
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
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMEDIFF,
				OP.GT,
				1200,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_killing_a_second_rat_ogre_01",
		response = "pes_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_killing_a_second_rat_ogre_02",
		response = "pes_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_killing_rat_ogre_01",
		response = "pes_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		response = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
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
		name = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pes_gameplay_ranger_downed_3_times_09_reply_01",
		response = "pes_gameplay_ranger_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_09_reply_01",
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
		name = "pes_gameplay_ranger_downed_3_times_10",
		response = "pes_gameplay_ranger_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		response = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		response = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
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
		name = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
		response = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
		response = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		response = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pes_gameplay_ranger_killing_spawn_melee_01",
		response = "pes_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_killing_spawn_ranged_01",
		response = "pes_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_misses_bomb_01",
		response = "pes_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pes_gameplay_ranger_potions_above_half_health_01",
		response = "pes_gameplay_ranger_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_02",
		response = "pes_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_03",
		response = "pes_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_response_04",
		response = "pes_gameplay_response_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_rat_ogre_01",
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
		name = "pes_gameplay_response_05",
		response = "pes_gameplay_response_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_rat_ogre_01",
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
		name = "pes_gameplay_response_071",
		response = "pes_gameplay_response_071",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_rat_ogre_melee_01",
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
		name = "pes_gameplay_response_112",
		response = "pes_gameplay_response_112",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_caught_by_slaver_3_times_two",
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
		name = "pes_gameplay_response_113",
		response = "pes_gameplay_response_113",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_124",
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
		name = "pes_gameplay_response_114",
		response = "pes_gameplay_response_114",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_caught_by_slaver_3_times_02",
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
		name = "pes_gameplay_response_115",
		response = "pes_gameplay_response_115",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_122",
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
		name = "pes_gameplay_response_116",
		response = "pes_gameplay_response_116",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_caught_by_slaver_3_times_02",
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
		name = "pes_gameplay_response_117",
		response = "pes_gameplay_response_117",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_23",
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
		name = "pes_gameplay_response_118",
		response = "pes_gameplay_response_118",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_caught_by_slaver_3_times_02",
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
		name = "pes_gameplay_response_119",
		response = "pes_gameplay_response_119",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_124",
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
		name = "pes_gameplay_response_13",
		response = "pes_gameplay_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_misses_bomb_01",
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
		name = "pes_gameplay_response_136",
		response = "pes_gameplay_response_136",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_melee_01",
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
		name = "pes_gameplay_response_137",
		response = "pes_gameplay_response_137",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_147",
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
		name = "pes_gameplay_response_138",
		response = "pes_gameplay_response_138",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_melee_01",
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
		name = "pes_gameplay_response_139",
		response = "pes_gameplay_response_139",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_146",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_response_14",
		response = "pes_gameplay_response_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_misses_bomb_01",
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
		name = "pes_gameplay_response_140",
		response = "pes_gameplay_response_140",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_153",
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
		name = "pes_gameplay_response_141",
		response = "pes_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_melee_01",
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
		name = "pes_gameplay_response_142",
		response = "pes_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_155",
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
		name = "pes_gameplay_response_143",
		response = "pes_gameplay_response_143",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_melee_01",
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
		name = "pes_gameplay_response_144",
		response = "pes_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_148",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_response_145",
		response = "pes_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_ranged_01",
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
		name = "pes_gameplay_response_146",
		response = "pes_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_155",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_response_147",
		response = "pes_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_ranged_01",
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
		name = "pes_gameplay_response_148",
		response = "pes_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_158",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_response_149",
		response = "pes_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_160",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_response_15",
		response = "pes_gameplay_response_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_misses_bomb_01",
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
		name = "pes_gameplay_response_150",
		response = "pes_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_ranged_01",
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
		name = "pes_gameplay_response_151",
		response = "pes_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_ranged_01",
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
		name = "pes_gameplay_response_16",
		response = "pes_gameplay_response_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_solider_misses_bomb_01",
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
		name = "pes_gameplay_response_167",
		response = "pes_gameplay_response_167",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_melee_01",
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
		name = "pes_gameplay_response_168",
		response = "pes_gameplay_response_168",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_178",
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
		name = "pes_gameplay_response_169",
		response = "pes_gameplay_response_169",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_182",
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
		name = "pes_gameplay_response_17",
		response = "pes_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_22",
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
		name = "pes_gameplay_response_170",
		response = "pes_gameplay_response_170",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_melee_01",
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
		name = "pes_gameplay_response_171",
		response = "pes_gameplay_response_171",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_182",
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
		name = "pes_gameplay_response_172",
		response = "pes_gameplay_response_172",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_184",
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
		name = "pes_gameplay_response_173",
		response = "pes_gameplay_response_173",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_melee_01",
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
		name = "pes_gameplay_response_174",
		response = "pes_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_melee_01",
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
		name = "pes_gameplay_response_175",
		response = "pes_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_187",
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
		name = "pes_gameplay_response_176",
		response = "pes_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_ranged_01",
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
		name = "pes_gameplay_response_177",
		response = "pes_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_188",
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
		name = "pes_gameplay_response_178",
		response = "pes_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_ranged_01",
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
		name = "pes_gameplay_response_179",
		response = "pes_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_185",
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
		name = "pes_gameplay_response_180",
		response = "pes_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_192",
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
		name = "pes_gameplay_response_181",
		response = "pes_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_ranged_01",
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
		name = "pes_gameplay_response_182",
		response = "pes_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_194",
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
		name = "pes_gameplay_response_183",
		response = "pes_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_ranged_01",
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
		name = "pes_gameplay_response_30",
		response = "pes_gameplay_response_30",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_second_rat_ogre_02",
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
		name = "pes_gameplay_response_31",
		response = "pes_gameplay_response_31",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_kiling_a_second_rat_ogre_01",
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
		name = "pes_gameplay_response_32",
		response = "pes_gameplay_response_32",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_41",
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
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_3_special_kills_in_a_row_01",
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
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_3_special_kills_in_a_row_01",
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
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_3_special_kills_in_a_row_01",
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
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_3_special_kills_in_a_row_02",
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
		name = "pes_gameplay_soldier_downed_3_times_02_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_02",
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
		name = "pes_gameplay_soldier_downed_3_times_04_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_04",
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
		name = "pes_gameplay_soldier_downed_3_times_06_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_06",
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
		name = "pes_gameplay_soldier_downed_3_times_07_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_07",
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
		name = "pes_gameplay_soldier_downed_3_times_08_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_08",
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
		name = "pes_gameplay_soldier_downed_3_times_09_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_09",
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
		name = "pes_gameplay_soldier_downed_3_times_10_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_10",
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
		name = "pes_gameplay_soldier_downed_3_times_11_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_11",
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
		name = "pes_gameplay_soldier_downed_3_times_12_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_12",
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
		name = "pes_gameplay_soldier_downed_3_times_13_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_13",
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
		name = "pes_gameplay_soldier_downed_3_times_reply_01",
		response = "pes_gameplay_soldier_downed_3_times_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_03",
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
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		response = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_rat_ogre_melee_01",
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
		name = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		response = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_rat_ogre_melee_01",
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
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
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
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
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
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
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
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
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
		name = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		response = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
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
		name = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pes_gameplay_wizard_downed_3_times_04_reply_01",
		response = "pes_gameplay_wizard_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_04_reply_01",
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
		name = "pes_gameplay_wizard_downed_3_times_05",
		response = "pes_gameplay_wizard_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
				"empire_soldier",
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2,
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
				"times_down_bright_wizard",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_downed_3_times_06",
		response = "pes_gameplay_wizard_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_wizard_downed_3_times_07",
		response = "pes_gameplay_wizard_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pes_gameplay_wizard_downed_3_times_07_reply_01",
		response = "pes_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_07_reply_01",
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
		name = "pes_gameplay_wizard_downed_3_times_12_reply_01",
		response = "pes_gameplay_wizard_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_12_reply_01",
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
		name = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
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
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
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
		name = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
		response = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_killing_spawn_melee_01",
		response = "pes_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_killing_spawn_ranged_01",
		response = "pes_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		response = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
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
		name = "pes_gameplay_wizard_misses_bomb_01",
		response = "pes_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pes_gameplay_wizard_potions_above_half_health_01",
		response = "pes_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_02",
		response = "pes_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_03",
		response = "pes_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_03_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwb_gameplay_response_18",
		response = "pwb_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_misses_bomb_01",
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
		name = "pwe_all_stairs_conversation_b",
		response = "pwe_all_stairs_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_all_stairs_conversation_a_01",
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
		name = "pwe_gameplay_another_is_bunnyjumping_01",
		response = "pwe_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_dwarf_picks_up_a_bomb",
		response = "pwe_gameplay_dwarf_picks_up_a_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_other_pickup",
			},
			{
				"query_context",
				"pickup_name",
				OP.EQ,
				"pickup_frag_grenade_t2",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_dwarf_picks_up_a_bomb",
				OP.TIMEDIFF,
				OP.GT,
				1800,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_picks_up_a_bomb",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_3_special_kills_in_a_row_01",
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
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_3_special_kills_in_a_row_01",
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
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_3_special_kills_in_a_row_01",
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
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_3_special_kills_in_a_row_01",
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
		name = "pwe_gameplay_elf_downed_3_times_02_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_02",
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
		name = "pwe_gameplay_elf_downed_3_times_03_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_03_azsd",
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
		name = "pwe_gameplay_elf_downed_3_times_04_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_04",
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
		name = "pwe_gameplay_elf_downed_3_times_05_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_05",
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
		name = "pwe_gameplay_elf_downed_3_times_06_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_06",
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
		name = "pwe_gameplay_elf_downed_3_times_07_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_07",
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
		name = "pwe_gameplay_elf_downed_3_times_08_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_08",
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
		name = "pwe_gameplay_elf_downed_3_times_09_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_09",
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
		name = "pwe_gameplay_elf_downed_3_times_10_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_10",
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
		name = "pwe_gameplay_elf_downed_3_times_11_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbr_gameplay_elf_downed_3_times_11",
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
		name = "pwe_gameplay_elf_downed_3_times_12_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_downed_3_times_12",
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
		name = "pwe_gameplay_elf_downed_3_times_13_reply_01",
		response = "pwe_gameplay_elf_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_downed_3_times_13",
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
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_rat_ogre_melee_01",
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
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_rat_ogre_melee_01",
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
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_rat_ogre_melee_01",
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
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_rat_ogre_ranged_01",
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
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_rat_ogre_ranged_01",
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
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_rat_ogre_ranged_01",
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
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_rat_ogre_ranged_01",
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
		name = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
		response = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
		response = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_06",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hanging_help",
		response = "pwe_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
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
		name = "pwe_gameplay_hunter_downed_3_times_06_reply_01",
		response = "pwe_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_06_reply_01",
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
		name = "pwe_gameplay_hunter_downed_3_times_11",
		response = "pwe_gameplay_hunter_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
		response = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_11_reply_01",
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
		name = "pwe_gameplay_hunter_downed_3_times_12",
		response = "pwe_gameplay_hunter_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_hunter_downed_3_times_13",
		response = "pwe_gameplay_hunter_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
		response = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_13_reply_01",
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
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_hit_by_goo_thrice_02",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
		response = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		response = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
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
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
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
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pwe_gameplay_hunter_killing_spawn_melee_01",
		response = "pwe_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		response = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_killing_troll_melee_01",
		response = "pwe_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_misses_bomb_01",
		response = "pwe_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwe_gameplay_hunter_potions_above_half_health_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_02",
		response = "pwe_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_03",
		response = "pwe_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
		response = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_kiling_a_second_rat_ogre_01",
		response = "pwe_gameplay_kiling_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_killing_a_rat_ogre_01",
		response = "pwe_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_killing_a_second_rat_ogre_02",
		response = "pwe_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
		response = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_04_reply_01",
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
		name = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
		response = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_10_reply_01",
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
		name = "pwe_gameplay_ranger_downed_3_times_11",
		response = "pwe_gameplay_ranger_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_ranger_downed_3_times_12",
		response = "pwe_gameplay_ranger_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
		response = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_12_reply_01",
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
		name = "pwe_gameplay_ranger_downed_3_times_13",
		response = "pwe_gameplay_ranger_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
		response = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_13_reply_01",
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
		name = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		response = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
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
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
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
		name = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
		response = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		response = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
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
		name = "pwe_gameplay_ranger_killing_spawn_melee_01",
		response = "pwe_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		response = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_killing_troll_melee_01",
		response = "pwe_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_misses_bomb_01",
		response = "pwe_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwe_gameplay_ranger_potions_above_half_health_02",
		response = "pwe_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_03",
		response = "pwe_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_04",
		response = "pwe_gameplay_ranger_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_054",
		response = "pwe_gameplay_response_054",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_055",
		response = "pwe_gameplay_response_055",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_056",
		response = "pwe_gameplay_response_056",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_04",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_07",
		response = "pwe_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_rat_ogre_crossbow_01",
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
		name = "pwe_gameplay_response_08",
		response = "pwe_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_rat_ogre_01",
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
		name = "pwe_gameplay_response_081",
		response = "pwe_gameplay_response_081",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_071",
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
		name = "pwe_gameplay_response_082",
		response = "pwe_gameplay_response_082",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_rat_ogre_melee_01",
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
		name = "pwe_gameplay_response_09",
		response = "pwe_gameplay_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_shoots_a_rat_ogre_01",
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
		name = "pwe_gameplay_response_123",
		response = "pwe_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_112",
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
		name = "pwe_gameplay_response_124",
		response = "pwe_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_caught_by_slaver_3_times_02",
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
		name = "pwe_gameplay_response_125",
		response = "pwe_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_caught_by_slaver_3_times_02",
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
		name = "pwe_gameplay_response_126",
		response = "pwe_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_119",
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
		name = "pwe_gameplay_response_127",
		response = "pwe_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_129",
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
		name = "pwe_gameplay_response_129",
		response = "pwe_gameplay_response_129",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_118",
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
		name = "pwe_gameplay_response_130",
		response = "pwe_gameplay_response_130",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_caught_by_slaver_3_times_02",
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
		name = "pwe_gameplay_response_147",
		response = "pwe_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_melee_01",
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
		name = "pwe_gameplay_response_148",
		response = "pwe_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_141",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_149",
		response = "pwe_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_melee_01",
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
		name = "pwe_gameplay_response_150",
		response = "pwe_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_148",
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
		name = "pwe_gameplay_response_151",
		response = "pwe_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_141",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_152",
		response = "pwe_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_melee_01",
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
		name = "pwe_gameplay_response_154",
		response = "pwe_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_melee_01",
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
		name = "pwe_gameplay_response_155",
		response = "pwe_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_ranged_01",
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
		name = "pwe_gameplay_response_156",
		response = "pwe_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_149",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_157",
		response = "pwe_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_ranged_01",
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
		name = "pwe_gameplay_response_158",
		response = "pwe_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_152",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_159",
		response = "pwe_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_ranged_01",
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
		name = "pwe_gameplay_response_160",
		response = "pwe_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_160",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_161",
		response = "pwe_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_151",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_response_162",
		response = "pwe_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_ranged_01",
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
		name = "pwe_gameplay_response_180",
		response = "pwe_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_melee_01",
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
		name = "pwe_gameplay_response_181",
		response = "pwe_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_175",
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
		name = "pwe_gameplay_response_182",
		response = "pwe_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_melee_01",
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
		name = "pwe_gameplay_response_183",
		response = "pwe_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_176",
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
		name = "pwe_gameplay_response_184",
		response = "pwe_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_173",
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
		name = "pwe_gameplay_response_185",
		response = "pwe_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_melee_01",
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
		name = "pwe_gameplay_response_186",
		response = "pwe_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_174",
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
		name = "pwe_gameplay_response_187",
		response = "pwe_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_melee_01",
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
		name = "pwe_gameplay_response_188",
		response = "pwe_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_ranged_01",
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
		name = "pwe_gameplay_response_189",
		response = "pwe_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_186",
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
		name = "pwe_gameplay_response_190",
		response = "pwe_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_188",
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
		name = "pwe_gameplay_response_191",
		response = "pwe_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_ranged_01",
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
		name = "pwe_gameplay_response_192",
		response = "pwe_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_ranged_01",
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
		name = "pwe_gameplay_response_193",
		response = "pwe_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_192",
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
		name = "pwe_gameplay_response_194",
		response = "pwe_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_183",
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
		name = "pwe_gameplay_response_195",
		response = "pwe_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_ranged_01",
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
		name = "pwe_gameplay_response_20",
		response = "pwe_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_19",
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
		name = "pwe_gameplay_response_21",
		response = "pwe_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_misses_bomb_01",
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
		name = "pwe_gameplay_response_22",
		response = "pwe_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_misses_bomb_01",
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
		name = "pwe_gameplay_response_23",
		response = "pwe_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_misses_bomb_01",
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
		name = "pwe_gameplay_response_24",
		response = "pwe_gameplay_response_24",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_misses_bomb_01",
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
		name = "pwe_gameplay_response_39",
		response = "pwe_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_36",
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
		name = "pwe_gameplay_response_40",
		response = "pwe_gameplay_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_a_second_rat_ogre_01",
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
		name = "pwe_gameplay_response_41",
		response = "pwe_gameplay_response_41",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_a_second_rat_ogre_01",
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
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
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
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
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
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_02",
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
		name = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
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
		name = "pwe_gameplay_soldier_downed_3_times_02",
		response = "pwe_gameplay_soldier_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
		response = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_06_reply_01",
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
		name = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
		response = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_08_reply_01",
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
		name = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
		response = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_09_reply_01",
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
		name = "pwe_gameplay_soldier_downed_3_times_12",
		response = "pwe_gameplay_soldier_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
		response = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_12_reply_01",
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
		name = "pwe_gameplay_soldier_downed_3_times_13",
		response = "pwe_gameplay_soldier_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
		response = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_13_reply_01",
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
		name = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
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
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_melee_01",
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
		name = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
		response = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		response = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pwe_gameplay_soldier_killing_spawn_melee_01",
		response = "pwe_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		response = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_misses_bomb_01",
		response = "pwe_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwe_gameplay_soldier_potions_above_half_health_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_01_reply_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_02",
		response = "pwe_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_03",
		response = "pwe_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pwe_gameplay_wizard_downed_3_times_11",
		response = "pwe_gameplay_wizard_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
		response = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_11_reply_01",
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
		name = "pwe_gameplay_wizard_downed_3_times_12",
		response = "pwe_gameplay_wizard_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
		response = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
		response = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_killing_spawn_melee_01",
		response = "pwe_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		response = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_misses_bomb_01",
		response = "pwe_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwe_gameplay_wizard_potions_above_half_health_01",
		response = "pwe_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_03",
		response = "pwe_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_all_stairs_conversation_b",
		response = "pwh_all_stairs_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_all_stairs_conversation_a_01",
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
		name = "pwh_gameplay_another_is_bunnyjumping_01",
		response = "pwh_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		response = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01",
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
		name = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
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
		name = "pwh_gameplay_elf_downed_3_times_03_azsd",
		response = "pwh_gameplay_elf_downed_3_times_03_azsd",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_elf_downed_3_times_03_reply_01",
		response = "pwh_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_03_reply_01",
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
		name = "pwh_gameplay_elf_downed_3_times_04",
		response = "pwh_gameplay_elf_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_elf_downed_3_times_04_reply_01",
		response = "pwh_gameplay_elf_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_04_reply_01",
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
		name = "pwh_gameplay_elf_downed_3_times_05",
		response = "pwh_gameplay_elf_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_elf_downed_3_times_10_reply_01",
		response = "pwh_gameplay_elf_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_10_reply_01",
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
		name = "pwh_gameplay_elf_downed_3_times_11_reply_01",
		response = "pwh_gameplay_elf_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_11_reply_01",
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
		name = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		response = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_07",
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
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
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
		name = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
		response = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_killing_spawn_melee_01",
		response = "pwh_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_killing_spawn_ranged_01",
		response = "pwh_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_killing_troll_melee_01",
		response = "pwh_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_elf_misses_bomb_01",
		response = "pwh_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwh_gameplay_hanging_help",
		response = "pwh_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_3_special_kills_in_a_row_01",
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
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_3_special_kills_in_a_row_01",
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
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_3_special_kills_in_a_row_01",
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
		name = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_02",
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
		name = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_03",
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
		name = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_04",
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
		name = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_05",
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
		name = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_06",
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
		name = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_07",
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
		name = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_08",
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
		name = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_09",
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
		name = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_10",
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
		name = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_11",
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
		name = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
		response = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_12",
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
		name = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
		response = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_13",
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
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_hit_by_goo_thrice_03",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_hit_by_goo_thrice",
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
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_rat_ogre_melee_01",
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
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_melee_01",
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
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_rat_ogre_melee_01",
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
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
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
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
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
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
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
		name = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		response = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
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
		name = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_04",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_killing_a_rat_ogre_01",
		response = "pwh_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_killing_a_second_rat_ogre_01",
		response = "pwh_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_killing_a_second_rat_ogre_02",
		response = "pwh_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
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
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
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
		name = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pwh_gameplay_ranger_downed_3_time_02",
		response = "pwh_gameplay_ranger_downed_3_time_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
		response = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_02_reply_01",
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
		name = "pwh_gameplay_ranger_downed_3_times_03",
		response = "pwh_gameplay_ranger_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
		response = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_03_reply_01",
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
		name = "pwh_gameplay_ranger_downed_3_times_04",
		response = "pwh_gameplay_ranger_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		response = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
		response = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
		response = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_rat_ogre_ranged_01",
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
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
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
		name = "pwh_gameplay_ranger_killing_spawn_melee_01",
		response = "pwh_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		response = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_troll_melee_01",
		response = "pwh_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_ranger_misses_bomb_01",
		response = "pwh_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwh_gameplay_response_043",
		response = "pwh_gameplay_response_043",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_044",
		response = "pwh_gameplay_response_044",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_06",
		response = "pwh_gameplay_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_fires_a_rat_ogre_01",
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
		name = "pwh_gameplay_response_071",
		response = "pwh_gameplay_response_071",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_3_special_kills_in_a_row_01",
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
		name = "pwh_gameplay_response_079",
		response = "pwh_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_079",
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
		name = "pwh_gameplay_response_08",
		response = "pwh_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hunter_shoots_rat_ogre_01",
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
		name = "pwh_gameplay_response_122",
		response = "pwh_gameplay_response_122",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_116",
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
		name = "pwh_gameplay_response_123",
		response = "pwh_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_caught_by_slaver_3_times_02",
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
		name = "pwh_gameplay_response_124",
		response = "pwh_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_caught_by_slaver_3_times_02",
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
		name = "pwh_gameplay_response_125",
		response = "pwh_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_114",
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
		name = "pwh_gameplay_response_126",
		response = "pwh_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_caught_by_slaver_3_times_02",
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
		name = "pwh_gameplay_response_127",
		response = "pwh_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_116",
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
		name = "pwh_gameplay_response_128",
		response = "pwh_gameplay_response_128",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_caught_by_slaver_3_times_02",
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
		name = "pwh_gameplay_response_145",
		response = "pwh_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_136",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_146",
		response = "pwh_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_melee_01",
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
		name = "pwh_gameplay_response_147",
		response = "pwh_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_144",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_148",
		response = "pwh_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_melee_01",
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
		name = "pwh_gameplay_response_149",
		response = "pwh_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_151",
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
		name = "pwh_gameplay_response_150",
		response = "pwh_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_melee_01",
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
		name = "pwh_gameplay_response_151",
		response = "pwh_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_152",
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
		name = "pwh_gameplay_response_152",
		response = "pwh_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_melee_01",
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
		name = "pwh_gameplay_response_153",
		response = "pwh_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_145",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_154",
		response = "pwh_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_ranged_01",
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
		name = "pwh_gameplay_response_155",
		response = "pwh_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_157",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_156",
		response = "pwh_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_ranged_01",
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
		name = "pwh_gameplay_response_157",
		response = "pwh_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_158",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_158",
		response = "pwh_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_ranged_01",
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
		name = "pwh_gameplay_response_159",
		response = "pwh_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_150",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_response_160",
		response = "pwh_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_ranged_01",
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
		name = "pwh_gameplay_response_177",
		response = "pwh_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_180",
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
		name = "pwh_gameplay_response_178",
		response = "pwh_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_melee_01",
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
		name = "pwh_gameplay_response_179",
		response = "pwh_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_180",
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
		name = "pwh_gameplay_response_180",
		response = "pwh_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_melee_01",
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
		name = "pwh_gameplay_response_181",
		response = "pwh_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_170",
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
		name = "pwh_gameplay_response_182",
		response = "pwh_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_melee_01",
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
		name = "pwh_gameplay_response_183",
		response = "pwh_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_185",
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
		name = "pwh_gameplay_response_184",
		response = "pwh_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_melee_01",
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
		name = "pwh_gameplay_response_185",
		response = "pwh_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_182",
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
		name = "pwh_gameplay_response_186",
		response = "pwh_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_ranged_01",
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
		name = "pwh_gameplay_response_187",
		response = "pwh_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_191",
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
		name = "pwh_gameplay_response_188",
		response = "pwh_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_ranged_01",
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
		name = "pwh_gameplay_response_189",
		response = "pwh_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_190",
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
		name = "pwh_gameplay_response_19",
		response = "pwh_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_misses_bomb_01",
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
		name = "pwh_gameplay_response_190",
		response = "pwh_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_ranged_01",
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
		name = "pwh_gameplay_response_191",
		response = "pwh_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_181",
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
		name = "pwh_gameplay_response_192",
		response = "pwh_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_ranged_01",
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
		name = "pwh_gameplay_response_20",
		response = "pwh_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_misses_bomb_01",
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
		name = "pwh_gameplay_response_21",
		response = "pwh_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_misses_bomb_01",
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
		name = "pwh_gameplay_response_22",
		response = "pwh_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_misses_bomb_01",
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
		name = "pwh_gameplay_response_23",
		response = "pwh_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_caught_by_slaver_3_times_02",
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
		name = "pwh_gameplay_response_36",
		response = "pwh_gameplay_response_36",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_second_rat_ogre_02",
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
		name = "pwh_gameplay_response_37_alt1",
		response = "pwh_gameplay_response_37_alt1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_37",
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
		name = "pwh_gameplay_response_38",
		response = "pwh_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_killing_a_second_rat_ogre_02",
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
		name = "pwh_gameplay_response_39",
		response = "pwh_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_39",
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
		name = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
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
		name = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
		response = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_02_reply_01",
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
		name = "pwh_gameplay_soldier_downed_3_times_03",
		response = "pwh_gameplay_soldier_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
				"witch_hunter",
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2,
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
				"times_down_empire_soldier",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_soldier_downed_3_times_04",
		response = "pwh_gameplay_soldier_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
		response = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_04_reply_01",
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
		name = "pwh_gameplay_soldier_downed_3_times_05",
		response = "pwh_gameplay_soldier_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
		response = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_05_reply_01",
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
		name = "pwh_gameplay_soldier_downed_3_times_reply_01",
		response = "pwh_gameplay_soldier_downed_3_times_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_reply_01",
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
		name = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
		response = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
		response = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_soldier_killing_spawn_melee_01",
		response = "pwh_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		response = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_solider_misses_bomb_01",
		response = "pwh_gameplay_solider_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		response = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
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
		name = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pwh_gameplay_wizard_downed_3_times_02",
		response = "pwh_gameplay_wizard_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
		response = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_02",
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
		name = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
		response = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_02_reply_01",
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
		name = "pwh_gameplay_wizard_downed_3_times_03",
		response = "pwh_gameplay_wizard_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
		response = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_03_reply_01",
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
		name = "pwh_gameplay_wizard_downed_3_times_04",
		response = "pwh_gameplay_wizard_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
				"witch_hunter",
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2,
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
		name = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
		response = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_10_reply_01",
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
		name = "pwh_gameplay_wizard_downed_3_times_14",
		response = "pwh_gameplay_wizard_downed_3_times_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times",
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
		name = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
		response = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_14_reply_01",
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
		name = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times",
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
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
		response = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
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
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
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
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
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
		name = "pwh_gameplay_wizard_killing_spawn_melee_01",
		response = "pwh_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		response = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy",
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn",
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged",
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_misses_bomb_01",
		response = "pwh_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp",
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
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
		name = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
		response = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03",
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
				"time_since_early_healing_draught",
				OP.TIMESET,
			},
		},
	})
	add_dialogues({
		pbr_gameplay_elf_downed_3_times_11 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbr_gameplay_elf_downed_3_times_11",
			},
			sound_events = {
				[1] = "pbr_gameplay_elf_downed_3_times_11",
			},
			sound_events_duration = {
				[1] = 1.6000000238419,
			},
		},
		pbw_all_stairs_conversation_b = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_all_stairs_conversation_b_01",
			},
			sound_events = {
				[1] = "pbw_all_stairs_conversation_b_01",
			},
			sound_events_duration = {
				[1] = 2.687979221344,
			},
		},
		pbw_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9230624437332,
			},
		},
		pbw_gameplay_another_is_bunnyjumping_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_another_is_bunnyjumping_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_another_is_bunnyjumping_01",
			},
			sound_events_duration = {
				[1] = 2.9307708740234,
			},
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 4.6877498626709,
			},
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.7639789581299,
			},
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 4.7536039352417,
			},
		},
		pbw_gameplay_elf_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 1.6358125209808,
			},
		},
		pbw_gameplay_elf_downed_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_downed_3_times_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_02",
			},
			sound_events_duration = {
				[1] = 1.7866666316986,
			},
		},
		pbw_gameplay_elf_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4622082710266,
			},
		},
		pbw_gameplay_elf_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 4.2043747901917,
			},
		},
		pbw_gameplay_elf_downed_3_times_06 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_downed_3_times_06",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_06",
			},
			sound_events_duration = {
				[1] = 4.0160207748413,
			},
		},
		pbw_gameplay_elf_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pbw_gameplay_elf_downed_3_times_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_downed_3_times_07",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_07",
			},
			sound_events_duration = {
				[1] = 2.3509166240692,
			},
		},
		pbw_gameplay_elf_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 1.0366666316986,
			},
		},
		pbw_gameplay_elf_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.4932084083557,
			},
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.2286250591278,
			},
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4873125553131,
			},
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.7350000143051,
			},
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4417500495911,
			},
		},
		pbw_gameplay_elf_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.5475833415985,
			},
		},
		pbw_gameplay_elf_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.6302083730698,
			},
		},
		pbw_gameplay_elf_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 3.2810208797455,
			},
		},
		pbw_gameplay_elf_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pbw_gameplay_elf_misses_bomb_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.604395866394,
			},
		},
		pbw_gameplay_elf_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 4.1975002288818,
			},
		},
		pbw_gameplay_elf_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.9071457386017,
			},
		},
		pbw_gameplay_elf_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.2466666698456,
			},
		},
		pbw_gameplay_elf_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.3800001144409,
			},
		},
		pbw_gameplay_elf_potions_above_half_health_06 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_potions_above_half_health_06",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_potions_above_half_health_06",
			},
			sound_events_duration = {
				[1] = 2.3719792366028,
			},
		},
		pbw_gameplay_elf_potions_above_half_health_06_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4987916946411,
			},
		},
		pbw_gameplay_hanging_help = {
			category = "player_alerts",
			database = "special_occasions_honduras",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06",
			},
			sound_events_duration = {
				1.9009791612625,
				1.270187497139,
				2.1469790935516,
				1.5290207862854,
				3.4056251049042,
				1.9411041736603,
			},
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 4.2738122940064,
			},
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
			},
			sound_events_duration = {
				[1] = 3.9008123874664,
			},
		},
		pbw_gameplay_hunter_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.0480625629425,
			},
		},
		pbw_gameplay_hunter_downed_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_downed_3_times_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_downed_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.6360416412353,
			},
		},
		pbw_gameplay_hunter_downed_3_times_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_downed_3_times_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_downed_3_times_03",
			},
			sound_events_duration = {
				[1] = 4.4993958473206,
			},
		},
		pbw_gameplay_hunter_downed_3_times_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_downed_3_times_04",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_downed_3_times_04",
			},
			sound_events_duration = {
				[1] = 4.6534376144409,
			},
		},
		pbw_gameplay_hunter_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.8500626087189,
			},
		},
		pbw_gameplay_hunter_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.8324167728424,
			},
		},
		pbw_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.9483957290649,
			},
		},
		pbw_gameplay_hunter_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.8561458587647,
			},
		},
		pbw_gameplay_hunter_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.997270822525,
			},
		},
		pbw_gameplay_hunter_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.6131250858307,
			},
		},
		pbw_gameplay_hunter_kills_3_specials_in_a_row_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
			},
			sound_events_duration = {
				[1] = 2.9089374542236,
			},
		},
		pbw_gameplay_hunter_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pbw_gameplay_hunter_misses_bomb_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_hunter_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 3.7887916564941,
			},
		},
		pbw_gameplay_killing_a_second_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 4.4454793930054,
			},
		},
		pbw_gameplay_killing_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_killing_rat_ogre_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_killing_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 3.1148540973663,
			},
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 3.9452917575836,
			},
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.5054793357849,
			},
		},
		pbw_gameplay_ranger_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.9493124485016,
			},
		},
		pbw_gameplay_ranger_downed_3_times_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_ranger_downed_3_times_07",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_downed_3_times_07",
			},
			sound_events_duration = {
				[1] = 1.7990416288376,
			},
		},
		pbw_gameplay_ranger_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8213124275208,
			},
		},
		pbw_gameplay_ranger_downed_3_times_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_ranger_downed_3_times_08",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_downed_3_times_08",
			},
			sound_events_duration = {
				[1] = 1.4792292118073,
			},
		},
		pbw_gameplay_ranger_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 1.853395819664,
			},
		},
		pbw_gameplay_ranger_downed_3_times_09 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_ranger_downed_3_times_09",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_downed_3_times_09",
			},
			sound_events_duration = {
				[1] = 3.8851873874664,
			},
		},
		pbw_gameplay_ranger_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0680415630341,
			},
		},
		pbw_gameplay_ranger_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.1665625572205,
			},
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.2539792060852,
			},
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8407502174377,
			},
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.7438333034515,
			},
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2016665935516,
			},
		},
		pbw_gameplay_ranger_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.7755208015442,
			},
		},
		pbw_gameplay_ranger_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.7862708568573,
			},
		},
		pbw_gameplay_ranger_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 1.6492916345596,
			},
		},
		pbw_gameplay_ranger_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_misses_bomb_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.56014585495,
			},
		},
		pbw_gameplay_ranger_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 1.7590416669846,
			},
		},
		pbw_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.7886457443237,
			},
		},
		pbw_gameplay_ranger_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 1.7240833044052,
			},
		},
		pbw_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0086250305176,
			},
		},
		pbw_gameplay_ranger_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 3.6804583072662,
			},
		},
		pbw_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3839166164398,
			},
		},
		pbw_gameplay_response_043 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_043",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_043",
			},
			sound_events_duration = {
				[1] = 0.53977084159851,
			},
		},
		pbw_gameplay_response_078 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_078",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_078",
			},
			sound_events_duration = {
				[1] = 2.1641666889191,
			},
		},
		pbw_gameplay_response_079 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_079",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_079",
			},
			sound_events_duration = {
				[1] = 2.2222292423248,
			},
		},
		pbw_gameplay_response_07_b = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_07_b",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_07_b",
			},
			sound_events_duration = {
				[1] = 2.9031875133514,
			},
		},
		pbw_gameplay_response_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_08",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_08",
			},
			sound_events_duration = {
				[1] = 2,
			},
		},
		pbw_gameplay_response_116 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_116",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_116",
			},
			sound_events_duration = {
				[1] = 2.5398540496826,
			},
		},
		pbw_gameplay_response_117 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_117",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_117",
			},
			sound_events_duration = {
				[1] = 3.5924167633057,
			},
		},
		pbw_gameplay_response_118 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_118",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_118",
			},
			sound_events_duration = {
				[1] = 2.7282707691193,
			},
		},
		pbw_gameplay_response_119 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_119",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_119",
			},
			sound_events_duration = {
				[1] = 3.3136250972748,
			},
		},
		pbw_gameplay_response_120 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_120",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_120",
			},
			sound_events_duration = {
				[1] = 3.4068541526794,
			},
		},
		pbw_gameplay_response_121 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_121",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_121",
			},
			sound_events_duration = {
				[1] = 1.9997291564941,
			},
		},
		pbw_gameplay_response_122 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_122",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_122",
			},
			sound_events_duration = {
				[1] = 2.3430209159851,
			},
		},
		pbw_gameplay_response_123 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_123",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_123",
			},
			sound_events_duration = {
				[1] = 2.6128542423248,
			},
		},
		pbw_gameplay_response_124 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_124",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_124",
			},
			sound_events_duration = {
				[1] = 1.7425625324249,
			},
		},
		pbw_gameplay_response_141 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_141",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_141",
			},
			sound_events_duration = {
				[1] = 1.7555416822434,
			},
		},
		pbw_gameplay_response_142 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_142",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_142",
			},
			sound_events_duration = {
				[1] = 2.090562582016,
			},
		},
		pbw_gameplay_response_144 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_144",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_144",
			},
			sound_events_duration = {
				[1] = 2.9440834522247,
			},
		},
		pbw_gameplay_response_145 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_145",
				[2] = "pwh_gameplay_soldier_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_145",
				[2] = "pwh_gameplay_soldier_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 0.88218748569489,
				[2] = 6.2334585189819,
			},
		},
		pbw_gameplay_response_146 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_146",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_146",
			},
			sound_events_duration = {
				[1] = 1.8703124523163,
			},
		},
		pbw_gameplay_response_147 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_147",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_147",
			},
			sound_events_duration = {
				[1] = 2.4578542709351,
			},
		},
		pbw_gameplay_response_148 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_148",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_148",
			},
			sound_events_duration = {
				[1] = 3.1942291259766,
			},
		},
		pbw_gameplay_response_149 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_149",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_149",
			},
			sound_events_duration = {
				[1] = 3.00816655159,
			},
		},
		pbw_gameplay_response_150 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_150",
				[2] = "pes_gameplay_hunter_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_150",
				[2] = "pes_gameplay_hunter_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.4987082481384,
				[2] = 2.0599687099457,
			},
		},
		pbw_gameplay_response_151 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_151",
				[2] = "pwe_gameplay_ranger_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_151",
				[2] = "pwe_gameplay_ranger_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 5.1344165802002,
				[2] = 4.4044165611267,
			},
		},
		pbw_gameplay_response_152 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_152",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_152",
			},
			sound_events_duration = {
				[1] = 5.2174792289734,
			},
		},
		pbw_gameplay_response_153 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_153",
				[2] = "pwh_gameplay_soldier_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_153",
				[2] = "pwh_gameplay_soldier_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.164083480835,
				[2] = 1.3996249437332,
			},
		},
		pbw_gameplay_response_154 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_154",
				[2] = "pwh_gameplay_wizard_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_154",
				[2] = "pwh_gameplay_wizard_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.3548958301544,
				[2] = 6.673291683197,
			},
		},
		pbw_gameplay_response_155 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_155",
				[2] = "pbw_gameplay_soldier_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_155",
				[2] = "pbw_gameplay_soldier_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.2663540840149,
				[2] = 1.6343749761581,
			},
		},
		pbw_gameplay_response_156 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_156",
				[2] = "pbw_gameplay_hunter_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_156",
				[2] = "pbw_gameplay_hunter_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.4592082500458,
				[2] = 2.3018333911896,
			},
		},
		pbw_gameplay_response_157 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_157",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_157",
			},
			sound_events_duration = {
				[1] = 4.733416557312,
			},
		},
		pbw_gameplay_response_174 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_174",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_174",
			},
			sound_events_duration = {
				[1] = 3.0672917366028,
			},
		},
		pbw_gameplay_response_175 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_175",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_175",
			},
			sound_events_duration = {
				[1] = 3.2624583244324,
			},
		},
		pbw_gameplay_response_176 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_176",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_176",
			},
			sound_events_duration = {
				[1] = 2.0192084312439,
			},
		},
		pbw_gameplay_response_177 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_177",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_177",
			},
			sound_events_duration = {
				[1] = 3.2646458148956,
			},
		},
		pbw_gameplay_response_178 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_178",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_178",
			},
			sound_events_duration = {
				[1] = 3.8267290592194,
			},
		},
		pbw_gameplay_response_179 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_179",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_179",
			},
			sound_events_duration = {
				[1] = 2.1684582233429,
			},
		},
		pbw_gameplay_response_180 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_180",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_180",
			},
			sound_events_duration = {
				[1] = 3.178750038147,
			},
		},
		pbw_gameplay_response_181 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_181",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_181",
			},
			sound_events_duration = {
				[1] = 2.5760624408722,
			},
		},
		pbw_gameplay_response_182 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_182",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_182",
			},
			sound_events_duration = {
				[1] = 2.6414375305176,
			},
		},
		pbw_gameplay_response_183 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_183",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_183",
			},
			sound_events_duration = {
				[1] = 2.4175624847412,
			},
		},
		pbw_gameplay_response_184 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_184",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_184",
			},
			sound_events_duration = {
				[1] = 2.5193123817444,
			},
		},
		pbw_gameplay_response_185 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_185",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_185",
			},
			sound_events_duration = {
				[1] = 4.7092914581299,
			},
		},
		pbw_gameplay_response_186 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_186",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_186",
			},
			sound_events_duration = {
				[1] = 1.4821457862854,
			},
		},
		pbw_gameplay_response_187 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_187",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_187",
			},
			sound_events_duration = {
				[1] = 4.5723123550415,
			},
		},
		pbw_gameplay_response_188 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_188",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_188",
			},
			sound_events_duration = {
				[1] = 2.2879791259766,
			},
		},
		pbw_gameplay_response_19 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_19",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_19",
			},
			sound_events_duration = {
				[1] = 2.4829165935516,
			},
		},
		pbw_gameplay_response_199 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_199",
				[2] = "pdr_gameplay_wizard_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gameplay_response_199",
				[2] = "pdr_gameplay_wizard_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 4.5523958206177,
				[2] = 3.3403542041779,
			},
		},
		pbw_gameplay_response_20 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pbw_gameplay_response_20",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_20",
			},
			sound_events_duration = {
				[1] = 0.34406250715256,
			},
		},
		pbw_gameplay_response_21 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pbw_gameplay_response_21",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_21",
			},
			sound_events_duration = {
				[1] = 3.6679792404175,
			},
		},
		pbw_gameplay_response_37 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_response_37",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_37",
			},
			sound_events_duration = {
				[1] = 1.7976666688919,
			},
		},
		pbw_gameplay_response_38 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pbw_gameplay_response_38",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_38",
			},
			sound_events_duration = {
				[1] = 2.7217292785645,
			},
		},
		pbw_gameplay_response_39 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pbw_gameplay_response_39",
			},
			sound_events = {
				[1] = "pbw_gameplay_response_39",
			},
			sound_events_duration = {
				[1] = 3.2757709026337,
			},
		},
		pbw_gameplay_soldier_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 3.5566458702087,
			},
		},
		pbw_gameplay_soldier_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 1.5707499980927,
			},
		},
		pbw_gameplay_soldier_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3886458873749,
			},
		},
		pbw_gameplay_soldier_downed_3_times_06 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_soldier_downed_3_times_06",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_downed_3_times_06",
			},
			sound_events_duration = {
				[1] = 1.9446874856949,
			},
		},
		pbw_gameplay_soldier_downed_3_times_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_soldier_downed_3_times_07",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_downed_3_times_07",
			},
			sound_events_duration = {
				[1] = 3.0608959197998,
			},
		},
		pbw_gameplay_soldier_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9615416526794,
			},
		},
		pbw_gameplay_soldier_downed_3_times_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_soldier_downed_3_times_08",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_downed_3_times_08",
			},
			sound_events_duration = {
				[1] = 3.9855208396912,
			},
		},
		pbw_gameplay_soldier_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.6776249408722,
			},
		},
		pbw_gameplay_soldier_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 1.7340625524521,
			},
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.2524583339691,
			},
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 4.796875,
			},
		},
		pbw_gameplay_soldier_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.5409166812897,
			},
		},
		pbw_gameplay_soldier_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.8342916965485,
			},
		},
		pbw_gameplay_soldier_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.0032708644867,
			},
		},
		pbw_gameplay_soldier_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_misses_bomb_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.8350625038147,
			},
		},
		pbw_gameplay_soldier_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 3.4156250953674,
			},
		},
		pbw_gameplay_soldier_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.2182083129883,
			},
		},
		pbw_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2707707881927,
			},
		},
		pbw_gameplay_soldier_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 3.6204373836517,
			},
		},
		pbw_gameplay_soldier_potions_above_half_health_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
			},
			sound_events_duration = {
				[1] = 4.4978542327881,
			},
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 5.5513124465942,
			},
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 4.2821249961853,
			},
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events_duration = {
				[1] = 3.4194791316986,
			},
		},
		pbw_gameplay_wizard_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 1.5737916231155,
			},
		},
		pbw_gameplay_wizard_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2802290916443,
			},
		},
		pbw_gameplay_wizard_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 1.3056458234787,
			},
		},
		pbw_gameplay_wizard_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 3.5474374294281,
			},
		},
		pbw_gameplay_wizard_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 4.7193331718445,
			},
		},
		pbw_gameplay_wizard_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 1.5013333559036,
			},
		},
		pbw_gameplay_wizard_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8117709159851,
			},
		},
		pbw_gameplay_wizard_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1496458053589,
			},
		},
		pbw_gameplay_wizard_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8894584178925,
			},
		},
		pbw_gameplay_wizard_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9481041431427,
			},
		},
		pbw_gameplay_wizard_downed_3_times_14_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1672916412353,
			},
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
			},
			sound_events_duration = {
				[1] = 5.0172915458679,
			},
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
			},
			sound_events_duration = {
				[1] = 4.3557291030884,
			},
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
			},
			sound_events_duration = {
				[1] = 6.6179790496826,
			},
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
			},
			sound_events_duration = {
				[1] = 7.0646247863769,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 2.184187412262,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.2191457748413,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 4.6143126487732,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1527500152588,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 5.5161457061768,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events_duration = {
				[1] = 1.6903749704361,
			},
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
			},
			sound_events_duration = {
				[1] = 3.9073750972748,
			},
		},
		pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.761833190918,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 2.9986040592194,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.4179999828339,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.8599584102631,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
			},
			sound_events_duration = {
				[1] = 1.9656250476837,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 3.9818959236145,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 2.0552499294281,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
			},
			sound_events_duration = {
				[1] = 2.6805624961853,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_04 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
			},
			sound_events_duration = {
				[1] = 3.0702500343323,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 1.090020775795,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.3347916603088,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			sound_events_duration = {
				[1] = 2.9589791297913,
			},
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
			},
			sound_events = {
				[1] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
			},
			sound_events_duration = {
				[1] = 2.0208957195282,
			},
		},
		pbw_killing_a_second_rat_ogre_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pbw_killing_a_second_rat_ogre_02",
			},
			sound_events = {
				[1] = "pbw_killing_a_second_rat_ogre_02",
			},
			sound_events_duration = {
				[1] = 4.8280000686645,
			},
		},
		pdr_all_stairs_conversation_a = {
			category = "guidance",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_all_stairs_conversation_a_01",
			},
			sound_events = {
				[1] = "pdr_all_stairs_conversation_a_01",
			},
			sound_events_duration = {
				[1] = 1.3824237585068,
			},
		},
		pdr_all_stairs_conversation_c = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_all_stairs_conversation_c_01",
			},
			sound_events = {
				[1] = "pdr_all_stairs_conversation_c_01",
			},
			sound_events_duration = {
				[1] = 2.7199790477753,
			},
		},
		pdr_gameplay_another_is_bunnyjumping_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_another_is_bunnyjumping_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_another_is_bunnyjumping_01",
			},
			sound_events_duration = {
				[1] = 3.8214375972748,
			},
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 2.912645816803,
			},
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1117708683014,
			},
		},
		pdr_gameplay_elf_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.5248334407806,
			},
		},
		pdr_gameplay_elf_downed_3_times_12 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_elf_downed_3_times_12",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_downed_3_times_12",
			},
			sound_events_duration = {
				[1] = 2.7075417041779,
			},
		},
		pdr_gameplay_elf_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0698957443237,
			},
		},
		pdr_gameplay_elf_downed_3_times_13 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_elf_downed_3_times_13",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_downed_3_times_13",
			},
			sound_events_duration = {
				[1] = 1.8666042089462,
			},
		},
		pdr_gameplay_elf_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 1.5163749456406,
			},
		},
		pdr_gameplay_elf_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.3202290534973,
			},
		},
		pdr_gameplay_elf_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.4140417575836,
			},
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.6352915763855,
			},
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8722500801086,
			},
		},
		pdr_gameplay_elf_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.4021875858307,
			},
		},
		pdr_gameplay_elf_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.1032083034515,
			},
		},
		pdr_gameplay_elf_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 3.6752083301544,
			},
		},
		pdr_gameplay_elf_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_elf_misses_bomb_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.140124797821,
			},
		},
		pdr_gameplay_elf_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 3.4939999580383,
			},
		},
		pdr_gameplay_elf_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 3.4214792251587,
			},
		},
		pdr_gameplay_elf_potions_above_half_health_04 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_elf_potions_above_half_health_04",
			},
			sound_events = {
				[1] = "pdr_gameplay_elf_potions_above_half_health_04",
			},
			sound_events_duration = {
				[1] = 2.7524583339691,
			},
		},
		pdr_gameplay_hanging_help = {
			category = "player_alerts",
			database = "special_occasions_honduras",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
			},
			sound_events_duration = {
				3.2312500476837,
				2.1472499370575,
				3.9923958778381,
				4.2404165267944,
				3.0713124275208,
				4.147979259491,
			},
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 2.6641874313355,
			},
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.1999998092651,
			},
		},
		pdr_gameplay_hunter_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.4855415821075,
			},
		},
		pdr_gameplay_hunter_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 5.143958568573,
			},
		},
		pdr_gameplay_hunter_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.6138334274292,
			},
		},
		pdr_gameplay_hunter_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 6.2201042175293,
			},
		},
		pdr_gameplay_hunter_downed_3_times_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_hunter_downed_3_times_08",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_08",
			},
			sound_events_duration = {
				[1] = 4.6560626029968,
			},
		},
		pdr_gameplay_hunter_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 4.4067707061768,
			},
		},
		pdr_gameplay_hunter_downed_3_times_09 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_hunter_downed_3_times_09",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_09",
			},
			sound_events_duration = {
				[1] = 6.3679165840149,
			},
		},
		pdr_gameplay_hunter_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3385207653046,
			},
		},
		pdr_gameplay_hunter_downed_3_times_10 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_hunter_downed_3_times_10",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_10",
			},
			sound_events_duration = {
				[1] = 3.1288542747498,
			},
		},
		pdr_gameplay_hunter_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 4.7848334312439,
			},
		},
		pdr_gameplay_hunter_downed_3_times_11_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
			},
			sound_events_duration = {
				[1] = 3.5777292251587,
			},
		},
		pdr_gameplay_hunter_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 4.0454998016357,
			},
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.6678333282471,
			},
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.7904584407806,
			},
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.9027082920074,
			},
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.8759167194366,
			},
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9027292728424,
			},
		},
		pdr_gameplay_hunter_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.4523334503174,
			},
		},
		pdr_gameplay_hunter_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.2255001068115,
			},
		},
		pdr_gameplay_hunter_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.9719791412353,
			},
		},
		pdr_gameplay_hunter_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_misses_bomb_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 3.9068748950958,
			},
		},
		pdr_gameplay_hunter_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.1261665821075,
			},
		},
		pdr_gameplay_hunter_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 3.5346667766571,
			},
		},
		pdr_gameplay_hunter_potions_above_half_health_04 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_potions_above_half_health_04",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_potions_above_half_health_04",
			},
			sound_events_duration = {
				[1] = 5.1474165916443,
			},
		},
		pdr_gameplay_hunter_potions_above_half_health_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1266875267029,
			},
		},
		pdr_gameplay_i_will_tank = {
			category = "player_feedback",
			database = "special_occasions_honduras",
			dialogue_animations_n = 14,
			face_animations_n = 14,
			randomize_indexes_n = 0,
			sound_events_n = 14,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pdr_gameplay_i_will_tank_05",
				"pdr_gameplay_i_will_tank_06",
				"pdr_gameplay_i_will_tank_07",
				"pdr_gameplay_i_will_tank_08",
				"pdr_gameplay_i_will_tank_09",
				"pdr_gameplay_i_will_tank_10",
				"pdr_gameplay_i_will_tank_11",
				"pdr_gameplay_i_will_tank_12",
				"pdr_gameplay_i_will_tank_13",
				"pdr_gameplay_i_will_tank_14",
				"pdr_gameplay_i_will_tank_19",
				"pdr_gameplay_i_will_tank_20",
				"pdr_gameplay_i_will_tank_21",
				"pdr_gameplay_i_will_tank_22",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_i_will_tank_05",
				"pdr_gameplay_i_will_tank_06",
				"pdr_gameplay_i_will_tank_07",
				"pdr_gameplay_i_will_tank_08",
				"pdr_gameplay_i_will_tank_09",
				"pdr_gameplay_i_will_tank_10",
				"pdr_gameplay_i_will_tank_11",
				"pdr_gameplay_i_will_tank_12",
				"pdr_gameplay_i_will_tank_13",
				"pdr_gameplay_i_will_tank_14",
				"pdr_gameplay_i_will_tank_19",
				"pdr_gameplay_i_will_tank_20",
				"pdr_gameplay_i_will_tank_21",
				"pdr_gameplay_i_will_tank_22",
			},
			sound_events_duration = {
				0.9707083106041,
				1.3009999990463,
				1.5660624504089,
				1.6919374465942,
				2.0709583759308,
				3.6010000705719,
				3.1816875934601,
				0.99308335781097,
				2.6746459007263,
				3.3945624828339,
				3.4331667423248,
				2.8991458415985,
				5.2690415382385,
				2.5870416164398,
			},
		},
		pdr_gameplay_killing_a_rat_ogre_crossbow_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
			},
			sound_events_duration = {
				[1] = 3.0934374332428,
			},
		},
		pdr_gameplay_killing_a_second_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 3.3102707862854,
			},
		},
		pdr_gameplay_killing_a_second_rat_ogre_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events_duration = {
				[1] = 4.6186456680298,
			},
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8450000286102,
			},
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 6.5630831718445,
			},
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events_duration = {
				[1] = 4.8357706069946,
			},
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
			},
			sound_events_duration = {
				[1] = 4.0424165725708,
			},
		},
		pdr_gameplay_ranger_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9051458835602,
			},
		},
		pdr_gameplay_ranger_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.2776875495911,
			},
		},
		pdr_gameplay_ranger_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8851666450501,
			},
		},
		pdr_gameplay_ranger_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4308540821075,
			},
		},
		pdr_gameplay_ranger_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 3.5422084331513,
			},
		},
		pdr_gameplay_ranger_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8877291679382,
			},
		},
		pdr_gameplay_ranger_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 2.6377291679382,
			},
		},
		pdr_gameplay_ranger_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0958542823791,
			},
		},
		pdr_gameplay_ranger_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 3.7350833415985,
			},
		},
		pdr_gameplay_ranger_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4392292499542,
			},
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
			},
			sound_events_duration = {
				[1] = 4.4626665115356,
			},
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.4529376029968,
			},
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
			},
			sound_events_duration = {
				[1] = 5.9522914886475,
			},
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
			},
			sound_events_duration = {
				[1] = 5.443895816803,
			},
		},
		pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1709792613983,
			},
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.9573333263397,
			},
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 2.3558125495911,
			},
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
			},
			sound_events_duration = {
				[1] = 4.245041847229,
			},
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.8371665477753,
			},
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.5020208358765,
			},
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events_duration = {
				[1] = 5.0286664962769,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4157917499542,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
			},
			sound_events_duration = {
				[1] = 5.4451456069946,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.557416677475,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 4.582145690918,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
			},
			sound_events_duration = {
				[1] = 2.9191875457764,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 5.3559165000916,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
			},
			sound_events_duration = {
				[1] = 1.5335208177566,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
			},
			sound_events_duration = {
				[1] = 4.3161668777466,
			},
		},
		pdr_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
			},
			sound_events_duration = {
				[1] = 1.3627916574478,
			},
		},
		pdr_gameplay_response_044 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_044",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_044",
			},
			sound_events_duration = {
				[1] = 3.8440208435059,
			},
		},
		pdr_gameplay_response_045 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_045",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_045",
			},
			sound_events_duration = {
				[1] = 2.4719998836517,
			},
		},
		pdr_gameplay_response_046 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_046",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_046",
			},
			sound_events_duration = {
				[1] = 2.125937461853,
			},
		},
		pdr_gameplay_response_050 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_050",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_050",
			},
			sound_events_duration = {
				[1] = 4.1062707901001,
			},
		},
		pdr_gameplay_response_053 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_053",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_053",
			},
			sound_events_duration = {
				[1] = 2.8137500286102,
			},
		},
		pdr_gameplay_response_054 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_054",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_054",
			},
			sound_events_duration = {
				[1] = 4.6996040344238,
			},
		},
		pdr_gameplay_response_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_07",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_07",
			},
			sound_events_duration = {
				[1] = 4.4634585380554,
			},
		},
		pdr_gameplay_response_079 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_079",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_079",
			},
			sound_events_duration = {
				[1] = 2.8851873874664,
			},
		},
		pdr_gameplay_response_080 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_080",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_080",
			},
			sound_events_duration = {
				[1] = 2.802791595459,
			},
		},
		pdr_gameplay_response_125 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_125",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_125",
			},
			sound_events_duration = {
				[1] = 2.2574167251587,
			},
		},
		pdr_gameplay_response_126 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_126",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_126",
			},
			sound_events_duration = {
				[1] = 3.3830208778381,
			},
		},
		pdr_gameplay_response_127 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_127",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_127",
			},
			sound_events_duration = {
				[1] = 3.5852708816528,
			},
		},
		pdr_gameplay_response_128 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_128",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_128",
			},
			sound_events_duration = {
				[1] = 4.9133543968201,
			},
		},
		pdr_gameplay_response_129 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_129",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_129",
			},
			sound_events_duration = {
				[1] = 2.6789166927338,
			},
		},
		pdr_gameplay_response_130 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_130",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_130",
			},
			sound_events_duration = {
				[1] = 4.3040418624878,
			},
		},
		pdr_gameplay_response_131 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_131",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_131",
			},
			sound_events_duration = {
				[1] = 3.0816457271576,
			},
		},
		pdr_gameplay_response_132 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_132",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_132",
			},
			sound_events_duration = {
				[1] = 2.4652082920074,
			},
		},
		pdr_gameplay_response_150 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_150",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_150",
			},
			sound_events_duration = {
				[1] = 3.0369167327881,
			},
		},
		pdr_gameplay_response_151 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_151",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_151",
			},
			sound_events_duration = {
				[1] = 3.6797082424164,
			},
		},
		pdr_gameplay_response_152 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_152",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_152",
			},
			sound_events_duration = {
				[1] = 2.8269166946411,
			},
		},
		pdr_gameplay_response_153 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_153",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_153",
			},
			sound_events_duration = {
				[1] = 2.4233541488648,
			},
		},
		pdr_gameplay_response_154 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_154",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_154",
			},
			sound_events_duration = {
				[1] = 4.0040001869202,
			},
		},
		pdr_gameplay_response_155 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_155",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_155",
			},
			sound_events_duration = {
				[1] = 2.8284165859222,
			},
		},
		pdr_gameplay_response_156 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_156",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_156",
			},
			sound_events_duration = {
				[1] = 2.9440417289734,
			},
		},
		pdr_gameplay_response_157 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_157",
				[2] = "pwe_gameplay_hunter_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gameplay_response_157",
				[2] = "pwe_gameplay_hunter_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.120374917984,
				[2] = 2.0093333721161,
			},
		},
		pdr_gameplay_response_158 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_158",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_158",
			},
			sound_events_duration = {
				[1] = 6.3713750839233,
			},
		},
		pdr_gameplay_response_159 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_159",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_159",
			},
			sound_events_duration = {
				[1] = 5.9873123168945,
			},
		},
		pdr_gameplay_response_160 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_160",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_160",
			},
			sound_events_duration = {
				[1] = 3.3836874961853,
			},
		},
		pdr_gameplay_response_161 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_161",
				[2] = "pdr_gameplay_elf_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gameplay_response_161",
				[2] = "pdr_gameplay_elf_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 5.8654789924622,
				[2] = 2.8445208072662,
			},
		},
		pdr_gameplay_response_162 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_162",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_162",
			},
			sound_events_duration = {
				[1] = 3.6843957901001,
			},
		},
		pdr_gameplay_response_163 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_163",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_163",
			},
			sound_events_duration = {
				[1] = 3.9491667747498,
			},
		},
		pdr_gameplay_response_17 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_17",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_17",
			},
			sound_events_duration = {
				[1] = 2.3195209503174,
			},
		},
		pdr_gameplay_response_18 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_18",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_18",
			},
			sound_events_duration = {
				[1] = 3.03870844841,
			},
		},
		pdr_gameplay_response_180 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_180",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_180",
			},
			sound_events_duration = {
				[1] = 3.2374999523163,
			},
		},
		pdr_gameplay_response_181 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_181",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_181",
			},
			sound_events_duration = {
				[1] = 2.5275626182556,
			},
		},
		pdr_gameplay_response_182 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_182",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_182",
			},
			sound_events_duration = {
				[1] = 3.5512082576752,
			},
		},
		pdr_gameplay_response_183 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_183",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_183",
			},
			sound_events_duration = {
				[1] = 4.3731875419617,
			},
		},
		pdr_gameplay_response_184 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_184",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_184",
			},
			sound_events_duration = {
				[1] = 1.6178125143051,
			},
		},
		pdr_gameplay_response_185 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_185",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_185",
			},
			sound_events_duration = {
				[1] = 4.1394376754761,
			},
		},
		pdr_gameplay_response_186 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_186",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_186",
			},
			sound_events_duration = {
				[1] = 3.9574167728424,
			},
		},
		pdr_gameplay_response_187 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_187",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_187",
			},
			sound_events_duration = {
				[1] = 2.5497500896454,
			},
		},
		pdr_gameplay_response_188 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_188",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_188",
			},
			sound_events_duration = {
				[1] = 3.5237708091736,
			},
		},
		pdr_gameplay_response_189 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_189",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_189",
			},
			sound_events_duration = {
				[1] = 1.8605624437332,
			},
		},
		pdr_gameplay_response_19 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_19",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_19",
			},
			sound_events_duration = {
				[1] = 2.7102916240692,
			},
		},
		pdr_gameplay_response_190 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_190",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_190",
			},
			sound_events_duration = {
				[1] = 2.6384999752045,
			},
		},
		pdr_gameplay_response_191 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_191",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_191",
			},
			sound_events_duration = {
				[1] = 3.9091458320618,
			},
		},
		pdr_gameplay_response_192 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_192",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_192",
			},
			sound_events_duration = {
				[1] = 2.9765207767487,
			},
		},
		pdr_gameplay_response_193 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_193",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_193",
			},
			sound_events_duration = {
				[1] = 3.3872082233429,
			},
		},
		pdr_gameplay_response_194 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_194",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_194",
			},
			sound_events_duration = {
				[1] = 3.0926876068115,
			},
		},
		pdr_gameplay_response_195 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_195",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_195",
			},
			sound_events_duration = {
				[1] = 2.0526666641235,
			},
		},
		pdr_gameplay_response_20 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_20",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_20",
			},
			sound_events_duration = {
				[1] = 3.9240000247955,
			},
		},
		pdr_gameplay_response_21 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_21",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_21",
			},
			sound_events_duration = {
				[1] = 3.0450832843781,
			},
		},
		pdr_gameplay_response_22 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_22",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_22",
			},
			sound_events_duration = {
				[1] = 2.3210833072662,
			},
		},
		pdr_gameplay_response_23 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_23",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_23",
			},
			sound_events_duration = {
				[1] = 0.49114581942558,
			},
		},
		pdr_gameplay_response_38 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_response_38",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_38",
			},
			sound_events_duration = {
				[1] = 3.7488958835602,
			},
		},
		pdr_gameplay_response_39 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_39",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_39",
			},
			sound_events_duration = {
				[1] = 2.368958234787,
			},
		},
		pdr_gameplay_response_40 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_gameplay_response_40",
			},
			sound_events = {
				[1] = "pdr_gameplay_response_40",
			},
			sound_events_duration = {
				[1] = 3.2379791736603,
			},
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.1999998092651,
			},
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
			},
			sound_events_duration = {
				[1] = 4.8414373397827,
			},
		},
		pdr_gameplay_soldier_caught_by_slaver_3_times_two = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
			},
			sound_events_duration = {
				[1] = 3.0596458911896,
			},
		},
		pdr_gameplay_soldier_downed_3_times_09 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_soldier_downed_3_times_09",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_downed_3_times_09",
			},
			sound_events_duration = {
				[1] = 2.8972084522247,
			},
		},
		pdr_gameplay_soldier_downed_3_times_10 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_soldier_downed_3_times_10",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_downed_3_times_10",
			},
			sound_events_duration = {
				[1] = 2.8430624008179,
			},
		},
		pdr_gameplay_soldier_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 4.9329791069031,
			},
		},
		pdr_gameplay_soldier_downed_3_times_11 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_soldier_downed_3_times_11",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_downed_3_times_11",
			},
			sound_events_duration = {
				[1] = 1.5148541927338,
			},
		},
		pdr_gameplay_soldier_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 3.6749792098999,
			},
		},
		pdr_gameplay_soldier_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.8996040821075,
			},
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.4712500572205,
			},
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 6.0801043510437,
			},
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 5.1979999542236,
			},
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.3073334693909,
			},
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.7451875209808,
			},
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.2474999427795,
			},
		},
		pdr_gameplay_soldier_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.4206874370575,
			},
		},
		pdr_gameplay_soldier_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.8858542442322,
			},
		},
		pdr_gameplay_soldier_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_misses_bomb_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.8095417022705,
			},
		},
		pdr_gameplay_soldier_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 3.6907708644867,
			},
		},
		pdr_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9445416927338,
			},
		},
		pdr_gameplay_soldier_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 4.520124912262,
			},
		},
		pdr_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 3.8580832481384,
			},
		},
		pdr_gameplay_soldier_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.231645822525,
			},
		},
		pdr_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2187917232513,
			},
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 1.4872916936874,
			},
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8754374980927,
			},
		},
		pdr_gameplay_wizard_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 1.9252500534058,
			},
		},
		pdr_gameplay_wizard_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 4.2715001106262,
			},
		},
		pdr_gameplay_wizard_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8710622787476,
			},
		},
		pdr_gameplay_wizard_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2005624771118,
			},
		},
		pdr_gameplay_wizard_downed_3_times_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_downed_3_times_08",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_08",
			},
			sound_events_duration = {
				[1] = 1.8218958377838,
			},
		},
		pdr_gameplay_wizard_downed_3_times_09 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_downed_3_times_09",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_09",
			},
			sound_events_duration = {
				[1] = 1.5728125572205,
			},
		},
		pdr_gameplay_wizard_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 5.4147500991821,
			},
		},
		pdr_gameplay_wizard_downed_3_times_10 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_downed_3_times_10",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_downed_3_times_10",
			},
			sound_events_duration = {
				[1] = 3.9230208396912,
			},
		},
		pdr_gameplay_wizard_fires_a_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 4.0513334274292,
			},
		},
		pdr_gameplay_wizard_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.7175834178925,
			},
		},
		pdr_gameplay_wizard_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.8180208206177,
			},
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.1301875114441,
			},
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
			},
			sound_events_duration = {
				[1] = 3.5350208282471,
			},
		},
		pdr_gameplay_wizard_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.9362709522247,
			},
		},
		pdr_gameplay_wizard_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.0931665897369,
			},
		},
		pdr_gameplay_wizard_kills_3_specials_in_a_row_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
			},
			sound_events_duration = {
				[1] = 3.8113541603088,
			},
		},
		pdr_gameplay_wizard_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_misses_bomb_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.7575626373291,
			},
		},
		pdr_gameplay_wizard_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 0.66906249523163,
			},
		},
		pdr_gameplay_wizard_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.0294582843781,
			},
		},
		pdr_gameplay_wizard_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.6358957290649,
			},
		},
		pdr_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			sound_events_duration = {
				[1] = 1.9025624990463,
			},
		},
		pdr_gameplay_wizard_potions_above_half_health_04 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pdr_gameplay_wizard_potions_above_half_health_04",
			},
			sound_events = {
				[1] = "pdr_gameplay_wizard_potions_above_half_health_04",
			},
			sound_events_duration = {
				[1] = 2.0555417537689,
			},
		},
		pdr_hunter_shoots_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pdr_hunter_shoots_rat_ogre_01",
			},
			sound_events = {
				[1] = "pdr_hunter_shoots_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 3.2000000476837,
			},
		},
		pes_all_stairs_conversation_b = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_all_stairs_conversation_b_01",
			},
			sound_events = {
				[1] = "pes_all_stairs_conversation_b_01",
			},
			sound_events_duration = {
				[1] = 2.9839999675751,
			},
		},
		pes_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1920208930969,
			},
		},
		pes_gameplay_another_is_bunnyjumping_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_another_is_bunnyjumping_01",
			},
			sound_events = {
				[1] = "pes_gameplay_another_is_bunnyjumping_01",
			},
			sound_events_duration = {
				[1] = 3.9320623874664,
			},
		},
		pes_gameplay_elf_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 2.4657082557678,
			},
		},
		pes_gameplay_elf_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.2053959369659,
			},
		},
		pes_gameplay_elf_downed_3_times_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_elf_downed_3_times_08",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_downed_3_times_08",
			},
			sound_events_duration = {
				[1] = 3.0694375038147,
			},
		},
		pes_gameplay_elf_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 0.77727085351944,
			},
		},
		pes_gameplay_elf_downed_3_times_09 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_elf_downed_3_times_09",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_downed_3_times_09",
			},
			sound_events_duration = {
				[1] = 2.3461666107178,
			},
		},
		pes_gameplay_elf_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 6.6962914466858,
			},
		},
		pes_gameplay_elf_downed_3_times_10 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_elf_downed_3_times_10",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_downed_3_times_10",
			},
			sound_events_duration = {
				[1] = 3.8644165992737,
			},
		},
		pes_gameplay_elf_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 1.7402291297913,
			},
		},
		pes_gameplay_elf_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 2.3893332481384,
			},
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.4060416221619,
			},
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 8.8636665344238,
			},
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 2.1070104837418,
			},
		},
		pes_gameplay_elf_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.5680832862854,
			},
		},
		pes_gameplay_elf_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.6365833282471,
			},
		},
		pes_gameplay_elf_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 4.1620626449585,
			},
		},
		pes_gameplay_elf_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_gameplay_elf_misses_bomb_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.2866249084473,
			},
		},
		pes_gameplay_elf_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 3.4710416793823,
			},
		},
		pes_gameplay_elf_potions_above_half_health_01_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.0903332233429,
			},
		},
		pes_gameplay_elf_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 4.6964998245239,
			},
		},
		pes_gameplay_elf_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.5083749294281,
			},
		},
		pes_gameplay_elf_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 3.2446458339691,
			},
		},
		pes_gameplay_elf_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8376460075378,
			},
		},
		pes_gameplay_elf_shoots_a_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_elf_shoots_a_rat_ogre_01",
			},
			sound_events = {
				[1] = "pes_gameplay_elf_shoots_a_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 2.0554165840149,
			},
		},
		pes_gameplay_hanging_help = {
			category = "player_alerts",
			database = "special_occasions_honduras",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06",
			},
			sound_events_duration = {
				1.7967916727066,
				1.9630000591278,
				2.0131666660309,
				1.4808541536331,
				2.4451458454132,
				2.6665208339691,
			},
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 3.8488854169846,
			},
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8635416030884,
			},
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.9385209083557,
			},
		},
		pes_gameplay_hunter_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.7427604198456,
			},
		},
		pes_gameplay_hunter_downed_3_times_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_downed_3_times_05",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_downed_3_times_05",
			},
			sound_events_duration = {
				[1] = 2.663229227066,
			},
		},
		pes_gameplay_hunter_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 2.6328645944595,
			},
		},
		pes_gameplay_hunter_downed_3_times_06 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_downed_3_times_06",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_downed_3_times_06",
			},
			sound_events_duration = {
				[1] = 2.2855312824249,
			},
		},
		pes_gameplay_hunter_downed_3_times_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_downed_3_times_07",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_downed_3_times_07",
			},
			sound_events_duration = {
				[1] = 1.1976249814033,
			},
		},
		pes_gameplay_hunter_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 2.6652500629425,
			},
		},
		pes_gameplay_hunter_hit_by_goo_thrice = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_hit_by_goo_thrice",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_hit_by_goo_thrice",
			},
			sound_events_duration = {
				[1] = 2.3996561765671,
			},
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.654833316803,
			},
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8832502365112,
			},
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.6585729122162,
			},
		},
		pes_gameplay_hunter_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.0395728945732,
			},
		},
		pes_gameplay_hunter_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.6683332920075,
			},
		},
		pes_gameplay_hunter_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 1.6237916946411,
			},
		},
		pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1944583654404,
			},
		},
		pes_gameplay_hunter_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_gameplay_hunter_misses_bomb_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 3.3298124074936,
			},
		},
		pes_gameplay_hunter_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 2.025927066803,
			},
		},
		pes_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0606875419617,
			},
		},
		pes_gameplay_hunter_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.9181354045868,
			},
		},
		pes_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 1.8532291650772,
			},
		},
		pes_gameplay_hunter_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.3023437261581,
			},
		},
		pes_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 4.6303958892822,
			},
		},
		pes_gameplay_i_will_tank = {
			category = "player_feedback",
			database = "special_occasions_honduras",
			dialogue_animations_n = 12,
			face_animations_n = 12,
			randomize_indexes_n = 0,
			sound_events_n = 12,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_gameplay_i_will_tank_05",
				"pes_gameplay_i_will_tank_06",
				"pes_gameplay_i_will_tank_07",
				"pes_gameplay_i_will_tank_08",
				"pes_gameplay_i_will_tank_09",
				"pes_gameplay_i_will_tank_10",
				"pes_gameplay_i_will_tank_11",
				"pes_gameplay_i_will_tank_12",
				"pes_gameplay_i_will_tank_13",
				"pes_gameplay_i_will_tank_14",
				"pes_gameplay_i_will_tank_15",
				"pes_gameplay_i_will_tank_16",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_i_will_tank_05",
				"pes_gameplay_i_will_tank_06",
				"pes_gameplay_i_will_tank_07",
				"pes_gameplay_i_will_tank_08",
				"pes_gameplay_i_will_tank_09",
				"pes_gameplay_i_will_tank_10",
				"pes_gameplay_i_will_tank_11",
				"pes_gameplay_i_will_tank_12",
				"pes_gameplay_i_will_tank_13",
				"pes_gameplay_i_will_tank_14",
				"pes_gameplay_i_will_tank_15",
				"pes_gameplay_i_will_tank_16",
			},
			sound_events_duration = {
				2.2811040878296,
				4.3625831604004,
				2.618979215622,
				1.9424166679382,
				3.7235834598541,
				1.0561666488648,
				3.5016250610352,
				2.1384375095367,
				2.952166557312,
				1.8544374704361,
				2.060604095459,
				1.960000038147,
			},
		},
		pes_gameplay_killing_a_second_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events = {
				[1] = "pes_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 1.8738125562668,
			},
		},
		pes_gameplay_killing_a_second_rat_ogre_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events = {
				[1] = "pes_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events_duration = {
				[1] = 2.3803124427795,
			},
		},
		pes_gameplay_killing_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_killing_rat_ogre_01",
			},
			sound_events = {
				[1] = "pes_gameplay_killing_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 2.1504166126251,
			},
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 2.8294167518616,
			},
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1559791564941,
			},
		},
		pes_gameplay_ranger_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 4.2881875038147,
			},
		},
		pes_gameplay_ranger_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 2.2741458415985,
			},
		},
		pes_gameplay_ranger_downed_3_times_10 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_ranger_downed_3_times_10",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_downed_3_times_10",
			},
			sound_events_duration = {
				[1] = 1.5859999656677,
			},
		},
		pes_gameplay_ranger_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_ranger_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.3396666049957,
			},
		},
		pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.8032187223434,
			},
		},
		pes_gameplay_ranger_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 2.9467916488648,
			},
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.026166677475,
			},
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.7706561684608,
			},
		},
		pes_gameplay_ranger_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.9082708358765,
			},
		},
		pes_gameplay_ranger_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.3619999885559,
			},
		},
		pes_gameplay_ranger_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_misses_bomb_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.3357915878296,
			},
		},
		pes_gameplay_ranger_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 2.3760416507721,
			},
		},
		pes_gameplay_ranger_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 4.4614791870117,
			},
		},
		pes_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2464375495911,
			},
		},
		pes_gameplay_ranger_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.4939167499542,
			},
		},
		pes_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 5.1782917976379,
			},
		},
		pes_gameplay_ranger_potions_above_half_health_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_ranger_potions_above_half_health_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_ranger_potions_above_half_health_reply_01",
			},
			sound_events_duration = {
				[1] = 5.452166557312,
			},
		},
		pes_gameplay_response_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_04",
			},
			sound_events = {
				[1] = "pes_gameplay_response_04",
			},
			sound_events_duration = {
				[1] = 2,
			},
		},
		pes_gameplay_response_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_05",
			},
			sound_events = {
				[1] = "pes_gameplay_response_05",
			},
			sound_events_duration = {
				[1] = 2.9708333015442,
			},
		},
		pes_gameplay_response_071 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_071",
			},
			sound_events = {
				[1] = "pes_gameplay_response_071",
			},
			sound_events_duration = {
				[1] = 2.9802498817444,
			},
		},
		pes_gameplay_response_112 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_112",
			},
			sound_events = {
				[1] = "pes_gameplay_response_112",
			},
			sound_events_duration = {
				[1] = 2.2666459083557,
			},
		},
		pes_gameplay_response_113 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_113",
			},
			sound_events = {
				[1] = "pes_gameplay_response_113",
			},
			sound_events_duration = {
				[1] = 4.037145614624,
			},
		},
		pes_gameplay_response_114 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_114",
			},
			sound_events = {
				[1] = "pes_gameplay_response_114",
			},
			sound_events_duration = {
				[1] = 2.005083322525,
			},
		},
		pes_gameplay_response_115 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_115",
			},
			sound_events = {
				[1] = "pes_gameplay_response_115",
			},
			sound_events_duration = {
				[1] = 2.3047292232513,
			},
		},
		pes_gameplay_response_116 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_116",
			},
			sound_events = {
				[1] = "pes_gameplay_response_116",
			},
			sound_events_duration = {
				[1] = 1.661812543869,
			},
		},
		pes_gameplay_response_117 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_117",
			},
			sound_events = {
				[1] = "pes_gameplay_response_117",
			},
			sound_events_duration = {
				[1] = 1.8982917070389,
			},
		},
		pes_gameplay_response_118 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_118",
			},
			sound_events = {
				[1] = "pes_gameplay_response_118",
			},
			sound_events_duration = {
				[1] = 1.589822947979,
			},
		},
		pes_gameplay_response_119 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_119",
			},
			sound_events = {
				[1] = "pes_gameplay_response_119",
			},
			sound_events_duration = {
				[1] = 0.90125000476837,
			},
		},
		pes_gameplay_response_13 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_gameplay_response_13",
			},
			sound_events = {
				[1] = "pes_gameplay_response_13",
			},
			sound_events_duration = {
				[1] = 2.0902707576752,
			},
		},
		pes_gameplay_response_136 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_136",
			},
			sound_events = {
				[1] = "pes_gameplay_response_136",
			},
			sound_events_duration = {
				[1] = 3.1050000190735,
			},
		},
		pes_gameplay_response_137 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_137",
			},
			sound_events = {
				[1] = "pes_gameplay_response_137",
			},
			sound_events_duration = {
				[1] = 2.6364583969116,
			},
		},
		pes_gameplay_response_138 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_138",
			},
			sound_events = {
				[1] = "pes_gameplay_response_138",
			},
			sound_events_duration = {
				[1] = 1.1015207767487,
			},
		},
		pes_gameplay_response_139 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_139",
				[2] = "pwh_gameplay_wizard_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gameplay_response_139",
				[2] = "pwh_gameplay_wizard_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.3132915496826,
				[2] = 5.0317916870117,
			},
		},
		pes_gameplay_response_14 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_14",
			},
			sound_events = {
				[1] = "pes_gameplay_response_14",
			},
			sound_events_duration = {
				[1] = 1.7819374799728,
			},
		},
		pes_gameplay_response_140 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_140",
			},
			sound_events = {
				[1] = "pes_gameplay_response_140",
			},
			sound_events_duration = {
				[1] = 3.2160415649414,
			},
		},
		pes_gameplay_response_141 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_141",
			},
			sound_events = {
				[1] = "pes_gameplay_response_141",
			},
			sound_events_duration = {
				[1] = 2.7400624752045,
			},
		},
		pes_gameplay_response_142 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_142",
			},
			sound_events = {
				[1] = "pes_gameplay_response_142",
			},
			sound_events_duration = {
				[1] = 1.839604139328,
			},
		},
		pes_gameplay_response_143 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_143",
			},
			sound_events = {
				[1] = "pes_gameplay_response_143",
			},
			sound_events_duration = {
				[1] = 3.2463854551315,
			},
		},
		pes_gameplay_response_144 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_144",
				[2] = "pbw_gameplay_elf_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gameplay_response_144",
				[2] = "pbw_gameplay_elf_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.5143959522247,
				[2] = 1.246749997139,
			},
		},
		pes_gameplay_response_145 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_145",
			},
			sound_events = {
				[1] = "pes_gameplay_response_145",
			},
			sound_events_duration = {
				[1] = 1.694000005722,
			},
		},
		pes_gameplay_response_146 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_146",
				[2] = "pes_gameplay_elf_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gameplay_response_146",
				[2] = "pes_gameplay_elf_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.7487291097641,
				[2] = 3.5201041698456,
			},
		},
		pes_gameplay_response_147 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_147",
			},
			sound_events = {
				[1] = "pes_gameplay_response_147",
			},
			sound_events_duration = {
				[1] = 3.8210833072662,
			},
		},
		pes_gameplay_response_148 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_148",
				[2] = "pbw_gameplay_ranger_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gameplay_response_148",
				[2] = "pbw_gameplay_ranger_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.309291601181,
				[2] = 2.2381875514984,
			},
		},
		pes_gameplay_response_149 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_149",
				[2] = "pes_gameplay_ranger_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gameplay_response_149",
				[2] = "pes_gameplay_ranger_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.6704375743866,
				[2] = 3.9827499389648,
			},
		},
		pes_gameplay_response_15 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_gameplay_response_15",
			},
			sound_events = {
				[1] = "pes_gameplay_response_15",
			},
			sound_events_duration = {
				[1] = 0.59985417127609,
			},
		},
		pes_gameplay_response_150 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_150",
			},
			sound_events = {
				[1] = "pes_gameplay_response_150",
			},
			sound_events_duration = {
				[1] = 2.5023334026337,
			},
		},
		pes_gameplay_response_151 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_151",
			},
			sound_events = {
				[1] = "pes_gameplay_response_151",
			},
			sound_events_duration = {
				[1] = 2.2842708826065,
			},
		},
		pes_gameplay_response_16 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_gameplay_response_16",
			},
			sound_events = {
				[1] = "pes_gameplay_response_16",
			},
			sound_events_duration = {
				[1] = 2.0083541870117,
			},
		},
		pes_gameplay_response_167 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_167",
			},
			sound_events = {
				[1] = "pes_gameplay_response_167",
			},
			sound_events_duration = {
				[1] = 3.1003959178925,
			},
		},
		pes_gameplay_response_168 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_168",
			},
			sound_events = {
				[1] = "pes_gameplay_response_168",
			},
			sound_events_duration = {
				[1] = 2.3744270801544,
			},
		},
		pes_gameplay_response_169 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_169",
			},
			sound_events = {
				[1] = "pes_gameplay_response_169",
			},
			sound_events_duration = {
				[1] = 2.2818541526794,
			},
		},
		pes_gameplay_response_17 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_17",
			},
			sound_events = {
				[1] = "pes_gameplay_response_17",
			},
			sound_events_duration = {
				[1] = 1.4541457891464,
			},
		},
		pes_gameplay_response_170 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_170",
			},
			sound_events = {
				[1] = "pes_gameplay_response_170",
			},
			sound_events_duration = {
				[1] = 4.3319582939148,
			},
		},
		pes_gameplay_response_171 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_171",
			},
			sound_events = {
				[1] = "pes_gameplay_response_171",
			},
			sound_events_duration = {
				[1] = 1.801541686058,
			},
		},
		pes_gameplay_response_172 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_172",
			},
			sound_events = {
				[1] = "pes_gameplay_response_172",
			},
			sound_events_duration = {
				[1] = 1.9857083559036,
			},
		},
		pes_gameplay_response_173 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_173",
			},
			sound_events = {
				[1] = "pes_gameplay_response_173",
			},
			sound_events_duration = {
				[1] = 3.2980208396912,
			},
		},
		pes_gameplay_response_174 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_174",
			},
			sound_events = {
				[1] = "pes_gameplay_response_174",
			},
			sound_events_duration = {
				[1] = 2.470999956131,
			},
		},
		pes_gameplay_response_175 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_175",
			},
			sound_events = {
				[1] = "pes_gameplay_response_175",
			},
			sound_events_duration = {
				[1] = 3.8216562271118,
			},
		},
		pes_gameplay_response_176 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_176",
			},
			sound_events = {
				[1] = "pes_gameplay_response_176",
			},
			sound_events_duration = {
				[1] = 3.2354791164398,
			},
		},
		pes_gameplay_response_177 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_177",
			},
			sound_events = {
				[1] = "pes_gameplay_response_177",
			},
			sound_events_duration = {
				[1] = 3.0534999370575,
			},
		},
		pes_gameplay_response_178 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_178",
			},
			sound_events = {
				[1] = "pes_gameplay_response_178",
			},
			sound_events_duration = {
				[1] = 2.5299792289734,
			},
		},
		pes_gameplay_response_179 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_179",
			},
			sound_events = {
				[1] = "pes_gameplay_response_179",
			},
			sound_events_duration = {
				[1] = 1.8786250352859,
			},
		},
		pes_gameplay_response_180 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_180",
			},
			sound_events = {
				[1] = "pes_gameplay_response_180",
			},
			sound_events_duration = {
				[1] = 2.6865000724792,
			},
		},
		pes_gameplay_response_181 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_181",
			},
			sound_events = {
				[1] = "pes_gameplay_response_181",
			},
			sound_events_duration = {
				[1] = 0.86416667699814,
			},
		},
		pes_gameplay_response_182 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_182",
			},
			sound_events = {
				[1] = "pes_gameplay_response_182",
			},
			sound_events_duration = {
				[1] = 2.6711459159851,
			},
		},
		pes_gameplay_response_183 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_183",
			},
			sound_events = {
				[1] = "pes_gameplay_response_183",
			},
			sound_events_duration = {
				[1] = 1.6016042232513,
			},
		},
		pes_gameplay_response_30 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_30",
			},
			sound_events = {
				[1] = "pes_gameplay_response_30",
			},
			sound_events_duration = {
				[1] = 2.5638332366943,
			},
		},
		pes_gameplay_response_31 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_response_31",
			},
			sound_events = {
				[1] = "pes_gameplay_response_31",
			},
			sound_events_duration = {
				[1] = 5.2017292976379,
			},
		},
		pes_gameplay_response_32 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_gameplay_response_32",
			},
			sound_events = {
				[1] = "pes_gameplay_response_32",
			},
			sound_events_duration = {
				[1] = 2.2151041030884,
			},
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.2964375019074,
			},
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.5561459064484,
			},
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events_duration = {
				[1] = 3.6928958892822,
			},
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
			},
			sound_events_duration = {
				[1] = 4.2556457519531,
			},
		},
		pes_gameplay_soldier_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0547292232513,
			},
		},
		pes_gameplay_soldier_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4489374160767,
			},
		},
		pes_gameplay_soldier_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 2.7580833435059,
			},
		},
		pes_gameplay_soldier_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9064373970032,
			},
		},
		pes_gameplay_soldier_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9910207986832,
			},
		},
		pes_gameplay_soldier_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1052916049957,
			},
		},
		pes_gameplay_soldier_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 1.5417499542236,
			},
		},
		pes_gameplay_soldier_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 2.0216457843781,
			},
		},
		pes_gameplay_soldier_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1971666812897,
			},
		},
		pes_gameplay_soldier_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 5.1735210418701,
			},
		},
		pes_gameplay_soldier_downed_3_times_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_downed_3_times_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_downed_3_times_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9089167118073,
			},
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.5431876182556,
			},
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
			},
			sound_events_duration = {
				[1] = 4.3284583091736,
			},
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
			},
			sound_events_duration = {
				[1] = 4.4720001220703,
			},
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
			},
			sound_events_duration = {
				[1] = 4.9079790115356,
			},
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.6573123931885,
			},
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 4.6185417175293,
			},
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.7419791221619,
			},
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.7526042461395,
			},
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events_duration = {
				[1] = 3.5913958549499,
			},
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
			},
			sound_events_duration = {
				[1] = 3.4094895124435,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.5639374256134,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
			},
			sound_events_duration = {
				[1] = 1.6365833282471,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.5426459312439,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 3.9870624542236,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
			},
			sound_events_duration = {
				[1] = 1.9096250534058,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8944375514984,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
			},
			sound_events_duration = {
				[1] = 3.0328333377838,
			},
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
			},
			sound_events = {
				[1] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
			},
			sound_events_duration = {
				[1] = 0.90499997138977,
			},
		},
		pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.7826042175293,
			},
		},
		pes_gameplay_wizard_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.2868332862854,
			},
		},
		pes_gameplay_wizard_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 2.5324583053589,
			},
		},
		pes_gameplay_wizard_downed_3_times_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_wizard_downed_3_times_05",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_downed_3_times_05",
			},
			sound_events_duration = {
				[1] = 2.8025417327881,
			},
		},
		pes_gameplay_wizard_downed_3_times_06 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_wizard_downed_3_times_06",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_downed_3_times_06",
			},
			sound_events_duration = {
				[1] = 1.1784374713898,
			},
		},
		pes_gameplay_wizard_downed_3_times_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_wizard_downed_3_times_07",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_downed_3_times_07",
			},
			sound_events_duration = {
				[1] = 2.7106041908264,
			},
		},
		pes_gameplay_wizard_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 1.5121666193008,
			},
		},
		pes_gameplay_wizard_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 4.0928750038147,
			},
		},
		pes_gameplay_wizard_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.1359374523163,
			},
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 4.277708530426,
			},
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 5.1121039390564,
			},
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 4.6368541717529,
			},
		},
		pes_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.6400625705719,
			},
		},
		pes_gameplay_wizard_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.0599167346954,
			},
		},
		pes_gameplay_wizard_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.0062084197998,
			},
		},
		pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.2518539428711,
			},
		},
		pes_gameplay_wizard_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_misses_bomb_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 3.0859167575836,
			},
		},
		pes_gameplay_wizard_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 1.925604224205,
			},
		},
		pes_gameplay_wizard_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.2004582881927,
			},
		},
		pes_gameplay_wizard_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.619916677475,
			},
		},
		pes_gameplay_wizard_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 3.814374923706,
			},
		},
		pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 4.767541885376,
			},
		},
		pes_gameplay_wizard_potions_above_half_health_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_gameplay_wizard_potions_above_half_health_reply_01",
			},
			sound_events = {
				[1] = "pes_gameplay_wizard_potions_above_half_health_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3370625972748,
			},
		},
		pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2809584140778,
			},
		},
		pwb_gameplay_response_18 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwb_gameplay_response_18",
			},
			sound_events = {
				[1] = "pwb_gameplay_response_18",
			},
			sound_events_duration = {
				[1] = 4.3848748207092,
			},
		},
		pwe_all_stairs_conversation_b = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_all_stairs_conversation_b_01",
			},
			sound_events = {
				[1] = "pwe_all_stairs_conversation_b_01",
			},
			sound_events_duration = {
				[1] = 1.5529999732971,
			},
		},
		pwe_gameplay_another_is_bunnyjumping_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_another_is_bunnyjumping_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_another_is_bunnyjumping_01",
			},
			sound_events_duration = {
				[1] = 5.4828124046326,
			},
		},
		pwe_gameplay_dwarf_picks_up_a_bomb = {
			category = "default",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_dwarf_picks_up_a_bomb_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_dwarf_picks_up_a_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.1708331108093,
			},
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 6.0397291183472,
			},
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.9196872711182,
			},
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 5.4831042289734,
			},
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
			},
			sound_events_duration = {
				[1] = 4.5519165992737,
			},
		},
		pwe_gameplay_elf_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 1.5234375,
			},
		},
		pwe_gameplay_elf_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1140625476837,
			},
		},
		pwe_gameplay_elf_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 2.7938332557678,
			},
		},
		pwe_gameplay_elf_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9858958721161,
			},
		},
		pwe_gameplay_elf_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 2.5591459274292,
			},
		},
		pwe_gameplay_elf_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3577709197998,
			},
		},
		pwe_gameplay_elf_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4996874332428,
			},
		},
		pwe_gameplay_elf_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 2.5948541164398,
			},
		},
		pwe_gameplay_elf_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 2.0016667842865,
			},
		},
		pwe_gameplay_elf_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4436457157135,
			},
		},
		pwe_gameplay_elf_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3637707233429,
			},
		},
		pwe_gameplay_elf_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 4.2945833206177,
			},
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.050666809082,
			},
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
			},
			sound_events_duration = {
				[1] = 4.3662085533142,
			},
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
			},
			sound_events_duration = {
				[1] = 5.0725002288818,
			},
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
			},
			sound_events_duration = {
				[1] = 4.7955622673035,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9346458911896,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 2.3932082653046,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
			},
			sound_events_duration = {
				[1] = 3.82847905159,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.6334373950958,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 2.2498333454132,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events_duration = {
				[1] = 4.7551875114441,
			},
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
			},
			sound_events_duration = {
				[1] = 5.2052083015442,
			},
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.8009374141693,
			},
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.8659167289734,
			},
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.3019790649414,
			},
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 3.3643124103546,
			},
		},
		pwe_gameplay_elf_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.7128958702087,
			},
		},
		pwe_gameplay_elf_potions_above_half_health_06_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
			},
			sound_events_duration = {
				[1] = 6.4049792289734,
			},
		},
		pwe_gameplay_hanging_help = {
			category = "player_alerts",
			database = "special_occasions_honduras",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06",
			},
			sound_events_duration = {
				3.2326250076294,
				3.2326250076294,
				1.8696249723434,
				1.6470416784286,
				1.9007707834244,
				3.8779792785645,
			},
		},
		pwe_gameplay_hunter_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 2.9366042613983,
			},
		},
		pwe_gameplay_hunter_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 4.1714792251587,
			},
		},
		pwe_gameplay_hunter_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 2.9105000495911,
			},
		},
		pwe_gameplay_hunter_downed_3_times_11 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_hunter_downed_3_times_11",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_downed_3_times_11",
			},
			sound_events_duration = {
				[1] = 3.7410624027252,
			},
		},
		pwe_gameplay_hunter_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2385416030884,
			},
		},
		pwe_gameplay_hunter_downed_3_times_12 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_hunter_downed_3_times_12",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_downed_3_times_12",
			},
			sound_events_duration = {
				[1] = 2.5054166316986,
			},
		},
		pwe_gameplay_hunter_downed_3_times_13 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_hunter_downed_3_times_13",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_downed_3_times_13",
			},
			sound_events_duration = {
				[1] = 5.2966876029968,
			},
		},
		pwe_gameplay_hunter_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1983332633972,
			},
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
			},
			sound_events_duration = {
				[1] = 3.157187461853,
			},
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.2459583282471,
			},
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 5.3647084236145,
			},
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.6820416450501,
			},
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 5.1680417060852,
			},
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.7981040477753,
			},
		},
		pwe_gameplay_hunter_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.9666666984558,
			},
		},
		pwe_gameplay_hunter_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 1.8144791126251,
			},
		},
		pwe_gameplay_hunter_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.9165832996368,
			},
		},
		pwe_gameplay_hunter_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 5.9340415000916,
			},
		},
		pwe_gameplay_hunter_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 5.4133543968201,
			},
		},
		pwe_gameplay_hunter_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 3.3083333969116,
			},
		},
		pwe_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.182062625885,
			},
		},
		pwe_gameplay_hunter_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.6435208320618,
			},
		},
		pwe_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4176042079926,
			},
		},
		pwe_gameplay_hunter_potions_above_half_health__reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
			},
			sound_events_duration = {
				[1] = 2.8994374275208,
			},
		},
		pwe_gameplay_kiling_a_second_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_kiling_a_second_rat_ogre_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_kiling_a_second_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 4.511833190918,
			},
		},
		pwe_gameplay_killing_a_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_killing_a_rat_ogre_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_killing_a_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 2.5700833797455,
			},
		},
		pwe_gameplay_killing_a_second_rat_ogre_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events_duration = {
				[1] = 3.7440209388733,
			},
		},
		pwe_gameplay_ranger_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 2.9564583301544,
			},
		},
		pwe_gameplay_ranger_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.6460626125336,
			},
		},
		pwe_gameplay_ranger_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 3.4090416431427,
			},
		},
		pwe_gameplay_ranger_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 4.9157290458679,
			},
		},
		pwe_gameplay_ranger_downed_3_times_11 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_ranger_downed_3_times_11",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_11",
			},
			sound_events_duration = {
				[1] = 3.6363749504089,
			},
		},
		pwe_gameplay_ranger_downed_3_times_12 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_ranger_downed_3_times_12",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_12",
			},
			sound_events_duration = {
				[1] = 2.4539792537689,
			},
		},
		pwe_gameplay_ranger_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 0.55156248807907,
			},
		},
		pwe_gameplay_ranger_downed_3_times_13 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_ranger_downed_3_times_13",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_13",
			},
			sound_events_duration = {
				[1] = 2.2494790554047,
			},
		},
		pwe_gameplay_ranger_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1627707481384,
			},
		},
		pwe_gameplay_ranger_hit_by_goo_thrice_00 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
			},
			sound_events_duration = {
				[1] = 5.127833366394,
			},
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 2.092916727066,
			},
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.1765832901001,
			},
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
			},
			sound_events_duration = {
				[1] = 3.8136665821075,
			},
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.2573747634888,
			},
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.7977709770203,
			},
		},
		pwe_gameplay_ranger_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.3161250352859,
			},
		},
		pwe_gameplay_ranger_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.2207708358765,
			},
		},
		pwe_gameplay_ranger_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.7956042289734,
			},
		},
		pwe_gameplay_ranger_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.726583480835,
			},
		},
		pwe_gameplay_ranger_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 2.4668333530426,
			},
		},
		pwe_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 5.2136664390564,
			},
		},
		pwe_gameplay_ranger_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.1974582672119,
			},
		},
		pwe_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.0106875896454,
			},
		},
		pwe_gameplay_ranger_potions_above_half_health_04 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_potions_above_half_health_04",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_potions_above_half_health_04",
			},
			sound_events_duration = {
				[1] = 3.3167707920074,
			},
		},
		pwe_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
			},
			sound_events_duration = {
				[1] = 2.6144790649414,
			},
		},
		pwe_gameplay_response_054 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_054",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_054",
			},
			sound_events_duration = {
				[1] = 1.8282916545868,
			},
		},
		pwe_gameplay_response_055 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_055",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_055",
			},
			sound_events_duration = {
				[1] = 3.2893540859222,
			},
		},
		pwe_gameplay_response_056 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_056",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_056",
			},
			sound_events_duration = {
				[1] = 3.1098749637604,
			},
		},
		pwe_gameplay_response_07 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_07",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_07",
			},
			sound_events_duration = {
				[1] = 4.7749581336975,
			},
		},
		pwe_gameplay_response_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_08",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_08",
			},
			sound_events_duration = {
				[1] = 3.0973958969116,
			},
		},
		pwe_gameplay_response_081 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_081",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_081",
			},
			sound_events_duration = {
				[1] = 2.0006248950958,
			},
		},
		pwe_gameplay_response_082 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_082",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_082",
			},
			sound_events_duration = {
				[1] = 2.6281249523163,
			},
		},
		pwe_gameplay_response_09 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_09",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_09",
			},
			sound_events_duration = {
				[1] = 4.6161665916443,
			},
		},
		pwe_gameplay_response_123 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_123",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_123",
			},
			sound_events_duration = {
				[1] = 4.3896040916443,
			},
		},
		pwe_gameplay_response_124 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_124",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_124",
			},
			sound_events_duration = {
				[1] = 2.7338540554047,
			},
		},
		pwe_gameplay_response_125 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_125",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_125",
			},
			sound_events_duration = {
				[1] = 3.0792915821075,
			},
		},
		pwe_gameplay_response_126 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_126",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_126",
			},
			sound_events_duration = {
				[1] = 2.0455832481384,
			},
		},
		pwe_gameplay_response_127 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_127",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_127",
			},
			sound_events_duration = {
				[1] = 2.51597905159,
			},
		},
		pwe_gameplay_response_129 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_129",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_129",
			},
			sound_events_duration = {
				[1] = 3.069479227066,
			},
		},
		pwe_gameplay_response_130 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_130",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_130",
			},
			sound_events_duration = {
				[1] = 3.9252917766571,
			},
		},
		pwe_gameplay_response_147 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_147",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_147",
			},
			sound_events_duration = {
				[1] = 4.4689373970032,
			},
		},
		pwe_gameplay_response_148 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_148",
				[2] = "pes_gameplay_wizard_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gameplay_response_148",
				[2] = "pes_gameplay_wizard_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 5.3911666870117,
				[2] = 1.8489583730698,
			},
		},
		pwe_gameplay_response_149 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_149",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_149",
			},
			sound_events_duration = {
				[1] = 3.9388542175293,
			},
		},
		pwe_gameplay_response_150 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_150",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_150",
			},
			sound_events_duration = {
				[1] = 1.2469375133514,
			},
		},
		pwe_gameplay_response_151 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_151",
				[2] = "pdr_gameplay_soldier_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gameplay_response_151",
				[2] = "pdr_gameplay_soldier_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.5986042022705,
				[2] = 6.2466039657593,
			},
		},
		pwe_gameplay_response_152 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_152",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_152",
			},
			sound_events_duration = {
				[1] = 2.9021458625794,
			},
		},
		pwe_gameplay_response_154 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_154",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_154",
			},
			sound_events_duration = {
				[1] = 3.3919582366943,
			},
		},
		pwe_gameplay_response_155 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_155",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_155",
			},
			sound_events_duration = {
				[1] = 3.0507500171661,
			},
		},
		pwe_gameplay_response_156 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_156",
				[2] = "pes_gameplay_wizard_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gameplay_response_156",
				[2] = "pes_gameplay_wizard_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.7527084350586,
				[2] = 2.239458322525,
			},
		},
		pwe_gameplay_response_157 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_157",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_157",
			},
			sound_events_duration = {
				[1] = 3.5322916507721,
			},
		},
		pwe_gameplay_response_158 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_158",
				[2] = "pwe_gameplay_wizard_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gameplay_response_158",
				[2] = "pwe_gameplay_wizard_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.7744791507721,
				[2] = 2.8671040534973,
			},
		},
		pwe_gameplay_response_159 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_159",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_159",
			},
			sound_events_duration = {
				[1] = 4.9488334655762,
			},
		},
		pwe_gameplay_response_160 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_160",
				[2] = "pdr_gameplay_hunter_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gameplay_response_160",
				[2] = "pdr_gameplay_hunter_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.9625415802002,
				[2] = 3.7712917327881,
			},
		},
		pwe_gameplay_response_161 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_161",
				[2] = "pdr_gameplay_wizard_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gameplay_response_161",
				[2] = "pdr_gameplay_wizard_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 7.3709998130798,
				[2] = 3.7340624332428,
			},
		},
		pwe_gameplay_response_162 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_162",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_162",
			},
			sound_events_duration = {
				[1] = 2.5483748912811,
			},
		},
		pwe_gameplay_response_180 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_180",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_180",
			},
			sound_events_duration = {
				[1] = 3.5412292480469,
			},
		},
		pwe_gameplay_response_181 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_181",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_181",
			},
			sound_events_duration = {
				[1] = 5.045437335968,
			},
		},
		pwe_gameplay_response_182 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_182",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_182",
			},
			sound_events_duration = {
				[1] = 4.1438331604004,
			},
		},
		pwe_gameplay_response_183 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_183",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_183",
			},
			sound_events_duration = {
				[1] = 3.7218749523163,
			},
		},
		pwe_gameplay_response_184 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_184",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_184",
			},
			sound_events_duration = {
				[1] = 3.7992498874664,
			},
		},
		pwe_gameplay_response_185 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_185",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_185",
			},
			sound_events_duration = {
				[1] = 3.3766875267029,
			},
		},
		pwe_gameplay_response_186 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_186",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_186",
			},
			sound_events_duration = {
				[1] = 3.298749923706,
			},
		},
		pwe_gameplay_response_187 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_187",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_187",
			},
			sound_events_duration = {
				[1] = 2.502729177475,
			},
		},
		pwe_gameplay_response_188 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_188",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_188",
			},
			sound_events_duration = {
				[1] = 3.6091666221619,
			},
		},
		pwe_gameplay_response_189 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_189",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_189",
			},
			sound_events_duration = {
				[1] = 2.1987500190735,
			},
		},
		pwe_gameplay_response_190 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_190",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_190",
			},
			sound_events_duration = {
				[1] = 3.2688748836517,
			},
		},
		pwe_gameplay_response_191 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_191",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_191",
			},
			sound_events_duration = {
				[1] = 3.8743541240692,
			},
		},
		pwe_gameplay_response_192 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_192",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_192",
			},
			sound_events_duration = {
				[1] = 3.0745000839233,
			},
		},
		pwe_gameplay_response_193 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_193",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_193",
			},
			sound_events_duration = {
				[1] = 2.6675000190735,
			},
		},
		pwe_gameplay_response_194 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_194",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_194",
			},
			sound_events_duration = {
				[1] = 4.5059585571289,
			},
		},
		pwe_gameplay_response_195 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_195",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_195",
			},
			sound_events_duration = {
				[1] = 2.1313126087189,
			},
		},
		pwe_gameplay_response_20 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_response_20",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_20",
			},
			sound_events_duration = {
				[1] = 4.8485207557678,
			},
		},
		pwe_gameplay_response_21 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_21",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_21",
			},
			sound_events_duration = {
				[1] = 0.80291664600372,
			},
		},
		pwe_gameplay_response_22 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_22",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_22",
			},
			sound_events_duration = {
				[1] = 1.2649375200272,
			},
		},
		pwe_gameplay_response_23 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_23",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_23",
			},
			sound_events_duration = {
				[1] = 1.6683332920075,
			},
		},
		pwe_gameplay_response_24 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_24",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_24",
			},
			sound_events_duration = {
				[1] = 2.723729133606,
			},
		},
		pwe_gameplay_response_39 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_39",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_39",
			},
			sound_events_duration = {
				[1] = 3.5257084369659,
			},
		},
		pwe_gameplay_response_40 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_40",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_40",
			},
			sound_events_duration = {
				[1] = 4.6742081642151,
			},
		},
		pwe_gameplay_response_41 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_gameplay_response_41",
			},
			sound_events = {
				[1] = "pwe_gameplay_response_41",
			},
			sound_events_duration = {
				[1] = 3.4262707233429,
			},
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 3.3301665782928,
			},
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 4.4446458816528,
			},
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.6792917251587,
			},
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
			},
			sound_events_duration = {
				[1] = 4.8394584655762,
			},
		},
		pwe_gameplay_soldier_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.6328959465027,
			},
		},
		pwe_gameplay_soldier_downed_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_downed_3_times_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.0639584064484,
			},
		},
		pwe_gameplay_soldier_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 2.2695832252502,
			},
		},
		pwe_gameplay_soldier_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4639375209808,
			},
		},
		pwe_gameplay_soldier_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1731562614441,
			},
		},
		pwe_gameplay_soldier_downed_3_times_12 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_downed_3_times_12",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_12",
			},
			sound_events_duration = {
				[1] = 3.5231459140778,
			},
		},
		pwe_gameplay_soldier_downed_3_times_12_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
			},
			sound_events_duration = {
				[1] = 3.6049375534058,
			},
		},
		pwe_gameplay_soldier_downed_3_times_13 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_downed_3_times_13",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_13",
			},
			sound_events_duration = {
				[1] = 3.1770000457764,
			},
		},
		pwe_gameplay_soldier_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 2.383749961853,
			},
		},
		pwe_gameplay_soldier_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.704062461853,
			},
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.2192499637604,
			},
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.7735209465027,
			},
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 2.0039374828339,
			},
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.7711873054504,
			},
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.5759167671204,
			},
		},
		pwe_gameplay_soldier_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.838427066803,
			},
		},
		pwe_gameplay_soldier_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.9452707767487,
			},
		},
		pwe_gameplay_soldier_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 4.9409790039063,
			},
		},
		pwe_gameplay_soldier_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 5.8331665992737,
			},
		},
		pwe_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.0899584293366,
			},
		},
		pwe_gameplay_soldier_potions_above_half_health_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_potions_above_half_health_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_potions_above_half_health_02",
			},
			sound_events_duration = {
				[1] = 4.3262915611267,
			},
		},
		pwe_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8168540000916,
			},
		},
		pwe_gameplay_soldier_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 0.67268747091293,
			},
		},
		pwe_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.7780208587647,
			},
		},
		pwe_gameplay_wizard_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 5.1773748397827,
			},
		},
		pwe_gameplay_wizard_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.0933332443237,
			},
		},
		pwe_gameplay_wizard_downed_3_times_11 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_wizard_downed_3_times_11",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_downed_3_times_11",
			},
			sound_events_duration = {
				[1] = 2.5652916431427,
			},
		},
		pwe_gameplay_wizard_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 2.1935832500458,
			},
		},
		pwe_gameplay_wizard_downed_3_times_12 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_wizard_downed_3_times_12",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_downed_3_times_12",
			},
			sound_events_duration = {
				[1] = 3.6698334217072,
			},
		},
		pwe_gameplay_wizard_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.3591458797455,
			},
		},
		pwe_gameplay_wizard_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 2.9731457233429,
			},
		},
		pwe_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.5692291259766,
			},
		},
		pwe_gameplay_wizard_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.0631041526794,
			},
		},
		pwe_gameplay_wizard_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.7967500686645,
			},
		},
		pwe_gameplay_wizard_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.6887917518616,
			},
		},
		pwe_gameplay_wizard_potions_above_half_health_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_potions_above_half_health_01",
			},
			sound_events_duration = {
				[1] = 4.1514792442322,
			},
		},
		pwe_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.7483958005905,
			},
		},
		pwe_gameplay_wizard_potions_above_half_health_03 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_potions_above_half_health_03",
			},
			sound_events_duration = {
				[1] = 2.7698125839233,
			},
		},
		pwe_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			sound_events = {
				[1] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
			},
			sound_events_duration = {
				[1] = 3.7039999961853,
			},
		},
		pwh_all_stairs_conversation_b = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_all_stairs_conversation_b_01",
			},
			sound_events = {
				[1] = "pwh_all_stairs_conversation_b_01",
			},
			sound_events_duration = {
				[1] = 1.8189791440964,
			},
		},
		pwh_gameplay_another_is_bunnyjumping_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_another_is_bunnyjumping_01_alt1",
			},
			sound_events = {
				[1] = "pwh_gameplay_another_is_bunnyjumping_01_alt1",
			},
			sound_events_duration = {
				[1] = 3.3018751144409,
			},
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 7.1352915763855,
			},
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 8.637770652771,
			},
		},
		pwh_gameplay_elf_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.9188542366028,
			},
		},
		pwh_gameplay_elf_downed_3_times_03_azsd = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_downed_3_times_03_azsd",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_03_azsd",
			},
			sound_events_duration = {
				[1] = 1.5489375591278,
			},
		},
		pwh_gameplay_elf_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 2.197562456131,
			},
		},
		pwh_gameplay_elf_downed_3_times_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_downed_3_times_04",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_04",
			},
			sound_events_duration = {
				[1] = 4.1674375534058,
			},
		},
		pwh_gameplay_elf_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 6.5744791030884,
			},
		},
		pwh_gameplay_elf_downed_3_times_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_downed_3_times_05",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_05",
			},
			sound_events_duration = {
				[1] = 2.8679583072662,
			},
		},
		pwh_gameplay_elf_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 1.6025208234787,
			},
		},
		pwh_gameplay_elf_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 3.3070833683014,
			},
		},
		pwh_gameplay_elf_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 2.6257083415985,
			},
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 2.5128126144409,
			},
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9681458473206,
			},
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 6.5475206375122,
			},
		},
		pwh_gameplay_elf_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.1682915687561,
			},
		},
		pwh_gameplay_elf_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.8351666927338,
			},
		},
		pwh_gameplay_elf_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.0333125591278,
			},
		},
		pwh_gameplay_elf_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_elf_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 1.9789375066757,
			},
		},
		pwh_gameplay_elf_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_elf_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_elf_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.9102499485016,
			},
		},
		pwh_gameplay_hanging_help = {
			category = "player_alerts",
			database = "special_occasions_honduras",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06",
			},
			sound_events_duration = {
				2.4445834159851,
				1.726083278656,
				1.9011458158493,
				1.6703333854675,
				2.4530000686645,
				3.1792917251587,
			},
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 6.3000001907349,
			},
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.2337501049042,
			},
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
			},
			sound_events_duration = {
				[1] = 5.9866456985474,
			},
		},
		pwh_gameplay_hunter_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.9809167385101,
			},
		},
		pwh_gameplay_hunter_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1791875362396,
			},
		},
		pwh_gameplay_hunter_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 4.5960416793823,
			},
		},
		pwh_gameplay_hunter_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 3.7393958568573,
			},
		},
		pwh_gameplay_hunter_downed_3_times_06_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
			},
			sound_events_duration = {
				[1] = 2.8827290534973,
			},
		},
		pwh_gameplay_hunter_downed_3_times_07_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
			},
			sound_events_duration = {
				[1] = 4.1999998092651,
			},
		},
		pwh_gameplay_hunter_downed_3_times_08_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
			},
			sound_events_duration = {
				[1] = 4.8912916183472,
			},
		},
		pwh_gameplay_hunter_downed_3_times_09_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1684167385101,
			},
		},
		pwh_gameplay_hunter_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 6.6896667480469,
			},
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
			},
			sound_events_duration = {
				[1] = 1.6566041707993,
			},
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
			},
			sound_events_duration = {
				[1] = 1.6430000066757,
			},
		},
		pwh_gameplay_hunter_downed_3_times_13_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
			},
			sound_events_duration = {
				[1] = 3.716875076294,
			},
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
			},
			sound_events_duration = {
				[1] = 6.8379373550415,
			},
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
			},
			sound_events_duration = {
				[1] = 7.660749912262,
			},
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
			},
			sound_events_duration = {
				[1] = 5.1526250839233,
			},
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
			},
			sound_events_duration = {
				[1] = 3.3154582977295,
			},
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
			},
			sound_events_duration = {
				[1] = 2.9014582633972,
			},
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 5.7169585227966,
			},
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 6.2349791526794,
			},
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events_duration = {
				[1] = 1.923708319664,
			},
		},
		pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
			},
			sound_events_duration = {
				[1] = 5.1630001068115,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.48672914505,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
			},
			sound_events_duration = {
				[1] = 5.8677916526794,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.746791601181,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 5.1656875610352,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 6,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
			},
			sound_events_duration = {
				[1] = 4.6509585380554,
			},
		},
		pwh_gameplay_hunter_potions_above_half_health_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
			},
			sound_events_duration = {
				[1] = 4.9445209503174,
			},
		},
		pwh_gameplay_killing_a_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_killing_a_rat_ogre_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_killing_a_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 2.6248958110809,
			},
		},
		pwh_gameplay_killing_a_second_rat_ogre_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_killing_a_second_rat_ogre_01",
			},
			sound_events_duration = {
				[1] = 2.1709792613983,
			},
		},
		pwh_gameplay_killing_a_second_rat_ogre_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_killing_a_second_rat_ogre_02",
			},
			sound_events_duration = {
				[1] = 3.5244584083557,
			},
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 5.9997291564941,
			},
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.37464594841,
			},
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
			},
			sound_events_duration = {
				[1] = 4.3812294006348,
			},
		},
		pwh_gameplay_ranger_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 2.774749994278,
			},
		},
		pwh_gameplay_ranger_downed_3_time_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_downed_3_time_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_downed_3_time_02",
			},
			sound_events_duration = {
				[1] = 1.4529999494553,
			},
		},
		pwh_gameplay_ranger_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.6878333091736,
			},
		},
		pwh_gameplay_ranger_downed_3_times_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_downed_3_times_03",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_downed_3_times_03",
			},
			sound_events_duration = {
				[1] = 2.1252915859222,
			},
		},
		pwh_gameplay_ranger_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 1.4722291231155,
			},
		},
		pwh_gameplay_ranger_downed_3_times_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_downed_3_times_04",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_downed_3_times_04",
			},
			sound_events_duration = {
				[1] = 2.4168124198914,
			},
		},
		pwh_gameplay_ranger_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 3.1285207271576,
			},
		},
		pwh_gameplay_ranger_killing_3_specials_in_a_row_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
			},
			sound_events_duration = {
				[1] = 4.5193333625794,
			},
		},
		pwh_gameplay_ranger_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 4.0380001068115,
			},
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.0772082805634,
			},
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
			},
			sound_events_duration = {
				[1] = 3.8038332462311,
			},
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
			},
			sound_events_duration = {
				[1] = 4.5530834197998,
			},
		},
		pwh_gameplay_ranger_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 2.8480625152588,
			},
		},
		pwh_gameplay_ranger_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.4751250743866,
			},
		},
		pwh_gameplay_ranger_killing_troll_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_killing_troll_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 2.5898332595825,
			},
		},
		pwh_gameplay_ranger_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_ranger_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_ranger_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 5.2872290611267,
			},
		},
		pwh_gameplay_response_043 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_043",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_043",
			},
			sound_events_duration = {
				[1] = 2.5246665477753,
			},
		},
		pwh_gameplay_response_044 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_044",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_044",
			},
			sound_events_duration = {
				[1] = 3.5562291145325,
			},
		},
		pwh_gameplay_response_06 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_06",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_06",
			},
			sound_events_duration = {
				[1] = 2.5328125953674,
			},
		},
		pwh_gameplay_response_071 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_071",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_071",
			},
			sound_events_duration = {
				[1] = 6.6868124008179,
			},
		},
		pwh_gameplay_response_079 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_079",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_079",
			},
			sound_events_duration = {
				[1] = 2.2911250591278,
			},
		},
		pwh_gameplay_response_08 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_08",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_08",
			},
			sound_events_duration = {
				[1] = 3.3361041545868,
			},
		},
		pwh_gameplay_response_122 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_122",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_122",
			},
			sound_events_duration = {
				[1] = 4.9498543739319,
			},
		},
		pwh_gameplay_response_123 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_123",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_123",
			},
			sound_events_duration = {
				[1] = 2.4564166069031,
			},
		},
		pwh_gameplay_response_124 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_124",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_124",
			},
			sound_events_duration = {
				[1] = 1.2771874666214,
			},
		},
		pwh_gameplay_response_125 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_125",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_125",
			},
			sound_events_duration = {
				[1] = 4.1724166870117,
			},
		},
		pwh_gameplay_response_126 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_126",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_126",
			},
			sound_events_duration = {
				[1] = 3.3977084159851,
			},
		},
		pwh_gameplay_response_127 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_127",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_127",
			},
			sound_events_duration = {
				[1] = 2.2607290744781,
			},
		},
		pwh_gameplay_response_128 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_128",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_128",
			},
			sound_events_duration = {
				[1] = 2.5255832672119,
			},
		},
		pwh_gameplay_response_145 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_145",
				[2] = "pwe_gameplay_soldier_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gameplay_response_145",
				[2] = "pwe_gameplay_soldier_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 3.5002915859222,
				[2] = 5.2760210037231,
			},
		},
		pwh_gameplay_response_146 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_146",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_146",
			},
			sound_events_duration = {
				[1] = 3.8003749847412,
			},
		},
		pwh_gameplay_response_147 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_147",
				[2] = "pwe_gameplay_wizard_killing_troll_melee_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gameplay_response_147",
				[2] = "pwe_gameplay_wizard_killing_troll_melee_01",
			},
			sound_events_duration = {
				[1] = 3.765625,
				[2] = 2.8948750495911,
			},
		},
		pwh_gameplay_response_148 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_148",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_148",
			},
			sound_events_duration = {
				[1] = 2.3770415782928,
			},
		},
		pwh_gameplay_response_149 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_149",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_149",
			},
			sound_events_duration = {
				[1] = 3.4189167022705,
			},
		},
		pwh_gameplay_response_150 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_150",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_150",
			},
			sound_events_duration = {
				[1] = 2.5112500190735,
			},
		},
		pwh_gameplay_response_151 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_151",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_151",
			},
			sound_events_duration = {
				[1] = 3.9551458358765,
			},
		},
		pwh_gameplay_response_152 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_152",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_152",
			},
			sound_events_duration = {
				[1] = 4.249979019165,
			},
		},
		pwh_gameplay_response_153 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_153",
				[2] = "pwe_gameplay_soldier_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gameplay_response_153",
				[2] = "pwe_gameplay_soldier_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.2950832843781,
				[2] = 4.4217500686645,
			},
		},
		pwh_gameplay_response_154 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_154",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_154",
			},
			sound_events_duration = {
				[1] = 3.8023750782013,
			},
		},
		pwh_gameplay_response_155 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_155",
				[2] = "pwh_gameplay_elf_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gameplay_response_155",
				[2] = "pwh_gameplay_elf_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.0076456069946,
				[2] = 3.8949999809265,
			},
		},
		pwh_gameplay_response_156 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_156",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_156",
			},
			sound_events_duration = {
				[1] = 4.2740626335144,
			},
		},
		pwh_gameplay_response_157 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_157",
				[2] = "pwh_gameplay_ranger_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gameplay_response_157",
				[2] = "pwh_gameplay_ranger_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.8428750038147,
				[2] = 2.9807915687561,
			},
		},
		pwh_gameplay_response_158 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_158",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_158",
			},
			sound_events_duration = {
				[1] = 2.9046459197998,
			},
		},
		pwh_gameplay_response_159 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_159",
				[2] = "pdr_gameplay_soldier_killing_troll_ranged_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gameplay_response_159",
				[2] = "pdr_gameplay_soldier_killing_troll_ranged_01",
			},
			sound_events_duration = {
				[1] = 5.3045415878296,
				[2] = 3.1486666202545,
			},
		},
		pwh_gameplay_response_160 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_160",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_160",
			},
			sound_events_duration = {
				[1] = 3.9597709178925,
			},
		},
		pwh_gameplay_response_177 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_177",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_177",
			},
			sound_events_duration = {
				[1] = 3.2476458549499,
			},
		},
		pwh_gameplay_response_178 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_178",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_178",
			},
			sound_events_duration = {
				[1] = 2.2531249523163,
			},
		},
		pwh_gameplay_response_179 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_179",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_179",
			},
			sound_events_duration = {
				[1] = 2.9971041679382,
			},
		},
		pwh_gameplay_response_180 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_180",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_180",
			},
			sound_events_duration = {
				[1] = 4.5721874237061,
			},
		},
		pwh_gameplay_response_181 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_181",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_181",
			},
			sound_events_duration = {
				[1] = 2.6921665668488,
			},
		},
		pwh_gameplay_response_182 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_182",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_182",
			},
			sound_events_duration = {
				[1] = 5.5471873283386,
			},
		},
		pwh_gameplay_response_183 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_183",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_183",
			},
			sound_events_duration = {
				[1] = 4.5426459312439,
			},
		},
		pwh_gameplay_response_184 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_184",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_184",
			},
			sound_events_duration = {
				[1] = 2.754625082016,
			},
		},
		pwh_gameplay_response_185 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_185",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_185",
			},
			sound_events_duration = {
				[1] = 5.7577500343323,
			},
		},
		pwh_gameplay_response_186 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_186",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_186",
			},
			sound_events_duration = {
				[1] = 4.0481877326965,
			},
		},
		pwh_gameplay_response_187 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_187",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_187",
			},
			sound_events_duration = {
				[1] = 2.3809790611267,
			},
		},
		pwh_gameplay_response_188 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_188",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_188",
			},
			sound_events_duration = {
				[1] = 3.0986042022705,
			},
		},
		pwh_gameplay_response_189 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_189",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_189",
			},
			sound_events_duration = {
				[1] = 2.1927292346954,
			},
		},
		pwh_gameplay_response_19 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_19",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_19",
			},
			sound_events_duration = {
				[1] = 3.0958333015442,
			},
		},
		pwh_gameplay_response_190 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_190",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_190",
			},
			sound_events_duration = {
				[1] = 4.4117293357849,
			},
		},
		pwh_gameplay_response_191 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_191",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_191",
			},
			sound_events_duration = {
				[1] = 3.7859165668488,
			},
		},
		pwh_gameplay_response_192 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_192",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_192",
			},
			sound_events_duration = {
				[1] = 3.2000000476837,
			},
		},
		pwh_gameplay_response_20 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_20",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_20",
			},
			sound_events_duration = {
				[1] = 2.1216042041779,
			},
		},
		pwh_gameplay_response_21 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_21",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_21",
			},
			sound_events_duration = {
				[1] = 2.3809583187103,
			},
		},
		pwh_gameplay_response_22 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_22",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_22",
			},
			sound_events_duration = {
				[1] = 2.9586040973663,
			},
		},
		pwh_gameplay_response_23 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_23",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_23",
			},
			sound_events_duration = {
				[1] = 2.9874792098999,
			},
		},
		pwh_gameplay_response_36 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_36",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_36",
			},
			sound_events_duration = {
				[1] = 4.0851874351502,
			},
		},
		pwh_gameplay_response_37_alt1 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_response_37_alt1",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_37_alt1",
			},
			sound_events_duration = {
				[1] = 2.7279999256134,
			},
		},
		pwh_gameplay_response_38 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_38",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_38",
			},
			sound_events_duration = {
				[1] = 3.7909791469574,
			},
		},
		pwh_gameplay_response_39 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_gameplay_response_39",
			},
			sound_events = {
				[1] = "pwh_gameplay_response_39",
			},
			sound_events_duration = {
				[1] = 1.5932500362396,
			},
		},
		pwh_gameplay_soldier_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 4.221604347229,
			},
		},
		pwh_gameplay_soldier_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.2036666870117,
			},
		},
		pwh_gameplay_soldier_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 2.0904583930969,
			},
		},
		pwh_gameplay_soldier_downed_3_times_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_soldier_downed_3_times_03",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_03",
			},
			sound_events_duration = {
				[1] = 5.2039375305176,
			},
		},
		pwh_gameplay_soldier_downed_3_times_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_soldier_downed_3_times_04",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_04",
			},
			sound_events_duration = {
				[1] = 3.4936666488648,
			},
		},
		pwh_gameplay_soldier_downed_3_times_04_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
			},
			sound_events_duration = {
				[1] = 3.9365208148956,
			},
		},
		pwh_gameplay_soldier_downed_3_times_05 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_soldier_downed_3_times_05",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_05",
			},
			sound_events_duration = {
				[1] = 2.3004999160767,
			},
		},
		pwh_gameplay_soldier_downed_3_times_05_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
			},
			sound_events_duration = {
				[1] = 4.3931250572205,
			},
		},
		pwh_gameplay_soldier_downed_3_times_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_downed_3_times_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_downed_3_times_reply_01",
			},
			sound_events_duration = {
				[1] = 1.9974792003632,
			},
		},
		pwh_gameplay_soldier_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 3.1761040687561,
			},
		},
		pwh_gameplay_soldier_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 5.3372502326965,
			},
		},
		pwh_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 4.6085624694824,
			},
		},
		pwh_gameplay_soldier_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.7417500019074,
			},
		},
		pwh_gameplay_soldier_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_soldier_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.170104265213,
			},
		},
		pwh_gameplay_solider_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_solider_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_solider_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 1.8142499923706,
			},
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
			},
			sound_events_duration = {
				[1] = 5.2274789810181,
			},
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
			},
			sound_events_duration = {
				[1] = 2.4483957290649,
			},
		},
		pwh_gameplay_wizard_caught_by_slaver_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.6046874523163,
			},
		},
		pwh_gameplay_wizard_downed_3_times_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_downed_3_times_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_02",
			},
			sound_events_duration = {
				[1] = 3.4063749313355,
			},
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
			},
			sound_events_duration = {
				[1] = 3.1465208530426,
			},
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
			},
			sound_events_duration = {
				[1] = 2.4023957252502,
			},
		},
		pwh_gameplay_wizard_downed_3_times_03 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_downed_3_times_03",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_03",
			},
			sound_events_duration = {
				[1] = 2.0427083969116,
			},
		},
		pwh_gameplay_wizard_downed_3_times_03_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
			},
			sound_events_duration = {
				[1] = 3.9895625114441,
			},
		},
		pwh_gameplay_wizard_downed_3_times_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_downed_3_times_04",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_04",
			},
			sound_events_duration = {
				[1] = 4.6729583740234,
			},
		},
		pwh_gameplay_wizard_downed_3_times_10_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
			},
			sound_events_duration = {
				[1] = 4.4037289619446,
			},
		},
		pwh_gameplay_wizard_downed_3_times_14 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_downed_3_times_14",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_14",
			},
			sound_events_duration = {
				[1] = 2.4786875247955,
			},
		},
		pwh_gameplay_wizard_downed_3_times_14_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
			},
			sound_events_duration = {
				[1] = 7.0014791488647,
			},
		},
		pwh_gameplay_wizard_hit_by_goo_thrice_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
			},
			sound_events_duration = {
				[1] = 3.6566667556763,
			},
		},
		pwh_gameplay_wizard_killing_rat_ogre_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
			},
			sound_events_duration = {
				[1] = 3.6843333244324,
			},
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
			},
			sound_events_duration = {
				[1] = 2.956333398819,
			},
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
			},
			sound_events_duration = {
				[1] = 6.3587498664856,
			},
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
			},
			sound_events_duration = {
				[1] = 7.8318958282471,
			},
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
			},
			sound_events_duration = {
				[1] = 9.8933334350586,
			},
		},
		pwh_gameplay_wizard_killing_spawn_melee_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_spawn_melee_01",
			},
			sound_events_duration = {
				[1] = 1.7556874752045,
			},
		},
		pwh_gameplay_wizard_killing_spawn_ranged_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_killing_spawn_ranged_01",
			},
			sound_events_duration = {
				[1] = 3.736624956131,
			},
		},
		pwh_gameplay_wizard_misses_bomb_01 = {
			category = "special_occasion",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_misses_bomb_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_misses_bomb_01",
			},
			sound_events_duration = {
				[1] = 2.9468123912811,
			},
		},
		pwh_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
			},
			sound_events_duration = {
				[1] = 1.8165208101273,
			},
		},
		pwh_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
			},
			sound_events_duration = {
				[1] = 2.943437576294,
			},
		},
		pwh_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			category = "casual_talk",
			database = "special_occasions_honduras",
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
				[1] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events = {
				[1] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
			},
			sound_events_duration = {
				[1] = 4.358916759491,
			},
		},
	})
end
