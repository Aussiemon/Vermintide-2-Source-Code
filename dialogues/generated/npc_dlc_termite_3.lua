-- chunkname: @dialogues/generated/npc_dlc_termite_3.lua

return function ()
	define_rule({
		name = "nik_gateway_bomb_sighted_one_b",
		probability = 1,
		response = "nik_gateway_bomb_sighted_one_b",
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
				"gateway_bomb_sighted_one_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_bomb_sighted_outside_b",
		probability = 1,
		response = "nik_gateway_bomb_sighted_outside_b",
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
				"gateway_bomb_sighted_outside_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_event_complete_c",
		probability = 1,
		response = "nik_gateway_event_complete_c",
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
				"vmg_a_gateway_event_aftermath_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_loot_elevator_a",
		probability = 1,
		response = "nik_gateway_loot_elevator_a",
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
				"gateway_loot_elevator_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_spolight_three_triggered_b",
		probability = 1,
		response = "nik_gateway_spolight_three_triggered_b",
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
				"vmg_a_gateway_spotlight_three_triggered_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_spotlight_triggered_c",
		probability = 1,
		response = "nik_gateway_spotlight_triggered_c",
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
				"gateway_spotlight_triggered_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_start_banter_a",
		probability = 1,
		response = "nik_gateway_start_banter_a",
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
				"gateway_start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_start_banter_c",
		probability = 1,
		response = "nik_gateway_start_banter_c",
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
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
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
		name = "nik_gateway_working_spotlight_one_a",
		probability = 1,
		response = "nik_gateway_working_spotlight_one_a",
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
				"gateway_working_spotlight_one_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_working_spotlight_three_a",
		probability = 1,
		response = "nik_gateway_working_spotlight_three_a",
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
				"gateway_working_spotlight_three_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_gateway_working_spotlight_two_a",
		probability = 1,
		response = "nik_gateway_working_spotlight_two_a",
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
				"gateway_working_spotlight_two_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "vmg_a_gateway_alarm_raised_first_bell_a",
		probability = 1,
		response = "vmg_a_gateway_alarm_raised_first_bell_a",
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
				"gateway_accidental_bell_ring_a",
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
		name = "vmg_a_gateway_bell_silenced_b",
		probability = 1,
		response = "vmg_a_gateway_bell_silenced_b",
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
				"gateway_bell_silenced_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"gateway_silenced_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"gateway_silenced_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_gateway_bomb_hoist_a",
		probability = 1,
		response = "vmg_a_gateway_bomb_hoist_a",
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
				"gateway_bomb_hoist_a",
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
		name = "vmg_a_gateway_bomb_sighted_one_c",
		probability = 1,
		response = "vmg_a_gateway_bomb_sighted_one_c",
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
				"nik_gateway_bomb_sighted_one_b",
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
		name = "vmg_a_gateway_bomb_stationary_post_spotlight_a",
		probability = 1,
		response = "vmg_a_gateway_bomb_stationary_post_spotlight_a",
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
				"gateway_bomb_stationary_post_spotlight_a",
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
		name = "vmg_a_gateway_event_aftermath_a",
		probability = 1,
		response = "vmg_a_gateway_event_aftermath_a",
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
				"gateway_event_complete_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"gateway_event_aftermath_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"gateway_event_aftermath_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_gateway_event_aftermath_a_EXTRA",
		probability = 1,
		response = "vmg_a_gateway_event_aftermath_a_EXTRA",
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
				"gateway_event_aftermath_a_EXTRA",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"gateway_event_aftermath_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"gateway_event_aftermath_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_gateway_event_aftermath_c",
		probability = 1,
		response = "vmg_a_gateway_event_aftermath_c",
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
				"vmg_b_gateway_event_aftermath_b",
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
		name = "vmg_a_gateway_event_monster_attack_b",
		probability = 1,
		response = "vmg_a_gateway_event_monster_attack_b",
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
				"gateway_event_monster_attack_a",
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
		name = "vmg_a_gateway_event_monster_attack_d",
		probability = 1,
		response = "vmg_a_gateway_event_monster_attack_d",
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
				"vmg_b_gateway_event_monster_attack_c",
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
		name = "vmg_a_gateway_event_partial_success_01_b",
		probability = 1,
		response = "vmg_a_gateway_event_partial_success_01_b",
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
				"vmg_b_gateway_event_partial_success_01_a",
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
		name = "vmg_a_gateway_event_partial_success_02_b",
		probability = 1,
		response = "vmg_a_gateway_event_partial_success_02_b",
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
				"vmg_b_gateway_event_partial_success_02_a",
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
		name = "vmg_a_gateway_event_partial_success_03_b",
		probability = 1,
		response = "vmg_a_gateway_event_partial_success_03_b",
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
				"vmg_b_gateway_event_partial_success_03_a",
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
		name = "vmg_a_gateway_post_spotlights_a",
		probability = 1,
		response = "vmg_a_gateway_post_spotlights_a",
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
				"gateway_post_spotlights_a",
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
		name = "vmg_a_gateway_spotlight_cave_bomb_moving_b",
		probability = 1,
		response = "vmg_a_gateway_spotlight_cave_bomb_moving_b",
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
				"vmg_b_gateway_spotlight_cave_bomb_moving_a",
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
		name = "vmg_a_gateway_spotlight_cave_bomb_still_a",
		probability = 1,
		response = "vmg_a_gateway_spotlight_cave_bomb_still_a",
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
				"gateway_working_spotlight_one_b",
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
		name = "vmg_a_gateway_spotlight_three_triggered_a",
		probability = 1,
		response = "vmg_a_gateway_spotlight_three_triggered_a",
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
				"gateway_spotlight_three_triggered_a",
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
		name = "vmg_a_gateway_spotlight_triggered_a",
		probability = 1,
		response = "vmg_a_gateway_spotlight_triggered_a",
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
				"gateway_spotlight_triggered_a",
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
		name = "vmg_b_gateway_alarm_raised_first_bell_b",
		probability = 1,
		response = "vmg_b_gateway_alarm_raised_first_bell_b",
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
				"vmg_a_gateway_alarm_raised_first_bell_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_bell_silenced_c",
		probability = 1,
		response = "vmg_b_gateway_bell_silenced_c",
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
				"vmg_a_gateway_bell_silenced_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_bomb_hoist_b",
		probability = 1,
		response = "vmg_b_gateway_bomb_hoist_b",
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
				"vmg_a_gateway_bomb_hoist_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_bomb_sighted_one_d",
		probability = 1,
		response = "vmg_b_gateway_bomb_sighted_one_d",
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
				"vmg_a_gateway_bomb_sighted_one_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_bomb_stationary_post_spotlight_b",
		probability = 1,
		response = "vmg_b_gateway_bomb_stationary_post_spotlight_b",
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
				"vmg_a_gateway_bomb_stationary_post_spotlight_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_aftermath_b",
		probability = 1,
		response = "vmg_b_gateway_event_aftermath_b",
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
				"vmg_a_gateway_event_aftermath_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_aftermath_explosion_a",
		probability = 1,
		response = "vmg_b_gateway_event_aftermath_explosion_a",
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
				"gateway_event_aftermath_explosion_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_monster_attack_c",
		probability = 1,
		response = "vmg_b_gateway_event_monster_attack_c",
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
				"vmg_a_gateway_event_monster_attack_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_monster_dead_a",
		probability = 1,
		response = "vmg_b_gateway_event_monster_dead_a",
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
				"gateway_event_monster_dead_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_partial_success_01_a",
		probability = 1,
		response = "vmg_b_gateway_event_partial_success_01_a",
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
				"gateway_event_partial_success_01_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
			{
				"user_memory",
				"gateway_partial_success_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"gateway_partial_success_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_partial_success_01_c",
		probability = 1,
		response = "vmg_b_gateway_event_partial_success_01_c",
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
				"vmg_a_gateway_event_partial_success_01_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_partial_success_02_a",
		probability = 1,
		response = "vmg_b_gateway_event_partial_success_02_a",
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
				"gateway_event_partial_success_02_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
			{
				"user_memory",
				"gateway_partial_success_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"gateway_partial_success_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_partial_success_02_c",
		probability = 1,
		response = "vmg_b_gateway_event_partial_success_02_c",
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
				"vmg_a_gateway_event_partial_success_02_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_event_partial_success_03_a",
		probability = 1,
		response = "vmg_b_gateway_event_partial_success_03_a",
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
				"gateway_event_partial_success_03_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
			{
				"user_memory",
				"gateway_partial_success_03",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"gateway_partial_success_03",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_post_spotlights_b",
		probability = 1,
		response = "vmg_b_gateway_post_spotlights_b",
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
				"vmg_a_gateway_post_spotlights_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_spotlight_cave_bomb_moving_a",
		probability = 1,
		response = "vmg_b_gateway_spotlight_cave_bomb_moving_a",
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
				"gateway_spotlight_cave_bomb_moving_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_b_gateway_spotlight_cave_bomb_still_b",
		probability = 1,
		response = "vmg_b_gateway_spotlight_cave_bomb_still_b",
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
				"vmg_a_gateway_spotlight_cave_bomb_still_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	define_rule({
		name = "vmg_gateway_spotlight_triggered_b",
		probability = 1,
		response = "vmg_gateway_spotlight_triggered_b",
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
				"query_context",
				"source_name",
				OP.EQ,
				"krask_minion",
			},
		},
	})
	add_dialogues({
		nik_gateway_bomb_sighted_one_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_bomb_sighted_one_b_01",
				"nik_gateway_bomb_sighted_one_b_02",
				"nik_gateway_bomb_sighted_one_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_bomb_sighted_one_b_01",
				"nik_gateway_bomb_sighted_one_b_02",
				"nik_gateway_bomb_sighted_one_b_03",
			},
			sound_events_duration = {
				3.2217707633972,
				3.7483332157135,
				3.3204166889191,
			},
		},
		nik_gateway_bomb_sighted_outside_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_bomb_sighted_outside_b_01",
				"nik_gateway_bomb_sighted_outside_b_02",
				"nik_gateway_bomb_sighted_outside_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_gateway_bomb_sighted_outside_b_01",
				"nik_gateway_bomb_sighted_outside_b_02",
				"nik_gateway_bomb_sighted_outside_b_03",
			},
			sound_events_duration = {
				3.426374912262,
				3.1400208473206,
				4.2247500419617,
			},
		},
		nik_gateway_event_complete_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_event_complete_c_01",
				"nik_gateway_event_complete_c_02",
				"nik_gateway_event_complete_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_gateway_event_complete_c_01",
				"nik_gateway_event_complete_c_02",
				"nik_gateway_event_complete_c_03",
			},
			sound_events_duration = {
				2.1640625,
				3.8153123855591,
				3.060250043869,
			},
		},
		nik_gateway_loot_elevator_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_loot_elevator_a_01",
				"nik_gateway_loot_elevator_a_02",
				"nik_gateway_loot_elevator_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_loot_elevator_a_01",
				"nik_gateway_loot_elevator_a_02",
				"nik_gateway_loot_elevator_a_03",
			},
			sound_events_duration = {
				4.9643959999084,
				6.3866248130798,
				5.5529999732971,
			},
		},
		nik_gateway_spolight_three_triggered_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_spolight_three_triggered_b_01",
				"nik_gateway_spolight_three_triggered_b_02",
				"nik_gateway_spolight_three_triggered_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_gateway_spolight_three_triggered_b_01",
				"nik_gateway_spolight_three_triggered_b_02",
				"nik_gateway_spolight_three_triggered_b_03",
			},
			sound_events_duration = {
				1.6672291755676,
				1.8113750219345,
				3.3122708797455,
			},
		},
		nik_gateway_spotlight_triggered_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_spotlight_triggered_c_01",
				"nik_gateway_spotlight_triggered_c_02",
				"nik_gateway_spotlight_triggered_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_gateway_spotlight_triggered_c_01",
				"nik_gateway_spotlight_triggered_c_02",
				"nik_gateway_spotlight_triggered_c_03",
			},
			sound_events_duration = {
				3.849687576294,
				3.9782083034515,
				4.2198748588562,
			},
		},
		nik_gateway_start_banter_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_start_banter_a_01",
				"nik_gateway_start_banter_a_02",
				"nik_gateway_start_banter_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_start_banter_a_01",
				"nik_gateway_start_banter_a_02",
				"nik_gateway_start_banter_a_03",
			},
			sound_events_duration = {
				4.0966248512268,
				5.2643122673035,
				3.1971249580383,
			},
		},
		nik_gateway_start_banter_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_start_banter_c_01",
				"nik_gateway_start_banter_c_02",
				"nik_gateway_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_gateway_start_banter_c_01",
				"nik_gateway_start_banter_c_02",
				"nik_gateway_start_banter_c_03",
			},
			sound_events_duration = {
				4.2539377212524,
				5.3424582481384,
				3.1896042823791,
			},
		},
		nik_gateway_working_spotlight_one_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_working_spotlight_one_a_01",
				"nik_gateway_working_spotlight_one_a_02",
				"nik_gateway_working_spotlight_one_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_working_spotlight_one_a_01",
				"nik_gateway_working_spotlight_one_a_02",
				"nik_gateway_working_spotlight_one_a_03",
			},
			sound_events_duration = {
				5.0123543739319,
				3.0787708759308,
				3.083104133606,
			},
		},
		nik_gateway_working_spotlight_three_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_working_spotlight_three_a_01",
				"nik_gateway_working_spotlight_three_a_02",
				"nik_gateway_working_spotlight_three_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_working_spotlight_three_a_01",
				"nik_gateway_working_spotlight_three_a_02",
				"nik_gateway_working_spotlight_three_a_03",
			},
			sound_events_duration = {
				5.4775834083557,
				3.8398542404175,
				3.0747916698456,
			},
		},
		nik_gateway_working_spotlight_two_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"nik_gateway_working_spotlight_two_a_01",
				"nik_gateway_working_spotlight_two_a_02",
				"nik_gateway_working_spotlight_two_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_working_spotlight_two_a_01",
				"nik_gateway_working_spotlight_two_a_02",
				"nik_gateway_working_spotlight_two_a_03",
			},
			sound_events_duration = {
				2.2446250915527,
				2.5530207157135,
				3.0875415802002,
			},
		},
		vmg_a_gateway_alarm_raised_first_bell_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_alarm_raised_first_bell_a_01",
				"vmg_a_gateway_alarm_raised_first_bell_a_02",
				"vmg_a_gateway_alarm_raised_first_bell_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_alarm_raised_first_bell_a_01",
				"vmg_a_gateway_alarm_raised_first_bell_a_02",
				"vmg_a_gateway_alarm_raised_first_bell_a_03",
			},
			sound_events_duration = {
				3.9332499504089,
				5.4499168395996,
				7.218249797821,
			},
		},
		vmg_a_gateway_bell_silenced_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_bell_silenced_b_01",
				"vmg_a_gateway_bell_silenced_b_02",
				"vmg_a_gateway_bell_silenced_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_bell_silenced_b_01",
				"vmg_a_gateway_bell_silenced_b_02",
				"vmg_a_gateway_bell_silenced_b_03",
			},
			sound_events_duration = {
				2.5213959217072,
				2.934291601181,
				3.4504375457764,
			},
		},
		vmg_a_gateway_bomb_hoist_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_bomb_hoist_a_01",
				"vmg_a_gateway_bomb_hoist_a_02",
				"vmg_a_gateway_bomb_hoist_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_bomb_hoist_a_01",
				"vmg_a_gateway_bomb_hoist_a_02",
				"vmg_a_gateway_bomb_hoist_a_03",
			},
			sound_events_duration = {
				6.1228332519531,
				3.8076250553131,
				4.431104183197,
			},
		},
		vmg_a_gateway_bomb_sighted_one_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_bomb_sighted_one_c_01",
				"vmg_a_gateway_bomb_sighted_one_c_02",
				"vmg_a_gateway_bomb_sighted_one_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_bomb_sighted_one_c_01",
				"vmg_a_gateway_bomb_sighted_one_c_02",
				"vmg_a_gateway_bomb_sighted_one_c_03",
			},
			sound_events_duration = {
				3.9917917251587,
				6.7021250724792,
				6.3790626525879,
			},
		},
		vmg_a_gateway_bomb_stationary_post_spotlight_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_bomb_stationary_post_spotlight_a_01",
				"vmg_a_gateway_bomb_stationary_post_spotlight_a_02",
				"vmg_a_gateway_bomb_stationary_post_spotlight_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_bomb_stationary_post_spotlight_a_01",
				"vmg_a_gateway_bomb_stationary_post_spotlight_a_02",
				"vmg_a_gateway_bomb_stationary_post_spotlight_a_03",
			},
			sound_events_duration = {
				4.9838542938232,
				6.2458333969116,
				4.8151459693909,
			},
		},
		vmg_a_gateway_event_aftermath_a = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_aftermath_a_01",
				"vmg_a_gateway_event_aftermath_a_02",
				"vmg_a_gateway_event_aftermath_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_aftermath_a_01",
				"vmg_a_gateway_event_aftermath_a_02",
				"vmg_a_gateway_event_aftermath_a_03",
			},
			sound_events_duration = {
				4.5951457023621,
				4.0651664733887,
				4.0703749656677,
			},
		},
		vmg_a_gateway_event_aftermath_a_EXTRA = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_aftermath_a_01",
				"vmg_a_gateway_event_aftermath_a_02",
				"vmg_a_gateway_event_aftermath_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_aftermath_a_01",
				"vmg_a_gateway_event_aftermath_a_02",
				"vmg_a_gateway_event_aftermath_a_03",
			},
			sound_events_duration = {
				4.5951457023621,
				4.0651664733887,
				4.0703749656677,
			},
		},
		vmg_a_gateway_event_aftermath_c = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_aftermath_c_01",
				"vmg_a_gateway_event_aftermath_c_02",
				"vmg_a_gateway_event_aftermath_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_aftermath_c_01",
				"vmg_a_gateway_event_aftermath_c_02",
				"vmg_a_gateway_event_aftermath_c_03",
			},
			sound_events_duration = {
				2.3979375362396,
				2.0465416908264,
				2.5110623836517,
			},
		},
		vmg_a_gateway_event_monster_attack_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_monster_attack_b_01",
				"vmg_a_gateway_event_monster_attack_b_02",
				"vmg_a_gateway_event_monster_attack_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_monster_attack_b_01",
				"vmg_a_gateway_event_monster_attack_b_02",
				"vmg_a_gateway_event_monster_attack_b_03",
			},
			sound_events_duration = {
				5.1124167442322,
				4.8853125572205,
				3.6175832748413,
			},
		},
		vmg_a_gateway_event_monster_attack_d = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_monster_attack_d_01",
				"vmg_a_gateway_event_monster_attack_d_02",
				"vmg_a_gateway_event_monster_attack_d_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_monster_attack_d_01",
				"vmg_a_gateway_event_monster_attack_d_02",
				"vmg_a_gateway_event_monster_attack_d_03",
			},
			sound_events_duration = {
				4.5971875190735,
				4.1538333892822,
				3.646562576294,
			},
		},
		vmg_a_gateway_event_partial_success_01_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_partial_success_01_b_01",
				"vmg_a_gateway_event_partial_success_01_b_02",
				"vmg_a_gateway_event_partial_success_01_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_partial_success_01_b_01",
				"vmg_a_gateway_event_partial_success_01_b_02",
				"vmg_a_gateway_event_partial_success_01_b_03",
			},
			sound_events_duration = {
				4.3874168395996,
				3.2413125038147,
				4.1142501831055,
			},
		},
		vmg_a_gateway_event_partial_success_02_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_partial_success_02_b_01",
				"vmg_a_gateway_event_partial_success_02_b_02",
				"vmg_a_gateway_event_partial_success_02_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_partial_success_02_b_01",
				"vmg_a_gateway_event_partial_success_02_b_02",
				"vmg_a_gateway_event_partial_success_02_b_03",
			},
			sound_events_duration = {
				5.1708540916443,
				3.1508123874664,
				3.0581667423248,
			},
		},
		vmg_a_gateway_event_partial_success_03_b = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_event_partial_success_03_b_01",
				"vmg_a_gateway_event_partial_success_03_b_02",
				"vmg_a_gateway_event_partial_success_03_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_event_partial_success_03_b_01",
				"vmg_a_gateway_event_partial_success_03_b_02",
				"vmg_a_gateway_event_partial_success_03_b_03",
			},
			sound_events_duration = {
				5.2115416526794,
				2.9879167079926,
				3.7033541202545,
			},
		},
		vmg_a_gateway_post_spotlights_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_post_spotlights_a_01",
				"vmg_a_gateway_post_spotlights_a_02",
				"vmg_a_gateway_post_spotlights_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_post_spotlights_a_01",
				"vmg_a_gateway_post_spotlights_a_02",
				"vmg_a_gateway_post_spotlights_a_03",
			},
			sound_events_duration = {
				7.2543959617615,
				6.3821043968201,
				4.251416683197,
			},
		},
		vmg_a_gateway_spotlight_cave_bomb_moving_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_spotlight_cave_bomb_moving_b_01",
				"vmg_a_gateway_spotlight_cave_bomb_moving_b_02",
				"vmg_a_gateway_spotlight_cave_bomb_moving_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_spotlight_cave_bomb_moving_b_01",
				"vmg_a_gateway_spotlight_cave_bomb_moving_b_02",
				"vmg_a_gateway_spotlight_cave_bomb_moving_b_03",
			},
			sound_events_duration = {
				6.5848751068115,
				4.874979019165,
				9.2272291183472,
			},
		},
		vmg_a_gateway_spotlight_cave_bomb_still_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_spotlight_cave_bomb_still_a_01",
				"vmg_a_gateway_spotlight_cave_bomb_still_a_02",
				"vmg_a_gateway_spotlight_cave_bomb_still_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_spotlight_cave_bomb_still_a_01",
				"vmg_a_gateway_spotlight_cave_bomb_still_a_02",
				"vmg_a_gateway_spotlight_cave_bomb_still_a_03",
			},
			sound_events_duration = {
				6.1592288017273,
				7.2275414466858,
				6.9582290649414,
			},
		},
		vmg_a_gateway_spotlight_three_triggered_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_spotlight_three_triggered_a_01",
				"vmg_a_gateway_spotlight_three_triggered_a_02",
				"vmg_a_gateway_spotlight_three_triggered_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_gateway_spotlight_three_triggered_a_01",
				"vmg_a_gateway_spotlight_three_triggered_a_02",
				"vmg_a_gateway_spotlight_three_triggered_a_03",
			},
			sound_events_duration = {
				6.3201665878296,
				5.6700625419617,
				7.9454998970032,
			},
		},
		vmg_a_gateway_spotlight_triggered_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_a_gateway_spotlight_triggered_a_01",
				"vmg_a_gateway_spotlight_triggered_a_02",
				"vmg_a_gateway_spotlight_triggered_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_gateway_spotlight_triggered_a_01",
				"vmg_a_gateway_spotlight_triggered_a_02",
				"vmg_a_gateway_spotlight_triggered_a_03",
			},
			sound_events_duration = {
				4.9181456565857,
				3.5350000858307,
				3.362687587738,
			},
		},
		vmg_b_gateway_alarm_raised_first_bell_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_alarm_raised_first_bell_b_01",
				"vmg_b_gateway_alarm_raised_first_bell_b_02",
				"vmg_b_gateway_alarm_raised_first_bell_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_alarm_raised_first_bell_b_01",
				"vmg_b_gateway_alarm_raised_first_bell_b_02",
				"vmg_b_gateway_alarm_raised_first_bell_b_03",
			},
			sound_events_duration = {
				3.3653957843781,
				5.3394584655762,
				4.7740831375122,
			},
		},
		vmg_b_gateway_bell_silenced_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_bell_silenced_c_01",
				"vmg_b_gateway_bell_silenced_c_02",
				"vmg_b_gateway_bell_silenced_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_bell_silenced_c_01",
				"vmg_b_gateway_bell_silenced_c_02",
				"vmg_b_gateway_bell_silenced_c_03",
			},
			sound_events_duration = {
				4.6646666526794,
				4.5456666946411,
				5.1577291488647,
			},
		},
		vmg_b_gateway_bomb_hoist_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_bomb_hoist_b_01",
				"vmg_b_gateway_bomb_hoist_b_02",
				"vmg_b_gateway_bomb_hoist_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_b_gateway_bomb_hoist_b_01",
				"vmg_b_gateway_bomb_hoist_b_02",
				"vmg_b_gateway_bomb_hoist_b_03",
			},
			sound_events_duration = {
				2.6484375,
				3.8531665802002,
				2.8943123817444,
			},
		},
		vmg_b_gateway_bomb_sighted_one_d = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_bomb_sighted_one_d_01",
				"vmg_b_gateway_bomb_sighted_one_d_02",
				"vmg_b_gateway_bomb_sighted_one_d_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_bomb_sighted_one_d_01",
				"vmg_b_gateway_bomb_sighted_one_d_02",
				"vmg_b_gateway_bomb_sighted_one_d_03",
			},
			sound_events_duration = {
				4.3879790306091,
				4.9432501792908,
				3.9673125743866,
			},
		},
		vmg_b_gateway_bomb_stationary_post_spotlight_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_bomb_stationary_post_spotlight_b_01",
				"vmg_b_gateway_bomb_stationary_post_spotlight_b_02",
				"vmg_b_gateway_bomb_stationary_post_spotlight_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_bomb_stationary_post_spotlight_b_01",
				"vmg_b_gateway_bomb_stationary_post_spotlight_b_02",
				"vmg_b_gateway_bomb_stationary_post_spotlight_b_03",
			},
			sound_events_duration = {
				3.2306876182556,
				2.9978332519531,
				3.5233957767487,
			},
		},
		vmg_b_gateway_event_aftermath_b = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_aftermath_b_01",
				"vmg_b_gateway_event_aftermath_b_02",
				"vmg_b_gateway_event_aftermath_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_event_aftermath_b_01",
				"vmg_b_gateway_event_aftermath_b_02",
				"vmg_b_gateway_event_aftermath_b_03",
			},
			sound_events_duration = {
				3.1513657569885,
				2.207629442215,
				2.3251457214356,
			},
		},
		vmg_b_gateway_event_aftermath_explosion_a = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				[1] = "vmg_b_gateway_event_aftermath_explosion_a_01",
				[2] = "vmg_b_gateway_event_aftermath_explosion_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "vmg_b_gateway_event_aftermath_explosion_a_01",
				[2] = "vmg_b_gateway_event_aftermath_explosion_a_02",
			},
			sound_events_duration = {
				[1] = 4.0896530151367,
				[2] = 4.0958852767944,
			},
		},
		vmg_b_gateway_event_monster_attack_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_monster_attack_c_01",
				"vmg_b_gateway_event_monster_attack_c_02",
				"vmg_b_gateway_event_monster_attack_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_event_monster_attack_c_01",
				"vmg_b_gateway_event_monster_attack_c_02",
				"vmg_b_gateway_event_monster_attack_c_03",
			},
			sound_events_duration = {
				4.9394583702087,
				3.430520772934,
				3.6939792633057,
			},
		},
		vmg_b_gateway_event_monster_dead_a = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_monster_dead_a_01",
				"vmg_b_gateway_event_monster_dead_a_02",
				"vmg_b_gateway_event_monster_dead_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_b_gateway_event_monster_dead_a_01",
				"vmg_b_gateway_event_monster_dead_a_02",
				"vmg_b_gateway_event_monster_dead_a_03",
			},
			sound_events_duration = {
				6.0705208778381,
				6.6232500076294,
				4.5642290115356,
			},
		},
		vmg_b_gateway_event_partial_success_01_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_partial_success_01_a_01",
				"vmg_b_gateway_event_partial_success_01_a_02",
				"vmg_b_gateway_event_partial_success_01_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_event_partial_success_01_a_01",
				"vmg_b_gateway_event_partial_success_01_a_02",
				"vmg_b_gateway_event_partial_success_01_a_03",
			},
			sound_events_duration = {
				6.0862498283386,
				4.9035415649414,
				4.8450832366943,
			},
		},
		vmg_b_gateway_event_partial_success_01_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_partial_success_01_c_01",
				"vmg_b_gateway_event_partial_success_01_c_02",
				"vmg_b_gateway_event_partial_success_01_c_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_b_gateway_event_partial_success_01_c_01",
				"vmg_b_gateway_event_partial_success_01_c_02",
				"vmg_b_gateway_event_partial_success_01_c_03",
			},
			sound_events_duration = {
				3.9851875305176,
				2.5034792423248,
				2.8164999485016,
			},
		},
		vmg_b_gateway_event_partial_success_02_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_partial_success_02_a_01",
				"vmg_b_gateway_event_partial_success_02_a_02",
				"vmg_b_gateway_event_partial_success_02_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_event_partial_success_02_a_01",
				"vmg_b_gateway_event_partial_success_02_a_02",
				"vmg_b_gateway_event_partial_success_02_a_03",
			},
			sound_events_duration = {
				5.2741665840149,
				3.3202500343323,
				3.3217084407806,
			},
		},
		vmg_b_gateway_event_partial_success_02_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_partial_success_02_c_01",
				"vmg_b_gateway_event_partial_success_02_c_02",
				"vmg_b_gateway_event_partial_success_02_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_event_partial_success_02_c_01",
				"vmg_b_gateway_event_partial_success_02_c_02",
				"vmg_b_gateway_event_partial_success_02_c_03",
			},
			sound_events_duration = {
				4.1128540039063,
				4.0782709121704,
				3.3171875476837,
			},
		},
		vmg_b_gateway_event_partial_success_03_a = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_event_partial_success_03_a_01",
				"vmg_b_gateway_event_partial_success_03_a_02",
				"vmg_b_gateway_event_partial_success_03_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_event_partial_success_03_a_01",
				"vmg_b_gateway_event_partial_success_03_a_02",
				"vmg_b_gateway_event_partial_success_03_a_03",
			},
			sound_events_duration = {
				2.8825416564941,
				2.158124923706,
				3.3700416088104,
			},
		},
		vmg_b_gateway_post_spotlights_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_post_spotlights_b_01",
				"vmg_b_gateway_post_spotlights_b_02",
				"vmg_b_gateway_post_spotlights_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_post_spotlights_b_01",
				"vmg_b_gateway_post_spotlights_b_02",
				"vmg_b_gateway_post_spotlights_b_03",
			},
			sound_events_duration = {
				6.5077290534973,
				4.6386456489563,
				4.0462498664856,
			},
		},
		vmg_b_gateway_spotlight_cave_bomb_moving_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_spotlight_cave_bomb_moving_a_01",
				"vmg_b_gateway_spotlight_cave_bomb_moving_a_02",
				"vmg_b_gateway_spotlight_cave_bomb_moving_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_spotlight_cave_bomb_moving_a_01",
				"vmg_b_gateway_spotlight_cave_bomb_moving_a_02",
				"vmg_b_gateway_spotlight_cave_bomb_moving_a_03",
			},
			sound_events_duration = {
				4.1344790458679,
				4.3807501792908,
				3.6587500572205,
			},
		},
		vmg_b_gateway_spotlight_cave_bomb_still_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_spotlight_cave_bomb_still_b_01",
				"vmg_b_gateway_spotlight_cave_bomb_still_b_02",
				"vmg_b_gateway_spotlight_cave_bomb_still_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_spotlight_cave_bomb_still_b_01",
				"vmg_b_gateway_spotlight_cave_bomb_still_b_02",
				"vmg_b_gateway_spotlight_cave_bomb_still_b_03",
			},
			sound_events_duration = {
				4.4263958930969,
				6.4330625534058,
				4.2683539390564,
			},
		},
		vmg_gateway_spotlight_triggered_b = {
			category = "level_talk",
			database = "npc_dlc_termite_3",
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
				"vmg_b_gateway_spotlight_triggered_b_01",
				"vmg_b_gateway_spotlight_triggered_b_02",
				"vmg_b_gateway_spotlight_triggered_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_b_gateway_spotlight_triggered_b_01",
				"vmg_b_gateway_spotlight_triggered_b_02",
				"vmg_b_gateway_spotlight_triggered_b_03",
			},
			sound_events_duration = {
				2.467791557312,
				3.4439375400543,
				4.5510416030884,
			},
		},
	})
end
