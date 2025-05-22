-- chunkname: @dialogues/generated/witch_hunter_dlc_termite_3.lua

return function ()
	define_rule({
		name = "pwh_gateway_accidental_bell_ring_a",
		probability = 1,
		response = "pwh_gateway_accidental_bell_ring_a",
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
		name = "pwh_gateway_bell_silenced_a",
		probability = 1,
		response = "pwh_gateway_bell_silenced_a",
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
		name = "pwh_gateway_bell_still_ringing_a",
		probability = 1,
		response = "pwh_gateway_bell_still_ringing_a",
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
		name = "pwh_gateway_bomb_hoist_c",
		probability = 1,
		response = "pwh_gateway_bomb_hoist_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_bomb_sighted_one_a",
		probability = 1,
		response = "pwh_gateway_bomb_sighted_one_a",
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
		name = "pwh_gateway_bomb_sighted_outside_a",
		probability = 1,
		response = "pwh_gateway_bomb_sighted_outside_a",
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
		name = "pwh_gateway_crest_door_a",
		probability = 1,
		response = "pwh_gateway_crest_door_a",
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
		name = "pwh_gateway_crest_tutorial_passage_a",
		probability = 1,
		response = "pwh_gateway_crest_tutorial_passage_a",
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
		name = "pwh_gateway_crest_tutorial_passage_b",
		probability = 1,
		response = "pwh_gateway_crest_tutorial_passage_b",
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
				"witch_hunter",
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
		name = "pwh_gateway_crest_tutorial_passage_shield_a",
		probability = 1,
		response = "pwh_gateway_crest_tutorial_passage_shield_a",
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
		name = "pwh_gateway_crest_tutorial_passage_solved_a",
		probability = 1,
		response = "pwh_gateway_crest_tutorial_passage_solved_a",
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
		name = "pwh_gateway_destroy_bell_prompt_a",
		probability = 1,
		response = "pwh_gateway_destroy_bell_prompt_a",
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
		name = "pwh_gateway_door_group_up_a",
		probability = 1,
		response = "pwh_gateway_door_group_up_a",
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
		name = "pwh_gateway_elevator_stop_a",
		probability = 1,
		response = "pwh_gateway_elevator_stop_a",
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
		name = "pwh_gateway_elevator_stop_b",
		probability = 1,
		response = "pwh_gateway_elevator_stop_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_end_event_bomb_sighted_a",
		probability = 1,
		response = "pwh_gateway_end_event_bomb_sighted_a",
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
		name = "pwh_gateway_event_aftermath_lift_a",
		probability = 1,
		response = "pwh_gateway_event_aftermath_lift_a",
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
		name = "pwh_gateway_event_complete_a",
		probability = 1,
		response = "pwh_gateway_event_complete_a",
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
				"witch_hunter",
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
		name = "pwh_gateway_event_complete_b",
		probability = 1,
		response = "pwh_gateway_event_complete_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_event_first_prompt_a",
		probability = 1,
		response = "pwh_gateway_event_first_prompt_a",
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
		name = "pwh_gateway_event_gate_a",
		probability = 1,
		response = "pwh_gateway_event_gate_a",
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
		name = "pwh_gateway_event_gate_b",
		probability = 1,
		response = "pwh_gateway_event_gate_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_event_monster_attack_a",
		probability = 1,
		response = "pwh_gateway_event_monster_attack_a",
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
		name = "pwh_gateway_event_partial_success_01_d",
		probability = 1,
		response = "pwh_gateway_event_partial_success_01_d",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_event_start_b",
		probability = 1,
		response = "pwh_gateway_event_start_b",
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
		name = "pwh_gateway_event_start_c",
		probability = 1,
		response = "pwh_gateway_event_start_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_event_start_d",
		probability = 1,
		response = "pwh_gateway_event_start_d",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_gate_a",
		probability = 1,
		response = "pwh_gateway_gate_a",
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
		name = "pwh_gateway_gate_lever_a",
		probability = 1,
		response = "pwh_gateway_gate_lever_a",
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
		name = "pwh_gateway_gate_lever_b",
		probability = 1,
		response = "pwh_gateway_gate_lever_b",
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
		name = "pwh_gateway_loot_elevator_b",
		probability = 1,
		response = "pwh_gateway_loot_elevator_b",
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
				"witch_hunter",
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
		name = "pwh_gateway_spotlight_triggered_b",
		probability = 1,
		response = "pwh_gateway_spotlight_triggered_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_start_banter_b",
		probability = 1,
		response = "pwh_gateway_start_banter_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_traversal_one_a",
		probability = 1,
		response = "pwh_gateway_traversal_one_a",
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
		name = "pwh_gateway_traversal_one_b",
		probability = 1,
		response = "pwh_gateway_traversal_one_b",
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
				"witch_hunter",
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
		name = "pwh_gateway_working_spotlight_one_b",
		probability = 1,
		response = "pwh_gateway_working_spotlight_one_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_working_spotlight_three_b",
		probability = 1,
		response = "pwh_gateway_working_spotlight_three_b",
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
				"witch_hunter",
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
		name = "pwh_gateway_working_spotlight_two_b",
		probability = 1,
		response = "pwh_gateway_working_spotlight_two_b",
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
				"witch_hunter",
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
		name = "pwh_gateway_wrecked_spotlight_a",
		probability = 1,
		response = "pwh_gateway_wrecked_spotlight_a",
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
		name = "pwh_gateway_wrecked_spotlight_b",
		probability = 1,
		response = "pwh_gateway_wrecked_spotlight_b",
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
		pwh_gateway_accidental_bell_ring_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_accidental_bell_ring_a_01",
				[2] = "pwh_gateway_accidental_bell_ring_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_accidental_bell_ring_a_01",
				[2] = "pwh_gateway_accidental_bell_ring_a_02",
			},
			sound_events_duration = {
				[1] = 1.7513333559036,
				[2] = 2.8208541870117,
			},
		},
		pwh_gateway_bell_silenced_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_bell_silenced_a_01",
				[2] = "pwh_gateway_bell_silenced_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_bell_silenced_a_01",
				[2] = "pwh_gateway_bell_silenced_a_02",
			},
			sound_events_duration = {
				[1] = 2.5247917175293,
				[2] = 1.5711874961853,
			},
		},
		pwh_gateway_bell_still_ringing_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_bell_still_ringing_a_01",
				[2] = "pwh_gateway_bell_still_ringing_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_bell_still_ringing_a_01",
				[2] = "pwh_gateway_bell_still_ringing_a_02",
			},
			sound_events_duration = {
				[1] = 3.4742083549499,
				[2] = 2.84339594841,
			},
		},
		pwh_gateway_bomb_hoist_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_bomb_hoist_c_01",
				[2] = "pwh_gateway_bomb_hoist_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_bomb_hoist_c_01",
				[2] = "pwh_gateway_bomb_hoist_c_02",
			},
			sound_events_duration = {
				[1] = 2.4294373989105,
				[2] = 1.9049791097641,
			},
		},
		pwh_gateway_bomb_sighted_one_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_bomb_sighted_one_a_01",
				[2] = "pwh_gateway_bomb_sighted_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_bomb_sighted_one_a_01",
				[2] = "pwh_gateway_bomb_sighted_one_a_02",
			},
			sound_events_duration = {
				[1] = 1.5517916679382,
				[2] = 2.9582707881927,
			},
		},
		pwh_gateway_bomb_sighted_outside_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_bomb_sighted_outside_a_01",
				[2] = "pwh_gateway_bomb_sighted_outside_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_bomb_sighted_outside_a_01",
				[2] = "pwh_gateway_bomb_sighted_outside_a_02",
			},
			sound_events_duration = {
				[1] = 3.240312576294,
				[2] = 2.6660833358765,
			},
		},
		pwh_gateway_crest_door_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_crest_door_a_01",
				[2] = "pwh_gateway_crest_door_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_crest_door_a_01",
				[2] = "pwh_gateway_crest_door_a_02",
			},
			sound_events_duration = {
				[1] = 4.3173542022705,
				[2] = 4.2972497940064,
			},
		},
		pwh_gateway_crest_tutorial_passage_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_crest_tutorial_passage_a_01",
				[2] = "pwh_gateway_crest_tutorial_passage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_crest_tutorial_passage_a_01",
				[2] = "pwh_gateway_crest_tutorial_passage_a_02",
			},
			sound_events_duration = {
				[1] = 1.5201041698456,
				[2] = 1.4009166955948,
			},
		},
		pwh_gateway_crest_tutorial_passage_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_crest_tutorial_passage_b_01",
				[2] = "pwh_gateway_crest_tutorial_passage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_crest_tutorial_passage_b_01",
				[2] = "pwh_gateway_crest_tutorial_passage_b_02",
			},
			sound_events_duration = {
				[1] = 3.1389374732971,
				[2] = 2.8472292423248,
			},
		},
		pwh_gateway_crest_tutorial_passage_shield_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pwh_gateway_crest_tutorial_passage_shield_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pwh_gateway_crest_tutorial_passage_shield_a_02",
			},
			sound_events_duration = {
				[1] = 2.783041715622,
				[2] = 1.713187456131,
			},
		},
		pwh_gateway_crest_tutorial_passage_solved_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pwh_gateway_crest_tutorial_passage_solved_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pwh_gateway_crest_tutorial_passage_solved_a_02",
			},
			sound_events_duration = {
				[1] = 1.2646458148956,
				[2] = 1.3673750162125,
			},
		},
		pwh_gateway_destroy_bell_prompt_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				"pwh_gateway_destroy_bell_prompt_a_01",
				"pwh_gateway_destroy_bell_prompt_a_02",
				"pwh_gateway_destroy_bell_prompt_a_03",
				"pwh_gateway_destroy_bell_prompt_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gateway_destroy_bell_prompt_a_01",
				"pwh_gateway_destroy_bell_prompt_a_02",
				"pwh_gateway_destroy_bell_prompt_a_03",
				"pwh_gateway_destroy_bell_prompt_a_04",
			},
			sound_events_duration = {
				2.07847905159,
				2.0037915706634,
				2.2969167232513,
				3.2023749351502,
			},
		},
		pwh_gateway_door_group_up_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_door_group_up_a_01",
				[2] = "pwh_gateway_door_group_up_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_door_group_up_a_01",
				[2] = "pwh_gateway_door_group_up_a_02",
			},
			sound_events_duration = {
				[1] = 2.9441459178925,
				[2] = 2.1988749504089,
			},
		},
		pwh_gateway_elevator_stop_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_elevator_stop_a_01",
				[2] = "pwh_gateway_elevator_stop_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_elevator_stop_a_01",
				[2] = "pwh_gateway_elevator_stop_a_02",
			},
			sound_events_duration = {
				[1] = 4.2308540344238,
				[2] = 3.6598541736603,
			},
		},
		pwh_gateway_elevator_stop_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_elevator_stop_b_01",
				[2] = "pwh_gateway_elevator_stop_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_elevator_stop_b_01",
				[2] = "pwh_gateway_elevator_stop_b_02",
			},
			sound_events_duration = {
				[1] = 2.5450832843781,
				[2] = 2.872750043869,
			},
		},
		pwh_gateway_end_event_bomb_sighted_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_end_event_bomb_sighted_a_01",
				[2] = "pwh_gateway_end_event_bomb_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_end_event_bomb_sighted_a_01",
				[2] = "pwh_gateway_end_event_bomb_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 2.0744166374206,
				[2] = 2.5276875495911,
			},
		},
		pwh_gateway_event_aftermath_lift_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_aftermath_lift_a_01",
				[2] = "pwh_gateway_event_aftermath_lift_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_aftermath_lift_a_01",
				[2] = "pwh_gateway_event_aftermath_lift_a_02",
			},
			sound_events_duration = {
				[1] = 2.9026458263397,
				[2] = 1.7943333387375,
			},
		},
		pwh_gateway_event_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_complete_a_01",
				[2] = "pwh_gateway_event_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_complete_a_01",
				[2] = "pwh_gateway_event_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.8289166688919,
				[2] = 3.4023125171661,
			},
		},
		pwh_gateway_event_complete_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_complete_b_01",
				[2] = "pwh_gateway_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_complete_b_01",
				[2] = "pwh_gateway_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.7474167346954,
				[2] = 3.6828541755676,
			},
		},
		pwh_gateway_event_first_prompt_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_first_prompt_a_01",
				[2] = "pwh_gateway_event_first_prompt_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_first_prompt_a_01",
				[2] = "pwh_gateway_event_first_prompt_a_02",
			},
			sound_events_duration = {
				[1] = 4.2803959846497,
				[2] = 3.4040625095367,
			},
		},
		pwh_gateway_event_gate_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_gate_a_01",
				[2] = "pwh_gateway_event_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_gate_a_01",
				[2] = "pwh_gateway_event_gate_a_02",
			},
			sound_events_duration = {
				[1] = 6.3087916374206,
				[2] = 3.4634582996368,
			},
		},
		pwh_gateway_event_gate_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_gate_b_01",
				[2] = "pwh_gateway_event_gate_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_gate_b_01",
				[2] = "pwh_gateway_event_gate_b_02",
			},
			sound_events_duration = {
				[1] = 3.7972917556763,
				[2] = 3.8853542804718,
			},
		},
		pwh_gateway_event_monster_attack_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_monster_attack_a_01",
				[2] = "pwh_gateway_event_monster_attack_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_monster_attack_a_01",
				[2] = "pwh_gateway_event_monster_attack_a_02",
			},
			sound_events_duration = {
				[1] = 2.6373541355133,
				[2] = 1.1791042089462,
			},
		},
		pwh_gateway_event_partial_success_01_d = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_partial_success_01_d_01",
				[2] = "pwh_gateway_event_partial_success_01_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_partial_success_01_d_01",
				[2] = "pwh_gateway_event_partial_success_01_d_02",
			},
			sound_events_duration = {
				[1] = 3.9917500019074,
				[2] = 1.6958957910538,
			},
		},
		pwh_gateway_event_start_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_start_b_01",
				[2] = "pwh_gateway_event_start_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_start_b_01",
				[2] = "pwh_gateway_event_start_b_02",
			},
			sound_events_duration = {
				[1] = 1.7419375181198,
				[2] = 2.4562499523163,
			},
		},
		pwh_gateway_event_start_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_start_c_01",
				[2] = "pwh_gateway_event_start_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_start_c_01",
				[2] = "pwh_gateway_event_start_c_02",
			},
			sound_events_duration = {
				[1] = 2.2442290782928,
				[2] = 2.8506667613983,
			},
		},
		pwh_gateway_event_start_d = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_event_start_d_01",
				[2] = "pwh_gateway_event_start_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_event_start_d_01",
				[2] = "pwh_gateway_event_start_d_02",
			},
			sound_events_duration = {
				[1] = 5.0409164428711,
				[2] = 4.6632499694824,
			},
		},
		pwh_gateway_gate_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_gate_a_01",
				[2] = "pwh_gateway_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_gate_a_01",
				[2] = "pwh_gateway_gate_a_02",
			},
			sound_events_duration = {
				[1] = 4.0431666374206,
				[2] = 3.0363957881927,
			},
		},
		pwh_gateway_gate_lever_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_generic_path_blocked_03",
				[2] = "pwh_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_generic_path_blocked_03",
				[2] = "pwh_generic_path_blocked_04",
			},
			sound_events_duration = {
				[1] = 1.2149791717529,
				[2] = 1.062979221344,
			},
		},
		pwh_gateway_gate_lever_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_level_skittergate_activate_gate_01_TERMITE",
				[2] = "pwh_level_skittergate_activate_gate_04_TERMITE",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_skittergate_activate_gate_01_TERMITE",
				[2] = "pwh_level_skittergate_activate_gate_04_TERMITE",
			},
			sound_events_duration = {
				[1] = 2.4767498970032,
				[2] = 1.4835416078568,
			},
		},
		pwh_gateway_loot_elevator_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_loot_elevator_b_01",
				[2] = "pwh_gateway_loot_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_loot_elevator_b_01",
				[2] = "pwh_gateway_loot_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 1.8890625238419,
				[2] = 3.8898334503174,
			},
		},
		pwh_gateway_spotlight_triggered_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_spotlight_triggered_b_01",
				[2] = "pwh_gateway_spotlight_triggered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_spotlight_triggered_b_01",
				[2] = "pwh_gateway_spotlight_triggered_b_02",
			},
			sound_events_duration = {
				[1] = 2.5627708435059,
				[2] = 2.6381042003632,
			},
		},
		pwh_gateway_start_banter_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_start_banter_b_01",
				[2] = "pwh_gateway_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_start_banter_b_01",
				[2] = "pwh_gateway_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.3215622901917,
				[2] = 3.2551250457764,
			},
		},
		pwh_gateway_traversal_one_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_traversal_one_a_01",
				[2] = "pwh_gateway_traversal_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_traversal_one_a_01",
				[2] = "pwh_gateway_traversal_one_a_02",
			},
			sound_events_duration = {
				[1] = 5.0097498893738,
				[2] = 6.7566666603088,
			},
		},
		pwh_gateway_traversal_one_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_traversal_one_b_01",
				[2] = "pwh_gateway_traversal_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_traversal_one_b_01",
				[2] = "pwh_gateway_traversal_one_b_02",
			},
			sound_events_duration = {
				[1] = 5.4336876869202,
				[2] = 4.1798958778381,
			},
		},
		pwh_gateway_working_spotlight_one_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_working_spotlight_one_b_01",
				[2] = "pwh_gateway_working_spotlight_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_working_spotlight_one_b_01",
				[2] = "pwh_gateway_working_spotlight_one_b_02",
			},
			sound_events_duration = {
				[1] = 3.8825833797455,
				[2] = 4.5331873893738,
			},
		},
		pwh_gateway_working_spotlight_three_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_working_spotlight_three_b_01",
				[2] = "pwh_gateway_working_spotlight_three_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_working_spotlight_three_b_01",
				[2] = "pwh_gateway_working_spotlight_three_b_02",
			},
			sound_events_duration = {
				[1] = 3.3009374141693,
				[2] = 3.0470416545868,
			},
		},
		pwh_gateway_working_spotlight_two_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_working_spotlight_two_b_01",
				[2] = "pwh_gateway_working_spotlight_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_working_spotlight_two_b_01",
				[2] = "pwh_gateway_working_spotlight_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.2588958740234,
				[2] = 2.3444375991821,
			},
		},
		pwh_gateway_wrecked_spotlight_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_wrecked_spotlight_a_01",
				[2] = "pwh_gateway_wrecked_spotlight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_wrecked_spotlight_a_01",
				[2] = "pwh_gateway_wrecked_spotlight_a_02",
			},
			sound_events_duration = {
				[1] = 2.6311042308807,
				[2] = 2.5397083759308,
			},
		},
		pwh_gateway_wrecked_spotlight_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_3",
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
				[1] = "pwh_gateway_wrecked_spotlight_b_01",
				[2] = "pwh_gateway_wrecked_spotlight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_wrecked_spotlight_b_01",
				[2] = "pwh_gateway_wrecked_spotlight_b_02",
			},
			sound_events_duration = {
				[1] = 2.7514791488648,
				[2] = 2.8842499256134,
			},
		},
	})
end
