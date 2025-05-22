-- chunkname: @dialogues/generated/wood_elf_dlc_termite_3.lua

return function ()
	define_rule({
		name = "pwe_gateway_accidental_bell_ring_a",
		probability = 1,
		response = "pwe_gateway_accidental_bell_ring_a",
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
		name = "pwe_gateway_bell_silenced_a",
		probability = 1,
		response = "pwe_gateway_bell_silenced_a",
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
		name = "pwe_gateway_bell_still_ringing_a",
		probability = 1,
		response = "pwe_gateway_bell_still_ringing_a",
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
		name = "pwe_gateway_bomb_hoist_c",
		probability = 1,
		response = "pwe_gateway_bomb_hoist_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_bomb_sighted_one_a",
		probability = 1,
		response = "pwe_gateway_bomb_sighted_one_a",
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
		name = "pwe_gateway_bomb_sighted_outside_a",
		probability = 1,
		response = "pwe_gateway_bomb_sighted_outside_a",
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
		name = "pwe_gateway_crest_door_a",
		probability = 1,
		response = "pwe_gateway_crest_door_a",
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
		name = "pwe_gateway_crest_tutorial_passage_b",
		probability = 1,
		response = "pwe_gateway_crest_tutorial_passage_b",
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
				"wood_elf",
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
		name = "pwe_gateway_crest_tutorial_passage_shield_a",
		probability = 1,
		response = "pwe_gateway_crest_tutorial_passage_shield_a",
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
		name = "pwe_gateway_crest_tutorial_passage_solved_a",
		probability = 1,
		response = "pwe_gateway_crest_tutorial_passage_solved_a",
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
				"gateway_crest_tutorial_passage_solved",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"gateway_crest_tutorial_passage_solved",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gateway_destroy_bell_prompt_a",
		probability = 1,
		response = "pwe_gateway_destroy_bell_prompt_a",
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
		name = "pwe_gateway_door_group_up_a",
		probability = 1,
		response = "pwe_gateway_door_group_up_a",
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
		name = "pwe_gateway_elevator_stop_a",
		probability = 1,
		response = "pwe_gateway_elevator_stop_a",
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
		name = "pwe_gateway_elevator_stop_b",
		probability = 1,
		response = "pwe_gateway_elevator_stop_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_end_event_bomb_sighted_a",
		probability = 1,
		response = "pwe_gateway_end_event_bomb_sighted_a",
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
		name = "pwe_gateway_event_aftermath_lift_a",
		probability = 1,
		response = "pwe_gateway_event_aftermath_lift_a",
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
		name = "pwe_gateway_event_complete_a",
		probability = 1,
		response = "pwe_gateway_event_complete_a",
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
				"wood_elf",
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
		name = "pwe_gateway_event_complete_b",
		probability = 1,
		response = "pwe_gateway_event_complete_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_event_first_prompt_a",
		probability = 1,
		response = "pwe_gateway_event_first_prompt_a",
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
		name = "pwe_gateway_event_gate_a",
		probability = 1,
		response = "pwe_gateway_event_gate_a",
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
		name = "pwe_gateway_event_gate_b",
		probability = 1,
		response = "pwe_gateway_event_gate_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_event_monster_attack_a",
		probability = 1,
		response = "pwe_gateway_event_monster_attack_a",
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
		name = "pwe_gateway_event_partial_success_01_d",
		probability = 1,
		response = "pwe_gateway_event_partial_success_01_d",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_event_start_a",
		probability = 1,
		response = "pwe_gateway_event_start_a",
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
		name = "pwe_gateway_event_start_b",
		probability = 1,
		response = "pwe_gateway_event_start_b",
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
		name = "pwe_gateway_event_start_c",
		probability = 1,
		response = "pwe_gateway_event_start_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_event_start_d",
		probability = 1,
		response = "pwe_gateway_event_start_d",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_gate_a",
		probability = 1,
		response = "pwe_gateway_gate_a",
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
		name = "pwe_gateway_gate_lever_a",
		probability = 1,
		response = "pwe_gateway_gate_lever_a",
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
				"faction_memory",
				"gateway_gate_lever_door",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gateway_gate_lever_b",
		probability = 1,
		response = "pwe_gateway_gate_lever_b",
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
		name = "pwe_gateway_loot_elevator_b",
		probability = 1,
		response = "pwe_gateway_loot_elevator_b",
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
				"wood_elf",
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
		name = "pwe_gateway_spotlight_triggered_b",
		probability = 1,
		response = "pwe_gateway_spotlight_triggered_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_start_banter_c",
		probability = 1,
		response = "pwe_gateway_start_banter_c",
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
				"gateway_start_banter_b",
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
		name = "pwe_gateway_traversal_one_a",
		probability = 1,
		response = "pwe_gateway_traversal_one_a",
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
		name = "pwe_gateway_traversal_one_b",
		probability = 1,
		response = "pwe_gateway_traversal_one_b",
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
				"wood_elf",
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
		name = "pwe_gateway_working_spotlight_one_b",
		probability = 1,
		response = "pwe_gateway_working_spotlight_one_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_working_spotlight_three_b",
		probability = 1,
		response = "pwe_gateway_working_spotlight_three_b",
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
				"wood_elf",
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
		name = "pwe_gateway_working_spotlight_two_b",
		probability = 1,
		response = "pwe_gateway_working_spotlight_two_b",
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
				"wood_elf",
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
		name = "pwe_gateway_wrecked_spotlight_a",
		probability = 1,
		response = "pwe_gateway_wrecked_spotlight_a",
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
		name = "pwe_gateway_wrecked_spotlight_b",
		probability = 1,
		response = "pwe_gateway_wrecked_spotlight_b",
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
		pwe_gateway_accidental_bell_ring_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_accidental_bell_ring_a_01",
				[2] = "pwe_gateway_accidental_bell_ring_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_accidental_bell_ring_a_01",
				[2] = "pwe_gateway_accidental_bell_ring_a_02",
			},
			sound_events_duration = {
				[1] = 1.6049791574478,
				[2] = 1.7338333129883,
			},
		},
		pwe_gateway_bell_silenced_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_bell_silenced_a_01",
				[2] = "pwe_gateway_bell_silenced_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_bell_silenced_a_01",
				[2] = "pwe_gateway_bell_silenced_a_02",
			},
			sound_events_duration = {
				[1] = 3.0851874351502,
				[2] = 1.2157917022705,
			},
		},
		pwe_gateway_bell_still_ringing_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_bell_still_ringing_a_01",
				[2] = "pwe_gateway_bell_still_ringing_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_bell_still_ringing_a_01",
				[2] = "pwe_gateway_bell_still_ringing_a_02",
			},
			sound_events_duration = {
				[1] = 2.5122916698456,
				[2] = 2.2336874008179,
			},
		},
		pwe_gateway_bomb_hoist_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_bomb_hoist_c_01",
				[2] = "pwe_gateway_bomb_hoist_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_bomb_hoist_c_01",
				[2] = "pwe_gateway_bomb_hoist_c_02",
			},
			sound_events_duration = {
				[1] = 1.7177083492279,
				[2] = 2.8944375514984,
			},
		},
		pwe_gateway_bomb_sighted_one_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_bomb_sighted_one_a_01",
				[2] = "pwe_gateway_bomb_sighted_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_bomb_sighted_one_a_01",
				[2] = "pwe_gateway_bomb_sighted_one_a_02",
			},
			sound_events_duration = {
				[1] = 1.9658750295639,
				[2] = 1.4964375495911,
			},
		},
		pwe_gateway_bomb_sighted_outside_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_gateway_bomb_sighted_outside_a_01",
			},
			sound_events = {
				[1] = "pwe_gateway_bomb_sighted_outside_a_01",
			},
			sound_events_duration = {
				[1] = 2.0406875610352,
			},
		},
		pwe_gateway_crest_door_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_crest_door_a_01",
				[2] = "pwe_gateway_crest_door_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_crest_door_a_01",
				[2] = "pwe_gateway_crest_door_a_02",
			},
			sound_events_duration = {
				[1] = 3.3341040611267,
				[2] = 2.8950834274292,
			},
		},
		pwe_gateway_crest_tutorial_passage_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_crest_tutorial_passage_b_01",
				[2] = "pwe_gateway_crest_tutorial_passage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_crest_tutorial_passage_b_01",
				[2] = "pwe_gateway_crest_tutorial_passage_b_02",
			},
			sound_events_duration = {
				[1] = 2.4578957557678,
				[2] = 3.209979057312,
			},
		},
		pwe_gateway_crest_tutorial_passage_shield_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pwe_gateway_crest_tutorial_passage_shield_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pwe_gateway_crest_tutorial_passage_shield_a_02",
			},
			sound_events_duration = {
				[1] = 2.2067291736603,
				[2] = 2.6068332195282,
			},
		},
		pwe_gateway_crest_tutorial_passage_solved_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pwe_gateway_crest_tutorial_passage_solved_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pwe_gateway_crest_tutorial_passage_solved_a_02",
			},
			sound_events_duration = {
				[1] = 4.9774374961853,
				[2] = 2.9534375667572,
			},
		},
		pwe_gateway_destroy_bell_prompt_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				"pwe_gateway_destroy_bell_prompt_a_01",
				"pwe_gateway_destroy_bell_prompt_a_02",
				"pwe_gateway_destroy_bell_prompt_a_03",
				"pwe_gateway_destroy_bell_prompt_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gateway_destroy_bell_prompt_a_01",
				"pwe_gateway_destroy_bell_prompt_a_02",
				"pwe_gateway_destroy_bell_prompt_a_03",
				"pwe_gateway_destroy_bell_prompt_a_04",
			},
			sound_events_duration = {
				1.3700833320618,
				2.0406875610352,
				1.3402082920075,
				1.7932499647141,
			},
		},
		pwe_gateway_door_group_up_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_door_group_up_a_01",
				[2] = "pwe_gateway_door_group_up_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_door_group_up_a_01",
				[2] = "pwe_gateway_door_group_up_a_02",
			},
			sound_events_duration = {
				[1] = 3.0664792060852,
				[2] = 2.3652083873749,
			},
		},
		pwe_gateway_elevator_stop_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_elevator_stop_a_01",
				[2] = "pwe_gateway_elevator_stop_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_elevator_stop_a_01",
				[2] = "pwe_gateway_elevator_stop_a_02",
			},
			sound_events_duration = {
				[1] = 2.2988958358765,
				[2] = 3.2169373035431,
			},
		},
		pwe_gateway_elevator_stop_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_elevator_stop_b_01",
				[2] = "pwe_gateway_elevator_stop_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_elevator_stop_b_01",
				[2] = "pwe_gateway_elevator_stop_b_02",
			},
			sound_events_duration = {
				[1] = 3.4979791641235,
				[2] = 3.6026666164398,
			},
		},
		pwe_gateway_end_event_bomb_sighted_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_end_event_bomb_sighted_a_01",
				[2] = "pwe_gateway_end_event_bomb_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_end_event_bomb_sighted_a_01",
				[2] = "pwe_gateway_end_event_bomb_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 1.4928749799728,
				[2] = 1.366291642189,
			},
		},
		pwe_gateway_event_aftermath_lift_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_aftermath_lift_a_01",
				[2] = "pwe_gateway_event_aftermath_lift_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_aftermath_lift_a_01",
				[2] = "pwe_gateway_event_aftermath_lift_a_02",
			},
			sound_events_duration = {
				[1] = 2.3933959007263,
				[2] = 1.96975004673,
			},
		},
		pwe_gateway_event_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_complete_a_01",
				[2] = "pwe_gateway_event_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_complete_a_01",
				[2] = "pwe_gateway_event_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.8026874065399,
				[2] = 2.53870844841,
			},
		},
		pwe_gateway_event_complete_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_complete_b_01",
				[2] = "pwe_gateway_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_complete_b_01",
				[2] = "pwe_gateway_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.4163334369659,
				[2] = 2.2715208530426,
			},
		},
		pwe_gateway_event_first_prompt_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_first_prompt_a_01",
				[2] = "pwe_gateway_event_first_prompt_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_first_prompt_a_01",
				[2] = "pwe_gateway_event_first_prompt_a_02",
			},
			sound_events_duration = {
				[1] = 2.4275624752045,
				[2] = 2.6143124103546,
			},
		},
		pwe_gateway_event_gate_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_gate_a_01",
				[2] = "pwe_gateway_event_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_gate_a_01",
				[2] = "pwe_gateway_event_gate_a_02",
			},
			sound_events_duration = {
				[1] = 4.8893752098083,
				[2] = 3.5394999980927,
			},
		},
		pwe_gateway_event_gate_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_gate_b_01",
				[2] = "pwe_gateway_event_gate_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_gate_b_01",
				[2] = "pwe_gateway_event_gate_b_02",
			},
			sound_events_duration = {
				[1] = 3.0695834159851,
				[2] = 1.8058124780655,
			},
		},
		pwe_gateway_event_monster_attack_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_monster_attack_a_01",
				[2] = "pwe_gateway_event_monster_attack_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_monster_attack_a_01",
				[2] = "pwe_gateway_event_monster_attack_a_02",
			},
			sound_events_duration = {
				[1] = 1.9798749685288,
				[2] = 1.4744166135788,
			},
		},
		pwe_gateway_event_partial_success_01_d = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_partial_success_01_d_01",
				[2] = "pwe_gateway_event_partial_success_01_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_partial_success_01_d_01",
				[2] = "pwe_gateway_event_partial_success_01_d_02",
			},
			sound_events_duration = {
				[1] = 1.6777291297913,
				[2] = 1.0632708072662,
			},
		},
		pwe_gateway_event_start_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				"pwe_gateway_event_start_a_01",
				"pwe_gateway_event_start_a_02",
				"pwe_gateway_event_start_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gateway_event_start_a_01",
				"pwe_gateway_event_start_a_02",
				"pwe_gateway_event_start_a_03",
			},
			sound_events_duration = {
				3.1987707614899,
				3.0598332881927,
				3.2218749523163,
			},
		},
		pwe_gateway_event_start_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_start_b_01",
				[2] = "pwe_gateway_event_start_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_start_b_01",
				[2] = "pwe_gateway_event_start_b_02",
			},
			sound_events_duration = {
				[1] = 3.236249923706,
				[2] = 2.317479133606,
			},
		},
		pwe_gateway_event_start_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_start_c_01",
				[2] = "pwe_gateway_event_start_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_start_c_01",
				[2] = "pwe_gateway_event_start_c_02",
			},
			sound_events_duration = {
				[1] = 2.8189375400543,
				[2] = 2.7811250686645,
			},
		},
		pwe_gateway_event_start_d = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_event_start_d_01",
				[2] = "pwe_gateway_event_start_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_event_start_d_01",
				[2] = "pwe_gateway_event_start_d_02",
			},
			sound_events_duration = {
				[1] = 3.2848334312439,
				[2] = 3.5693333148956,
			},
		},
		pwe_gateway_gate_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_gate_a_01",
				[2] = "pwe_gateway_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_gate_a_01",
				[2] = "pwe_gateway_gate_a_02",
			},
			sound_events_duration = {
				[1] = 1.5107500553131,
				[2] = 1.4830833673477,
			},
		},
		pwe_gateway_gate_lever_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				"pwe_generic_path_blocked_01",
				"pwe_generic_path_blocked_02",
				"pwe_generic_path_blocked_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_path_blocked_01",
				"pwe_generic_path_blocked_02",
				"pwe_generic_path_blocked_03",
			},
			sound_events_duration = {
				0.86000001430511,
				1.9159791469574,
				1.2020000219345,
			},
		},
		pwe_gateway_gate_lever_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_level_skittergate_activate_gate_04",
				[2] = "pwe_level_skittergate_activate_gate_03_TERMITE",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_skittergate_activate_gate_04",
				[2] = "pwe_level_skittergate_activate_gate_03_TERMITE",
			},
			sound_events_duration = {
				[1] = 4.0415835380554,
				[2] = 1.7753125429153,
			},
		},
		pwe_gateway_loot_elevator_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_loot_elevator_b_01",
				[2] = "pwe_gateway_loot_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_loot_elevator_b_01",
				[2] = "pwe_gateway_loot_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 3.2847292423248,
				[2] = 3.2867083549499,
			},
		},
		pwe_gateway_spotlight_triggered_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_spotlight_triggered_b_01",
				[2] = "pwe_gateway_spotlight_triggered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_spotlight_triggered_b_01",
				[2] = "pwe_gateway_spotlight_triggered_b_02",
			},
			sound_events_duration = {
				[1] = 2.2078125476837,
				[2] = 2.6173958778381,
			},
		},
		pwe_gateway_start_banter_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_3",
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
				"pwe_gateway_start_banter_c_01",
				"pwe_gateway_start_banter_c_02",
				"pwe_gateway_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gateway_start_banter_c_01",
				"pwe_gateway_start_banter_c_02",
				"pwe_gateway_start_banter_c_03",
			},
			sound_events_duration = {
				2.0394582748413,
				3.0911250114441,
				4.25545835495,
			},
		},
		pwe_gateway_traversal_one_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_traversal_one_a_01",
				[2] = "pwe_gateway_traversal_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_traversal_one_a_01",
				[2] = "pwe_gateway_traversal_one_a_02",
			},
			sound_events_duration = {
				[1] = 4.0003957748413,
				[2] = 4.7034168243408,
			},
		},
		pwe_gateway_traversal_one_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_traversal_one_b_01",
				[2] = "pwe_gateway_traversal_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_traversal_one_b_01",
				[2] = "pwe_gateway_traversal_one_b_02",
			},
			sound_events_duration = {
				[1] = 4.5732707977295,
				[2] = 4.0668749809265,
			},
		},
		pwe_gateway_working_spotlight_one_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_working_spotlight_one_b_01",
				[2] = "pwe_gateway_working_spotlight_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_working_spotlight_one_b_01",
				[2] = "pwe_gateway_working_spotlight_one_b_02",
			},
			sound_events_duration = {
				[1] = 2.8560416698456,
				[2] = 3.7248542308807,
			},
		},
		pwe_gateway_working_spotlight_three_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_working_spotlight_three_b_01",
				[2] = "pwe_gateway_working_spotlight_three_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_working_spotlight_three_b_01",
				[2] = "pwe_gateway_working_spotlight_three_b_02",
			},
			sound_events_duration = {
				[1] = 2.8492500782013,
				[2] = 2.7309582233429,
			},
		},
		pwe_gateway_working_spotlight_two_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_working_spotlight_two_b_01",
				[2] = "pwe_gateway_working_spotlight_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_working_spotlight_two_b_01",
				[2] = "pwe_gateway_working_spotlight_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.7365624904633,
				[2] = 4.6434373855591,
			},
		},
		pwe_gateway_wrecked_spotlight_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_wrecked_spotlight_a_01",
				[2] = "pwe_gateway_wrecked_spotlight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_wrecked_spotlight_a_01",
				[2] = "pwe_gateway_wrecked_spotlight_a_02",
			},
			sound_events_duration = {
				[1] = 3.2575833797455,
				[2] = 3.1573541164398,
			},
		},
		pwe_gateway_wrecked_spotlight_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_3",
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
				[1] = "pwe_gateway_wrecked_spotlight_b_01",
				[2] = "pwe_gateway_wrecked_spotlight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_gateway_wrecked_spotlight_b_01",
				[2] = "pwe_gateway_wrecked_spotlight_b_02",
			},
			sound_events_duration = {
				[1] = 2.3056874275208,
				[2] = 2.1942291259766,
			},
		},
	})
end
