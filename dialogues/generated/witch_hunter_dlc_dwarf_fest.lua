-- chunkname: @dialogues/generated/witch_hunter_dlc_dwarf_fest.lua

return function ()
	define_rule({
		name = "pwh_dal_finale_filth_halls_a",
		probability = 1,
		response = "pwh_dal_finale_filth_halls_a",
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
				"witch_hunter",
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
		name = "pwh_dal_finale_hall_of_heroes_leave_a",
		probability = 1,
		response = "pwh_dal_finale_hall_of_heroes_leave_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"dal_finale_hall_of_heroes_leave_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"dal_finale_hall_of_heroes_leave_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dal_finale_hall_of_heroes_leave_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_dal_finale_hall_of_heroes_leave_a_heard",
		probability = 1,
		response = "pwh_dal_finale_hall_of_heroes_leave_a_heard",
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
				"npcr1_dal_finale_hall_of_heroes_troll_slain_c",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"dal_finale_hall_of_heroes_leave_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dal_finale_hall_of_heroes_leave_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_dal_finale_hall_of_heroes_troll_mid_fight_a",
		probability = 1,
		response = "pwh_dal_finale_hall_of_heroes_troll_mid_fight_a",
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
				"witch_hunter",
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
		name = "pwh_dal_finale_hall_of_heroes_troll_slain_a",
		probability = 1,
		response = "pwh_dal_finale_hall_of_heroes_troll_slain_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_finale_troll_chief_b",
		probability = 1,
		response = "pwh_dal_finale_troll_chief_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_first_task_a",
		probability = 1,
		response = "pwh_dal_lifts_hub_first_task_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_lever_pulled_a",
		probability = 1,
		response = "pwh_dal_lifts_hub_lever_pulled_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_lever_pulled_b",
		probability = 1,
		response = "pwh_dal_lifts_hub_lever_pulled_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_lever_pulled_c",
		probability = 1,
		response = "pwh_dal_lifts_hub_lever_pulled_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_lift_sighted_c",
		probability = 1,
		response = "pwh_dal_lifts_hub_lift_sighted_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_lift_started_a",
		probability = 1,
		response = "pwh_dal_lifts_hub_lift_started_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_hub_return_final_task_complete_a",
		probability = 1,
		response = "pwh_dal_lifts_hub_return_final_task_complete_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_hub_return_first_task_complete_a",
		probability = 1,
		response = "pwh_dal_lifts_hub_return_first_task_complete_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_hub_return_pipe_complete_a",
		probability = 1,
		response = "pwh_dal_lifts_hub_return_pipe_complete_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_lift_is_moving_reminder_a",
		probability = 1,
		response = "pwh_dal_lifts_lift_is_moving_reminder_a",
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
		name = "pwh_dal_lifts_lift_rising_water_a",
		probability = 1,
		response = "pwh_dal_lifts_lift_rising_water_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_cog_cog_placed_a",
		probability = 1,
		response = "pwh_dal_lifts_path_cog_cog_placed_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_cog_entered_a",
		probability = 1,
		response = "pwh_dal_lifts_path_cog_entered_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_cog_seeing_cog_a",
		probability = 1,
		response = "pwh_dal_lifts_path_cog_seeing_cog_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_cog_taken_cog_a",
		probability = 1,
		response = "pwh_dal_lifts_path_cog_taken_cog_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_pipe_entered_a",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_entered_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_pipe_entered_b",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_entered_b",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_pipe_lever_pulled_complete_a",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_lever_pulled_complete_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_pipe_seeing_blockage_a",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_seeing_blockage_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_pipe_seeing_blockage_b",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_seeing_blockage_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_pipe_seeing_lever_a",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_seeing_lever_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_pipe_shutter_walk_b",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_shutter_walk_b",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_pipe_traversal_a",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_traversal_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_pipe_traversal_b",
		probability = 1,
		response = "pwh_dal_lifts_path_pipe_traversal_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_wheel_complete_a",
		probability = 1,
		response = "pwh_dal_lifts_path_wheel_complete_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_wheel_complete_b",
		probability = 1,
		response = "pwh_dal_lifts_path_wheel_complete_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lifts_path_wheel_entered_a",
		probability = 1,
		response = "pwh_dal_lifts_path_wheel_entered_a",
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
				"witch_hunter",
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
		name = "pwh_dal_lifts_path_wheel_seeing_brake_a",
		probability = 1,
		response = "pwh_dal_lifts_path_wheel_seeing_brake_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lights_gate_sealed_b",
		probability = 1,
		response = "pwh_dal_lights_gate_sealed_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_lights_trolls_dead_complete_b",
		probability = 1,
		response = "pwh_dal_lights_trolls_dead_complete_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_outer_approach_a",
		probability = 1,
		response = "pwh_dal_outer_approach_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_outer_close_c",
		probability = 1,
		response = "pwh_dal_outer_close_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_outer_troll_a",
		probability = 1,
		response = "pwh_dal_outer_troll_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_outer_troll_dead_complete_a",
		probability = 1,
		response = "pwh_dal_outer_troll_dead_complete_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_start_banter_d",
		probability = 1,
		response = "pwh_dal_start_banter_d",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_dal_start_vista_a",
		probability = 1,
		response = "pwh_dal_start_vista_a",
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
				"witch_hunter",
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
		name = "pwh_dal_start_vista_b",
		probability = 1,
		response = "pwh_dal_start_vista_b",
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
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		pwh_dal_finale_filth_halls_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_finale_filth_halls_a_01",
				[2] = "pwh_dal_finale_filth_halls_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_finale_filth_halls_a_01",
				[2] = "pwh_dal_finale_filth_halls_a_02",
			},
			sound_events_duration = {
				[1] = 3.7170207500458,
				[2] = 5.5929374694824,
			},
		},
		pwh_dal_finale_hall_of_heroes_leave_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_leave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_leave_a_02",
			},
			sound_events_duration = {
				[1] = 3.9219791889191,
				[2] = 3.5380625724792,
			},
		},
		pwh_dal_finale_hall_of_heroes_leave_a_heard = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_leave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_leave_a_02",
			},
			sound_events_duration = {
				[1] = 3.9219791889191,
				[2] = 3.5380625724792,
			},
		},
		pwh_dal_finale_hall_of_heroes_troll_mid_fight_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			sound_events_duration = {
				[1] = 1.8238749504089,
				[2] = 3.8131248950958,
			},
		},
		pwh_dal_finale_hall_of_heroes_troll_slain_a = {
			category = "special_occasion_interrupt",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pwh_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			sound_events_duration = {
				[1] = 5.3501873016357,
				[2] = 5.7053956985474,
			},
		},
		pwh_dal_finale_troll_chief_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_finale_troll_chief_b_01",
				[2] = "pwh_dal_finale_troll_chief_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_finale_troll_chief_b_01",
				[2] = "pwh_dal_finale_troll_chief_b_02",
			},
			sound_events_duration = {
				[1] = 2.5343332290649,
				[2] = 3.8460624217987,
			},
		},
		pwh_dal_lifts_hub_first_task_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_first_task_a_01",
				[2] = "pwh_dal_lifts_hub_first_task_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_first_task_a_01",
				[2] = "pwh_dal_lifts_hub_first_task_a_02",
			},
			sound_events_duration = {
				[1] = 3.8887915611267,
				[2] = 3.1155834197998,
			},
		},
		pwh_dal_lifts_hub_lever_pulled_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events_duration = {
				[1] = 2.2236666679382,
			},
		},
		pwh_dal_lifts_hub_lever_pulled_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events_duration = {
				[1] = 7.9093751907349,
			},
		},
		pwh_dal_lifts_hub_lever_pulled_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pwh_dal_lifts_hub_lever_pulled_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pwh_dal_lifts_hub_lever_pulled_c_02",
			},
			sound_events_duration = {
				[1] = 4.0381460189819,
				[2] = 3.9705834388733,
			},
		},
		pwh_dal_lifts_hub_lift_sighted_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pwh_dal_lifts_hub_lift_sighted_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pwh_dal_lifts_hub_lift_sighted_c_02",
			},
			sound_events_duration = {
				[1] = 3.0083541870117,
				[2] = 3.2716040611267,
			},
		},
		pwh_dal_lifts_hub_lift_started_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_lift_started_a_01",
				[2] = "pwh_dal_lifts_hub_lift_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_lift_started_a_01",
				[2] = "pwh_dal_lifts_hub_lift_started_a_02",
			},
			sound_events_duration = {
				[1] = 2.8242707252502,
				[2] = 4.3829793930054,
			},
		},
		pwh_dal_lifts_hub_return_final_task_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pwh_dal_lifts_hub_return_final_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pwh_dal_lifts_hub_return_final_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.6252708435059,
				[2] = 3.9433958530426,
			},
		},
		pwh_dal_lifts_hub_return_first_task_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pwh_dal_lifts_hub_return_first_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pwh_dal_lifts_hub_return_first_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.9029166698456,
				[2] = 3.2616875171661,
			},
		},
		pwh_dal_lifts_hub_return_pipe_complete_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pwh_dal_lifts_hub_return_pipe_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pwh_dal_lifts_hub_return_pipe_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.9233748912811,
				[2] = 4.1381249427795,
			},
		},
		pwh_dal_lifts_lift_is_moving_reminder_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pwh_dal_lifts_lift_is_moving_reminder_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pwh_dal_lifts_lift_is_moving_reminder_a_02",
			},
			sound_events_duration = {
				[1] = 2.9974167346954,
				[2] = 2.2622082233429,
			},
		},
		pwh_dal_lifts_lift_rising_water_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_lift_rising_water_a_01",
				[2] = "pwh_dal_lifts_lift_rising_water_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_lift_rising_water_a_01",
				[2] = "pwh_dal_lifts_lift_rising_water_a_02",
			},
			sound_events_duration = {
				[1] = 4.2190623283386,
				[2] = 4.65860414505,
			},
		},
		pwh_dal_lifts_path_cog_cog_placed_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pwh_dal_lifts_path_cog_cog_placed_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pwh_dal_lifts_path_cog_cog_placed_a_02",
			},
			sound_events_duration = {
				[1] = 2.5429167747498,
				[2] = 2.8209583759308,
			},
		},
		pwh_dal_lifts_path_cog_entered_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_cog_entered_a_01",
				[2] = "pwh_dal_lifts_path_cog_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_cog_entered_a_01",
				[2] = "pwh_dal_lifts_path_cog_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.4352083206177,
				[2] = 3.4562082290649,
			},
		},
		pwh_dal_lifts_path_cog_seeing_cog_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pwh_dal_lifts_path_cog_seeing_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pwh_dal_lifts_path_cog_seeing_cog_a_02",
			},
			sound_events_duration = {
				[1] = 3.4728751182556,
				[2] = 4.057541847229,
			},
		},
		pwh_dal_lifts_path_cog_taken_cog_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pwh_dal_lifts_path_cog_taken_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pwh_dal_lifts_path_cog_taken_cog_a_02",
			},
			sound_events_duration = {
				[1] = 2.6535832881927,
				[2] = 2.9014792442322,
			},
		},
		pwh_dal_lifts_path_pipe_entered_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_entered_a_01",
				[2] = "pwh_dal_lifts_path_pipe_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_entered_a_01",
				[2] = "pwh_dal_lifts_path_pipe_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.9473750591278,
				[2] = 3.033979177475,
			},
		},
		pwh_dal_lifts_path_pipe_entered_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_entered_b_01",
				[2] = "pwh_dal_lifts_path_pipe_entered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_entered_b_01",
				[2] = "pwh_dal_lifts_path_pipe_entered_b_02",
			},
			sound_events_duration = {
				[1] = 3.2570209503174,
				[2] = 1.6308958530426,
			},
		},
		pwh_dal_lifts_path_pipe_lever_pulled_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pwh_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pwh_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.390145778656,
				[2] = 2.9324374198914,
			},
		},
		pwh_dal_lifts_path_pipe_seeing_blockage_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pwh_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pwh_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			sound_events_duration = {
				[1] = 3.4510416984558,
				[2] = 5.3846874237061,
			},
		},
		pwh_dal_lifts_path_pipe_seeing_blockage_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pwh_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pwh_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			sound_events_duration = {
				[1] = 5.4664373397827,
				[2] = 3.7797291278839,
			},
		},
		pwh_dal_lifts_path_pipe_seeing_lever_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pwh_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pwh_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			sound_events_duration = {
				[1] = 4.4934372901917,
				[2] = 2.6000208854675,
			},
		},
		pwh_dal_lifts_path_pipe_shutter_walk_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pwh_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pwh_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			sound_events_duration = {
				[1] = 3.2356040477753,
				[2] = 2.9303750991821,
			},
		},
		pwh_dal_lifts_path_pipe_traversal_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pwh_dal_lifts_path_pipe_traversal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pwh_dal_lifts_path_pipe_traversal_a_02",
			},
			sound_events_duration = {
				[1] = 1.8781249523163,
				[2] = 3.788229227066,
			},
		},
		pwh_dal_lifts_path_pipe_traversal_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pwh_dal_lifts_path_pipe_traversal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pwh_dal_lifts_path_pipe_traversal_b_02",
			},
			sound_events_duration = {
				[1] = 2.4113125801086,
				[2] = 2.1792707443237,
			},
		},
		pwh_dal_lifts_path_wheel_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_wheel_complete_a_01",
				[2] = "pwh_dal_lifts_path_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_wheel_complete_a_01",
				[2] = "pwh_dal_lifts_path_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 6.0928335189819,
				[2] = 5.4945831298828,
			},
		},
		pwh_dal_lifts_path_wheel_complete_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_wheel_complete_b_01",
				[2] = "pwh_dal_lifts_path_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_wheel_complete_b_01",
				[2] = "pwh_dal_lifts_path_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 4.1097083091736,
				[2] = 3.1066875457764,
			},
		},
		pwh_dal_lifts_path_wheel_entered_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_wheel_entered_a_01",
				[2] = "pwh_dal_lifts_path_wheel_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_wheel_entered_a_01",
				[2] = "pwh_dal_lifts_path_wheel_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.4469375610352,
				[2] = 4.4783334732056,
			},
		},
		pwh_dal_lifts_path_wheel_seeing_brake_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pwh_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pwh_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			sound_events_duration = {
				[1] = 4.2580623626709,
				[2] = 4.6502289772034,
			},
		},
		pwh_dal_lights_gate_sealed_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lights_gate_sealed_b_01",
				[2] = "pwh_dal_lights_gate_sealed_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lights_gate_sealed_b_01",
				[2] = "pwh_dal_lights_gate_sealed_b_02",
			},
			sound_events_duration = {
				[1] = 3.3877084255219,
				[2] = 2.8401458263397,
			},
		},
		pwh_dal_lights_trolls_dead_complete_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_lights_trolls_dead_complete_b_01",
				[2] = "pwh_dal_lights_trolls_dead_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_lights_trolls_dead_complete_b_01",
				[2] = "pwh_dal_lights_trolls_dead_complete_b_02",
			},
			sound_events_duration = {
				[1] = 5.7618751525879,
				[2] = 4.0651459693909,
			},
		},
		pwh_dal_outer_approach_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_outer_approach_a_01",
				[2] = "pwh_dal_outer_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_outer_approach_a_01",
				[2] = "pwh_dal_outer_approach_a_02",
			},
			sound_events_duration = {
				[1] = 5.3254375457764,
				[2] = 5.9556250572205,
			},
		},
		pwh_dal_outer_close_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_outer_close_c_01",
			},
			sound_events = {
				[1] = "pwh_dal_outer_close_c_01",
			},
			sound_events_duration = {
				[1] = 3.3459792137146,
			},
		},
		pwh_dal_outer_troll_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_outer_troll_a_01",
				[2] = "pwh_dal_outer_troll_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_outer_troll_a_01",
				[2] = "pwh_dal_outer_troll_a_02",
			},
			sound_events_duration = {
				[1] = 2.7459790706634,
				[2] = 3.0645208358765,
			},
		},
		pwh_dal_outer_troll_dead_complete_a = {
			category = "special_occasion_interrupt",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_outer_troll_dead_complete_a_01",
				[2] = "pwh_dal_outer_troll_dead_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_outer_troll_dead_complete_a_01",
				[2] = "pwh_dal_outer_troll_dead_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.1723959445953,
				[2] = 5.6528749465942,
			},
		},
		pwh_dal_start_banter_d = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_start_banter_d_01",
				[2] = "pwh_dal_start_banter_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_start_banter_d_01",
				[2] = "pwh_dal_start_banter_d_02",
			},
			sound_events_duration = {
				[1] = 6.2471251487732,
				[2] = 5.8653125762939,
			},
		},
		pwh_dal_start_vista_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_start_vista_a_01",
				[2] = "pwh_dal_start_vista_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_start_vista_a_01",
				[2] = "pwh_dal_start_vista_a_02",
			},
			sound_events_duration = {
				[1] = 5.2442293167114,
				[2] = 6.6463332176208,
			},
		},
		pwh_dal_start_vista_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_dwarf_fest",
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
				[1] = "pwh_dal_start_vista_b_01",
				[2] = "pwh_dal_start_vista_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_dal_start_vista_b_01",
				[2] = "pwh_dal_start_vista_b_02",
			},
			sound_events_duration = {
				[1] = 6.4846043586731,
				[2] = 6.1101040840149,
			},
		},
	})
end
