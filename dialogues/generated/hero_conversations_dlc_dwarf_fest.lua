-- chunkname: @dialogues/generated/hero_conversations_dlc_dwarf_fest.lua

return function ()
	define_rule({
		name = "pbw_dal_conversation_group_one_crystal_b",
		probability = 1,
		response = "pbw_dal_conversation_group_one_crystal_b",
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
				"dal_conversation_group_one_crystal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_one_dal_b",
		probability = 1,
		response = "pbw_dal_conversation_group_one_dal_b",
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
				"dal_conversation_group_one_dal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_one_okri_a",
		probability = 1,
		response = "pbw_dal_conversation_group_one_okri_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pbw_dal_conversation_group_one_okri_a",
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
			{
				"faction_memory",
				"pbw_dal_conversation_group_one_okri_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dal_conversation_group_one_title_b",
		probability = 1,
		response = "pbw_dal_conversation_group_one_title_b",
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
				"dal_conversation_group_one_title_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_one_title_two_b",
		probability = 1,
		response = "pbw_dal_conversation_group_one_title_two_b",
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
				"dal_conversation_group_one_title_two_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_three_disrepair_b",
		probability = 1,
		response = "pbw_dal_conversation_group_three_disrepair_b",
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
				"dal_conversation_group_three_disrepair_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_three_engineer_b",
		probability = 1,
		response = "pbw_dal_conversation_group_three_engineer_b",
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
				"dal_conversation_group_three_engineer_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_three_feet_b",
		probability = 1,
		response = "pbw_dal_conversation_group_three_feet_b",
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
				"dal_conversation_group_three_feet_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_three_progress_a",
		probability = 1,
		response = "pbw_dal_conversation_group_three_progress_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pbw_dal_conversation_group_three_progress_a",
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
			{
				"faction_memory",
				"pbw_dal_conversation_group_three_progress_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dal_conversation_group_three_spy_b",
		probability = 1,
		response = "pbw_dal_conversation_group_three_spy_b",
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
				"dal_conversation_group_three_spy_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_two_contest_b",
		probability = 1,
		response = "pbw_dal_conversation_group_two_contest_b",
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
				"dal_conversation_group_two_contest_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_two_okri_b",
		probability = 1,
		response = "pbw_dal_conversation_group_two_okri_b",
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
				"dal_conversation_group_two_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_two_proof_b",
		probability = 1,
		response = "pbw_dal_conversation_group_two_proof_b",
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
				"dal_conversation_group_two_proof_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_two_respect_b",
		probability = 1,
		response = "pbw_dal_conversation_group_two_respect_b",
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
				"dal_conversation_group_two_respect_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_dal_conversation_group_two_trolls_a",
		probability = 1,
		response = "pbw_dal_conversation_group_two_trolls_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pbw_dal_conversation_group_two_trolls_a",
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
			{
				"faction_memory",
				"pbw_dal_conversation_group_two_trolls_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_one_crystal_b",
		probability = 1,
		response = "pdr_dal_conversation_group_one_crystal_b",
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
				"dal_conversation_group_one_crystal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_one_dal_a",
		probability = 1,
		response = "pdr_dal_conversation_group_one_dal_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pdr_dal_conversation_group_one_dal_a",
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
			{
				"faction_memory",
				"pdr_dal_conversation_group_one_dal_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_one_okri_b",
		probability = 1,
		response = "pdr_dal_conversation_group_one_okri_b",
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
				"dal_conversation_group_one_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_one_title_b",
		probability = 1,
		response = "pdr_dal_conversation_group_one_title_b",
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
				"dal_conversation_group_one_title_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_one_title_two_b",
		probability = 1,
		response = "pdr_dal_conversation_group_one_title_two_b",
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
				"dal_conversation_group_one_title_two_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_three_disrepair_a",
		probability = 1,
		response = "pdr_dal_conversation_group_three_disrepair_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pdr_dal_conversation_group_three_disrepair_a",
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
			{
				"faction_memory",
				"pdr_dal_conversation_group_three_disrepair_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_three_engineer_b",
		probability = 1,
		response = "pdr_dal_conversation_group_three_engineer_b",
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
				"dal_conversation_group_three_engineer_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_three_feet_b",
		probability = 1,
		response = "pdr_dal_conversation_group_three_feet_b",
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
				"dal_conversation_group_three_feet_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_three_progress_b",
		probability = 1,
		response = "pdr_dal_conversation_group_three_progress_b",
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
				"dal_conversation_group_three_progress_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_three_spy_b",
		probability = 1,
		response = "pdr_dal_conversation_group_three_spy_b",
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
				"dal_conversation_group_three_spy_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_two_contest_b",
		probability = 1,
		response = "pdr_dal_conversation_group_two_contest_b",
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
				"dal_conversation_group_two_contest_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_two_okri_a",
		probability = 1,
		response = "pdr_dal_conversation_group_two_okri_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pdr_dal_conversation_group_two_okri_a",
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
			{
				"faction_memory",
				"pdr_dal_conversation_group_two_okri_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_two_proof_b",
		probability = 1,
		response = "pdr_dal_conversation_group_two_proof_b",
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
				"dal_conversation_group_two_proof_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_two_respect_b",
		probability = 1,
		response = "pdr_dal_conversation_group_two_respect_b",
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
				"dal_conversation_group_two_respect_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pdr_dal_conversation_group_two_trolls_b",
		probability = 1,
		response = "pdr_dal_conversation_group_two_trolls_b",
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
				"dal_conversation_group_two_trolls_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_one_crystal_b",
		probability = 1,
		response = "pes_dal_conversation_group_one_crystal_b",
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
				"dal_conversation_group_one_crystal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_one_dal_b",
		probability = 1,
		response = "pes_dal_conversation_group_one_dal_b",
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
				"dal_conversation_group_one_dal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_one_okri_b",
		probability = 1,
		response = "pes_dal_conversation_group_one_okri_b",
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
				"dal_conversation_group_one_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_one_title_b",
		probability = 1,
		response = "pes_dal_conversation_group_one_title_b",
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
				"dal_conversation_group_one_title_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_one_title_two_a",
		probability = 1,
		response = "pes_dal_conversation_group_one_title_two_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pes_dal_conversation_group_one_title_two_a",
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
			{
				"faction_memory",
				"pes_dal_conversation_group_one_title_two_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_three_disrepair_b",
		probability = 1,
		response = "pes_dal_conversation_group_three_disrepair_b",
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
				"dal_conversation_group_three_disrepair_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_three_engineer_b",
		probability = 1,
		response = "pes_dal_conversation_group_three_engineer_b",
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
				"dal_conversation_group_three_engineer_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_three_feet_a",
		probability = 1,
		response = "pes_dal_conversation_group_three_feet_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pes_dal_conversation_group_three_feet_a",
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
			{
				"faction_memory",
				"pes_dal_conversation_group_three_feet_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_three_progress_b",
		probability = 1,
		response = "pes_dal_conversation_group_three_progress_b",
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
				"dal_conversation_group_three_progress_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_three_spy_b",
		probability = 1,
		response = "pes_dal_conversation_group_three_spy_b",
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
				"dal_conversation_group_three_spy_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_two_contest_b",
		probability = 1,
		response = "pes_dal_conversation_group_two_contest_b",
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
				"dal_conversation_group_two_contest_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_two_okri_b",
		probability = 1,
		response = "pes_dal_conversation_group_two_okri_b",
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
				"dal_conversation_group_two_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_two_proof_b",
		probability = 1,
		response = "pes_dal_conversation_group_two_proof_b",
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
				"dal_conversation_group_two_proof_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_two_respect_a",
		probability = 1,
		response = "pes_dal_conversation_group_two_respect_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pes_dal_conversation_group_two_respect_a",
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
			{
				"faction_memory",
				"pes_dal_conversation_group_two_respect_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dal_conversation_group_two_trolls_b",
		probability = 1,
		response = "pes_dal_conversation_group_two_trolls_b",
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
				"dal_conversation_group_two_trolls_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
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
		},
	})
	define_rule({
		name = "pwe_dal_conversation_group_one_crystal_b",
		probability = 1,
		response = "pwe_dal_conversation_group_one_crystal_b",
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
				"dal_conversation_group_one_crystal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_one_dal_b",
		probability = 1,
		response = "pwe_dal_conversation_group_one_dal_b",
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
				"dal_conversation_group_one_dal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_one_okri_b",
		probability = 1,
		response = "pwe_dal_conversation_group_one_okri_b",
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
				"dal_conversation_group_one_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_one_title_a",
		probability = 1,
		response = "pwe_dal_conversation_group_one_title_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pwe_dal_conversation_group_one_title_a",
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
			{
				"faction_memory",
				"pwe_dal_conversation_group_one_title_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_conversation_group_one_title_two_b",
		probability = 1,
		response = "pwe_dal_conversation_group_one_title_two_b",
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
				"dal_conversation_group_one_title_two_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_three_disrepair_b",
		probability = 1,
		response = "pwe_dal_conversation_group_three_disrepair_b",
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
				"dal_conversation_group_three_disrepair_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_three_engineer_b",
		probability = 1,
		response = "pwe_dal_conversation_group_three_engineer_b",
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
				"dal_conversation_group_three_engineer_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_three_feet_b",
		probability = 1,
		response = "pwe_dal_conversation_group_three_feet_b",
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
				"dal_conversation_group_three_feet_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_three_progress_b",
		probability = 1,
		response = "pwe_dal_conversation_group_three_progress_b",
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
				"dal_conversation_group_three_progress_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_three_spy_a",
		probability = 1,
		response = "pwe_dal_conversation_group_three_spy_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pwe_dal_conversation_group_three_spy_a",
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
			{
				"faction_memory",
				"pwe_dal_conversation_group_three_spy_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_conversation_group_two_contest_b",
		probability = 1,
		response = "pwe_dal_conversation_group_two_contest_b",
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
				"dal_conversation_group_two_contest_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_two_okri_b",
		probability = 1,
		response = "pwe_dal_conversation_group_two_okri_b",
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
				"dal_conversation_group_two_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_two_proof_a",
		probability = 1,
		response = "pwe_dal_conversation_group_two_proof_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pwe_dal_conversation_group_two_proof_a",
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
			{
				"faction_memory",
				"pwe_dal_conversation_group_two_proof_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_conversation_group_two_respect_b",
		probability = 1,
		response = "pwe_dal_conversation_group_two_respect_b",
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
				"dal_conversation_group_two_respect_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_dal_conversation_group_two_trolls_b",
		probability = 1,
		response = "pwe_dal_conversation_group_two_trolls_b",
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
				"dal_conversation_group_two_trolls_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_one_crystal_a",
		probability = 1,
		response = "pwh_dal_conversation_group_one_crystal_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pwh_dal_conversation_group_one_crystal_a",
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
			{
				"faction_memory",
				"pwh_dal_conversation_group_one_crystal_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_dal_conversation_group_one_dal_b",
		probability = 1,
		response = "pwh_dal_conversation_group_one_dal_b",
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
				"dal_conversation_group_one_dal_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_one_okri_b",
		probability = 1,
		response = "pwh_dal_conversation_group_one_okri_b",
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
				"dal_conversation_group_one_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_one_title_b",
		probability = 1,
		response = "pwh_dal_conversation_group_one_title_b",
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
				"dal_conversation_group_one_title_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_one_title_two_b",
		probability = 1,
		response = "pwh_dal_conversation_group_one_title_two_b",
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
				"dal_conversation_group_one_title_two_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_three_disrepair_b",
		probability = 1,
		response = "pwh_dal_conversation_group_three_disrepair_b",
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
				"dal_conversation_group_three_disrepair_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_three_engineer_a",
		probability = 1,
		response = "pwh_dal_conversation_group_three_engineer_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pwh_dal_conversation_group_three_engineer_a",
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
			{
				"faction_memory",
				"pwh_dal_conversation_group_three_engineer_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_dal_conversation_group_three_feet_b",
		probability = 1,
		response = "pwh_dal_conversation_group_three_feet_b",
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
				"dal_conversation_group_three_feet_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_three_progress_b",
		probability = 1,
		response = "pwh_dal_conversation_group_three_progress_b",
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
				"dal_conversation_group_three_progress_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_three_spy_b",
		probability = 1,
		response = "pwh_dal_conversation_group_three_spy_b",
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
				"dal_conversation_group_three_spy_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_two_contest_a",
		probability = 1,
		response = "pwh_dal_conversation_group_two_contest_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"intensity",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pwh_dal_conversation_group_two_contest_a",
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
			{
				"faction_memory",
				"pwh_dal_conversation_group_two_contest_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_dal_conversation_group_two_okri_b",
		probability = 1,
		response = "pwh_dal_conversation_group_two_okri_b",
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
				"dal_conversation_group_two_okri_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_two_proof_b",
		probability = 1,
		response = "pwh_dal_conversation_group_two_proof_b",
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
				"dal_conversation_group_two_proof_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_two_respect_b",
		probability = 1,
		response = "pwh_dal_conversation_group_two_respect_b",
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
				"dal_conversation_group_two_respect_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_dal_conversation_group_two_trolls_b",
		probability = 1,
		response = "pwh_dal_conversation_group_two_trolls_b",
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
				"dal_conversation_group_two_trolls_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
	add_dialogues({
		pbw_dal_conversation_group_one_crystal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_one_crystal_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_one_crystal_b_01",
			},
			sound_events_duration = {
				[1] = 5.080020904541,
			},
		},
		pbw_dal_conversation_group_one_dal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_one_dal_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_one_dal_b_01",
			},
			sound_events_duration = {
				[1] = 3.8553750514984,
			},
		},
		pbw_dal_conversation_group_one_okri_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_one_okri_a_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_one_okri_a_01",
			},
			sound_events_duration = {
				[1] = 4.4826040267944,
			},
		},
		pbw_dal_conversation_group_one_title_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_one_title_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_one_title_b_01",
			},
			sound_events_duration = {
				[1] = 4.3925623893738,
			},
		},
		pbw_dal_conversation_group_one_title_two_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_one_title_two_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_one_title_two_b_01",
			},
			sound_events_duration = {
				[1] = 3.0519375801086,
			},
		},
		pbw_dal_conversation_group_three_disrepair_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events_duration = {
				[1] = 4.2906041145325,
			},
		},
		pbw_dal_conversation_group_three_engineer_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_three_engineer_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_three_engineer_b_01",
			},
			sound_events_duration = {
				[1] = 2.8736457824707,
			},
		},
		pbw_dal_conversation_group_three_feet_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_three_feet_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_three_feet_b_01",
			},
			sound_events_duration = {
				[1] = 4.2322707176208,
			},
		},
		pbw_dal_conversation_group_three_progress_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_three_progress_a_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_three_progress_a_01",
			},
			sound_events_duration = {
				[1] = 4.1327290534973,
			},
		},
		pbw_dal_conversation_group_three_spy_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_three_spy_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_three_spy_b_01",
			},
			sound_events_duration = {
				[1] = 4.3578124046326,
			},
		},
		pbw_dal_conversation_group_two_contest_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_two_contest_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_two_contest_b_01",
			},
			sound_events_duration = {
				[1] = 3.4113125801086,
			},
		},
		pbw_dal_conversation_group_two_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_two_okri_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_two_okri_b_01",
			},
			sound_events_duration = {
				[1] = 3.4039165973663,
			},
		},
		pbw_dal_conversation_group_two_proof_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_two_proof_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_two_proof_b_01",
			},
			sound_events_duration = {
				[1] = 3.2099165916443,
			},
		},
		pbw_dal_conversation_group_two_respect_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_two_respect_b_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_two_respect_b_01",
			},
			sound_events_duration = {
				[1] = 2.2313957214356,
			},
		},
		pbw_dal_conversation_group_two_trolls_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_dal_conversation_group_two_trolls_a_01",
			},
			sound_events = {
				[1] = "pbw_dal_conversation_group_two_trolls_a_01",
			},
			sound_events_duration = {
				[1] = 2.4863541126251,
			},
		},
		pdr_dal_conversation_group_one_crystal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_one_crystal_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_one_crystal_b_01",
			},
			sound_events_duration = {
				[1] = 4.5528335571289,
			},
		},
		pdr_dal_conversation_group_one_dal_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_one_dal_a_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_one_dal_a_01",
			},
			sound_events_duration = {
				[1] = 7.2033333778381,
			},
		},
		pdr_dal_conversation_group_one_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_one_okri_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_one_okri_b_01",
			},
			sound_events_duration = {
				[1] = 4.1936039924622,
			},
		},
		pdr_dal_conversation_group_one_title_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_one_title_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_one_title_b_01",
			},
			sound_events_duration = {
				[1] = 4.2055206298828,
			},
		},
		pdr_dal_conversation_group_one_title_two_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_one_title_two_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_one_title_two_b_01",
			},
			sound_events_duration = {
				[1] = 4.1076040267944,
			},
		},
		pdr_dal_conversation_group_three_disrepair_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_three_disrepair_a_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_three_disrepair_a_01",
			},
			sound_events_duration = {
				[1] = 5.4646043777466,
			},
		},
		pdr_dal_conversation_group_three_engineer_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_three_engineer_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_three_engineer_b_01",
			},
			sound_events_duration = {
				[1] = 3.5471875667572,
			},
		},
		pdr_dal_conversation_group_three_feet_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_three_feet_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_three_feet_b_01",
			},
			sound_events_duration = {
				[1] = 7.4206457138061,
			},
		},
		pdr_dal_conversation_group_three_progress_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_three_progress_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_three_progress_b_01",
			},
			sound_events_duration = {
				[1] = 2.8731665611267,
			},
		},
		pdr_dal_conversation_group_three_spy_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_three_spy_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_three_spy_b_01",
			},
			sound_events_duration = {
				[1] = 5.1877708435059,
			},
		},
		pdr_dal_conversation_group_two_contest_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_two_contest_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_two_contest_b_01",
			},
			sound_events_duration = {
				[1] = 2.8200416564941,
			},
		},
		pdr_dal_conversation_group_two_okri_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_two_okri_a_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_two_okri_a_01",
			},
			sound_events_duration = {
				[1] = 5.3536248207092,
			},
		},
		pdr_dal_conversation_group_two_proof_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_two_proof_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_two_proof_b_01",
			},
			sound_events_duration = {
				[1] = 3.7066457271576,
			},
		},
		pdr_dal_conversation_group_two_respect_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_two_respect_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_two_respect_b_01",
			},
			sound_events_duration = {
				[1] = 3.2961041927338,
			},
		},
		pdr_dal_conversation_group_two_trolls_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_conversation_group_two_trolls_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_conversation_group_two_trolls_b_01",
			},
			sound_events_duration = {
				[1] = 2.7710833549499,
			},
		},
		pes_dal_conversation_group_one_crystal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_one_crystal_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_one_crystal_b_01",
			},
			sound_events_duration = {
				[1] = 2.3375625610352,
			},
		},
		pes_dal_conversation_group_one_dal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_one_dal_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_one_dal_b_01",
			},
			sound_events_duration = {
				[1] = 4.8532915115356,
			},
		},
		pes_dal_conversation_group_one_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_one_okri_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_one_okri_b_01",
			},
			sound_events_duration = {
				[1] = 2.4969375133514,
			},
		},
		pes_dal_conversation_group_one_title_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_one_title_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_one_title_b_01",
			},
			sound_events_duration = {
				[1] = 3.4114792346954,
			},
		},
		pes_dal_conversation_group_one_title_two_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_one_title_two_a_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_one_title_two_a_01",
			},
			sound_events_duration = {
				[1] = 5.7828330993652,
			},
		},
		pes_dal_conversation_group_three_disrepair_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events_duration = {
				[1] = 2.9591875076294,
			},
		},
		pes_dal_conversation_group_three_engineer_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_three_engineer_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_three_engineer_b_01",
			},
			sound_events_duration = {
				[1] = 4.0481877326965,
			},
		},
		pes_dal_conversation_group_three_feet_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_three_feet_a_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_three_feet_a_01",
			},
			sound_events_duration = {
				[1] = 3.6232500076294,
			},
		},
		pes_dal_conversation_group_three_progress_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_three_progress_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_three_progress_b_01",
			},
			sound_events_duration = {
				[1] = 4.2102499008179,
			},
		},
		pes_dal_conversation_group_three_spy_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_three_spy_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_three_spy_b_01",
			},
			sound_events_duration = {
				[1] = 5.1956458091736,
			},
		},
		pes_dal_conversation_group_two_contest_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_two_contest_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_two_contest_b_01",
			},
			sound_events_duration = {
				[1] = 4.4122915267944,
			},
		},
		pes_dal_conversation_group_two_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_two_okri_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_two_okri_b_01",
			},
			sound_events_duration = {
				[1] = 2.3766875267029,
			},
		},
		pes_dal_conversation_group_two_proof_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_two_proof_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_two_proof_b_01",
			},
			sound_events_duration = {
				[1] = 2.4690625667572,
			},
		},
		pes_dal_conversation_group_two_respect_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_two_respect_a_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_two_respect_a_01",
			},
			sound_events_duration = {
				[1] = 6.0209584236145,
			},
		},
		pes_dal_conversation_group_two_trolls_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_conversation_group_two_trolls_b_01",
			},
			sound_events = {
				[1] = "pes_dal_conversation_group_two_trolls_b_01",
			},
			sound_events_duration = {
				[1] = 2.9673125743866,
			},
		},
		pwe_dal_conversation_group_one_crystal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_one_crystal_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_one_crystal_b_01",
			},
			sound_events_duration = {
				[1] = 5.0772085189819,
			},
		},
		pwe_dal_conversation_group_one_dal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_one_dal_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_one_dal_b_01",
			},
			sound_events_duration = {
				[1] = 5.2329792976379,
			},
		},
		pwe_dal_conversation_group_one_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_one_okri_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_one_okri_b_01",
			},
			sound_events_duration = {
				[1] = 5.8470206260681,
			},
		},
		pwe_dal_conversation_group_one_title_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_one_title_a_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_one_title_a_01",
			},
			sound_events_duration = {
				[1] = 6.1862707138061,
			},
		},
		pwe_dal_conversation_group_one_title_two_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_one_title_two_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_one_title_two_b_01",
			},
			sound_events_duration = {
				[1] = 5.2789168357849,
			},
		},
		pwe_dal_conversation_group_three_disrepair_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events_duration = {
				[1] = 7.4312500953674,
			},
		},
		pwe_dal_conversation_group_three_engineer_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_three_engineer_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_three_engineer_b_01",
			},
			sound_events_duration = {
				[1] = 4.176833152771,
			},
		},
		pwe_dal_conversation_group_three_feet_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_three_feet_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_three_feet_b_01",
			},
			sound_events_duration = {
				[1] = 3.7370624542236,
			},
		},
		pwe_dal_conversation_group_three_progress_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_three_progress_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_three_progress_b_01",
			},
			sound_events_duration = {
				[1] = 2.6697707176209,
			},
		},
		pwe_dal_conversation_group_three_spy_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_three_spy_a_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_three_spy_a_01",
			},
			sound_events_duration = {
				[1] = 5.1138334274292,
			},
		},
		pwe_dal_conversation_group_two_contest_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_two_contest_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_two_contest_b_01",
			},
			sound_events_duration = {
				[1] = 4.2002081871033,
			},
		},
		pwe_dal_conversation_group_two_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_two_okri_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_two_okri_b_01",
			},
			sound_events_duration = {
				[1] = 3.3312709331513,
			},
		},
		pwe_dal_conversation_group_two_proof_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_two_proof_a_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_two_proof_a_01",
			},
			sound_events_duration = {
				[1] = 4.2449164390564,
			},
		},
		pwe_dal_conversation_group_two_respect_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_two_respect_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_two_respect_b_01",
			},
			sound_events_duration = {
				[1] = 2.7261250019074,
			},
		},
		pwe_dal_conversation_group_two_trolls_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_conversation_group_two_trolls_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_conversation_group_two_trolls_b_01",
			},
			sound_events_duration = {
				[1] = 2.7030625343323,
			},
		},
		pwh_dal_conversation_group_one_crystal_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_one_crystal_a_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_one_crystal_a_01",
			},
			sound_events_duration = {
				[1] = 7.5394582748413,
			},
		},
		pwh_dal_conversation_group_one_dal_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_one_dal_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_one_dal_b_01",
			},
			sound_events_duration = {
				[1] = 4.5848126411438,
			},
		},
		pwh_dal_conversation_group_one_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_one_okri_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_one_okri_b_01",
			},
			sound_events_duration = {
				[1] = 5.4150834083557,
			},
		},
		pwh_dal_conversation_group_one_title_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_one_title_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_one_title_b_01",
			},
			sound_events_duration = {
				[1] = 5.2843956947327,
			},
		},
		pwh_dal_conversation_group_one_title_two_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_one_title_two_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_one_title_two_b_01",
			},
			sound_events_duration = {
				[1] = 4.4478750228882,
			},
		},
		pwh_dal_conversation_group_three_disrepair_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_three_disrepair_b_01",
			},
			sound_events_duration = {
				[1] = 5.0093955993652,
			},
		},
		pwh_dal_conversation_group_three_engineer_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_three_engineer_a_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_three_engineer_a_01",
			},
			sound_events_duration = {
				[1] = 5.9475207328796,
			},
		},
		pwh_dal_conversation_group_three_feet_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_three_feet_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_three_feet_b_01",
			},
			sound_events_duration = {
				[1] = 3.6097707748413,
			},
		},
		pwh_dal_conversation_group_three_progress_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_three_progress_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_three_progress_b_01",
			},
			sound_events_duration = {
				[1] = 5.2887706756592,
			},
		},
		pwh_dal_conversation_group_three_spy_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_three_spy_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_three_spy_b_01",
			},
			sound_events_duration = {
				[1] = 4.3024792671204,
			},
		},
		pwh_dal_conversation_group_two_contest_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_two_contest_a_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_two_contest_a_01",
			},
			sound_events_duration = {
				[1] = 8.0818128585815,
			},
		},
		pwh_dal_conversation_group_two_okri_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_two_okri_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_two_okri_b_01",
			},
			sound_events_duration = {
				[1] = 5.4089584350586,
			},
		},
		pwh_dal_conversation_group_two_proof_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_two_proof_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_two_proof_b_01",
			},
			sound_events_duration = {
				[1] = 4.8146042823792,
			},
		},
		pwh_dal_conversation_group_two_respect_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_two_respect_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_two_respect_b_01",
			},
			sound_events_duration = {
				[1] = 6.2320418357849,
			},
		},
		pwh_dal_conversation_group_two_trolls_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_dal_conversation_group_two_trolls_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_conversation_group_two_trolls_b_01",
			},
			sound_events_duration = {
				[1] = 5.1885833740234,
			},
		},
	})
end
