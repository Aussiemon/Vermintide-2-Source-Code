-- chunkname: @dialogues/generated/npc_dlc_dwarf_fest.lua

return function ()
	define_rule({
		name = "nco_dal_bonus_troll_one_dead_a",
		probability = 1,
		response = "nco_dal_bonus_troll_one_dead_a",
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
				"nco_dal_bonus_troll_one_dead_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_bonus_troll_three_dead_a",
		probability = 1,
		response = "nco_dal_bonus_troll_three_dead_a",
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
				"nco_dal_bonus_troll_three_dead_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_bonus_troll_two_dead_a",
		probability = 1,
		response = "nco_dal_bonus_troll_two_dead_a",
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
				"nco_dal_bonus_troll_two_dead_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_finale_hall_of_heroes_a",
		probability = 1,
		response = "nco_dal_finale_hall_of_heroes_a",
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
				"nco_dal_finale_hall_of_heroes_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_finale_hall_of_heroes_horn_a",
		probability = 1,
		response = "nco_dal_finale_hall_of_heroes_horn_a",
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
				"nco_dal_finale_hall_of_heroes_horn_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_finale_hall_of_heroes_troll_mid_fight_b",
		probability = 1,
		response = "nco_dal_finale_hall_of_heroes_troll_mid_fight_b",
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
				"dal_finale_hall_of_heroes_troll_mid_fight_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_finale_hall_of_heroes_troll_slain_b",
		probability = 1,
		response = "nco_dal_finale_hall_of_heroes_troll_slain_b",
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
				"dal_finale_hall_of_heroes_troll_slain_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_finale_troll_chief_a",
		probability = 1,
		response = "nco_dal_finale_troll_chief_a",
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
				"nco_dal_finale_troll_chief_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_hub_lift_sighted_a",
		probability = 1,
		response = "nco_dal_lifts_hub_lift_sighted_a",
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
				"nco_dal_lifts_hub_lift_sighted_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_hub_lift_sighted_b",
		probability = 1,
		response = "nco_dal_lifts_hub_lift_sighted_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nco_dal_lifts_hub_lift_sighted_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_hub_lift_started_ambush_a",
		probability = 1,
		response = "nco_dal_lifts_hub_lift_started_ambush_a",
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
				"dal_lifts_hub_lift_started_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_hub_return_first_task_complete_c",
		probability = 1,
		response = "nco_dal_lifts_hub_return_first_task_complete_c",
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
				"dal_lifts_hub_return_first_task_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_hub_return_second_task_complete_a",
		probability = 1,
		response = "nco_dal_lifts_hub_return_second_task_complete_a",
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
				"dal_lifts_hub_return_task_complete",
			},
			{
				"faction_memory",
				"flow_tasks_complete",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"dal_lifts_hub_return_second_task_complete_a",
				OP.EQ,
				0,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
		on_done = {
			{
				"faction_memory",
				"dal_lifts_hub_return_second_task_complete_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_lift_arrived_a",
		probability = 1,
		response = "nco_dal_lifts_lift_arrived_a",
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
				"nco_dal_lifts_lift_arrived_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_lift_is_moving_reminder_b",
		probability = 1,
		response = "nco_dal_lifts_lift_is_moving_reminder_b",
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
				"dal_lifts_lift_is_moving_reminder_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_lift_rising_water_b",
		probability = 1,
		response = "nco_dal_lifts_lift_rising_water_b",
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
				"dal_lifts_lift_rising_water_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_path_cog_entered_b",
		probability = 1,
		response = "nco_dal_lifts_path_cog_entered_b",
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
				"dal_lifts_path_cog_entered_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_path_pipe_shutter_walk_a",
		probability = 1,
		response = "nco_dal_lifts_path_pipe_shutter_walk_a",
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
				"nco_dal_lifts_path_pipe_shutter_walk_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lifts_path_pipe_torch_return_a",
		probability = 1,
		response = "nco_dal_lifts_path_pipe_torch_return_a",
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
				"nco_dal_lifts_path_pipe_torch_return_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lights_gate_sealed_a",
		probability = 1,
		response = "nco_dal_lights_gate_sealed_a",
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
				"nco_dal_lights_gate_sealed_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lights_switch_activated_a",
		probability = 1,
		response = "nco_dal_lights_switch_activated_a",
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
				"nco_dal_lights_switch_activated_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lights_trolls_dead_complete_a",
		probability = 1,
		response = "nco_dal_lights_trolls_dead_complete_a",
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
				"nco_dal_lights_trolls_dead_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_lights_trolls_dead_complete_c",
		probability = 1,
		response = "nco_dal_lights_trolls_dead_complete_c",
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
				"dal_lights_trolls_dead_complete_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_outer_approach_b",
		probability = 1,
		response = "nco_dal_outer_approach_b",
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
				"dal_outer_approach_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_outer_causeway_b",
		probability = 1,
		response = "nco_dal_outer_causeway_b",
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
				"npcr1_dal_outer_causeway_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_outer_close_a",
		probability = 1,
		response = "nco_dal_outer_close_a",
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
				"dal_outer_close_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_outer_close_b",
		probability = 1,
		response = "nco_dal_outer_close_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nco_dal_outer_close_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_outer_troll_b",
		probability = 1,
		response = "nco_dal_outer_troll_b",
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
				"dal_outer_troll_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_outer_troll_dead_complete_b",
		probability = 1,
		response = "nco_dal_outer_troll_dead_complete_b",
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
				"dal_outer_troll_dead_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_start_banter_a",
		probability = 1,
		response = "nco_dal_start_banter_a",
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
				"dal_start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_start_banter_b",
		probability = 1,
		response = "nco_dal_start_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dal_start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_start_banter_c",
		probability = 1,
		response = "nco_dal_start_banter_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dal_start_banter_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "nco_dal_start_vista_c",
		probability = 1,
		response = "nco_dal_start_vista_c",
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
				"dal_start_vista_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_cousin",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_finale_hall_of_heroes_horn_b",
		probability = 1,
		response = "npcr1_dal_finale_hall_of_heroes_horn_b",
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
				"nco_dal_finale_hall_of_heroes_horn_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_finale_hall_of_heroes_troll_mid_fight_b",
		probability = 1,
		response = "npcr1_dal_finale_hall_of_heroes_troll_mid_fight_b",
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
				"dal_finale_hall_of_heroes_troll_mid_fight_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_finale_hall_of_heroes_troll_slain_c",
		probability = 1,
		response = "npcr1_dal_finale_hall_of_heroes_troll_slain_c",
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
				"nco_dal_finale_hall_of_heroes_troll_slain_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_lifts_hub_lift_sighted_d",
		probability = 1,
		response = "npcr1_dal_lifts_hub_lift_sighted_d",
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
				"dal_lifts_hub_lift_sighted_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_lifts_hub_lift_started_ambush_b",
		probability = 1,
		response = "npcr1_dal_lifts_hub_lift_started_ambush_b",
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
				"nco_dal_lifts_hub_lift_started_ambush_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_lifts_hub_return_first_task_complete_d",
		probability = 1,
		response = "npcr1_dal_lifts_hub_return_first_task_complete_d",
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
				"nco_dal_lifts_hub_return_first_task_complete_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_lifts_hub_return_second_task_complete_b",
		probability = 1,
		response = "npcr1_dal_lifts_hub_return_second_task_complete_b",
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
				"nco_dal_lifts_hub_return_second_task_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_lights_switch_activated_c",
		probability = 1,
		response = "npcr1_dal_lights_switch_activated_c",
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
				"nco_dal_lights_switch_activated_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_outer_causeway_a",
		probability = 1,
		response = "npcr1_dal_outer_causeway_a",
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
				"npcr1_dal_outer_causeway_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	define_rule({
		name = "npcr1_dal_outer_troll_c",
		probability = 1,
		response = "npcr1_dal_outer_troll_c",
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
				"nco_dal_outer_troll_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_dwarf_revellers",
			},
		},
	})
	add_dialogues({
		nco_dal_bonus_troll_one_dead_a = {
			category = "special_occasion_interrupt",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_bonus_troll_one_dead_a_01",
				[2] = "nco_dal_bonus_troll_one_dead_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_bonus_troll_one_dead_a_01",
				[2] = "nco_dal_bonus_troll_one_dead_a_02",
			},
			sound_events_duration = {
				[1] = 5.4000000953674,
				[2] = 7.8186664581299,
			},
		},
		nco_dal_bonus_troll_three_dead_a = {
			category = "special_occasion_interrupt",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_bonus_troll_three_dead_a_01",
				[2] = "nco_dal_bonus_troll_three_dead_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_bonus_troll_three_dead_a_01",
				[2] = "nco_dal_bonus_troll_three_dead_a_02",
			},
			sound_events_duration = {
				[1] = 5.597770690918,
				[2] = 4.4734373092651,
			},
		},
		nco_dal_bonus_troll_two_dead_a = {
			category = "special_occasion_interrupt",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_bonus_troll_two_dead_a_01",
				[2] = "nco_dal_bonus_troll_two_dead_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_bonus_troll_two_dead_a_01",
				[2] = "nco_dal_bonus_troll_two_dead_a_02",
			},
			sound_events_duration = {
				[1] = 7.6573333740234,
				[2] = 5.4783539772034,
			},
		},
		nco_dal_finale_hall_of_heroes_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_finale_hall_of_heroes_a_01",
				"nco_dal_finale_hall_of_heroes_a_02",
				"nco_dal_finale_hall_of_heroes_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_finale_hall_of_heroes_a_01",
				"nco_dal_finale_hall_of_heroes_a_02",
				"nco_dal_finale_hall_of_heroes_a_03",
			},
			sound_events_duration = {
				5.6461458206177,
				7.2223749160767,
				4.9526872634888,
			},
		},
		nco_dal_finale_hall_of_heroes_horn_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_finale_hall_of_heroes_horn_a_01",
				"nco_dal_finale_hall_of_heroes_horn_a_02",
				"nco_dal_finale_hall_of_heroes_horn_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_finale_hall_of_heroes_horn_a_01",
				"nco_dal_finale_hall_of_heroes_horn_a_02",
				"nco_dal_finale_hall_of_heroes_horn_a_03",
			},
			sound_events_duration = {
				8.3867988586426,
				8.1087560653687,
				8.2746963500977,
			},
		},
		nco_dal_finale_hall_of_heroes_troll_mid_fight_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nco_dal_finale_hall_of_heroes_troll_mid_fight_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_finale_hall_of_heroes_troll_mid_fight_b_01",
			},
			sound_events_duration = {
				[1] = 1.5993572473526,
			},
		},
		nco_dal_finale_hall_of_heroes_troll_slain_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_finale_hall_of_heroes_troll_slain_b_01",
				"nco_dal_finale_hall_of_heroes_troll_slain_b_02",
				"nco_dal_finale_hall_of_heroes_troll_slain_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_finale_hall_of_heroes_troll_slain_b_01",
				"nco_dal_finale_hall_of_heroes_troll_slain_b_02",
				"nco_dal_finale_hall_of_heroes_troll_slain_b_03",
			},
			sound_events_duration = {
				12.230976104736,
				12.342875480652,
				13.492029190064,
			},
		},
		nco_dal_finale_troll_chief_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_finale_troll_chief_a_01",
				"nco_dal_finale_troll_chief_a_02",
				"nco_dal_finale_troll_chief_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_finale_troll_chief_a_01",
				"nco_dal_finale_troll_chief_a_02",
				"nco_dal_finale_troll_chief_a_03",
			},
			sound_events_duration = {
				4.9054584503174,
				5.6574168205261,
				5.1308751106262,
			},
		},
		nco_dal_lifts_hub_lift_sighted_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_hub_lift_sighted_a_01",
				[2] = "nco_dal_lifts_hub_lift_sighted_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_hub_lift_sighted_a_01",
				[2] = "nco_dal_lifts_hub_lift_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 3.616229057312,
				[2] = 4.8966250419617,
			},
		},
		nco_dal_lifts_hub_lift_sighted_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_hub_lift_sighted_b_01",
				[2] = "nco_dal_lifts_hub_lift_sighted_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_hub_lift_sighted_b_01",
				[2] = "nco_dal_lifts_hub_lift_sighted_b_02",
			},
			sound_events_duration = {
				[1] = 4.4850206375122,
				[2] = 4.4583749771118,
			},
		},
		nco_dal_lifts_hub_lift_started_ambush_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_hub_lift_started_ambush_a_01",
				[2] = "nco_dal_lifts_hub_lift_started_ambush_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_hub_lift_started_ambush_a_01",
				[2] = "nco_dal_lifts_hub_lift_started_ambush_a_02",
			},
			sound_events_duration = {
				[1] = 3.758868932724,
				[2] = 4.8065896034241,
			},
		},
		nco_dal_lifts_hub_return_first_task_complete_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_hub_return_first_task_complete_c_01",
				[2] = "nco_dal_lifts_hub_return_first_task_complete_c_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_hub_return_first_task_complete_c_01",
				[2] = "nco_dal_lifts_hub_return_first_task_complete_c_02",
			},
			sound_events_duration = {
				[1] = 3.0020933151245,
				[2] = 4.1741743087769,
			},
		},
		nco_dal_lifts_hub_return_second_task_complete_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_lifts_hub_return_second_task_complete_a_01",
				"nco_dal_lifts_hub_return_second_task_complete_a_02",
				"nco_dal_lifts_hub_return_second_task_complete_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_lifts_hub_return_second_task_complete_a_01",
				"nco_dal_lifts_hub_return_second_task_complete_a_02",
				"nco_dal_lifts_hub_return_second_task_complete_a_03",
			},
			sound_events_duration = {
				4.2652220726013,
				4.1860680580139,
				5.434974193573,
			},
		},
		nco_dal_lifts_lift_arrived_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_lifts_lift_arrived_a_01",
				"nco_dal_lifts_lift_arrived_a_02",
				"nco_dal_lifts_lift_arrived_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_lifts_lift_arrived_a_01",
				"nco_dal_lifts_lift_arrived_a_02",
				"nco_dal_lifts_lift_arrived_a_03",
			},
			sound_events_duration = {
				3.2206666469574,
				6.4529790878296,
				6.5723123550415,
			},
		},
		nco_dal_lifts_lift_is_moving_reminder_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_lift_is_moving_reminder_b_01",
				[2] = "nco_dal_lifts_lift_is_moving_reminder_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_lift_is_moving_reminder_b_01",
				[2] = "nco_dal_lifts_lift_is_moving_reminder_b_02",
			},
			sound_events_duration = {
				[1] = 3.8303959369659,
				[2] = 3.2420625686645,
			},
		},
		nco_dal_lifts_lift_rising_water_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_lift_rising_water_b_01",
				[2] = "nco_dal_lifts_lift_rising_water_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_lift_rising_water_b_01",
				[2] = "nco_dal_lifts_lift_rising_water_b_02",
			},
			sound_events_duration = {
				[1] = 4.7525210380554,
				[2] = 4.3143539428711,
			},
		},
		nco_dal_lifts_path_cog_entered_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_path_cog_entered_b_01",
				[2] = "nco_dal_lifts_path_cog_entered_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_path_cog_entered_b_01",
				[2] = "nco_dal_lifts_path_cog_entered_b_02",
			},
			sound_events_duration = {
				[1] = 5.5905623435974,
				[2] = 4.4703750610352,
			},
		},
		nco_dal_lifts_path_pipe_shutter_walk_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_path_pipe_shutter_walk_a_01",
				[2] = "nco_dal_lifts_path_pipe_shutter_walk_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_path_pipe_shutter_walk_a_01",
				[2] = "nco_dal_lifts_path_pipe_shutter_walk_a_02",
			},
			sound_events_duration = {
				[1] = 4.5062294006348,
				[2] = 3.840437412262,
			},
		},
		nco_dal_lifts_path_pipe_torch_return_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lifts_path_pipe_torch_return_a_01",
				[2] = "nco_dal_lifts_path_pipe_torch_return_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lifts_path_pipe_torch_return_a_01",
				[2] = "nco_dal_lifts_path_pipe_torch_return_a_02",
			},
			sound_events_duration = {
				[1] = 6.2401456832886,
				[2] = 4.1547083854675,
			},
		},
		nco_dal_lights_gate_sealed_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lights_gate_sealed_a_01",
				[2] = "nco_dal_lights_gate_sealed_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lights_gate_sealed_a_01",
				[2] = "nco_dal_lights_gate_sealed_a_02",
			},
			sound_events_duration = {
				[1] = 7.8322291374206,
				[2] = 7.8933539390564,
			},
		},
		nco_dal_lights_switch_activated_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lights_switch_activated_a_01",
				[2] = "nco_dal_lights_switch_activated_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lights_switch_activated_a_01",
				[2] = "nco_dal_lights_switch_activated_a_02",
			},
			sound_events_duration = {
				[1] = 3.929888010025,
				[2] = 4.6148719787598,
			},
		},
		nco_dal_lights_trolls_dead_complete_a = {
			category = "special_occasion_interrupt",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lights_trolls_dead_complete_a_01",
				[2] = "nco_dal_lights_trolls_dead_complete_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lights_trolls_dead_complete_a_01",
				[2] = "nco_dal_lights_trolls_dead_complete_a_02",
			},
			sound_events_duration = {
				[1] = 5.9031043052673,
				[2] = 7.5934581756592,
			},
		},
		nco_dal_lights_trolls_dead_complete_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_lights_trolls_dead_complete_c_01",
				[2] = "nco_dal_lights_trolls_dead_complete_c_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_lights_trolls_dead_complete_c_01",
				[2] = "nco_dal_lights_trolls_dead_complete_c_02",
			},
			sound_events_duration = {
				[1] = 4.1314997673035,
				[2] = 7.0386877059936,
			},
		},
		nco_dal_outer_approach_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_outer_approach_b_01",
				[2] = "nco_dal_outer_approach_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_outer_approach_b_01",
				[2] = "nco_dal_outer_approach_b_02",
			},
			sound_events_duration = {
				[1] = 7.7199583053589,
				[2] = 8.491250038147,
			},
		},
		nco_dal_outer_causeway_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_outer_causeway_b_01",
				"nco_dal_outer_causeway_b_02",
				"nco_dal_outer_causeway_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_outer_causeway_b_01",
				"nco_dal_outer_causeway_b_02",
				"nco_dal_outer_causeway_b_03",
			},
			sound_events_duration = {
				4.5015416145325,
				5.2372918128967,
				3.7525207996368,
			},
		},
		nco_dal_outer_close_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_outer_close_a_01",
				[2] = "nco_dal_outer_close_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_outer_close_a_01",
				[2] = "nco_dal_outer_close_a_02",
			},
			sound_events_duration = {
				[1] = 3.0322709083557,
				[2] = 4.5509166717529,
			},
		},
		nco_dal_outer_close_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_outer_close_b_01",
				[2] = "nco_dal_outer_close_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_outer_close_b_01",
				[2] = "nco_dal_outer_close_b_02",
			},
			sound_events_duration = {
				[1] = 7.0021877288818,
				[2] = 6.1727290153503,
			},
		},
		nco_dal_outer_troll_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nco_dal_outer_troll_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_outer_troll_b_01",
			},
			sound_events_duration = {
				[1] = 1.7787890434265,
			},
		},
		nco_dal_outer_troll_dead_complete_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				[1] = "nco_dal_outer_troll_dead_complete_b_01",
				[2] = "nco_dal_outer_troll_dead_complete_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nco_dal_outer_troll_dead_complete_b_01",
				[2] = "nco_dal_outer_troll_dead_complete_b_02",
			},
			sound_events_duration = {
				[1] = 5.0732498168945,
				[2] = 5.6072292327881,
			},
		},
		nco_dal_start_banter_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_start_banter_a_01",
				"nco_dal_start_banter_a_02",
				"nco_dal_start_banter_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_start_banter_a_01",
				"nco_dal_start_banter_a_02",
				"nco_dal_start_banter_a_03",
			},
			sound_events_duration = {
				9.4355325698853,
				9.6282796859741,
				9.6399822235107,
			},
		},
		nco_dal_start_banter_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_start_banter_b_01",
				"nco_dal_start_banter_b_02",
				"nco_dal_start_banter_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_start_banter_b_01",
				"nco_dal_start_banter_b_02",
				"nco_dal_start_banter_b_03",
			},
			sound_events_duration = {
				11.7578125,
				12.450703620911,
				11.288215637207,
			},
		},
		nco_dal_start_banter_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_start_banter_c_01",
				"nco_dal_start_banter_c_02",
				"nco_dal_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_start_banter_c_01",
				"nco_dal_start_banter_c_02",
				"nco_dal_start_banter_c_03",
			},
			sound_events_duration = {
				5.1704840660095,
				4.0958342552185,
				4.7815160751343,
			},
		},
		nco_dal_start_vista_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
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
				"nco_dal_start_vista_c_01",
				"nco_dal_start_vista_c_02",
				"nco_dal_start_vista_c_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nco_dal_start_vista_c_01",
				"nco_dal_start_vista_c_02",
				"nco_dal_start_vista_c_03",
			},
			sound_events_duration = {
				5.6185417175293,
				4.8126873970032,
				6.5023331642151,
			},
		},
		npcr1_dal_finale_hall_of_heroes_horn_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_finale_hall_of_heroes_horn_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_finale_hall_of_heroes_horn_b_01",
			},
			sound_events_duration = {
				[1] = 6.7333331108093,
			},
		},
		npcr1_dal_finale_hall_of_heroes_troll_mid_fight_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_finale_hall_of_heroes_troll_mid_fight_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_finale_hall_of_heroes_troll_mid_fight_b_01",
			},
			sound_events_duration = {
				[1] = 5.4666666984558,
			},
		},
		npcr1_dal_finale_hall_of_heroes_troll_slain_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_finale_hall_of_heroes_troll_slain_c_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_finale_hall_of_heroes_troll_slain_c_01",
			},
			sound_events_duration = {
				[1] = 8.1000003814697,
			},
		},
		npcr1_dal_lifts_hub_lift_sighted_d = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_lifts_hub_lift_sighted_d_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_lifts_hub_lift_sighted_d_01",
			},
			sound_events_duration = {
				[1] = 5.9333333969116,
			},
		},
		npcr1_dal_lifts_hub_lift_started_ambush_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_lifts_hub_lift_started_ambush_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_lifts_hub_lift_started_ambush_b_01",
			},
			sound_events_duration = {
				[1] = 7.8333334922791,
			},
		},
		npcr1_dal_lifts_hub_return_first_task_complete_d = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_lifts_hub_return_first_task_complete_d_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_lifts_hub_return_first_task_complete_d_01",
			},
			sound_events_duration = {
				[1] = 7.0666666030884,
			},
		},
		npcr1_dal_lifts_hub_return_second_task_complete_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_lifts_hub_return_second_task_complete_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_lifts_hub_return_second_task_complete_b_01",
			},
			sound_events_duration = {
				[1] = 5.7666668891907,
			},
		},
		npcr1_dal_lights_switch_activated_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_lights_switch_activated_c_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_lights_switch_activated_c_01",
			},
			sound_events_duration = {
				[1] = 5.1666665077209,
			},
		},
		npcr1_dal_outer_causeway_a = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_outer_causeway_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_outer_causeway_a_01",
			},
			sound_events_duration = {
				[1] = 5.3333334922791,
			},
		},
		npcr1_dal_outer_troll_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npcr1_dal_outer_troll_c_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npcr1_dal_outer_troll_c_01",
			},
			sound_events_duration = {
				[1] = 7,
			},
		},
	})
end
