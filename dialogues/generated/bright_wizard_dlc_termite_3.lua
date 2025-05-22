-- chunkname: @dialogues/generated/bright_wizard_dlc_termite_3.lua

return function ()
	define_rule({
		name = "pbw_gateway_accidental_bell_ring_a",
		probability = 1,
		response = "pbw_gateway_accidental_bell_ring_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_accidental_bell_ring_a",
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
		name = "pbw_gateway_bell_silenced_a",
		probability = 1,
		response = "pbw_gateway_bell_silenced_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_bell_silenced_a",
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
		name = "pbw_gateway_bell_still_ringing_a",
		probability = 1,
		response = "pbw_gateway_bell_still_ringing_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_bell_ringing_reminder",
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
		name = "pbw_gateway_bomb_hoist_c",
		probability = 1,
		response = "pbw_gateway_bomb_hoist_c",
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
				"vmg_b_gateway_bomb_hoist_b",
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
		name = "pbw_gateway_bomb_sighted_one_a",
		probability = 1,
		response = "pbw_gateway_bomb_sighted_one_a",
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
				"gateway_bomb_sighted_one_a",
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
				"gateway_bomb_sighted_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_bomb_sighted_one",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_bomb_sighted_outside_a",
		probability = 1,
		response = "pbw_gateway_bomb_sighted_outside_a",
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
				"gateway_bomb_sighted_outside_a",
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
				"outside_bomb_vo_disable",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"gateway_bomb_sighted_outside",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_bomb_sighted_outside",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_crest_door_a",
		probability = 1,
		response = "pbw_gateway_crest_door_a",
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
				"gateway_crest_door_a",
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
				"gateway_crest_door",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_crest_door",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_crest_tutorial_passage_a",
		probability = 1,
		response = "pbw_gateway_crest_tutorial_passage_a",
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
				"gateway_crest_tutorial_passage_a",
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
				"gateway_crest_tutorial_passage",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_crest_tutorial_passage",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_crest_tutorial_passage_b",
		probability = 1,
		response = "pbw_gateway_crest_tutorial_passage_b",
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
				"gateway_crest_tutorial_passage_a",
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
		},
	})
	define_rule({
		name = "pbw_gateway_crest_tutorial_passage_shield_a",
		probability = 1,
		response = "pbw_gateway_crest_tutorial_passage_shield_a",
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
				"gateway_crest_tutorial_passage_shield_a",
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
				"gateway_crest_tutorial_passage",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"gateway_crest_tutorial_passage_shield",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_crest_tutorial_passage_shield",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_crest_tutorial_passage_solved_a",
		probability = 1,
		response = "pbw_gateway_crest_tutorial_passage_solved_a",
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
				"gateway_crest_tutorial_passage_solved_a",
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
		name = "pbw_gateway_destroy_bell_prompt_a",
		probability = 1,
		response = "pbw_gateway_destroy_bell_prompt_a",
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
				"gateway_destroy_bell_prompt_a",
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
		name = "pbw_gateway_door_group_up_a",
		probability = 1,
		response = "pbw_gateway_door_group_up_a",
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
				"gateway_door_group_up_a",
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
		name = "pbw_gateway_elevator_stop_a",
		probability = 1,
		response = "pbw_gateway_elevator_stop_a",
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
				"gateway_elevator_stop_a",
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
		name = "pbw_gateway_elevator_stop_b",
		probability = 1,
		response = "pbw_gateway_elevator_stop_b",
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
				"gateway_elevator_stop_a",
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
		name = "pbw_gateway_end_event_bomb_sighted_a",
		probability = 1,
		response = "pbw_gateway_end_event_bomb_sighted_a",
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
				"gateway_end_event_bomb_sighted_a",
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
				"gateway_end_event_bomb_sighted",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_end_event_bomb_sighted",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_event_aftermath_lift_a",
		probability = 1,
		response = "pbw_gateway_event_aftermath_lift_a",
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
				"gateway_event_aftermath_lift_a",
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
				"gateway_end_event_done",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"gateway_event_aftermath_lift",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_event_aftermath_lift",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_event_complete_a",
		probability = 1,
		response = "pbw_gateway_event_complete_a",
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
				"gateway_event_complete_a",
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
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_event_complete_b",
		probability = 1,
		response = "pbw_gateway_event_complete_b",
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
				"gateway_event_complete_a",
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
		name = "pbw_gateway_event_first_prompt_a",
		probability = 1,
		response = "pbw_gateway_event_first_prompt_a",
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
				"gateway_event_start_d",
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
				"gateway_event_first_prompt",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_event_first_prompt",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_event_gate_a",
		probability = 1,
		response = "pbw_gateway_event_gate_a",
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
				"vmg_b_gateway_event_monster_dead_a",
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
		name = "pbw_gateway_event_gate_b",
		probability = 1,
		response = "pbw_gateway_event_gate_b",
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
				"gateway_event_gate_a",
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
		name = "pbw_gateway_event_monster_attack_a",
		probability = 1,
		response = "pbw_gateway_event_monster_attack_a",
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
				"gateway_event_monster_attack_a",
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
		name = "pbw_gateway_event_partial_success_01_d",
		probability = 1,
		response = "pbw_gateway_event_partial_success_01_d",
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
				"vmg_b_gateway_event_partial_success_01_c",
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
		name = "pbw_gateway_event_start_a",
		probability = 1,
		response = "pbw_gateway_event_start_a",
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
				"gateway_event_start_a",
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
				"wood_elf",
				OP.EQ,
				0,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_event_start_b",
		probability = 1,
		response = "pbw_gateway_event_start_b",
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
				"gateway_event_start_b",
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
				"gateway_event_start",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_event_start",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_event_start_c",
		probability = 1,
		response = "pbw_gateway_event_start_c",
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
				"gateway_event_start_b",
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
		name = "pbw_gateway_event_start_d",
		probability = 1,
		response = "pbw_gateway_event_start_d",
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
				"gateway_event_start_c",
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
		name = "pbw_gateway_gate_a",
		probability = 1,
		response = "pbw_gateway_gate_a",
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
				"gateway_gate_a",
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
				"gateway_gate",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_gate",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_gate_lever_a",
		probability = 1,
		response = "pbw_gateway_gate_lever_a",
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
				"gateway_gate_lever_door_a",
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
				"gateway_gate_lever",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"gateway_gate_lever_door",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"seen_gate_lever",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"gateway_gate_lever_door",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_gate_lever_b",
		probability = 1,
		response = "pbw_gateway_gate_lever_b",
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
				"gateway_gate_lever_a",
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
				"user_memory",
				"seen_gate_lever",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"gateway_gate_lever",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_gate_lever",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_loot_elevator_b",
		probability = 1,
		response = "pbw_gateway_loot_elevator_b",
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
				"nik_gateway_loot_elevator_a",
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
		},
	})
	define_rule({
		name = "pbw_gateway_spotlight_triggered_b",
		probability = 1,
		response = "pbw_gateway_spotlight_triggered_b",
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
				"vmg_a_gateway_spotlight_triggered_a",
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
		name = "pbw_gateway_start_banter_b",
		probability = 1,
		response = "pbw_gateway_start_banter_b",
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
				"nik_gateway_start_banter_a",
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
		name = "pbw_gateway_traversal_one_a",
		probability = 1,
		response = "pbw_gateway_traversal_one_a",
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
				"gateway_traversal_one_a",
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
				"user_context",
				"intensity",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"gateway_traversal_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_traversal_one",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_traversal_one_b",
		probability = 1,
		response = "pbw_gateway_traversal_one_b",
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
				"gateway_traversal_one_a",
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
		},
	})
	define_rule({
		name = "pbw_gateway_working_spotlight_one_b",
		probability = 1,
		response = "pbw_gateway_working_spotlight_one_b",
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
				"nik_gateway_working_spotlight_one_a",
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
		name = "pbw_gateway_working_spotlight_three_b",
		probability = 1,
		response = "pbw_gateway_working_spotlight_three_b",
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
				"nik_gateway_working_spotlight_three_a",
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
		},
	})
	define_rule({
		name = "pbw_gateway_working_spotlight_two_b",
		probability = 1,
		response = "pbw_gateway_working_spotlight_two_b",
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
				"nik_gateway_working_spotlight_two_a",
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
		},
	})
	define_rule({
		name = "pbw_gateway_wrecked_spotlight_a",
		probability = 1,
		response = "pbw_gateway_wrecked_spotlight_a",
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
				"gateway_wrecked_spotlight_a",
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
				"gateway_wrecked_spotlight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"seen_spotlight",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"gateway_wrecked_spotlight",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_wrecked_spotlight_b",
		probability = 1,
		response = "pbw_gateway_wrecked_spotlight_b",
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
				"gateway_wrecked_spotlight_a",
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
				"user_memory",
				"seen_spotlight",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"gateway_wrecked_spotlight",
				OP.EQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_wrecked_spotlight",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_gateway_accidental_bell_ring_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_accidental_bell_ring_a_01",
				[2] = "pbw_gateway_accidental_bell_ring_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_accidental_bell_ring_a_01",
				[2] = "pbw_gateway_accidental_bell_ring_a_02",
			},
			sound_events_duration = {
				[1] = 2.2988750934601,
				[2] = 1.8842083215714,
			},
		},
		pbw_gateway_bell_silenced_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_bell_silenced_a_01",
				[2] = "pbw_gateway_bell_silenced_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_bell_silenced_a_01",
				[2] = "pbw_gateway_bell_silenced_a_02",
			},
			sound_events_duration = {
				[1] = 2.8916459083557,
				[2] = 3.274749994278,
			},
		},
		pbw_gateway_bell_still_ringing_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_bell_still_ringing_a_01",
				[2] = "pbw_gateway_bell_still_ringing_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_bell_still_ringing_a_01",
				[2] = "pbw_gateway_bell_still_ringing_a_02",
			},
			sound_events_duration = {
				[1] = 2.8816249370575,
				[2] = 2.9052500724792,
			},
		},
		pbw_gateway_bomb_hoist_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_bomb_hoist_c_01",
				[2] = "pbw_gateway_bomb_hoist_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_bomb_hoist_c_01",
				[2] = "pbw_gateway_bomb_hoist_c_02",
			},
			sound_events_duration = {
				[1] = 2.834979057312,
				[2] = 1.55568754673,
			},
		},
		pbw_gateway_bomb_sighted_one_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_bomb_sighted_one_a_01",
				[2] = "pbw_gateway_bomb_sighted_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_bomb_sighted_one_a_01",
				[2] = "pbw_gateway_bomb_sighted_one_a_02",
			},
			sound_events_duration = {
				[1] = 1.7258750200272,
				[2] = 2.4468958377838,
			},
		},
		pbw_gateway_bomb_sighted_outside_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_bomb_sighted_outside_a_01",
				[2] = "pbw_gateway_bomb_sighted_outside_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_bomb_sighted_outside_a_01",
				[2] = "pbw_gateway_bomb_sighted_outside_a_02",
			},
			sound_events_duration = {
				[1] = 2.4800832271576,
				[2] = 3.2450416088104,
			},
		},
		pbw_gateway_crest_door_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_crest_door_a_01",
				[2] = "pbw_gateway_crest_door_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_crest_door_a_01",
				[2] = "pbw_gateway_crest_door_a_02",
			},
			sound_events_duration = {
				[1] = 2.3113541603088,
				[2] = 2.426500082016,
			},
		},
		pbw_gateway_crest_tutorial_passage_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_crest_tutorial_passage_a_01",
				[2] = "pbw_gateway_crest_tutorial_passage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_crest_tutorial_passage_a_01",
				[2] = "pbw_gateway_crest_tutorial_passage_a_02",
			},
			sound_events_duration = {
				[1] = 2.4175207614899,
				[2] = 1.6807708740234,
			},
		},
		pbw_gateway_crest_tutorial_passage_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_crest_tutorial_passage_b_01",
				[2] = "pbw_gateway_crest_tutorial_passage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_crest_tutorial_passage_b_01",
				[2] = "pbw_gateway_crest_tutorial_passage_b_02",
			},
			sound_events_duration = {
				[1] = 3.0433750152588,
				[2] = 2.8530833721161,
			},
		},
		pbw_gateway_crest_tutorial_passage_shield_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pbw_gateway_crest_tutorial_passage_shield_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pbw_gateway_crest_tutorial_passage_shield_a_02",
			},
			sound_events_duration = {
				[1] = 3.5585000514984,
				[2] = 3.0421874523163,
			},
		},
		pbw_gateway_crest_tutorial_passage_solved_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pbw_gateway_crest_tutorial_passage_solved_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pbw_gateway_crest_tutorial_passage_solved_a_02",
			},
			sound_events_duration = {
				[1] = 2.8551042079926,
				[2] = 2.0517709255219,
			},
		},
		pbw_gateway_destroy_bell_prompt_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				"pbw_gateway_destroy_bell_prompt_a_01",
				"pbw_gateway_destroy_bell_prompt_a_02",
				"pbw_gateway_destroy_bell_prompt_a_03",
				"pbw_gateway_destroy_bell_prompt_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gateway_destroy_bell_prompt_a_01",
				"pbw_gateway_destroy_bell_prompt_a_02",
				"pbw_gateway_destroy_bell_prompt_a_03",
				"pbw_gateway_destroy_bell_prompt_a_04",
			},
			sound_events_duration = {
				2.811187505722,
				2.3125834465027,
				2.6970417499542,
				3.5290832519531,
			},
		},
		pbw_gateway_door_group_up_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_door_group_up_a_01",
				[2] = "pbw_gateway_door_group_up_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_door_group_up_a_01",
				[2] = "pbw_gateway_door_group_up_a_02",
			},
			sound_events_duration = {
				[1] = 2.1378333568573,
				[2] = 2.0680415630341,
			},
		},
		pbw_gateway_elevator_stop_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_elevator_stop_a_01",
				[2] = "pbw_gateway_elevator_stop_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_elevator_stop_a_01",
				[2] = "pbw_gateway_elevator_stop_a_02",
			},
			sound_events_duration = {
				[1] = 2.5981457233429,
				[2] = 1.7066875696182,
			},
		},
		pbw_gateway_elevator_stop_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_elevator_stop_b_01",
				[2] = "pbw_gateway_elevator_stop_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_elevator_stop_b_01",
				[2] = "pbw_gateway_elevator_stop_b_02",
			},
			sound_events_duration = {
				[1] = 3.1596040725708,
				[2] = 1.9055207967758,
			},
		},
		pbw_gateway_end_event_bomb_sighted_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_end_event_bomb_sighted_a_01",
				[2] = "pbw_gateway_end_event_bomb_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_end_event_bomb_sighted_a_01",
				[2] = "pbw_gateway_end_event_bomb_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 0.99164581298828,
				[2] = 2.5514583587647,
			},
		},
		pbw_gateway_event_aftermath_lift_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_aftermath_lift_a_01",
				[2] = "pbw_gateway_event_aftermath_lift_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_aftermath_lift_a_01",
				[2] = "pbw_gateway_event_aftermath_lift_a_02",
			},
			sound_events_duration = {
				[1] = 2.4616458415985,
				[2] = 1.8313332796097,
			},
		},
		pbw_gateway_event_complete_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_complete_a_01",
				[2] = "pbw_gateway_event_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_complete_a_01",
				[2] = "pbw_gateway_event_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.0518124103546,
				[2] = 3.1476666927338,
			},
		},
		pbw_gateway_event_complete_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_complete_b_01",
				[2] = "pbw_gateway_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_complete_b_01",
				[2] = "pbw_gateway_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.8739376068115,
				[2] = 3.1762707233429,
			},
		},
		pbw_gateway_event_first_prompt_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_first_prompt_a_01",
				[2] = "pbw_gateway_event_first_prompt_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_first_prompt_a_01",
				[2] = "pbw_gateway_event_first_prompt_a_02",
			},
			sound_events_duration = {
				[1] = 3.665958404541,
				[2] = 3.782208442688,
			},
		},
		pbw_gateway_event_gate_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_gate_a_01",
				[2] = "pbw_gateway_event_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_gate_a_01",
				[2] = "pbw_gateway_event_gate_a_02",
			},
			sound_events_duration = {
				[1] = 3.6413750648499,
				[2] = 3.2634167671204,
			},
		},
		pbw_gateway_event_gate_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_gate_b_01",
				[2] = "pbw_gateway_event_gate_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_gate_b_01",
				[2] = "pbw_gateway_event_gate_b_02",
			},
			sound_events_duration = {
				[1] = 2.566645860672,
				[2] = 2.8006250858307,
			},
		},
		pbw_gateway_event_monster_attack_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_monster_attack_a_01",
				[2] = "pbw_gateway_event_monster_attack_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_monster_attack_a_01",
				[2] = "pbw_gateway_event_monster_attack_a_02",
			},
			sound_events_duration = {
				[1] = 1.4937499761581,
				[2] = 0.95700001716614,
			},
		},
		pbw_gateway_event_partial_success_01_d = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_partial_success_01_d_01",
				[2] = "pbw_gateway_event_partial_success_01_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_partial_success_01_d_01",
				[2] = "pbw_gateway_event_partial_success_01_d_02",
			},
			sound_events_duration = {
				[1] = 3.3974583148956,
				[2] = 2.1657292842865,
			},
		},
		pbw_gateway_event_start_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				"pbw_gateway_event_start_a_01",
				"pbw_gateway_event_start_a_02",
				"pbw_gateway_event_start_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gateway_event_start_a_01",
				"pbw_gateway_event_start_a_02",
				"pbw_gateway_event_start_a_03",
			},
			sound_events_duration = {
				2.6323957443237,
				2.2923541069031,
				2.9059166908264,
			},
		},
		pbw_gateway_event_start_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_start_b_01",
				[2] = "pbw_gateway_event_start_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_start_b_01",
				[2] = "pbw_gateway_event_start_b_02",
			},
			sound_events_duration = {
				[1] = 2.3997082710266,
				[2] = 2.3086457252502,
			},
		},
		pbw_gateway_event_start_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_start_c_01",
				[2] = "pbw_gateway_event_start_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_start_c_01",
				[2] = "pbw_gateway_event_start_c_02",
			},
			sound_events_duration = {
				[1] = 1.8816666603088,
				[2] = 3.3051042556763,
			},
		},
		pbw_gateway_event_start_d = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_event_start_d_01",
				[2] = "pbw_gateway_event_start_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_event_start_d_01",
				[2] = "pbw_gateway_event_start_d_02",
			},
			sound_events_duration = {
				[1] = 3.4808332920074,
				[2] = 2.1879167556763,
			},
		},
		pbw_gateway_gate_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_gate_a_01",
				[2] = "pbw_gateway_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_gate_a_01",
				[2] = "pbw_gateway_gate_a_02",
			},
			sound_events_duration = {
				[1] = 2.0457499027252,
				[2] = 1.1308125257492,
			},
		},
		pbw_gateway_gate_lever_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.2289791107178,
				1.2300000190735,
				2.397979259491,
			},
		},
		pbw_gateway_gate_lever_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				"pbw_level_skittergate_activate_gate_02",
				"pbw_level_skittergate_activate_gate_03_TERMITE",
				"pbw_level_skittergate_activate_gate_04_TERMITE",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_skittergate_activate_gate_02",
				"pbw_level_skittergate_activate_gate_03_TERMITE",
				"pbw_level_skittergate_activate_gate_04_TERMITE",
			},
			sound_events_duration = {
				5.2125835418701,
				1.5209374427795,
				3.0491042137146,
			},
		},
		pbw_gateway_loot_elevator_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_loot_elevator_b_01",
				[2] = "pbw_gateway_loot_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_loot_elevator_b_01",
				[2] = "pbw_gateway_loot_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 2.3468749523163,
				[2] = 3.6990208625794,
			},
		},
		pbw_gateway_spotlight_triggered_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_spotlight_triggered_b_01",
				[2] = "pbw_gateway_spotlight_triggered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_spotlight_triggered_b_01",
				[2] = "pbw_gateway_spotlight_triggered_b_02",
			},
			sound_events_duration = {
				[1] = 2.3001666069031,
				[2] = 2.4978749752045,
			},
		},
		pbw_gateway_start_banter_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_start_banter_b_01",
				[2] = "pbw_gateway_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_start_banter_b_01",
				[2] = "pbw_gateway_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.2276248931885,
				[2] = 3.6150417327881,
			},
		},
		pbw_gateway_traversal_one_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_traversal_one_a_01",
				[2] = "pbw_gateway_traversal_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_traversal_one_a_01",
				[2] = "pbw_gateway_traversal_one_a_02",
			},
			sound_events_duration = {
				[1] = 3.246812582016,
				[2] = 5.4305834770203,
			},
		},
		pbw_gateway_traversal_one_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_traversal_one_b_01",
				[2] = "pbw_gateway_traversal_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_traversal_one_b_01",
				[2] = "pbw_gateway_traversal_one_b_02",
			},
			sound_events_duration = {
				[1] = 3.6460208892822,
				[2] = 4.0309791564941,
			},
		},
		pbw_gateway_working_spotlight_one_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_working_spotlight_one_b_01",
				[2] = "pbw_gateway_working_spotlight_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_working_spotlight_one_b_01",
				[2] = "pbw_gateway_working_spotlight_one_b_02",
			},
			sound_events_duration = {
				[1] = 2.5395834445953,
				[2] = 2.3646667003632,
			},
		},
		pbw_gateway_working_spotlight_three_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_working_spotlight_three_b_01",
				[2] = "pbw_gateway_working_spotlight_three_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_working_spotlight_three_b_01",
				[2] = "pbw_gateway_working_spotlight_three_b_02",
			},
			sound_events_duration = {
				[1] = 3.4760415554047,
				[2] = 1.876416683197,
			},
		},
		pbw_gateway_working_spotlight_two_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_working_spotlight_two_b_01",
				[2] = "pbw_gateway_working_spotlight_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_working_spotlight_two_b_01",
				[2] = "pbw_gateway_working_spotlight_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.4108333587647,
				[2] = 3.1225624084473,
			},
		},
		pbw_gateway_wrecked_spotlight_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_wrecked_spotlight_a_01",
				[2] = "pbw_gateway_wrecked_spotlight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_wrecked_spotlight_a_01",
				[2] = "pbw_gateway_wrecked_spotlight_a_02",
			},
			sound_events_duration = {
				[1] = 1.8416249752045,
				[2] = 2.1315417289734,
			},
		},
		pbw_gateway_wrecked_spotlight_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_3",
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
				[1] = "pbw_gateway_wrecked_spotlight_b_01",
				[2] = "pbw_gateway_wrecked_spotlight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_wrecked_spotlight_b_01",
				[2] = "pbw_gateway_wrecked_spotlight_b_02",
			},
			sound_events_duration = {
				[1] = 2.2850208282471,
				[2] = 3.8659374713898,
			},
		},
	})
end
