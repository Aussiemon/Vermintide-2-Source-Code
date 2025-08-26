-- chunkname: @dialogues/generated/wood_elf_dlc_dwarf_fest.lua

return function ()
	define_rule({
		name = "pwe_dal_finale_filth_halls_a",
		probability = 1,
		response = "pwe_dal_finale_filth_halls_a",
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
				"dal_finale_filth_halls_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_finale_hall_of_heroes_leave_a",
		probability = 1,
		response = "pwe_dal_finale_hall_of_heroes_leave_a",
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
				"dal_finale_hall_of_heroes_leave_a",
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
		name = "pwe_dal_finale_hall_of_heroes_troll_mid_fight_a",
		probability = 1,
		response = "pwe_dal_finale_hall_of_heroes_troll_mid_fight_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dal_troll_mid_fight_a",
			},
			{
				"user_memory",
				"dal_finale_hall_of_heroes_troll_mid_fight_a",
				OP.EQ,
				0,
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
				"user_memory",
				"dal_finale_hall_of_heroes_troll_mid_fight_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_finale_hall_of_heroes_troll_slain_a",
		probability = 1,
		response = "pwe_dal_finale_hall_of_heroes_troll_slain_a",
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
				"dal_finale_hall_of_heroes_troll_slain_a",
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
		name = "pwe_dal_finale_troll_chief_b",
		probability = 1,
		response = "pwe_dal_finale_troll_chief_b",
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
				"dal_finale_troll_chief_a",
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
		name = "pwe_dal_lifts_hub_first_task_a",
		probability = 1,
		response = "pwe_dal_lifts_hub_first_task_a",
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
				"dal_lifts_hub_first_task",
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
		name = "pwe_dal_lifts_hub_lever_pulled_a",
		probability = 1,
		response = "pwe_dal_lifts_hub_lever_pulled_a",
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
				"dal_lifts_hub_lever_pulled_a",
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
		name = "pwe_dal_lifts_hub_lever_pulled_b",
		probability = 1,
		response = "pwe_dal_lifts_hub_lever_pulled_b",
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
				"dal_lifts_hub_lever_pulled_a",
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
		name = "pwe_dal_lifts_hub_lever_pulled_c",
		probability = 1,
		response = "pwe_dal_lifts_hub_lever_pulled_c",
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
				"dal_lifts_hub_lever_pulled_b",
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
		name = "pwe_dal_lifts_hub_lift_sighted_c",
		probability = 1,
		response = "pwe_dal_lifts_hub_lift_sighted_c",
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
				"dal_lifts_hub_lift_sighted_b",
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
		name = "pwe_dal_lifts_hub_lift_started_a",
		probability = 1,
		response = "pwe_dal_lifts_hub_lift_started_a",
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
				"dal_lifts_hub_lift_started_a",
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
		name = "pwe_dal_lifts_hub_return_final_task_complete_a",
		probability = 1,
		response = "pwe_dal_lifts_hub_return_final_task_complete_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"faction_memory",
				"flow_tasks_complete",
				OP.EQ,
				3,
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dal_lifts_hub_return_task_complete",
			},
			{
				"faction_memory",
				"dal_lifts_hub_return_final_task_complete_a",
				OP.EQ,
				0,
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
				"dal_lifts_hub_return_final_task_complete_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_lifts_hub_return_first_task_complete_a",
		probability = 1,
		response = "pwe_dal_lifts_hub_return_first_task_complete_a",
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
				1,
			},
			{
				"faction_memory",
				"dal_lifts_hub_return_first_task_complete_a",
				OP.EQ,
				0,
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
				"dal_lifts_hub_return_first_task_complete_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_lifts_hub_return_pipe_complete_a",
		probability = 1,
		response = "pwe_dal_lifts_hub_return_pipe_complete_a",
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
				"dal_lifts_hub_return_pipe_complete_a",
			},
			{
				"faction_memory",
				"flow_task_water_complete",
				OP.EQ,
				1,
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
		},
		on_done = {
			{
				"faction_memory",
				"flow_task_water_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_lifts_lift_is_moving_reminder_a",
		probability = 1,
		response = "pwe_dal_lifts_lift_is_moving_reminder_a",
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
				"dal_lifts_lift_is_moving_reminder_a",
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
		name = "pwe_dal_lifts_lift_rising_water_a",
		probability = 1,
		response = "pwe_dal_lifts_lift_rising_water_a",
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
				"dal_lifts_lift_rising_water_a",
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
		name = "pwe_dal_lifts_path_cog_cog_placed_a",
		probability = 1,
		response = "pwe_dal_lifts_path_cog_cog_placed_a",
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
				"dal_lifts_path_cog_cog_placed_a",
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
		name = "pwe_dal_lifts_path_cog_entered_a",
		probability = 1,
		response = "pwe_dal_lifts_path_cog_entered_a",
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
				"dal_lifts_path_cog_entered_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_cog_seeing_cog_a",
		probability = 1,
		response = "pwe_dal_lifts_path_cog_seeing_cog_a",
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
				"dal_lifts_path_cog_seeing_cog_a",
			},
			{
				"faction_memory",
				"dal_lifts_path_cog_seeing_cog_a",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				150,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dal_lifts_path_cog_seeing_cog_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_cog_taken_cog_a",
		probability = 1,
		response = "pwe_dal_lifts_path_cog_taken_cog_a",
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
				"dal_lifts_path_cog_taken_cog_a",
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
		name = "pwe_dal_lifts_path_pipe_entered_a",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_entered_a",
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
				"dal_lifts_path_pipe_entered_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_pipe_entered_b",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_entered_b",
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
				"dal_lifts_path_pipe_entered_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_pipe_lever_pulled_complete_a",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_lever_pulled_complete_a",
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
				"dal_lifts_path_pipe_lever_pulled_complete_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_pipe_seeing_blockage_a",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_seeing_blockage_a",
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
				"dal_lifts_path_pipe_seeing_blockage_a",
			},
			{
				"faction_memory",
				"dal_lifts_path_pipe_seeing_blockage_a",
				OP.EQ,
				0,
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
				"dal_lifts_path_pipe_seeing_blockage_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_pipe_seeing_blockage_b",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_seeing_blockage_b",
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
				"dal_lifts_path_pipe_seeing_blockage_a",
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
		name = "pwe_dal_lifts_path_pipe_seeing_lever_a",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_seeing_lever_a",
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
				"dal_lifts_path_pipe_seeing_lever_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_pipe_shutter_walk_b",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_shutter_walk_b",
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
				"nco_dal_lifts_path_pipe_shutter_walk_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_pipe_traversal_a",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_traversal_a",
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
				"dal_lifts_path_pipe_traversal_a",
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
		name = "pwe_dal_lifts_path_pipe_traversal_b",
		probability = 1,
		response = "pwe_dal_lifts_path_pipe_traversal_b",
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
				"dal_lifts_path_pipe_traversal_a",
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
		name = "pwe_dal_lifts_path_wheel_complete_a",
		probability = 1,
		response = "pwe_dal_lifts_path_wheel_complete_a",
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
				"dal_lifts_path_wheel_complete_a",
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
		name = "pwe_dal_lifts_path_wheel_complete_b",
		probability = 1,
		response = "pwe_dal_lifts_path_wheel_complete_b",
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
				"dal_lifts_path_wheel_complete_a",
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
		name = "pwe_dal_lifts_path_wheel_entered_a",
		probability = 1,
		response = "pwe_dal_lifts_path_wheel_entered_a",
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
				"dal_lifts_path_wheel_entered_a",
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
		},
	})
	define_rule({
		name = "pwe_dal_lifts_path_wheel_seeing_brake_a",
		probability = 1,
		response = "pwe_dal_lifts_path_wheel_seeing_brake_a",
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
				"dal_lifts_path_wheel_seeing_brake_a",
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
		name = "pwe_dal_lights_gate_sealed_b",
		probability = 1,
		response = "pwe_dal_lights_gate_sealed_b",
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
				"dal_lights_gate_sealed_a",
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
		name = "pwe_dal_lights_trolls_dead_complete_b",
		probability = 1,
		response = "pwe_dal_lights_trolls_dead_complete_b",
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
				"dal_lights_trolls_dead_complete_a",
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
		name = "pwe_dal_outer_approach_a",
		probability = 1,
		response = "pwe_dal_outer_approach_a",
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
				"dal_outer_approach_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
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
		name = "pwe_dal_outer_close_c",
		probability = 1,
		response = "pwe_dal_outer_close_c",
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
				"dal_outer_close_b",
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
		name = "pwe_dal_outer_troll_a",
		probability = 1,
		response = "pwe_dal_outer_troll_a",
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
				"dal_outer_troll_a",
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
		name = "pwe_dal_outer_troll_dead_complete_a",
		probability = 1,
		response = "pwe_dal_outer_troll_dead_complete_a",
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
				"dal_outer_troll_dead_complete_a",
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
		name = "pwe_dal_start_banter_d",
		probability = 1,
		response = "pwe_dal_start_banter_d",
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
				"nco_dal_start_banter_c",
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
		name = "pwe_dal_start_vista_a",
		probability = 1,
		response = "pwe_dal_start_vista_a",
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
				"dal_start_vista_a",
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
				"dal_start_vista_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dal_start_vista_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_dal_start_vista_b",
		probability = 1,
		response = "pwe_dal_start_vista_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dal_start_vista_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	add_dialogues({
		pwe_dal_finale_filth_halls_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_finale_filth_halls_a_01",
				[2] = "pwe_dal_finale_filth_halls_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_finale_filth_halls_a_01",
				[2] = "pwe_dal_finale_filth_halls_a_02",
			},
			sound_events_duration = {
				[1] = 4.0825624465942,
				[2] = 5.0356664657593,
			},
		},
		pwe_dal_finale_hall_of_heroes_leave_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pwe_dal_finale_hall_of_heroes_leave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pwe_dal_finale_hall_of_heroes_leave_a_02",
			},
			sound_events_duration = {
				[1] = 2.0593750476837,
				[2] = 2.9158959388733,
			},
		},
		pwe_dal_finale_hall_of_heroes_troll_mid_fight_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pwe_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pwe_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			sound_events_duration = {
				[1] = 4.378333568573,
				[2] = 2.5173125267029,
			},
		},
		pwe_dal_finale_hall_of_heroes_troll_slain_a = {
			category = "special_occasion_interrupt",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pwe_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pwe_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			sound_events_duration = {
				[1] = 2.9026458263397,
				[2] = 6.8708333969116,
			},
		},
		pwe_dal_finale_troll_chief_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_finale_troll_chief_b_01",
				[2] = "pwe_dal_finale_troll_chief_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_finale_troll_chief_b_01",
				[2] = "pwe_dal_finale_troll_chief_b_02",
			},
			sound_events_duration = {
				[1] = 3.0772707462311,
				[2] = 3.6714999675751,
			},
		},
		pwe_dal_lifts_hub_first_task_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_first_task_a_01",
				[2] = "pwe_dal_lifts_hub_first_task_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_first_task_a_01",
				[2] = "pwe_dal_lifts_hub_first_task_a_02",
			},
			sound_events_duration = {
				[1] = 3.5773334503174,
				[2] = 3.1755208969116,
			},
		},
		pwe_dal_lifts_hub_lever_pulled_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events_duration = {
				[1] = 2.5618124008179,
			},
		},
		pwe_dal_lifts_hub_lever_pulled_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events_duration = {
				[1] = 7.2572498321533,
			},
		},
		pwe_dal_lifts_hub_lever_pulled_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pwe_dal_lifts_hub_lever_pulled_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pwe_dal_lifts_hub_lever_pulled_c_02",
			},
			sound_events_duration = {
				[1] = 3.9399166107178,
				[2] = 6.3037710189819,
			},
		},
		pwe_dal_lifts_hub_lift_sighted_c = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pwe_dal_lifts_hub_lift_sighted_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pwe_dal_lifts_hub_lift_sighted_c_02",
			},
			sound_events_duration = {
				[1] = 4.5637292861939,
				[2] = 5.1021666526794,
			},
		},
		pwe_dal_lifts_hub_lift_started_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_lift_started_a_01",
				[2] = "pwe_dal_lifts_hub_lift_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_lift_started_a_01",
				[2] = "pwe_dal_lifts_hub_lift_started_a_02",
			},
			sound_events_duration = {
				[1] = 2.1596667766571,
				[2] = 5.8540835380554,
			},
		},
		pwe_dal_lifts_hub_return_final_task_complete_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pwe_dal_lifts_hub_return_final_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pwe_dal_lifts_hub_return_final_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.1629791259766,
				[2] = 3.9232499599457,
			},
		},
		pwe_dal_lifts_hub_return_first_task_complete_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pwe_dal_lifts_hub_return_first_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pwe_dal_lifts_hub_return_first_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.4979791641235,
				[2] = 5.6798958778381,
			},
		},
		pwe_dal_lifts_hub_return_pipe_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pwe_dal_lifts_hub_return_pipe_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pwe_dal_lifts_hub_return_pipe_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.3502707481384,
				[2] = 2.3156249523163,
			},
		},
		pwe_dal_lifts_lift_is_moving_reminder_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pwe_dal_lifts_lift_is_moving_reminder_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pwe_dal_lifts_lift_is_moving_reminder_a_02",
			},
			sound_events_duration = {
				[1] = 2.3564167022705,
				[2] = 1.5857083797455,
			},
		},
		pwe_dal_lifts_lift_rising_water_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_lift_rising_water_a_01",
				[2] = "pwe_dal_lifts_lift_rising_water_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_lift_rising_water_a_01",
				[2] = "pwe_dal_lifts_lift_rising_water_a_02",
			},
			sound_events_duration = {
				[1] = 4.4963750839233,
				[2] = 2.2967708110809,
			},
		},
		pwe_dal_lifts_path_cog_cog_placed_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pwe_dal_lifts_path_cog_cog_placed_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pwe_dal_lifts_path_cog_cog_placed_a_02",
			},
			sound_events_duration = {
				[1] = 2.2176458835602,
				[2] = 2.2237708568573,
			},
		},
		pwe_dal_lifts_path_cog_entered_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_cog_entered_a_01",
				[2] = "pwe_dal_lifts_path_cog_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_cog_entered_a_01",
				[2] = "pwe_dal_lifts_path_cog_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.3554375171661,
				[2] = 5.0526666641235,
			},
		},
		pwe_dal_lifts_path_cog_seeing_cog_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pwe_dal_lifts_path_cog_seeing_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pwe_dal_lifts_path_cog_seeing_cog_a_02",
			},
			sound_events_duration = {
				[1] = 2.7947916984558,
				[2] = 2.5880000591278,
			},
		},
		pwe_dal_lifts_path_cog_taken_cog_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pwe_dal_lifts_path_cog_taken_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pwe_dal_lifts_path_cog_taken_cog_a_02",
			},
			sound_events_duration = {
				[1] = 3.4427292346954,
				[2] = 2.0360624790192,
			},
		},
		pwe_dal_lifts_path_pipe_entered_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_entered_a_01",
				[2] = "pwe_dal_lifts_path_pipe_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_entered_a_01",
				[2] = "pwe_dal_lifts_path_pipe_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.1004583835602,
				[2] = 3.6858541965485,
			},
		},
		pwe_dal_lifts_path_pipe_entered_b = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_entered_b_01",
				[2] = "pwe_dal_lifts_path_pipe_entered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_entered_b_01",
				[2] = "pwe_dal_lifts_path_pipe_entered_b_02",
			},
			sound_events_duration = {
				[1] = 4.1324377059936,
				[2] = 3.4454374313355,
			},
		},
		pwe_dal_lifts_path_pipe_lever_pulled_complete_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pwe_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pwe_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.0488123893738,
				[2] = 3.6432499885559,
			},
		},
		pwe_dal_lifts_path_pipe_seeing_blockage_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pwe_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pwe_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			sound_events_duration = {
				[1] = 5.6282916069031,
				[2] = 4.3353958129883,
			},
		},
		pwe_dal_lifts_path_pipe_seeing_blockage_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pwe_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pwe_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			sound_events_duration = {
				[1] = 3.4804375171661,
				[2] = 4.1962914466858,
			},
		},
		pwe_dal_lifts_path_pipe_seeing_lever_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pwe_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pwe_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			sound_events_duration = {
				[1] = 2.7375416755676,
				[2] = 4.6862916946411,
			},
		},
		pwe_dal_lifts_path_pipe_shutter_walk_b = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pwe_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pwe_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			sound_events_duration = {
				[1] = 3.4896874427795,
				[2] = 3.0929374694824,
			},
		},
		pwe_dal_lifts_path_pipe_traversal_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pwe_dal_lifts_path_pipe_traversal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pwe_dal_lifts_path_pipe_traversal_a_02",
			},
			sound_events_duration = {
				[1] = 1.8787083625793,
				[2] = 2.4856457710266,
			},
		},
		pwe_dal_lifts_path_pipe_traversal_b = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pwe_dal_lifts_path_pipe_traversal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pwe_dal_lifts_path_pipe_traversal_b_02",
			},
			sound_events_duration = {
				[1] = 3.137791633606,
				[2] = 2.893354177475,
			},
		},
		pwe_dal_lifts_path_wheel_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_wheel_complete_a_01",
				[2] = "pwe_dal_lifts_path_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_wheel_complete_a_01",
				[2] = "pwe_dal_lifts_path_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.6732082366943,
				[2] = 3.1849999427795,
			},
		},
		pwe_dal_lifts_path_wheel_complete_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_wheel_complete_b_01",
				[2] = "pwe_dal_lifts_path_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_wheel_complete_b_01",
				[2] = "pwe_dal_lifts_path_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.5186250209808,
				[2] = 3.4688124656677,
			},
		},
		pwe_dal_lifts_path_wheel_entered_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_wheel_entered_a_01",
				[2] = "pwe_dal_lifts_path_wheel_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_wheel_entered_a_01",
				[2] = "pwe_dal_lifts_path_wheel_entered_a_02",
			},
			sound_events_duration = {
				[1] = 2.7897083759308,
				[2] = 2.1573541164398,
			},
		},
		pwe_dal_lifts_path_wheel_seeing_brake_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pwe_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pwe_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			sound_events_duration = {
				[1] = 5.0621252059936,
				[2] = 2.4468123912811,
			},
		},
		pwe_dal_lights_gate_sealed_b = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lights_gate_sealed_b_01",
				[2] = "pwe_dal_lights_gate_sealed_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lights_gate_sealed_b_01",
				[2] = "pwe_dal_lights_gate_sealed_b_02",
			},
			sound_events_duration = {
				[1] = 1.77108335495,
				[2] = 3.6192290782928,
			},
		},
		pwe_dal_lights_trolls_dead_complete_b = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_lights_trolls_dead_complete_b_01",
				[2] = "pwe_dal_lights_trolls_dead_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_lights_trolls_dead_complete_b_01",
				[2] = "pwe_dal_lights_trolls_dead_complete_b_02",
			},
			sound_events_duration = {
				[1] = 1.9880000352859,
				[2] = 2.1407499313355,
			},
		},
		pwe_dal_outer_approach_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_outer_approach_a_01",
				[2] = "pwe_dal_outer_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_outer_approach_a_01",
				[2] = "pwe_dal_outer_approach_a_02",
			},
			sound_events_duration = {
				[1] = 2.7635416984558,
				[2] = 8.6460418701172,
			},
		},
		pwe_dal_outer_close_c = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_dal_outer_close_c_01",
			},
			sound_events = {
				[1] = "pwe_dal_outer_close_c_01",
			},
			sound_events_duration = {
				[1] = 2.7481875419617,
			},
		},
		pwe_dal_outer_troll_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_outer_troll_a_01",
				[2] = "pwe_dal_outer_troll_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_outer_troll_a_01",
				[2] = "pwe_dal_outer_troll_a_02",
			},
			sound_events_duration = {
				[1] = 2.1468958854675,
				[2] = 2.0412082672119,
			},
		},
		pwe_dal_outer_troll_dead_complete_a = {
			category = "special_occasion_interrupt",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_outer_troll_dead_complete_a_01",
				[2] = "pwe_dal_outer_troll_dead_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_outer_troll_dead_complete_a_01",
				[2] = "pwe_dal_outer_troll_dead_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.3717291355133,
				[2] = 2.5129582881927,
			},
		},
		pwe_dal_start_banter_d = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_start_banter_d_01",
				[2] = "pwe_dal_start_banter_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_start_banter_d_01",
				[2] = "pwe_dal_start_banter_d_02",
			},
			sound_events_duration = {
				[1] = 2.809770822525,
				[2] = 4.1340832710266,
			},
		},
		pwe_dal_start_vista_a = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_start_vista_a_01",
				[2] = "pwe_dal_start_vista_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_start_vista_a_01",
				[2] = "pwe_dal_start_vista_a_02",
			},
			sound_events_duration = {
				[1] = 5.5506043434143,
				[2] = 4.4670209884644,
			},
		},
		pwe_dal_start_vista_b = {
			category = "level_talk",
			database = "wood_elf_dlc_dwarf_fest",
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
				[1] = "pwe_dal_start_vista_b_01",
				[2] = "pwe_dal_start_vista_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_dal_start_vista_b_01",
				[2] = "pwe_dal_start_vista_b_02",
			},
			sound_events_duration = {
				[1] = 4.2744793891907,
				[2] = 3.1492917537689,
			},
		},
	})
end
