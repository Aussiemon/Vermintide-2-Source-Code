-- chunkname: @dialogues/generated/dwarf_ranger_dlc_dwarf_fest.lua

return function ()
	define_rule({
		name = "pdr_dal_finale_filth_halls_a",
		probability = 1,
		response = "pdr_dal_finale_filth_halls_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_finale_hall_of_heroes_leave_a",
		probability = 1,
		response = "pdr_dal_finale_hall_of_heroes_leave_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_finale_hall_of_heroes_troll_mid_fight_a",
		probability = 1,
		response = "pdr_dal_finale_hall_of_heroes_troll_mid_fight_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_finale_hall_of_heroes_troll_slain_a",
		probability = 1,
		response = "pdr_dal_finale_hall_of_heroes_troll_slain_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_finale_troll_chief_b",
		probability = 1,
		response = "pdr_dal_finale_troll_chief_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_first_task_a",
		probability = 1,
		response = "pdr_dal_lifts_hub_first_task_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_lever_pulled_a",
		probability = 1,
		response = "pdr_dal_lifts_hub_lever_pulled_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_lever_pulled_b",
		probability = 1,
		response = "pdr_dal_lifts_hub_lever_pulled_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_lever_pulled_c",
		probability = 1,
		response = "pdr_dal_lifts_hub_lever_pulled_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_lift_sighted_c",
		probability = 1,
		response = "pdr_dal_lifts_hub_lift_sighted_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_lift_started_a",
		probability = 1,
		response = "pdr_dal_lifts_hub_lift_started_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_hub_return_final_task_complete_a",
		probability = 1,
		response = "pdr_dal_lifts_hub_return_final_task_complete_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_hub_return_first_task_complete_a",
		probability = 1,
		response = "pdr_dal_lifts_hub_return_first_task_complete_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_hub_return_pipe_complete_a",
		probability = 1,
		response = "pdr_dal_lifts_hub_return_pipe_complete_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_lift_is_moving_reminder_a",
		probability = 1,
		response = "pdr_dal_lifts_lift_is_moving_reminder_a",
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
		name = "pdr_dal_lifts_lift_rising_water_a",
		probability = 1,
		response = "pdr_dal_lifts_lift_rising_water_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_cog_cog_placed_a",
		probability = 1,
		response = "pdr_dal_lifts_path_cog_cog_placed_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_cog_entered_a",
		probability = 1,
		response = "pdr_dal_lifts_path_cog_entered_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_cog_seeing_cog_a",
		probability = 1,
		response = "pdr_dal_lifts_path_cog_seeing_cog_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_cog_taken_cog_a",
		probability = 1,
		response = "pdr_dal_lifts_path_cog_taken_cog_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_pipe_entered_a",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_entered_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_pipe_entered_b",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_entered_b",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_pipe_lever_pulled_complete_a",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_lever_pulled_complete_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_pipe_seeing_blockage_a",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_seeing_blockage_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_pipe_seeing_blockage_b",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_seeing_blockage_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_pipe_seeing_lever_a",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_seeing_lever_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_pipe_shutter_walk_b",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_shutter_walk_b",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_pipe_traversal_a",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_traversal_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_pipe_traversal_b",
		probability = 1,
		response = "pdr_dal_lifts_path_pipe_traversal_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_wheel_complete_a",
		probability = 1,
		response = "pdr_dal_lifts_path_wheel_complete_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_wheel_complete_b",
		probability = 1,
		response = "pdr_dal_lifts_path_wheel_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lifts_path_wheel_entered_a",
		probability = 1,
		response = "pdr_dal_lifts_path_wheel_entered_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_lifts_path_wheel_seeing_brake_a",
		probability = 1,
		response = "pdr_dal_lifts_path_wheel_seeing_brake_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lights_gate_sealed_b",
		probability = 1,
		response = "pdr_dal_lights_gate_sealed_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_lights_trolls_dead_complete_b",
		probability = 1,
		response = "pdr_dal_lights_trolls_dead_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_outer_approach_b",
		probability = 1,
		response = "pdr_dal_outer_approach_b",
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
				"user_context",
				"enemies_close",
				OP.LT,
				5,
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
		name = "pdr_dal_outer_close_c",
		probability = 1,
		response = "pdr_dal_outer_close_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_outer_troll_a",
		probability = 1,
		response = "pdr_dal_outer_troll_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_outer_troll_dead_complete_a",
		probability = 1,
		response = "pdr_dal_outer_troll_dead_complete_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_start_banter_d",
		probability = 1,
		response = "pdr_dal_start_banter_d",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_dal_start_vista_a",
		probability = 1,
		response = "pdr_dal_start_vista_a",
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
				"dwarf_ranger",
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
		name = "pdr_dal_start_vista_b",
		probability = 1,
		response = "pdr_dal_start_vista_b",
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
				"dwarf_ranger",
			},
		},
	})
	add_dialogues({
		pdr_dal_finale_filth_halls_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_finale_filth_halls_a_01",
				[2] = "pdr_dal_finale_filth_halls_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_finale_filth_halls_a_01",
				[2] = "pdr_dal_finale_filth_halls_a_02",
			},
			sound_events_duration = {
				[1] = 4.1947708129883,
				[2] = 3.8539373874664,
			},
		},
		pdr_dal_finale_hall_of_heroes_leave_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pdr_dal_finale_hall_of_heroes_leave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_finale_hall_of_heroes_leave_a_01",
				[2] = "pdr_dal_finale_hall_of_heroes_leave_a_02",
			},
			sound_events_duration = {
				[1] = 3.5018334388733,
				[2] = 4.7020831108093,
			},
		},
		pdr_dal_finale_hall_of_heroes_troll_mid_fight_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pdr_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_finale_hall_of_heroes_troll_mid_fight_a_01",
				[2] = "pdr_dal_finale_hall_of_heroes_troll_mid_fight_a_02",
			},
			sound_events_duration = {
				[1] = 3.6630415916443,
				[2] = 2.5407707691193,
			},
		},
		pdr_dal_finale_hall_of_heroes_troll_slain_a = {
			category = "special_occasion_interrupt",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pdr_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_finale_hall_of_heroes_troll_slain_a_01",
				[2] = "pdr_dal_finale_hall_of_heroes_troll_slain_a_02",
			},
			sound_events_duration = {
				[1] = 3.0035624504089,
				[2] = 3.0912709236145,
			},
		},
		pdr_dal_finale_troll_chief_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_finale_troll_chief_b_01",
				[2] = "pdr_dal_finale_troll_chief_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_finale_troll_chief_b_01",
				[2] = "pdr_dal_finale_troll_chief_b_02",
			},
			sound_events_duration = {
				[1] = 4.0240416526794,
				[2] = 3.2153959274292,
			},
		},
		pdr_dal_lifts_hub_first_task_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_first_task_a_01",
				[2] = "pdr_dal_lifts_hub_first_task_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_first_task_a_01",
				[2] = "pdr_dal_lifts_hub_first_task_a_02",
			},
			sound_events_duration = {
				[1] = 2.0472500324249,
				[2] = 3.7804791927338,
			},
		},
		pdr_dal_lifts_hub_lever_pulled_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
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
				[1] = "pdr_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_lever_pulled_a_01",
			},
			sound_events_duration = {
				[1] = 3.5437083244324,
			},
		},
		pdr_dal_lifts_hub_lever_pulled_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
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
				[1] = "pdr_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_lever_pulled_b_01",
			},
			sound_events_duration = {
				[1] = 10.003624916077,
			},
		},
		pdr_dal_lifts_hub_lever_pulled_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pdr_dal_lifts_hub_lever_pulled_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_lever_pulled_c_01",
				[2] = "pdr_dal_lifts_hub_lever_pulled_c_02",
			},
			sound_events_duration = {
				[1] = 2.7879374027252,
				[2] = 3.0421249866486,
			},
		},
		pdr_dal_lifts_hub_lift_sighted_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pdr_dal_lifts_hub_lift_sighted_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_lift_sighted_c_01",
				[2] = "pdr_dal_lifts_hub_lift_sighted_c_02",
			},
			sound_events_duration = {
				[1] = 3.91441655159,
				[2] = 3.2496874332428,
			},
		},
		pdr_dal_lifts_hub_lift_started_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_lift_started_a_01",
				[2] = "pdr_dal_lifts_hub_lift_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_lift_started_a_01",
				[2] = "pdr_dal_lifts_hub_lift_started_a_02",
			},
			sound_events_duration = {
				[1] = 2.2167499065399,
				[2] = 2.1291251182556,
			},
		},
		pdr_dal_lifts_hub_return_final_task_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pdr_dal_lifts_hub_return_final_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_return_final_task_complete_a_01",
				[2] = "pdr_dal_lifts_hub_return_final_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.8782916069031,
				[2] = 2.5161666870117,
			},
		},
		pdr_dal_lifts_hub_return_first_task_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pdr_dal_lifts_hub_return_first_task_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_return_first_task_complete_a_01",
				[2] = "pdr_dal_lifts_hub_return_first_task_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.615291595459,
				[2] = 4.5721459388733,
			},
		},
		pdr_dal_lifts_hub_return_pipe_complete_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pdr_dal_lifts_hub_return_pipe_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_hub_return_pipe_complete_a_01",
				[2] = "pdr_dal_lifts_hub_return_pipe_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.2429583072662,
				[2] = 2.630937576294,
			},
		},
		pdr_dal_lifts_lift_is_moving_reminder_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pdr_dal_lifts_lift_is_moving_reminder_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_lift_is_moving_reminder_a_01",
				[2] = "pdr_dal_lifts_lift_is_moving_reminder_a_02",
			},
			sound_events_duration = {
				[1] = 2.3932082653046,
				[2] = 3.3611249923706,
			},
		},
		pdr_dal_lifts_lift_rising_water_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_lift_rising_water_a_01",
				[2] = "pdr_dal_lifts_lift_rising_water_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_lift_rising_water_a_01",
				[2] = "pdr_dal_lifts_lift_rising_water_a_02",
			},
			sound_events_duration = {
				[1] = 2.0506665706634,
				[2] = 2.5947916507721,
			},
		},
		pdr_dal_lifts_path_cog_cog_placed_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pdr_dal_lifts_path_cog_cog_placed_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_cog_cog_placed_a_01",
				[2] = "pdr_dal_lifts_path_cog_cog_placed_a_02",
			},
			sound_events_duration = {
				[1] = 0.96083331108093,
				[2] = 1.600625038147,
			},
		},
		pdr_dal_lifts_path_cog_entered_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_cog_entered_a_01",
				[2] = "pdr_dal_lifts_path_cog_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_cog_entered_a_01",
				[2] = "pdr_dal_lifts_path_cog_entered_a_02",
			},
			sound_events_duration = {
				[1] = 3.2794165611267,
				[2] = 3.4077708721161,
			},
		},
		pdr_dal_lifts_path_cog_seeing_cog_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pdr_dal_lifts_path_cog_seeing_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_cog_seeing_cog_a_01",
				[2] = "pdr_dal_lifts_path_cog_seeing_cog_a_02",
			},
			sound_events_duration = {
				[1] = 3.8291873931885,
				[2] = 2.9101667404175,
			},
		},
		pdr_dal_lifts_path_cog_taken_cog_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pdr_dal_lifts_path_cog_taken_cog_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_cog_taken_cog_a_01",
				[2] = "pdr_dal_lifts_path_cog_taken_cog_a_02",
			},
			sound_events_duration = {
				[1] = 4.2624373435974,
				[2] = 3.2944583892822,
			},
		},
		pdr_dal_lifts_path_pipe_entered_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_entered_a_01",
				[2] = "pdr_dal_lifts_path_pipe_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_entered_a_01",
				[2] = "pdr_dal_lifts_path_pipe_entered_a_02",
			},
			sound_events_duration = {
				[1] = 4.7579584121704,
				[2] = 4.4636874198914,
			},
		},
		pdr_dal_lifts_path_pipe_entered_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_entered_b_01",
				[2] = "pdr_dal_lifts_path_pipe_entered_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_entered_b_01",
				[2] = "pdr_dal_lifts_path_pipe_entered_b_02",
			},
			sound_events_duration = {
				[1] = 4.397020816803,
				[2] = 4.6003332138061,
			},
		},
		pdr_dal_lifts_path_pipe_lever_pulled_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pdr_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_lever_pulled_complete_a_01",
				[2] = "pdr_dal_lifts_path_pipe_lever_pulled_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.4839375019074,
				[2] = 4.2981247901917,
			},
		},
		pdr_dal_lifts_path_pipe_seeing_blockage_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pdr_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_seeing_blockage_a_01",
				[2] = "pdr_dal_lifts_path_pipe_seeing_blockage_a_02",
			},
			sound_events_duration = {
				[1] = 2.3527083396912,
				[2] = 2.592333316803,
			},
		},
		pdr_dal_lifts_path_pipe_seeing_blockage_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pdr_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_seeing_blockage_b_01",
				[2] = "pdr_dal_lifts_path_pipe_seeing_blockage_b_02",
			},
			sound_events_duration = {
				[1] = 5.6631460189819,
				[2] = 2.7448124885559,
			},
		},
		pdr_dal_lifts_path_pipe_seeing_lever_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pdr_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_seeing_lever_a_01",
				[2] = "pdr_dal_lifts_path_pipe_seeing_lever_a_02",
			},
			sound_events_duration = {
				[1] = 3.6767292022705,
				[2] = 2.1790416240692,
			},
		},
		pdr_dal_lifts_path_pipe_shutter_walk_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pdr_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_shutter_walk_b_01",
				[2] = "pdr_dal_lifts_path_pipe_shutter_walk_b_02",
			},
			sound_events_duration = {
				[1] = 3.4567,
				[2] = 3.4567,
			},
		},
		pdr_dal_lifts_path_pipe_traversal_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pdr_dal_lifts_path_pipe_traversal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_traversal_a_01",
				[2] = "pdr_dal_lifts_path_pipe_traversal_a_02",
			},
			sound_events_duration = {
				[1] = 3.6790833473206,
				[2] = 3.0004167556763,
			},
		},
		pdr_dal_lifts_path_pipe_traversal_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pdr_dal_lifts_path_pipe_traversal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_pipe_traversal_b_01",
				[2] = "pdr_dal_lifts_path_pipe_traversal_b_02",
			},
			sound_events_duration = {
				[1] = 2.9236042499542,
				[2] = 2.8662707805634,
			},
		},
		pdr_dal_lifts_path_wheel_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_wheel_complete_a_01",
				[2] = "pdr_dal_lifts_path_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_wheel_complete_a_01",
				[2] = "pdr_dal_lifts_path_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.1246457099915,
				[2] = 2.1642916202545,
			},
		},
		pdr_dal_lifts_path_wheel_complete_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_wheel_complete_b_01",
				[2] = "pdr_dal_lifts_path_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_wheel_complete_b_01",
				[2] = "pdr_dal_lifts_path_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.3275208473206,
				[2] = 2.1861040592194,
			},
		},
		pdr_dal_lifts_path_wheel_entered_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_wheel_entered_a_01",
				[2] = "pdr_dal_lifts_path_wheel_entered_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_wheel_entered_a_01",
				[2] = "pdr_dal_lifts_path_wheel_entered_a_02",
			},
			sound_events_duration = {
				[1] = 2.6084792613983,
				[2] = 4.3938126564026,
			},
		},
		pdr_dal_lifts_path_wheel_seeing_brake_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pdr_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lifts_path_wheel_seeing_brake_a_01",
				[2] = "pdr_dal_lifts_path_wheel_seeing_brake_a_02",
			},
			sound_events_duration = {
				[1] = 2.2071042060852,
				[2] = 3.3468542098999,
			},
		},
		pdr_dal_lights_gate_sealed_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lights_gate_sealed_b_01",
				[2] = "pdr_dal_lights_gate_sealed_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lights_gate_sealed_b_01",
				[2] = "pdr_dal_lights_gate_sealed_b_02",
			},
			sound_events_duration = {
				[1] = 2.0104999542236,
				[2] = 3.212729215622,
			},
		},
		pdr_dal_lights_trolls_dead_complete_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_lights_trolls_dead_complete_b_01",
				[2] = "pdr_dal_lights_trolls_dead_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_lights_trolls_dead_complete_b_01",
				[2] = "pdr_dal_lights_trolls_dead_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.6261875629425,
				[2] = 5.3379583358765,
			},
		},
		pdr_dal_outer_approach_b = {
			category = "npc_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_outer_approach_b_01",
				[2] = "pdr_dal_outer_approach_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_outer_approach_b_01",
				[2] = "pdr_dal_outer_approach_b_02",
			},
			sound_events_duration = {
				[1] = 4.6458539962769,
				[2] = 4.2760834693909,
			},
		},
		pdr_dal_outer_close_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
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
				[1] = "pdr_dal_outer_close_c_01",
			},
			sound_events = {
				[1] = "pdr_dal_outer_close_c_01",
			},
			sound_events_duration = {
				[1] = 2.3658125400543,
			},
		},
		pdr_dal_outer_troll_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_outer_troll_a_01",
				[2] = "pdr_dal_outer_troll_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_outer_troll_a_01",
				[2] = "pdr_dal_outer_troll_a_02",
			},
			sound_events_duration = {
				[1] = 3.4449374675751,
				[2] = 4.1197915077209,
			},
		},
		pdr_dal_outer_troll_dead_complete_a = {
			category = "special_occasion_interrupt",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_outer_troll_dead_complete_a_01",
				[2] = "pdr_dal_outer_troll_dead_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_outer_troll_dead_complete_a_01",
				[2] = "pdr_dal_outer_troll_dead_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.6103749275208,
				[2] = 2.9552292823791,
			},
		},
		pdr_dal_start_banter_d = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_start_banter_d_01",
				[2] = "pdr_dal_start_banter_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_start_banter_d_01",
				[2] = "pdr_dal_start_banter_d_02",
			},
			sound_events_duration = {
				[1] = 2.9246873855591,
				[2] = 3.0892083644867,
			},
		},
		pdr_dal_start_vista_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_start_vista_a_01",
				[2] = "pdr_dal_start_vista_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_start_vista_a_01",
				[2] = "pdr_dal_start_vista_a_02",
			},
			sound_events_duration = {
				[1] = 3.3676042556763,
				[2] = 4.5673542022705,
			},
		},
		pdr_dal_start_vista_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_fest",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_dal_start_vista_b_01",
				[2] = "pdr_dal_start_vista_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dal_start_vista_b_01",
				[2] = "pdr_dal_start_vista_b_02",
			},
			sound_events_duration = {
				[1] = 2.9322292804718,
				[2] = 5.5042085647583,
			},
		},
	})
end
