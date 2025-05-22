-- chunkname: @dialogues/generated/empire_soldier_dlc_termite_3.lua

return function ()
	define_rule({
		name = "pes_gateway_accidental_bell_ring_a",
		probability = 1,
		response = "pes_gateway_accidental_bell_ring_a",
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
		name = "pes_gateway_bell_silenced_a",
		probability = 1,
		response = "pes_gateway_bell_silenced_a",
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
		name = "pes_gateway_bell_still_ringing_a",
		probability = 1,
		response = "pes_gateway_bell_still_ringing_a",
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
		name = "pes_gateway_bomb_hoist_c",
		probability = 1,
		response = "pes_gateway_bomb_hoist_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_bomb_sighted_one_a",
		probability = 1,
		response = "pes_gateway_bomb_sighted_one_a",
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
		name = "pes_gateway_bomb_sighted_outside_a",
		probability = 1,
		response = "pes_gateway_bomb_sighted_outside_a",
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
		name = "pes_gateway_crest_door_a",
		probability = 1,
		response = "pes_gateway_crest_door_a",
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
		name = "pes_gateway_crest_tutorial_passage_a",
		probability = 1,
		response = "pes_gateway_crest_tutorial_passage_a",
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
		name = "pes_gateway_crest_tutorial_passage_b",
		probability = 1,
		response = "pes_gateway_crest_tutorial_passage_b",
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
				"empire_soldier",
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
		name = "pes_gateway_crest_tutorial_passage_shield_a",
		probability = 1,
		response = "pes_gateway_crest_tutorial_passage_shield_a",
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
		name = "pes_gateway_crest_tutorial_passage_solved_a",
		probability = 1,
		response = "pes_gateway_crest_tutorial_passage_solved_a",
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
		name = "pes_gateway_destroy_bell_prompt_a",
		probability = 1,
		response = "pes_gateway_destroy_bell_prompt_a",
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
		name = "pes_gateway_door_group_up_a",
		probability = 1,
		response = "pes_gateway_door_group_up_a",
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
		name = "pes_gateway_elevator_stop_a",
		probability = 1,
		response = "pes_gateway_elevator_stop_a",
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
		name = "pes_gateway_elevator_stop_b",
		probability = 1,
		response = "pes_gateway_elevator_stop_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_end_event_bomb_sighted_a",
		probability = 1,
		response = "pes_gateway_end_event_bomb_sighted_a",
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
		name = "pes_gateway_event_aftermath_lift_a",
		probability = 1,
		response = "pes_gateway_event_aftermath_lift_a",
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
		name = "pes_gateway_event_complete_a",
		probability = 1,
		response = "pes_gateway_event_complete_a",
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
				"empire_soldier",
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
		name = "pes_gateway_event_complete_b",
		probability = 1,
		response = "pes_gateway_event_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_event_first_prompt_a",
		probability = 1,
		response = "pes_gateway_event_first_prompt_a",
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
		name = "pes_gateway_event_gate_a",
		probability = 1,
		response = "pes_gateway_event_gate_a",
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
		name = "pes_gateway_event_gate_b",
		probability = 1,
		response = "pes_gateway_event_gate_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_event_monster_attack_a",
		probability = 1,
		response = "pes_gateway_event_monster_attack_a",
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
		name = "pes_gateway_event_partial_success_01_d",
		probability = 1,
		response = "pes_gateway_event_partial_success_01_d",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_event_start_b",
		probability = 1,
		response = "pes_gateway_event_start_b",
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
		name = "pes_gateway_event_start_c",
		probability = 1,
		response = "pes_gateway_event_start_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_event_start_d",
		probability = 1,
		response = "pes_gateway_event_start_d",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_gate_a",
		probability = 1,
		response = "pes_gateway_gate_a",
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
		name = "pes_gateway_gate_lever_a",
		probability = 1,
		response = "pes_gateway_gate_lever_a",
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
		name = "pes_gateway_gate_lever_b",
		probability = 1,
		response = "pes_gateway_gate_lever_b",
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
		name = "pes_gateway_loot_elevator_b",
		probability = 1,
		response = "pes_gateway_loot_elevator_b",
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
				"empire_soldier",
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
		name = "pes_gateway_spotlight_triggered_b",
		probability = 1,
		response = "pes_gateway_spotlight_triggered_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_start_banter_b",
		probability = 1,
		response = "pes_gateway_start_banter_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_traversal_one_a",
		probability = 1,
		response = "pes_gateway_traversal_one_a",
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
		name = "pes_gateway_traversal_one_b",
		probability = 1,
		response = "pes_gateway_traversal_one_b",
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
				"empire_soldier",
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
		name = "pes_gateway_working_spotlight_one_b",
		probability = 1,
		response = "pes_gateway_working_spotlight_one_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_working_spotlight_three_b",
		probability = 1,
		response = "pes_gateway_working_spotlight_three_b",
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
				"empire_soldier",
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
		name = "pes_gateway_working_spotlight_two_b",
		probability = 1,
		response = "pes_gateway_working_spotlight_two_b",
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
				"empire_soldier",
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
		name = "pes_gateway_wrecked_spotlight_a",
		probability = 1,
		response = "pes_gateway_wrecked_spotlight_a",
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
		name = "pes_gateway_wrecked_spotlight_b",
		probability = 1,
		response = "pes_gateway_wrecked_spotlight_b",
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
		pes_gateway_accidental_bell_ring_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_accidental_bell_ring_a_01",
				[2] = "pes_gateway_accidental_bell_ring_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_accidental_bell_ring_a_01",
				[2] = "pes_gateway_accidental_bell_ring_a_02",
			},
			sound_events_duration = {
				[1] = 2.5732917785645,
				[2] = 2.8706874847412,
			},
		},
		pes_gateway_bell_silenced_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_bell_silenced_a_01",
				[2] = "pes_gateway_bell_silenced_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_bell_silenced_a_01",
				[2] = "pes_gateway_bell_silenced_a_02",
			},
			sound_events_duration = {
				[1] = 3.7417707443237,
				[2] = 1.6129167079925,
			},
		},
		pes_gateway_bell_still_ringing_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_bell_still_ringing_a_01",
				[2] = "pes_gateway_bell_still_ringing_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_bell_still_ringing_a_01",
				[2] = "pes_gateway_bell_still_ringing_a_02",
			},
			sound_events_duration = {
				[1] = 2.962729215622,
				[2] = 2.4528334140778,
			},
		},
		pes_gateway_bomb_hoist_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_bomb_hoist_c_01",
				[2] = "pes_gateway_bomb_hoist_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_bomb_hoist_c_01",
				[2] = "pes_gateway_bomb_hoist_c_02",
			},
			sound_events_duration = {
				[1] = 2.0759999752045,
				[2] = 1.3655833005905,
			},
		},
		pes_gateway_bomb_sighted_one_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_bomb_sighted_one_a_01",
				[2] = "pes_gateway_bomb_sighted_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_bomb_sighted_one_a_01",
				[2] = "pes_gateway_bomb_sighted_one_a_02",
			},
			sound_events_duration = {
				[1] = 3.8413751125336,
				[2] = 2.3356041908264,
			},
		},
		pes_gateway_bomb_sighted_outside_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_bomb_sighted_outside_a_01",
				[2] = "pes_gateway_bomb_sighted_outside_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_bomb_sighted_outside_a_01",
				[2] = "pes_gateway_bomb_sighted_outside_a_02",
			},
			sound_events_duration = {
				[1] = 2.8385207653046,
				[2] = 2.69566655159,
			},
		},
		pes_gateway_crest_door_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_crest_door_a_01",
				[2] = "pes_gateway_crest_door_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_crest_door_a_01",
				[2] = "pes_gateway_crest_door_a_02",
			},
			sound_events_duration = {
				[1] = 1.9623124599457,
				[2] = 3.4085416793823,
			},
		},
		pes_gateway_crest_tutorial_passage_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_crest_tutorial_passage_a_01",
				[2] = "pes_gateway_crest_tutorial_passage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_crest_tutorial_passage_a_01",
				[2] = "pes_gateway_crest_tutorial_passage_a_02",
			},
			sound_events_duration = {
				[1] = 1.176437497139,
				[2] = 0.985291659832,
			},
		},
		pes_gateway_crest_tutorial_passage_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_crest_tutorial_passage_b_01",
				[2] = "pes_gateway_crest_tutorial_passage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_crest_tutorial_passage_b_01",
				[2] = "pes_gateway_crest_tutorial_passage_b_02",
			},
			sound_events_duration = {
				[1] = 2.197562456131,
				[2] = 2.4794166088104,
			},
		},
		pes_gateway_crest_tutorial_passage_shield_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pes_gateway_crest_tutorial_passage_shield_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pes_gateway_crest_tutorial_passage_shield_a_02",
			},
			sound_events_duration = {
				[1] = 2.0608749389648,
				[2] = 2.8909165859222,
			},
		},
		pes_gateway_crest_tutorial_passage_solved_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pes_gateway_crest_tutorial_passage_solved_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pes_gateway_crest_tutorial_passage_solved_a_02",
			},
			sound_events_duration = {
				[1] = 1.7671041488648,
				[2] = 2.7259790897369,
			},
		},
		pes_gateway_destroy_bell_prompt_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				"pes_gateway_destroy_bell_prompt_a_01",
				"pes_gateway_destroy_bell_prompt_a_02",
				"pes_gateway_destroy_bell_prompt_a_03",
				"pes_gateway_destroy_bell_prompt_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gateway_destroy_bell_prompt_a_01",
				"pes_gateway_destroy_bell_prompt_a_02",
				"pes_gateway_destroy_bell_prompt_a_03",
				"pes_gateway_destroy_bell_prompt_a_04",
			},
			sound_events_duration = {
				1.876833319664,
				1.8291457891464,
				1.6746250391007,
				1.5198750495911,
			},
		},
		pes_gateway_door_group_up_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_door_group_up_a_01",
				[2] = "pes_gateway_door_group_up_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_door_group_up_a_01",
				[2] = "pes_gateway_door_group_up_a_02",
			},
			sound_events_duration = {
				[1] = 2.1909375190735,
				[2] = 2.9916665554047,
			},
		},
		pes_gateway_elevator_stop_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_elevator_stop_a_01",
				[2] = "pes_gateway_elevator_stop_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_elevator_stop_a_01",
				[2] = "pes_gateway_elevator_stop_a_02",
			},
			sound_events_duration = {
				[1] = 1.9672917127609,
				[2] = 2.7382290363312,
			},
		},
		pes_gateway_elevator_stop_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_elevator_stop_b_01",
				[2] = "pes_gateway_elevator_stop_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_elevator_stop_b_01",
				[2] = "pes_gateway_elevator_stop_b_02",
			},
			sound_events_duration = {
				[1] = 3.0128333568573,
				[2] = 2.4645833969116,
			},
		},
		pes_gateway_end_event_bomb_sighted_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_end_event_bomb_sighted_a_01",
				[2] = "pes_gateway_end_event_bomb_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_end_event_bomb_sighted_a_01",
				[2] = "pes_gateway_end_event_bomb_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 2.4267916679382,
				[2] = 2.3441250324249,
			},
		},
		pes_gateway_event_aftermath_lift_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_aftermath_lift_a_01",
				[2] = "pes_gateway_event_aftermath_lift_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_aftermath_lift_a_01",
				[2] = "pes_gateway_event_aftermath_lift_a_02",
			},
			sound_events_duration = {
				[1] = 1.6119583845139,
				[2] = 1.5242291688919,
			},
		},
		pes_gateway_event_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_complete_a_01",
				[2] = "pes_gateway_event_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_complete_a_01",
				[2] = "pes_gateway_event_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.9406249523163,
				[2] = 1.5698750019074,
			},
		},
		pes_gateway_event_complete_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_complete_b_01",
				[2] = "pes_gateway_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_complete_b_01",
				[2] = "pes_gateway_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 1.6618332862854,
				[2] = 2.6735417842865,
			},
		},
		pes_gateway_event_first_prompt_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_first_prompt_a_01",
				[2] = "pes_gateway_event_first_prompt_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_first_prompt_a_01",
				[2] = "pes_gateway_event_first_prompt_a_02",
			},
			sound_events_duration = {
				[1] = 3.3011250495911,
				[2] = 3.7711250782013,
			},
		},
		pes_gateway_event_gate_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_gate_a_01",
				[2] = "pes_gateway_event_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_gate_a_01",
				[2] = "pes_gateway_event_gate_a_02",
			},
			sound_events_duration = {
				[1] = 4.4580001831055,
				[2] = 2.8757083415985,
			},
		},
		pes_gateway_event_gate_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_gate_b_01",
				[2] = "pes_gateway_event_gate_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_gate_b_01",
				[2] = "pes_gateway_event_gate_b_02",
			},
			sound_events_duration = {
				[1] = 3.1411666870117,
				[2] = 2.5878958702087,
			},
		},
		pes_gateway_event_monster_attack_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_monster_attack_a_01",
				[2] = "pes_gateway_event_monster_attack_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_monster_attack_a_01",
				[2] = "pes_gateway_event_monster_attack_a_02",
			},
			sound_events_duration = {
				[1] = 0.74656248092651,
				[2] = 1.008229136467,
			},
		},
		pes_gateway_event_partial_success_01_d = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_partial_success_01_d_01",
				[2] = "pes_gateway_event_partial_success_01_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_partial_success_01_d_01",
				[2] = "pes_gateway_event_partial_success_01_d_02",
			},
			sound_events_duration = {
				[1] = 1.24899995327,
				[2] = 1.2956249713898,
			},
		},
		pes_gateway_event_start_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_start_b_01",
				[2] = "pes_gateway_event_start_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_start_b_01",
				[2] = "pes_gateway_event_start_b_02",
			},
			sound_events_duration = {
				[1] = 2.4528748989105,
				[2] = 1.7401666641235,
			},
		},
		pes_gateway_event_start_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_start_c_01",
				[2] = "pes_gateway_event_start_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_start_c_01",
				[2] = "pes_gateway_event_start_c_02",
			},
			sound_events_duration = {
				[1] = 1.5076249837875,
				[2] = 1.9531667232513,
			},
		},
		pes_gateway_event_start_d = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_event_start_d_01",
				[2] = "pes_gateway_event_start_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_event_start_d_01",
				[2] = "pes_gateway_event_start_d_02",
			},
			sound_events_duration = {
				[1] = 2.0665833950043,
				[2] = 2.5919582843781,
			},
		},
		pes_gateway_gate_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_gate_a_01",
				[2] = "pes_gateway_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_gate_a_01",
				[2] = "pes_gateway_gate_a_02",
			},
			sound_events_duration = {
				[1] = 1.444375038147,
				[2] = 1.4752082824707,
			},
		},
		pes_gateway_gate_lever_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.1100000143051,
				1.8349791765213,
				1.0189791917801,
			},
		},
		pes_gateway_gate_lever_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_level_skittergate_activate_gate_02",
				[2] = "pes_level_skittergate_activate_gate_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_skittergate_activate_gate_02",
				[2] = "pes_level_skittergate_activate_gate_03",
			},
			sound_events_duration = {
				[1] = 2.0632290840149,
				[2] = 2.0641875267029,
			},
		},
		pes_gateway_loot_elevator_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_loot_elevator_b_01",
				[2] = "pes_gateway_loot_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_loot_elevator_b_01",
				[2] = "pes_gateway_loot_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 3.3979165554047,
				[2] = 1.7559583187103,
			},
		},
		pes_gateway_spotlight_triggered_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_spotlight_triggered_b_01",
				[2] = "pes_gateway_spotlight_triggered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_spotlight_triggered_b_01",
				[2] = "pes_gateway_spotlight_triggered_b_02",
			},
			sound_events_duration = {
				[1] = 1.1909166574478,
				[2] = 2.2944583892822,
			},
		},
		pes_gateway_start_banter_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_start_banter_b_01",
				[2] = "pes_gateway_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_start_banter_b_01",
				[2] = "pes_gateway_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.3345625400543,
				[2] = 3.835104227066,
			},
		},
		pes_gateway_traversal_one_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_traversal_one_a_01",
				[2] = "pes_gateway_traversal_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_traversal_one_a_01",
				[2] = "pes_gateway_traversal_one_a_02",
			},
			sound_events_duration = {
				[1] = 2.2515416145325,
				[2] = 2.9988958835602,
			},
		},
		pes_gateway_traversal_one_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_traversal_one_b_01",
				[2] = "pes_gateway_traversal_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_traversal_one_b_01",
				[2] = "pes_gateway_traversal_one_b_02",
			},
			sound_events_duration = {
				[1] = 2.6864376068115,
				[2] = 2.0549166202545,
			},
		},
		pes_gateway_working_spotlight_one_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_working_spotlight_one_b_01",
				[2] = "pes_gateway_working_spotlight_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_working_spotlight_one_b_01",
				[2] = "pes_gateway_working_spotlight_one_b_02",
			},
			sound_events_duration = {
				[1] = 1.9423749446869,
				[2] = 3.141104221344,
			},
		},
		pes_gateway_working_spotlight_three_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_working_spotlight_three_b_01",
				[2] = "pes_gateway_working_spotlight_three_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_working_spotlight_three_b_01",
				[2] = "pes_gateway_working_spotlight_three_b_02",
			},
			sound_events_duration = {
				[1] = 1.8831875324249,
				[2] = 2.1816458702087,
			},
		},
		pes_gateway_working_spotlight_two_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_working_spotlight_two_b_01",
				[2] = "pes_gateway_working_spotlight_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_working_spotlight_two_b_01",
				[2] = "pes_gateway_working_spotlight_two_b_02",
			},
			sound_events_duration = {
				[1] = 3.2120208740234,
				[2] = 2.6484582424164,
			},
		},
		pes_gateway_wrecked_spotlight_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_wrecked_spotlight_a_01",
				[2] = "pes_gateway_wrecked_spotlight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_wrecked_spotlight_a_01",
				[2] = "pes_gateway_wrecked_spotlight_a_02",
			},
			sound_events_duration = {
				[1] = 1.9686042070389,
				[2] = 1.7167708873749,
			},
		},
		pes_gateway_wrecked_spotlight_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_3",
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
				[1] = "pes_gateway_wrecked_spotlight_b_01",
				[2] = "pes_gateway_wrecked_spotlight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_wrecked_spotlight_b_01",
				[2] = "pes_gateway_wrecked_spotlight_b_02",
			},
			sound_events_duration = {
				[1] = 4.3064584732056,
				[2] = 4.8537707328796,
			},
		},
	})
end
