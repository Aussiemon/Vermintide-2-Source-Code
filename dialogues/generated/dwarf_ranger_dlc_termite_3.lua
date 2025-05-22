-- chunkname: @dialogues/generated/dwarf_ranger_dlc_termite_3.lua

return function ()
	define_rule({
		name = "pdr_gateway_accidental_bell_ring_a",
		probability = 1,
		response = "pdr_gateway_accidental_bell_ring_a",
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
		name = "pdr_gateway_bell_silenced_a",
		probability = 1,
		response = "pdr_gateway_bell_silenced_a",
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
		name = "pdr_gateway_bell_still_ringing_a",
		probability = 1,
		response = "pdr_gateway_bell_still_ringing_a",
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
		name = "pdr_gateway_bomb_hoist_c",
		probability = 1,
		response = "pdr_gateway_bomb_hoist_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_bomb_sighted_one_a",
		probability = 1,
		response = "pdr_gateway_bomb_sighted_one_a",
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
		name = "pdr_gateway_bomb_sighted_outside_a",
		probability = 1,
		response = "pdr_gateway_bomb_sighted_outside_a",
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
		name = "pdr_gateway_crest_door_a",
		probability = 1,
		response = "pdr_gateway_crest_door_a",
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
		name = "pdr_gateway_crest_tutorial_passage_a",
		probability = 1,
		response = "pdr_gateway_crest_tutorial_passage_a",
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
		name = "pdr_gateway_crest_tutorial_passage_b",
		probability = 1,
		response = "pdr_gateway_crest_tutorial_passage_b",
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
				"dwarf_ranger",
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
		name = "pdr_gateway_crest_tutorial_passage_shield_a",
		probability = 1,
		response = "pdr_gateway_crest_tutorial_passage_shield_a",
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
		name = "pdr_gateway_crest_tutorial_passage_solved_a",
		probability = 1,
		response = "pdr_gateway_crest_tutorial_passage_solved_a",
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
		name = "pdr_gateway_destroy_bell_prompt_a",
		probability = 1,
		response = "pdr_gateway_destroy_bell_prompt_a",
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
		name = "pdr_gateway_door_group_up_a",
		probability = 1,
		response = "pdr_gateway_door_group_up_a",
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
		name = "pdr_gateway_elevator_stop_a",
		probability = 1,
		response = "pdr_gateway_elevator_stop_a",
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
		name = "pdr_gateway_elevator_stop_b",
		probability = 1,
		response = "pdr_gateway_elevator_stop_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_end_event_bomb_sighted_a",
		probability = 1,
		response = "pdr_gateway_end_event_bomb_sighted_a",
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
		name = "pdr_gateway_event_aftermath_lift_a",
		probability = 1,
		response = "pdr_gateway_event_aftermath_lift_a",
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
		name = "pdr_gateway_event_complete_a",
		probability = 1,
		response = "pdr_gateway_event_complete_a",
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
				"dwarf_ranger",
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
		name = "pdr_gateway_event_complete_b",
		probability = 1,
		response = "pdr_gateway_event_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_event_first_prompt_a",
		probability = 1,
		response = "pdr_gateway_event_first_prompt_a",
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
		name = "pdr_gateway_event_gate_a",
		probability = 1,
		response = "pdr_gateway_event_gate_a",
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
		name = "pdr_gateway_event_gate_b",
		probability = 1,
		response = "pdr_gateway_event_gate_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_event_monster_attack_a",
		probability = 1,
		response = "pdr_gateway_event_monster_attack_a",
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
		name = "pdr_gateway_event_partial_success_01_d",
		probability = 1,
		response = "pdr_gateway_event_partial_success_01_d",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_event_start_b",
		probability = 1,
		response = "pdr_gateway_event_start_b",
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
		name = "pdr_gateway_event_start_c",
		probability = 1,
		response = "pdr_gateway_event_start_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_event_start_d",
		probability = 1,
		response = "pdr_gateway_event_start_d",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_gate_a",
		probability = 1,
		response = "pdr_gateway_gate_a",
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
		name = "pdr_gateway_gate_lever_a",
		probability = 1,
		response = "pdr_gateway_gate_lever_a",
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
		name = "pdr_gateway_gate_lever_b",
		probability = 1,
		response = "pdr_gateway_gate_lever_b",
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
		name = "pdr_gateway_loot_elevator_b",
		probability = 1,
		response = "pdr_gateway_loot_elevator_b",
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
				"dwarf_ranger",
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
		name = "pdr_gateway_spotlight_triggered_b",
		probability = 1,
		response = "pdr_gateway_spotlight_triggered_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_start_banter_b",
		probability = 1,
		response = "pdr_gateway_start_banter_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_traversal_one_a",
		probability = 1,
		response = "pdr_gateway_traversal_one_a",
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
		name = "pdr_gateway_traversal_one_b",
		probability = 1,
		response = "pdr_gateway_traversal_one_b",
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
				"dwarf_ranger",
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
		name = "pdr_gateway_working_spotlight_one_b",
		probability = 1,
		response = "pdr_gateway_working_spotlight_one_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_working_spotlight_three_b",
		probability = 1,
		response = "pdr_gateway_working_spotlight_three_b",
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
				"dwarf_ranger",
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
		name = "pdr_gateway_working_spotlight_two_b",
		probability = 1,
		response = "pdr_gateway_working_spotlight_two_b",
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
				"dwarf_ranger",
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
		name = "pdr_gateway_wrecked_spotlight_a",
		probability = 1,
		response = "pdr_gateway_wrecked_spotlight_a",
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
		name = "pdr_gateway_wrecked_spotlight_b",
		probability = 1,
		response = "pdr_gateway_wrecked_spotlight_b",
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
		pdr_gateway_accidental_bell_ring_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_accidental_bell_ring_a_01",
				[2] = "pdr_gateway_accidental_bell_ring_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_accidental_bell_ring_a_01",
				[2] = "pdr_gateway_accidental_bell_ring_a_02",
			},
			sound_events_duration = {
				[1] = 1.1458333730698,
				[2] = 1.3376874923706,
			},
		},
		pdr_gateway_bell_silenced_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_bell_silenced_a_01",
				[2] = "pdr_gateway_bell_silenced_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_bell_silenced_a_01",
				[2] = "pdr_gateway_bell_silenced_a_02",
			},
			sound_events_duration = {
				[1] = 1.9412916898727,
				[2] = 2.1852917671204,
			},
		},
		pdr_gateway_bell_still_ringing_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_bell_still_ringing_a_01",
				[2] = "pdr_gateway_bell_still_ringing_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_bell_still_ringing_a_01",
				[2] = "pdr_gateway_bell_still_ringing_a_02",
			},
			sound_events_duration = {
				[1] = 2.095520734787,
				[2] = 2.022604227066,
			},
		},
		pdr_gateway_bomb_hoist_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_bomb_hoist_c_01",
				[2] = "pdr_gateway_bomb_hoist_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_bomb_hoist_c_01",
				[2] = "pdr_gateway_bomb_hoist_c_02",
			},
			sound_events_duration = {
				[1] = 2.3488750457764,
				[2] = 2.5936665534973,
			},
		},
		pdr_gateway_bomb_sighted_one_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_bomb_sighted_one_a_01",
				[2] = "pdr_gateway_bomb_sighted_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_bomb_sighted_one_a_01",
				[2] = "pdr_gateway_bomb_sighted_one_a_02",
			},
			sound_events_duration = {
				[1] = 1.8585624694824,
				[2] = 2.4053332805634,
			},
		},
		pdr_gateway_bomb_sighted_outside_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_bomb_sighted_outside_a_01",
				[2] = "pdr_gateway_bomb_sighted_outside_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_bomb_sighted_outside_a_01",
				[2] = "pdr_gateway_bomb_sighted_outside_a_02",
			},
			sound_events_duration = {
				[1] = 3.813458442688,
				[2] = 2.0945625305176,
			},
		},
		pdr_gateway_crest_door_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_crest_door_a_01",
				[2] = "pdr_gateway_crest_door_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_crest_door_a_01",
				[2] = "pdr_gateway_crest_door_a_02",
			},
			sound_events_duration = {
				[1] = 3.1998958587647,
				[2] = 4.3952498435974,
			},
		},
		pdr_gateway_crest_tutorial_passage_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_crest_tutorial_passage_a_01",
				[2] = "pdr_gateway_crest_tutorial_passage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_crest_tutorial_passage_a_01",
				[2] = "pdr_gateway_crest_tutorial_passage_a_02",
			},
			sound_events_duration = {
				[1] = 2.4191040992737,
				[2] = 1.5784374475479,
			},
		},
		pdr_gateway_crest_tutorial_passage_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_crest_tutorial_passage_b_01",
				[2] = "pdr_gateway_crest_tutorial_passage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_crest_tutorial_passage_b_01",
				[2] = "pdr_gateway_crest_tutorial_passage_b_02",
			},
			sound_events_duration = {
				[1] = 2.3831875324249,
				[2] = 2.3907291889191,
			},
		},
		pdr_gateway_crest_tutorial_passage_shield_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pdr_gateway_crest_tutorial_passage_shield_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_crest_tutorial_passage_shield_a_01",
				[2] = "pdr_gateway_crest_tutorial_passage_shield_a_02",
			},
			sound_events_duration = {
				[1] = 2.6533334255219,
				[2] = 2.8500208854675,
			},
		},
		pdr_gateway_crest_tutorial_passage_solved_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pdr_gateway_crest_tutorial_passage_solved_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_crest_tutorial_passage_solved_a_01",
				[2] = "pdr_gateway_crest_tutorial_passage_solved_a_02",
			},
			sound_events_duration = {
				[1] = 3.7824790477753,
				[2] = 1.6190625429153,
			},
		},
		pdr_gateway_destroy_bell_prompt_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				"pdr_gateway_destroy_bell_prompt_a_01",
				"pdr_gateway_destroy_bell_prompt_a_02",
				"pdr_gateway_destroy_bell_prompt_a_03",
				"pdr_gateway_destroy_bell_prompt_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gateway_destroy_bell_prompt_a_01",
				"pdr_gateway_destroy_bell_prompt_a_02",
				"pdr_gateway_destroy_bell_prompt_a_03",
				"pdr_gateway_destroy_bell_prompt_a_04",
			},
			sound_events_duration = {
				1.2614166736603,
				1.4526875019074,
				1.7319166660309,
				1.2977499961853,
			},
		},
		pdr_gateway_door_group_up_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_door_group_up_a_01",
				[2] = "pdr_gateway_door_group_up_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_door_group_up_a_01",
				[2] = "pdr_gateway_door_group_up_a_02",
			},
			sound_events_duration = {
				[1] = 1.3925000429153,
				[2] = 2.5431249141693,
			},
		},
		pdr_gateway_elevator_stop_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_elevator_stop_a_01",
				[2] = "pdr_gateway_elevator_stop_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_elevator_stop_a_01",
				[2] = "pdr_gateway_elevator_stop_a_02",
			},
			sound_events_duration = {
				[1] = 2.7589790821075,
				[2] = 2.0089583396912,
			},
		},
		pdr_gateway_elevator_stop_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_elevator_stop_b_01",
				[2] = "pdr_gateway_elevator_stop_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_elevator_stop_b_01",
				[2] = "pdr_gateway_elevator_stop_b_02",
			},
			sound_events_duration = {
				[1] = 3.2656667232513,
				[2] = 2.9483332633972,
			},
		},
		pdr_gateway_end_event_bomb_sighted_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_end_event_bomb_sighted_a_01",
				[2] = "pdr_gateway_end_event_bomb_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_end_event_bomb_sighted_a_01",
				[2] = "pdr_gateway_end_event_bomb_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 2.0753126144409,
				[2] = 1.7520416975021,
			},
		},
		pdr_gateway_event_aftermath_lift_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_aftermath_lift_a_01",
				[2] = "pdr_gateway_event_aftermath_lift_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_aftermath_lift_a_01",
				[2] = "pdr_gateway_event_aftermath_lift_a_02",
			},
			sound_events_duration = {
				[1] = 1.963250041008,
				[2] = 2.0843958854675,
			},
		},
		pdr_gateway_event_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_complete_a_01",
				[2] = "pdr_gateway_event_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_complete_a_01",
				[2] = "pdr_gateway_event_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.058000087738,
				[2] = 2.0058751106262,
			},
		},
		pdr_gateway_event_complete_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_complete_b_01",
				[2] = "pdr_gateway_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_complete_b_01",
				[2] = "pdr_gateway_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.6148126125336,
				[2] = 2.9769999980927,
			},
		},
		pdr_gateway_event_first_prompt_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_first_prompt_a_01",
				[2] = "pdr_gateway_event_first_prompt_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_first_prompt_a_01",
				[2] = "pdr_gateway_event_first_prompt_a_02",
			},
			sound_events_duration = {
				[1] = 4.1345000267029,
				[2] = 2.5251250267029,
			},
		},
		pdr_gateway_event_gate_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_gate_a_01",
				[2] = "pdr_gateway_event_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_gate_a_01",
				[2] = "pdr_gateway_event_gate_a_02",
			},
			sound_events_duration = {
				[1] = 2.0844166278839,
				[2] = 2.3351249694824,
			},
		},
		pdr_gateway_event_gate_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_gate_b_01",
				[2] = "pdr_gateway_event_gate_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_gate_b_01",
				[2] = "pdr_gateway_event_gate_b_02",
			},
			sound_events_duration = {
				[1] = 2.5920000076294,
				[2] = 2.3885834217072,
			},
		},
		pdr_gateway_event_monster_attack_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_monster_attack_a_01",
				[2] = "pdr_gateway_event_monster_attack_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_monster_attack_a_01",
				[2] = "pdr_gateway_event_monster_attack_a_02",
			},
			sound_events_duration = {
				[1] = 1.452229142189,
				[2] = 2.3091459274292,
			},
		},
		pdr_gateway_event_partial_success_01_d = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_partial_success_01_d_01",
				[2] = "pdr_gateway_event_partial_success_01_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_partial_success_01_d_01",
				[2] = "pdr_gateway_event_partial_success_01_d_02",
			},
			sound_events_duration = {
				[1] = 1.3665208816528,
				[2] = 1.5273125171661,
			},
		},
		pdr_gateway_event_start_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_start_b_01",
				[2] = "pdr_gateway_event_start_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_start_b_01",
				[2] = "pdr_gateway_event_start_b_02",
			},
			sound_events_duration = {
				[1] = 2.4292500019074,
				[2] = 1.7943542003632,
			},
		},
		pdr_gateway_event_start_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_start_c_01",
				[2] = "pdr_gateway_event_start_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_start_c_01",
				[2] = "pdr_gateway_event_start_c_02",
			},
			sound_events_duration = {
				[1] = 3.2023334503174,
				[2] = 3.8714792728424,
			},
		},
		pdr_gateway_event_start_d = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_event_start_d_01",
				[2] = "pdr_gateway_event_start_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_event_start_d_01",
				[2] = "pdr_gateway_event_start_d_02",
			},
			sound_events_duration = {
				[1] = 2.8589375019074,
				[2] = 4.6383543014526,
			},
		},
		pdr_gateway_gate_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_gate_a_01",
				[2] = "pdr_gateway_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_gate_a_01",
				[2] = "pdr_gateway_gate_a_02",
			},
			sound_events_duration = {
				[1] = 2.0232501029968,
				[2] = 1.9455624818802,
			},
		},
		pdr_gateway_gate_lever_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.6169791221619,
				1.9629791975021,
				1.7539792060852,
			},
		},
		pdr_gateway_gate_lever_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				"pdr_prologue_bardin_healed_01_TERMITE",
				"pdr_level_skittergate_activate_gate_01",
				"pdr_level_skittergate_activate_gate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_prologue_bardin_healed_01_TERMITE",
				"pdr_level_skittergate_activate_gate_01",
				"pdr_level_skittergate_activate_gate_04",
			},
			sound_events_duration = {
				2.7160000801086,
				3.7039165496826,
				3.1891458034515,
			},
		},
		pdr_gateway_loot_elevator_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_loot_elevator_b_01",
				[2] = "pdr_gateway_loot_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_loot_elevator_b_01",
				[2] = "pdr_gateway_loot_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 2.6906666755676,
				[2] = 4.109375,
			},
		},
		pdr_gateway_spotlight_triggered_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_spotlight_triggered_b_01",
				[2] = "pdr_gateway_spotlight_triggered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_spotlight_triggered_b_01",
				[2] = "pdr_gateway_spotlight_triggered_b_02",
			},
			sound_events_duration = {
				[1] = 2.7600834369659,
				[2] = 2.0590624809265,
			},
		},
		pdr_gateway_start_banter_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_start_banter_b_01",
				[2] = "pdr_gateway_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_start_banter_b_01",
				[2] = "pdr_gateway_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.4727292060852,
				[2] = 3.9550623893738,
			},
		},
		pdr_gateway_traversal_one_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_traversal_one_a_01",
				[2] = "pdr_gateway_traversal_one_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_traversal_one_a_01",
				[2] = "pdr_gateway_traversal_one_a_02",
			},
			sound_events_duration = {
				[1] = 3.3810832500458,
				[2] = 4.4469375610352,
			},
		},
		pdr_gateway_traversal_one_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_traversal_one_b_01",
				[2] = "pdr_gateway_traversal_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_traversal_one_b_01",
				[2] = "pdr_gateway_traversal_one_b_02",
			},
			sound_events_duration = {
				[1] = 3.5378334522247,
				[2] = 3.0920417308807,
			},
		},
		pdr_gateway_working_spotlight_one_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_working_spotlight_one_b_01",
				[2] = "pdr_gateway_working_spotlight_one_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_working_spotlight_one_b_01",
				[2] = "pdr_gateway_working_spotlight_one_b_02",
			},
			sound_events_duration = {
				[1] = 4.0878748893738,
				[2] = 4.4041042327881,
			},
		},
		pdr_gateway_working_spotlight_three_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_working_spotlight_three_b_01",
				[2] = "pdr_gateway_working_spotlight_three_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_working_spotlight_three_b_01",
				[2] = "pdr_gateway_working_spotlight_three_b_02",
			},
			sound_events_duration = {
				[1] = 2.3629999160767,
				[2] = 2.2930624485016,
			},
		},
		pdr_gateway_working_spotlight_two_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_working_spotlight_two_b_01",
				[2] = "pdr_gateway_working_spotlight_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_working_spotlight_two_b_01",
				[2] = "pdr_gateway_working_spotlight_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.1514582633972,
				[2] = 3.2342083454132,
			},
		},
		pdr_gateway_wrecked_spotlight_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_wrecked_spotlight_a_01",
				[2] = "pdr_gateway_wrecked_spotlight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_wrecked_spotlight_a_01",
				[2] = "pdr_gateway_wrecked_spotlight_a_02",
			},
			sound_events_duration = {
				[1] = 2.0878748893738,
				[2] = 1.9790832996368,
			},
		},
		pdr_gateway_wrecked_spotlight_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_3",
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
				[1] = "pdr_gateway_wrecked_spotlight_b_01",
				[2] = "pdr_gateway_wrecked_spotlight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_wrecked_spotlight_b_01",
				[2] = "pdr_gateway_wrecked_spotlight_b_02",
			},
			sound_events_duration = {
				[1] = 2.887791633606,
				[2] = 4.2684168815613,
			},
		},
	})
end
