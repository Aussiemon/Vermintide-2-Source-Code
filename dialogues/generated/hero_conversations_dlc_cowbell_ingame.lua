-- chunkname: @dialogues/generated/hero_conversations_dlc_cowbell_ingame.lua

return function ()
	define_rule({
		name = "nfl_shadow_curse_curse_arrival_b",
		response = "nfl_shadow_curse_curse_arrival_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_lieutenant_spawned_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_shadow_curse_eclipse_a",
		response = "nfl_shadow_curse_eclipse_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_shadow_curse_grab_crystal",
		response = "nfl_shadow_curse_grab_crystal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_crystal_dropped",
			},
			{
				"global_context",
				"current_level",
				OP.NEQ,
				"arena_belakor",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_shadow_curse_start_level_a",
		response = "nfl_shadow_curse_start_level_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"curse_intro",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
		},
	})
	define_rule({
		name = "nfl_shadow_curse_start_level_b",
		response = "nfl_shadow_curse_start_level_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_start_level_a_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_shadow_curse_start_level_c",
		response = "nfl_shadow_curse_start_level_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_start_level_b_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_shadow_curse_worship_site",
		response = "nfl_shadow_curse_worship_site",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_worship_site_nearby",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nwd_shadow_curse_start_level_d",
		response = "nwd_shadow_curse_start_level_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_start_level_c_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon",
			},
		},
	})
	define_rule({
		name = "pbw_shadow_curse_curse_arrival_b",
		response = "pbw_shadow_curse_curse_arrival_b",
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
				"shadow_curse_arrival_a",
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_shadow_curse_eclipse_a",
		response = "pbw_shadow_curse_eclipse_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse",
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
		name = "pbw_shadow_curse_eclipse_b",
		response = "pbw_shadow_curse_eclipse_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse_a_done",
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
		name = "pbw_shadow_curse_eclipse_c",
		response = "pbw_shadow_curse_eclipse_c",
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
				"shadow_curse_eclipse_b",
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
		name = "pbw_shadow_curse_worship_site",
		response = "pbw_shadow_curse_worship_site",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_worship_site_nearby",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_shadow_curse_worship_site_ping",
		response = "pbw_shadow_curse_worship_site_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"shadow_curse_worship_site",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_shadow_curse_curse_arrival_b",
		response = "pdr_shadow_curse_curse_arrival_b",
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
				"shadow_curse_arrival_a",
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_shadow_curse_eclipse_a",
		response = "pdr_shadow_curse_eclipse_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse",
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
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_shadow_curse_eclipse_b",
		response = "pdr_shadow_curse_eclipse_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse_a_done",
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
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_shadow_curse_eclipse_c",
		response = "pdr_shadow_curse_eclipse_c",
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
				"shadow_curse_eclipse_b",
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
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_shadow_curse_eclipse_dummy_trigger",
		response = "pdr_shadow_curse_eclipse_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				"intensity",
				OP.LT,
				20,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				70,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_eclipse_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_eclipse_conversation",
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
		name = "pdr_shadow_curse_worship_site",
		response = "pdr_shadow_curse_worship_site",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_worship_site_nearby",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_shadow_curse_worship_site_ping",
		response = "pdr_shadow_curse_worship_site_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"shadow_curse_worship_site",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_shadow_curse_curse_arrival_b",
		response = "pes_shadow_curse_curse_arrival_b",
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
				"shadow_curse_arrival_a",
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_shadow_curse_eclipse_a",
		response = "pes_shadow_curse_eclipse_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse",
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
		name = "pes_shadow_curse_eclipse_b",
		response = "pes_shadow_curse_eclipse_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse_a_done",
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
		name = "pes_shadow_curse_eclipse_c",
		response = "pes_shadow_curse_eclipse_c",
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
				"shadow_curse_eclipse_b",
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
		name = "pes_shadow_curse_worship_site",
		response = "pes_shadow_curse_worship_site",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_worship_site_nearby",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_shadow_curse_worship_site_ping",
		response = "pes_shadow_curse_worship_site_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"shadow_curse_worship_site",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_shadow_curse_curse_arrival_b",
		response = "pwe_shadow_curse_curse_arrival_b",
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
				"shadow_curse_arrival_a",
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_shadow_curse_eclipse_a",
		response = "pwe_shadow_curse_eclipse_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse",
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
		name = "pwe_shadow_curse_eclipse_b",
		response = "pwe_shadow_curse_eclipse_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse_a_done",
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
		name = "pwe_shadow_curse_eclipse_c",
		response = "pwe_shadow_curse_eclipse_c",
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
				"shadow_curse_eclipse_b",
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
		name = "pwe_shadow_curse_eclipse_dummy_trigger",
		response = "pwe_shadow_curse_eclipse_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				"intensity",
				OP.LT,
				20,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				70,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_eclipse_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_eclipse_conversation",
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
		name = "pwe_shadow_curse_worship_site",
		response = "pwe_shadow_curse_worship_site",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_worship_site_nearby",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_shadow_curse_worship_site_ping",
		response = "pwe_shadow_curse_worship_site_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"shadow_curse_worship_site",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_shadow_curse_curse_arrival_b",
		response = "pwh_shadow_curse_curse_arrival_b",
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
				"shadow_curse_arrival_a",
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_shadow_curse_eclipse_a",
		response = "pwh_shadow_curse_eclipse_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse",
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
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_shadow_curse_eclipse_b",
		response = "pwh_shadow_curse_eclipse_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_eclipse_a_done",
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
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_shadow_curse_eclipse_c",
		response = "pwh_shadow_curse_eclipse_c",
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
				"shadow_curse_eclipse_b",
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
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_shadow_curse_worship_site",
		response = "pwh_shadow_curse_worship_site",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_worship_site_nearby",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_shadow_curse_worship_site_ping",
		response = "pwh_shadow_curse_worship_site_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"shadow_curse_worship_site",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_locus_ping",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "sc1_shadow_curse_arrival_a",
		response = "sc1_shadow_curse_arrival_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_sc1_spawn",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_shadow_lieutenant",
			},
		},
	})
	define_rule({
		name = "sc2_shadow_curse_arrival_a",
		response = "sc2_shadow_curse_arrival_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_sc2_spawn",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_shadow_lieutenant",
			},
		},
	})
	define_rule({
		name = "sc3_shadow_curse_arrival_a",
		response = "sc3_shadow_curse_arrival_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_sc3_spawn",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_shadow_lieutenant",
			},
		},
	})
	add_dialogues({
		nfl_shadow_curse_curse_arrival_b = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"nfl_shadow_curse_curse_arrival_b_01",
				"nfl_shadow_curse_curse_arrival_b_02",
				"nfl_shadow_curse_curse_arrival_b_03",
				"nfl_shadow_curse_curse_arrival_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_curse_arrival_b_01",
				"nfl_shadow_curse_curse_arrival_b_02",
				"nfl_shadow_curse_curse_arrival_b_03",
				"nfl_shadow_curse_curse_arrival_b_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		nfl_shadow_curse_eclipse_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			override_awareness = "shadow_curse_eclipse_a_done",
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
				[1] = "nfl_shadow_curse_eclipse_a_01",
				[2] = "nfl_shadow_curse_eclipse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nfl_shadow_curse_eclipse_a_01",
				[2] = "nfl_shadow_curse_eclipse_a_02",
			},
			sound_events_duration = {
				[1] = 5.9519791603088,
				[2] = 5.2079792022705,
			},
		},
		nfl_shadow_curse_grab_crystal = {
			category = "npc_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 8,
			face_animations_n = 8,
			randomize_indexes_n = 0,
			sound_events_n = 8,
			dialogue_animations = {
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
				"nfl_shadow_curse_grab_crystal_01",
				"nfl_shadow_curse_grab_crystal_02",
				"nfl_shadow_curse_grab_crystal_03",
				"nfl_shadow_curse_grab_crystal_04",
				"nfl_shadow_curse_grab_crystal_05",
				"nfl_shadow_curse_grab_crystal_06",
				"nfl_shadow_curse_grab_crystal_07",
				"nfl_shadow_curse_grab_crystal_08",
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_grab_crystal_01",
				"nfl_shadow_curse_grab_crystal_02",
				"nfl_shadow_curse_grab_crystal_03",
				"nfl_shadow_curse_grab_crystal_04",
				"nfl_shadow_curse_grab_crystal_05",
				"nfl_shadow_curse_grab_crystal_06",
				"nfl_shadow_curse_grab_crystal_07",
				"nfl_shadow_curse_grab_crystal_08",
			},
			sound_events_duration = {
				3.6070001125336,
				4.1560001373291,
				5.3909788131714,
				5.2209792137146,
				4.0079789161682,
				4.602979183197,
				4.3680000305176,
				4.691978931427,
			},
		},
		nfl_shadow_curse_start_level_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "nfl_shadow_curse_start_level_a_done",
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
				"nfl_shadow_curse_start_level_a_01",
				"nfl_shadow_curse_start_level_a_02",
				"nfl_shadow_curse_start_level_a_03",
				"nfl_shadow_curse_start_level_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_start_level_a_01",
				"nfl_shadow_curse_start_level_a_02",
				"nfl_shadow_curse_start_level_a_03",
				"nfl_shadow_curse_start_level_a_04",
			},
			sound_events_duration = {
				5.7049789428711,
				7.9989790916443,
				6.3639793395996,
				6.9099793434143,
			},
		},
		nfl_shadow_curse_start_level_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "nfl_shadow_curse_start_level_b_done",
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
				"nfl_shadow_curse_start_level_b_01",
				"nfl_shadow_curse_start_level_b_02",
				"nfl_shadow_curse_start_level_b_03",
				"nfl_shadow_curse_start_level_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_start_level_b_01",
				"nfl_shadow_curse_start_level_b_02",
				"nfl_shadow_curse_start_level_b_03",
				"nfl_shadow_curse_start_level_b_04",
			},
			sound_events_duration = {
				4.941978931427,
				5.0169792175293,
				4.602979183197,
				6.1929793357849,
			},
		},
		nfl_shadow_curse_start_level_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "nfl_shadow_curse_start_level_c_done",
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
				"nfl_shadow_curse_start_level_c_01",
				"nfl_shadow_curse_start_level_c_02",
				"nfl_shadow_curse_start_level_c_03",
				"nfl_shadow_curse_start_level_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_start_level_c_01",
				"nfl_shadow_curse_start_level_c_02",
				"nfl_shadow_curse_start_level_c_03",
				"nfl_shadow_curse_start_level_c_04",
			},
			sound_events_duration = {
				6.1099791526794,
				4.4239792823792,
				4.5209794044495,
				5.2519793510437,
			},
		},
		nfl_shadow_curse_worship_site = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"nfl_shadow_curse_worship_site_01",
				"nfl_shadow_curse_worship_site_02",
				"nfl_shadow_curse_worship_site_03",
				"nfl_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_worship_site_01",
				"nfl_shadow_curse_worship_site_02",
				"nfl_shadow_curse_worship_site_03",
				"nfl_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				4.3599791526794,
				5.7149791717529,
				4.9149789810181,
				6.26797914505,
			},
		},
		nwd_shadow_curse_start_level_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 8,
			face_animations_n = 8,
			randomize_indexes_n = 0,
			sound_events_n = 8,
			dialogue_animations = {
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
			},
			localization_strings = {
				"nwd_shadow_curse_start_level_d_01",
				"nwd_shadow_curse_start_level_d_02",
				"nwd_shadow_curse_start_level_d_03",
				"nwd_shadow_curse_start_level_d_04",
				"nwd_shadow_curse_start_level_d_05",
				"nwd_shadow_curse_start_level_d_06",
				"nwd_shadow_curse_start_level_d_07",
				"nwd_shadow_curse_start_level_d_08",
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_shadow_curse_start_level_d_01",
				"nwd_shadow_curse_start_level_d_02",
				"nwd_shadow_curse_start_level_d_03",
				"nwd_shadow_curse_start_level_d_04",
				"nwd_shadow_curse_start_level_d_05",
				"nwd_shadow_curse_start_level_d_06",
				"nwd_shadow_curse_start_level_d_07",
				"nwd_shadow_curse_start_level_d_08",
			},
			sound_events_duration = {
				11.809051513672,
				11.129937171936,
				10.532441139221,
				10.998870849609,
				11.248471260071,
				13.864599227905,
				14.528219223023,
				13.934956550598,
			},
		},
		pbw_shadow_curse_curse_arrival_b = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pbw_shadow_curse_curse_arrival_b_01",
				"pbw_shadow_curse_curse_arrival_b_02",
				"pbw_shadow_curse_curse_arrival_b_03",
				"pbw_shadow_curse_curse_arrival_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_shadow_curse_curse_arrival_b_01",
				"pbw_shadow_curse_curse_arrival_b_02",
				"pbw_shadow_curse_curse_arrival_b_03",
				"pbw_shadow_curse_curse_arrival_b_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pbw_shadow_curse_eclipse_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			override_awareness = "shadow_curse_eclipse_a_done",
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
				[1] = "pbw_shadow_curse_eclipse_a_01",
				[2] = "pbw_shadow_curse_eclipse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_shadow_curse_eclipse_a_01",
				[2] = "pbw_shadow_curse_eclipse_a_02",
			},
			sound_events_duration = {
				[1] = 3.0539791584015,
				[2] = 3.698979139328,
			},
		},
		pbw_shadow_curse_eclipse_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pbw_shadow_curse_eclipse_b_01",
				[2] = "pbw_shadow_curse_eclipse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_shadow_curse_eclipse_b_01",
				[2] = "pbw_shadow_curse_eclipse_b_02",
			},
			sound_events_duration = {
				[1] = 5.3299789428711,
				[2] = 2.8269999027252,
			},
		},
		pbw_shadow_curse_eclipse_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pbw_shadow_curse_eclipse_c_01",
				[2] = "pbw_shadow_curse_eclipse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_shadow_curse_eclipse_c_01",
				[2] = "pbw_shadow_curse_eclipse_c_02",
			},
			sound_events_duration = {
				[1] = 4.9270000457764,
				[2] = 4.0219793319702,
			},
		},
		pbw_shadow_curse_worship_site = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pbw_shadow_curse_worship_site_01",
				"pbw_shadow_curse_worship_site_02",
				"pbw_shadow_curse_worship_site_03",
				"pbw_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_shadow_curse_worship_site_01",
				"pbw_shadow_curse_worship_site_02",
				"pbw_shadow_curse_worship_site_03",
				"pbw_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				2.2479791641235,
				2.7130000591278,
				3.4159998893738,
				3.1009790897369,
			},
		},
		pbw_shadow_curse_worship_site_ping = {
			category = "player_feedback",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pbw_shadow_curse_worship_site_01",
				"pbw_shadow_curse_worship_site_02",
				"pbw_shadow_curse_worship_site_03",
				"pbw_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_shadow_curse_worship_site_01",
				"pbw_shadow_curse_worship_site_02",
				"pbw_shadow_curse_worship_site_03",
				"pbw_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				2.2479791641235,
				2.7130000591278,
				3.4159998893738,
				3.1009790897369,
			},
		},
		pdr_shadow_curse_curse_arrival_b = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pdr_shadow_curse_curse_arrival_b_01",
				"pdr_shadow_curse_curse_arrival_b_02",
				"pdr_shadow_curse_curse_arrival_b_03",
				"pdr_shadow_curse_curse_arrival_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_shadow_curse_curse_arrival_b_01",
				"pdr_shadow_curse_curse_arrival_b_02",
				"pdr_shadow_curse_curse_arrival_b_03",
				"pdr_shadow_curse_curse_arrival_b_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pdr_shadow_curse_eclipse_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			override_awareness = "shadow_curse_eclipse_a_done",
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
				[1] = "pdr_shadow_curse_eclipse_a_01",
				[2] = "pdr_shadow_curse_eclipse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_shadow_curse_eclipse_a_01",
				[2] = "pdr_shadow_curse_eclipse_a_02",
			},
			sound_events_duration = {
				[1] = 2.0379791259766,
				[2] = 2.9979791641235,
			},
		},
		pdr_shadow_curse_eclipse_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pdr_shadow_curse_eclipse_b_01",
				[2] = "pdr_shadow_curse_eclipse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_shadow_curse_eclipse_b_01",
				[2] = "pdr_shadow_curse_eclipse_b_02",
			},
			sound_events_duration = {
				[1] = 2.8549792766571,
				[2] = 3.9349792003632,
			},
		},
		pdr_shadow_curse_eclipse_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pdr_shadow_curse_eclipse_c_01",
				[2] = "pdr_shadow_curse_eclipse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_shadow_curse_eclipse_c_01",
				[2] = "pdr_shadow_curse_eclipse_c_02",
			},
			sound_events_duration = {
				[1] = 2.5320000648499,
				[2] = 3.3719792366028,
			},
		},
		pdr_shadow_curse_eclipse_dummy_trigger = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "shadow_curse_eclipse",
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
		pdr_shadow_curse_worship_site = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pdr_shadow_curse_worship_site_01",
				"pdr_shadow_curse_worship_site_02",
				"pdr_shadow_curse_worship_site_03",
				"pdr_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_shadow_curse_worship_site_01",
				"pdr_shadow_curse_worship_site_02",
				"pdr_shadow_curse_worship_site_03",
				"pdr_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				2.5979790687561,
				2.4979791641235,
				3.9909999370575,
				2.948979139328,
			},
		},
		pdr_shadow_curse_worship_site_ping = {
			category = "player_feedback",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pdr_shadow_curse_worship_site_01",
				"pdr_shadow_curse_worship_site_02",
				"pdr_shadow_curse_worship_site_03",
				"pdr_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_shadow_curse_worship_site_01",
				"pdr_shadow_curse_worship_site_02",
				"pdr_shadow_curse_worship_site_03",
				"pdr_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				2.5979790687561,
				2.4979791641235,
				3.9909999370575,
				2.948979139328,
			},
		},
		pes_shadow_curse_curse_arrival_b = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pes_shadow_curse_curse_arrival_b_01",
				"pes_shadow_curse_curse_arrival_b_02",
				"pes_shadow_curse_curse_arrival_b_03",
				"pes_shadow_curse_curse_arrival_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_shadow_curse_curse_arrival_b_01",
				"pes_shadow_curse_curse_arrival_b_02",
				"pes_shadow_curse_curse_arrival_b_03",
				"pes_shadow_curse_curse_arrival_b_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pes_shadow_curse_eclipse_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			override_awareness = "shadow_curse_eclipse_a_done",
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
				[1] = "pes_shadow_curse_eclipse_a_01",
				[2] = "pes_shadow_curse_eclipse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_shadow_curse_eclipse_a_01",
				[2] = "pes_shadow_curse_eclipse_a_02",
			},
			sound_events_duration = {
				[1] = 3.2260000705719,
				[2] = 3.4529790878296,
			},
		},
		pes_shadow_curse_eclipse_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pes_shadow_curse_eclipse_b_01",
				[2] = "pes_shadow_curse_eclipse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_shadow_curse_eclipse_b_01",
				[2] = "pes_shadow_curse_eclipse_b_02",
			},
			sound_events_duration = {
				[1] = 3.4609792232513,
				[2] = 4.1399998664856,
			},
		},
		pes_shadow_curse_eclipse_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pes_shadow_curse_eclipse_c_01",
				[2] = "pes_shadow_curse_eclipse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_shadow_curse_eclipse_c_01",
				[2] = "pes_shadow_curse_eclipse_c_02",
			},
			sound_events_duration = {
				[1] = 2.6449999809265,
				[2] = 4.9669790267944,
			},
		},
		pes_shadow_curse_worship_site = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pes_shadow_curse_worship_site_01",
				"pes_shadow_curse_worship_site_02",
				"pes_shadow_curse_worship_site_03",
				"pes_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_shadow_curse_worship_site_01",
				"pes_shadow_curse_worship_site_02",
				"pes_shadow_curse_worship_site_03",
				"pes_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				2.4509792327881,
				1.9700000286102,
				2.1119999885559,
				2.8949999809265,
			},
		},
		pes_shadow_curse_worship_site_ping = {
			category = "player_feedback",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pes_shadow_curse_worship_site_01",
				"pes_shadow_curse_worship_site_02",
				"pes_shadow_curse_worship_site_03",
				"pes_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_shadow_curse_worship_site_01",
				"pes_shadow_curse_worship_site_02",
				"pes_shadow_curse_worship_site_03",
				"pes_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				2.4509792327881,
				1.9700000286102,
				2.1119999885559,
				2.8949999809265,
			},
		},
		pwe_shadow_curse_curse_arrival_b = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pwe_shadow_curse_curse_arrival_b_01",
				"pwe_shadow_curse_curse_arrival_b_02",
				"pwe_shadow_curse_curse_arrival_b_03",
				"pwe_shadow_curse_curse_arrival_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_shadow_curse_curse_arrival_b_01",
				"pwe_shadow_curse_curse_arrival_b_02",
				"pwe_shadow_curse_curse_arrival_b_03",
				"pwe_shadow_curse_curse_arrival_b_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pwe_shadow_curse_eclipse_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			override_awareness = "shadow_curse_eclipse_a_done",
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
				[1] = "pwe_shadow_curse_eclipse_a_01",
				[2] = "pwe_shadow_curse_eclipse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_shadow_curse_eclipse_a_01",
				[2] = "pwe_shadow_curse_eclipse_a_02",
			},
			sound_events_duration = {
				[1] = 4.0879998207092,
				[2] = 4.2889790534973,
			},
		},
		pwe_shadow_curse_eclipse_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pwe_shadow_curse_eclipse_b_01",
				[2] = "pwe_shadow_curse_eclipse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_shadow_curse_eclipse_b_01",
				[2] = "pwe_shadow_curse_eclipse_b_02",
			},
			sound_events_duration = {
				[1] = 3.8439791202545,
				[2] = 4.3249793052673,
			},
		},
		pwe_shadow_curse_eclipse_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pwe_shadow_curse_eclipse_c_01",
				[2] = "pwe_shadow_curse_eclipse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_shadow_curse_eclipse_c_01",
				[2] = "pwe_shadow_curse_eclipse_c_02",
			},
			sound_events_duration = {
				[1] = 4.6050000190735,
				[2] = 4.1909790039063,
			},
		},
		pwe_shadow_curse_eclipse_dummy_trigger = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "shadow_curse_eclipse",
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
		pwe_shadow_curse_worship_site = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pwe_shadow_curse_worship_site_01",
				"pwe_shadow_curse_worship_site_02",
				"pwe_shadow_curse_worship_site_03",
				"pwe_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_shadow_curse_worship_site_01",
				"pwe_shadow_curse_worship_site_02",
				"pwe_shadow_curse_worship_site_03",
				"pwe_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				1.8370000123978,
				3.3910000324249,
				2.1549999713898,
				3.2869791984558,
			},
		},
		pwe_shadow_curse_worship_site_ping = {
			category = "player_feedback",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pwe_shadow_curse_worship_site_01",
				"pwe_shadow_curse_worship_site_02",
				"pwe_shadow_curse_worship_site_03",
				"pwe_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_shadow_curse_worship_site_01",
				"pwe_shadow_curse_worship_site_02",
				"pwe_shadow_curse_worship_site_03",
				"pwe_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				1.8370000123978,
				3.3910000324249,
				2.1549999713898,
				3.2869791984558,
			},
		},
		pwh_shadow_curse_curse_arrival_b = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pwh_shadow_curse_curse_arrival_b_01",
				"pwh_shadow_curse_curse_arrival_b_02",
				"pwh_shadow_curse_curse_arrival_b_03",
				"pwh_shadow_curse_curse_arrival_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_shadow_curse_curse_arrival_b_01",
				"pwh_shadow_curse_curse_arrival_b_02",
				"pwh_shadow_curse_curse_arrival_b_03",
				"pwh_shadow_curse_curse_arrival_b_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pwh_shadow_curse_eclipse_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			override_awareness = "shadow_curse_eclipse_a_done",
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
				[1] = "pwh_shadow_curse_eclipse_a_01",
				[2] = "pwh_shadow_curse_eclipse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_shadow_curse_eclipse_a_01",
				[2] = "pwh_shadow_curse_eclipse_a_02",
			},
			sound_events_duration = {
				[1] = 6.1379790306091,
				[2] = 7.4709792137146,
			},
		},
		pwh_shadow_curse_eclipse_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pwh_shadow_curse_eclipse_b_01",
				[2] = "pwh_shadow_curse_eclipse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_shadow_curse_eclipse_b_01",
				[2] = "pwh_shadow_curse_eclipse_b_02",
			},
			sound_events_duration = {
				[1] = 4.4979791641235,
				[2] = 5.9730000495911,
			},
		},
		pwh_shadow_curse_eclipse_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				[1] = "pwh_shadow_curse_eclipse_c_01",
				[2] = "pwh_shadow_curse_eclipse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_shadow_curse_eclipse_c_01",
				[2] = "pwh_shadow_curse_eclipse_c_02",
			},
			sound_events_duration = {
				[1] = 4.5859789848328,
				[2] = 4.4790000915527,
			},
		},
		pwh_shadow_curse_worship_site = {
			category = "special_occasion",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pwh_shadow_curse_worship_site_01",
				"pwh_shadow_curse_worship_site_02",
				"pwh_shadow_curse_worship_site_03",
				"pwh_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_shadow_curse_worship_site_01",
				"pwh_shadow_curse_worship_site_02",
				"pwh_shadow_curse_worship_site_03",
				"pwh_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				3.9400000572205,
				4.7360000610352,
				4.7189998626709,
				2.3399999141693,
			},
		},
		pwh_shadow_curse_worship_site_ping = {
			category = "player_feedback",
			database = "hero_conversations_dlc_cowbell_ingame",
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
				"pwh_shadow_curse_worship_site_01",
				"pwh_shadow_curse_worship_site_02",
				"pwh_shadow_curse_worship_site_03",
				"pwh_shadow_curse_worship_site_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_shadow_curse_worship_site_01",
				"pwh_shadow_curse_worship_site_02",
				"pwh_shadow_curse_worship_site_03",
				"pwh_shadow_curse_worship_site_04",
			},
			sound_events_duration = {
				3.9400000572205,
				4.7360000610352,
				4.7189998626709,
				2.3399999141693,
			},
		},
		sc1_shadow_curse_arrival_a = {
			category = "player_alerts_boss",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			override_awareness = "shadow_lieutenant_spawned_done",
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
				"sc1_shadow_curse_arrival_a_01",
				"sc1_shadow_curse_arrival_a_02",
				"sc1_shadow_curse_arrival_a_03",
				"sc1_shadow_curse_arrival_a_04",
				"sc1_shadow_curse_arrival_a_05",
				"sc1_shadow_curse_arrival_a_06",
				"sc1_shadow_curse_arrival_a_07",
				"sc1_shadow_curse_arrival_a_08",
				"sc1_shadow_curse_arrival_a_09",
				"sc1_shadow_curse_arrival_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"sc1_shadow_curse_arrival_a_01",
				"sc1_shadow_curse_arrival_a_02",
				"sc1_shadow_curse_arrival_a_03",
				"sc1_shadow_curse_arrival_a_04",
				"sc1_shadow_curse_arrival_a_05",
				"sc1_shadow_curse_arrival_a_06",
				"sc1_shadow_curse_arrival_a_07",
				"sc1_shadow_curse_arrival_a_08",
				"sc1_shadow_curse_arrival_a_09",
				"sc1_shadow_curse_arrival_a_10",
			},
			sound_events_duration = {
				4.5900001525879,
				3.5039999485016,
				3.6929790973663,
				5.7890000343323,
				2.920000076294,
				3.6949999332428,
				4.643000125885,
				4.6020002365112,
				6.7010002136231,
				6.0689792633057,
			},
		},
		sc2_shadow_curse_arrival_a = {
			category = "player_alerts_boss",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			override_awareness = "shadow_lieutenant_spawned_done",
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
				"sc2_shadow_curse_arrival_a_01",
				"sc2_shadow_curse_arrival_a_02",
				"sc2_shadow_curse_arrival_a_03",
				"sc2_shadow_curse_arrival_a_04",
				"sc2_shadow_curse_arrival_a_05",
				"sc2_shadow_curse_arrival_a_06",
				"sc2_shadow_curse_arrival_a_07",
				"sc2_shadow_curse_arrival_a_08",
				"sc2_shadow_curse_arrival_a_09",
				"sc2_shadow_curse_arrival_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"sc2_shadow_curse_arrival_a_01",
				"sc2_shadow_curse_arrival_a_02",
				"sc2_shadow_curse_arrival_a_03",
				"sc2_shadow_curse_arrival_a_04",
				"sc2_shadow_curse_arrival_a_05",
				"sc2_shadow_curse_arrival_a_06",
				"sc2_shadow_curse_arrival_a_07",
				"sc2_shadow_curse_arrival_a_08",
				"sc2_shadow_curse_arrival_a_09",
				"sc2_shadow_curse_arrival_a_10",
			},
			sound_events_duration = {
				4.1630001068115,
				4.7020001411438,
				3.8650000095367,
				3.4679999351502,
				5.1240000724792,
				3.2369999885559,
				3.5039999485016,
				3.1979999542236,
				3.845999956131,
				3.789999961853,
			},
		},
		sc3_shadow_curse_arrival_a = {
			category = "player_alerts_boss",
			database = "hero_conversations_dlc_cowbell_ingame",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			override_awareness = "shadow_lieutenant_spawned_done",
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
				"sc3_shadow_curse_arrival_a_01",
				"sc3_shadow_curse_arrival_a_02",
				"sc3_shadow_curse_arrival_a_03",
				"sc3_shadow_curse_arrival_a_04",
				"sc3_shadow_curse_arrival_a_05",
				"sc3_shadow_curse_arrival_a_06",
				"sc3_shadow_curse_arrival_a_07",
				"sc3_shadow_curse_arrival_a_08",
				"sc3_shadow_curse_arrival_a_09",
				"sc3_shadow_curse_arrival_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"sc3_shadow_curse_arrival_a_01",
				"sc3_shadow_curse_arrival_a_02",
				"sc3_shadow_curse_arrival_a_03",
				"sc3_shadow_curse_arrival_a_04",
				"sc3_shadow_curse_arrival_a_05",
				"sc3_shadow_curse_arrival_a_06",
				"sc3_shadow_curse_arrival_a_07",
				"sc3_shadow_curse_arrival_a_08",
				"sc3_shadow_curse_arrival_a_09",
				"sc3_shadow_curse_arrival_a_10",
			},
			sound_events_duration = {
				3.6649792194366,
				3.9140000343323,
				6.1199998855591,
				5.7490000724792,
				5.4039998054504,
				3.1989998817444,
				3.9639999866486,
				5.5780000686645,
				3.295000076294,
				6.0869998931885,
			},
		},
	})
end
