-- chunkname: @dialogues/generated/empire_soldier_dlc_dwarf_fest.lua

return function ()
	define_rule({
		name = "pes_dal_finale_filth_halls_a",
		probability = 1,
		response = "pes_dal_finale_filth_halls_a",
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
				"empire_soldier",
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
		name = "pes_dal_finale_hall_of_heroes_leave_a",
		probability = 1,
		response = "pes_dal_finale_hall_of_heroes_leave_a",
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
				"empire_soldier",
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
		name = "pes_dal_finale_hall_of_heroes_leave_a_heard",
		probability = 1,
		response = "pes_dal_finale_hall_of_heroes_leave_a_heard",
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
				"empire_soldier",
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
		name = "pes_dal_finale_hall_of_heroes_troll_mid_fight_a",
		probability = 1,
		response = "pes_dal_finale_hall_of_heroes_troll_mid_fight_a",
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
				"empire_soldier",
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
		name = "pes_dal_finale_hall_of_heroes_troll_slain_a",
		probability = 1,
		response = "pes_dal_finale_hall_of_heroes_troll_slain_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_finale_troll_chief_b",
		probability = 1,
		response = "pes_dal_finale_troll_chief_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_first_task_a",
		probability = 1,
		response = "pes_dal_lifts_hub_first_task_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_lever_pulled_a",
		probability = 1,
		response = "pes_dal_lifts_hub_lever_pulled_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_lever_pulled_b",
		probability = 1,
		response = "pes_dal_lifts_hub_lever_pulled_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_lever_pulled_c",
		probability = 1,
		response = "pes_dal_lifts_hub_lever_pulled_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_lift_sighted_c",
		probability = 1,
		response = "pes_dal_lifts_hub_lift_sighted_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_lift_started_a",
		probability = 1,
		response = "pes_dal_lifts_hub_lift_started_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_hub_return_final_task_complete_a",
		probability = 1,
		response = "pes_dal_lifts_hub_return_final_task_complete_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_hub_return_first_task_complete_a",
		probability = 1,
		response = "pes_dal_lifts_hub_return_first_task_complete_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_hub_return_pipe_complete_a",
		probability = 1,
		response = "pes_dal_lifts_hub_return_pipe_complete_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_lift_is_moving_reminder_a",
		probability = 1,
		response = "pes_dal_lifts_lift_is_moving_reminder_a",
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
		name = "pes_dal_lifts_lift_rising_water_a",
		probability = 1,
		response = "pes_dal_lifts_lift_rising_water_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_cog_cog_placed_a",
		probability = 1,
		response = "pes_dal_lifts_path_cog_cog_placed_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_cog_entered_a",
		probability = 1,
		response = "pes_dal_lifts_path_cog_entered_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_cog_seeing_cog_a",
		probability = 1,
		response = "pes_dal_lifts_path_cog_seeing_cog_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_cog_taken_cog_a",
		probability = 1,
		response = "pes_dal_lifts_path_cog_taken_cog_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_pipe_entered_a",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_entered_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_pipe_entered_b",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_entered_b",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_pipe_lever_pulled_complete_a",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_lever_pulled_complete_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_pipe_seeing_blockage_a",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_seeing_blockage_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_pipe_seeing_blockage_b",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_seeing_blockage_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_pipe_seeing_lever_a",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_seeing_lever_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_pipe_shutter_walk_b",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_shutter_walk_b",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_pipe_traversal_a",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_traversal_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_pipe_traversal_b",
		probability = 1,
		response = "pes_dal_lifts_path_pipe_traversal_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_wheel_complete_a",
		probability = 1,
		response = "pes_dal_lifts_path_wheel_complete_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_wheel_complete_b",
		probability = 1,
		response = "pes_dal_lifts_path_wheel_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lifts_path_wheel_entered_a",
		probability = 1,
		response = "pes_dal_lifts_path_wheel_entered_a",
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
				"empire_soldier",
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
		name = "pes_dal_lifts_path_wheel_seeing_brake_a",
		probability = 1,
		response = "pes_dal_lifts_path_wheel_seeing_brake_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lights_gate_sealed_b",
		probability = 1,
		response = "pes_dal_lights_gate_sealed_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_lights_trolls_dead_complete_b",
		probability = 1,
		response = "pes_dal_lights_trolls_dead_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_outer_approach_a",
		probability = 1,
		response = "pes_dal_outer_approach_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_outer_close_c",
		probability = 1,
		response = "pes_dal_outer_close_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_outer_troll_a",
		probability = 1,
		response = "pes_dal_outer_troll_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_outer_troll_dead_complete_a",
		probability = 1,
		response = "pes_dal_outer_troll_dead_complete_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_start_banter_d",
		probability = 1,
		response = "pes_dal_start_banter_d",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dal_start_vista_a",
		probability = 1,
		response = "pes_dal_start_vista_a",
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
				"empire_soldier",
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
		name = "pes_dal_start_vista_b",
		probability = 1,
		response = "pes_dal_start_vista_b",
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
				"empire_soldier",
			},
		},
	})
	add_dialogues({
		pes_dal_finale_filth_halls_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_finale_filth_halls_a_01",
				[2] = "pes_dal_finale_filth_halls_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_finale_filth_halls_a_01",
				[2] = "pes_dal_finale_filth_halls_a_02",
			},
			sound_events_duration = {
				[1] = 3.400333404541,
				[2] = 3.3136250972748,
			},
		},
		pes_dal_finale_hall_of_heroes_leave_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_leave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_leave_a_02",
			},
			sound_events_duration = {
				[1] = 2.7378332614899,
				[2] = 4.9137501716614,
			},
		},
		pes_dal_finale_hall_of_heroes_leave_a_heard = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_leave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_leave_a_02",
			},
			sound_events_duration = {
				[1] = 2.7378332614899,
				[2] = 4.9137501716614,
			},
		},
		pes_dal_finale_hall_of_heroes_troll_mid_fight_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			sound_events_duration = {
				[1] = 2.9058332443237,
				[2] = 2.9975624084473,
			},
		},
		pes_dal_finale_hall_of_heroes_troll_slain_a = {
			category = "special_occasion_interrupt",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pes_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			sound_events_duration = {
				[1] = 3.7818541526794,
				[2] = 4.8332290649414,
			},
		},
		pes_dal_finale_troll_chief_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_finale_troll_chief_b_01",
				[2] = "pes_dal_finale_troll_chief_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_finale_troll_chief_b_01",
				[2] = "pes_dal_finale_troll_chief_b_02",
			},
			sound_events_duration = {
				[1] = 1.7028541564941,
				[2] = 2.6029584407806,
			},
		},
		pes_dal_lifts_hub_first_task_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_first_task_a_01",
				[2] = "pes_dal_lifts_hub_first_task_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_first_task_a_01",
				[2] = "pes_dal_lifts_hub_first_task_a_02",
			},
			sound_events_duration = {
				[1] = 1.564333319664,
				[2] = 4.4146251678467,
			},
		},
		pes_dal_lifts_hub_lever_pulled_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
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
				[1] = "pes_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events = {
				[1] = "pes_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events_duration = {
				[1] = 4.0083541870117,
			},
		},
		pes_dal_lifts_hub_lever_pulled_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
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
				[1] = "pes_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events = {
				[1] = "pes_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events_duration = {
				[1] = 6.9241042137146,
			},
		},
		pes_dal_lifts_hub_lever_pulled_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pes_dal_lifts_hub_lever_pulled_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pes_dal_lifts_hub_lever_pulled_c_02",
			},
			sound_events_duration = {
				[1] = 2.2276248931885,
				[2] = 4.6354999542236,
			},
		},
		pes_dal_lifts_hub_lift_sighted_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pes_dal_lifts_hub_lift_sighted_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pes_dal_lifts_hub_lift_sighted_c_02",
			},
			sound_events_duration = {
				[1] = 3.136020898819,
				[2] = 1.7677500247955,
			},
		},
		pes_dal_lifts_hub_lift_started_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_lift_started_a_01",
				[2] = "pes_dal_lifts_hub_lift_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_lift_started_a_01",
				[2] = "pes_dal_lifts_hub_lift_started_a_02",
			},
			sound_events_duration = {
				[1] = 1.5777916908264,
				[2] = 3.3617498874664,
			},
		},
		pes_dal_lifts_hub_return_final_task_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pes_dal_lifts_hub_return_final_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pes_dal_lifts_hub_return_final_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.477520942688,
				[2] = 3.3222916126251,
			},
		},
		pes_dal_lifts_hub_return_first_task_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pes_dal_lifts_hub_return_first_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pes_dal_lifts_hub_return_first_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.5872707366943,
				[2] = 2.4492499828339,
			},
		},
		pes_dal_lifts_hub_return_pipe_complete_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pes_dal_lifts_hub_return_pipe_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pes_dal_lifts_hub_return_pipe_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.0741250514984,
				[2] = 2.6751248836517,
			},
		},
		pes_dal_lifts_lift_is_moving_reminder_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pes_dal_lifts_lift_is_moving_reminder_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pes_dal_lifts_lift_is_moving_reminder_a_02",
			},
			sound_events_duration = {
				[1] = 3.1361041069031,
				[2] = 1.9708541631699,
			},
		},
		pes_dal_lifts_lift_rising_water_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_lift_rising_water_a_01",
				[2] = "pes_dal_lifts_lift_rising_water_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_lift_rising_water_a_01",
				[2] = "pes_dal_lifts_lift_rising_water_a_02",
			},
			sound_events_duration = {
				[1] = 2.3034584522247,
				[2] = 3.2195625305176,
			},
		},
		pes_dal_lifts_path_cog_cog_placed_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pes_dal_lifts_path_cog_cog_placed_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pes_dal_lifts_path_cog_cog_placed_a_02",
			},
			sound_events_duration = {
				[1] = 1.1041250228882,
				[2] = 1.1986458301544,
			},
		},
		pes_dal_lifts_path_cog_entered_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_cog_entered_a_01",
				[2] = "pes_dal_lifts_path_cog_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_cog_entered_a_01",
				[2] = "pes_dal_lifts_path_cog_entered_a_02",
			},
			sound_events_duration = {
				[1] = 2.2107915878296,
				[2] = 6.650812625885,
			},
		},
		pes_dal_lifts_path_cog_seeing_cog_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pes_dal_lifts_path_cog_seeing_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pes_dal_lifts_path_cog_seeing_cog_a_02",
			},
			sound_events_duration = {
				[1] = 3.5248959064484,
				[2] = 3.7672500610352,
			},
		},
		pes_dal_lifts_path_cog_taken_cog_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pes_dal_lifts_path_cog_taken_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pes_dal_lifts_path_cog_taken_cog_a_02",
			},
			sound_events_duration = {
				[1] = 2.2580416202545,
				[2] = 3.3436250686645,
			},
		},
		pes_dal_lifts_path_pipe_entered_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_entered_a_01",
				[2] = "pes_dal_lifts_path_pipe_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_entered_a_01",
				[2] = "pes_dal_lifts_path_pipe_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.3696665763855,
				[2] = 4.2702083587647,
			},
		},
		pes_dal_lifts_path_pipe_entered_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_entered_b_01",
				[2] = "pes_dal_lifts_path_pipe_entered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_entered_b_01",
				[2] = "pes_dal_lifts_path_pipe_entered_b_02",
			},
			sound_events_duration = {
				[1] = 0.9668750166893,
				[2] = 3.4421665668488,
			},
		},
		pes_dal_lifts_path_pipe_lever_pulled_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pes_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pes_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.3744792938232,
				[2] = 5.4376039505005,
			},
		},
		pes_dal_lifts_path_pipe_seeing_blockage_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pes_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pes_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			sound_events_duration = {
				[1] = 2.8970415592194,
				[2] = 3.1989583969116,
			},
		},
		pes_dal_lifts_path_pipe_seeing_blockage_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pes_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pes_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			sound_events_duration = {
				[1] = 1.4515625238419,
				[2] = 4.7168750762939,
			},
		},
		pes_dal_lifts_path_pipe_seeing_lever_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pes_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pes_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			sound_events_duration = {
				[1] = 3.2626667022705,
				[2] = 3.5053334236145,
			},
		},
		pes_dal_lifts_path_pipe_shutter_walk_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pes_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pes_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			sound_events_duration = {
				[1] = 6.2122707366943,
				[2] = 3.9230000972748,
			},
		},
		pes_dal_lifts_path_pipe_traversal_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pes_dal_lifts_path_pipe_traversal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pes_dal_lifts_path_pipe_traversal_a_02",
			},
			sound_events_duration = {
				[1] = 2.4949584007263,
				[2] = 2.9391667842865,
			},
		},
		pes_dal_lifts_path_pipe_traversal_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pes_dal_lifts_path_pipe_traversal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pes_dal_lifts_path_pipe_traversal_b_02",
			},
			sound_events_duration = {
				[1] = 2.9069166183472,
				[2] = 2.8414375782013,
			},
		},
		pes_dal_lifts_path_wheel_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_wheel_complete_a_01",
				[2] = "pes_dal_lifts_path_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_wheel_complete_a_01",
				[2] = "pes_dal_lifts_path_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.9446666240692,
				[2] = 2.3656041622162,
			},
		},
		pes_dal_lifts_path_wheel_complete_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_wheel_complete_b_01",
				[2] = "pes_dal_lifts_path_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_wheel_complete_b_01",
				[2] = "pes_dal_lifts_path_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.7033751010895,
				[2] = 2.3896040916443,
			},
		},
		pes_dal_lifts_path_wheel_entered_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_wheel_entered_a_01",
				[2] = "pes_dal_lifts_path_wheel_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_wheel_entered_a_01",
				[2] = "pes_dal_lifts_path_wheel_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.4823958873749,
				[2] = 2.5775415897369,
			},
		},
		pes_dal_lifts_path_wheel_seeing_brake_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pes_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pes_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			sound_events_duration = {
				[1] = 2.8439791202545,
				[2] = 2.8557915687561,
			},
		},
		pes_dal_lights_gate_sealed_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lights_gate_sealed_b_01",
				[2] = "pes_dal_lights_gate_sealed_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lights_gate_sealed_b_01",
				[2] = "pes_dal_lights_gate_sealed_b_02",
			},
			sound_events_duration = {
				[1] = 2.4763541221619,
				[2] = 1.6753333806992,
			},
		},
		pes_dal_lights_trolls_dead_complete_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_lights_trolls_dead_complete_b_01",
				[2] = "pes_dal_lights_trolls_dead_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_lights_trolls_dead_complete_b_01",
				[2] = "pes_dal_lights_trolls_dead_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.443437576294,
				[2] = 4.4910206794739,
			},
		},
		pes_dal_outer_approach_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_outer_approach_a_01",
				[2] = "pes_dal_outer_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_outer_approach_a_01",
				[2] = "pes_dal_outer_approach_a_02",
			},
			sound_events_duration = {
				[1] = 3.8058125972748,
				[2] = 5.2505626678467,
			},
		},
		pes_dal_outer_close_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
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
				[1] = "pes_dal_outer_close_c_01",
			},
			sound_events = {
				[1] = "pes_dal_outer_close_c_01",
			},
			sound_events_duration = {
				[1] = 2.6926040649414,
			},
		},
		pes_dal_outer_troll_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_outer_troll_a_01",
				[2] = "pes_dal_outer_troll_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_outer_troll_a_01",
				[2] = "pes_dal_outer_troll_a_02",
			},
			sound_events_duration = {
				[1] = 2.7513542175293,
				[2] = 2.4272708892822,
			},
		},
		pes_dal_outer_troll_dead_complete_a = {
			category = "special_occasion_interrupt",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_outer_troll_dead_complete_a_01",
				[2] = "pes_dal_outer_troll_dead_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_outer_troll_dead_complete_a_01",
				[2] = "pes_dal_outer_troll_dead_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.1675624847412,
				[2] = 3.8513333797455,
			},
		},
		pes_dal_start_banter_d = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_start_banter_d_01",
				[2] = "pes_dal_start_banter_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_start_banter_d_01",
				[2] = "pes_dal_start_banter_d_02",
			},
			sound_events_duration = {
				[1] = 4.2736668586731,
				[2] = 3.2506041526794,
			},
		},
		pes_dal_start_vista_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_start_vista_a_01",
				[2] = "pes_dal_start_vista_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_start_vista_a_01",
				[2] = "pes_dal_start_vista_a_02",
			},
			sound_events_duration = {
				[1] = 3.4905624389648,
				[2] = 2.5856873989105,
			},
		},
		pes_dal_start_vista_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_dal_start_vista_b_01",
				[2] = "pes_dal_start_vista_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dal_start_vista_b_01",
				[2] = "pes_dal_start_vista_b_02",
			},
			sound_events_duration = {
				[1] = 3.6889998912811,
				[2] = 3.8760623931885,
			},
		},
	})
end
