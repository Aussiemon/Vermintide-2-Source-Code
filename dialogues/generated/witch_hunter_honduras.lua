return function ()
	define_rule({
		name = "pwh_objective_interacting_with_objective",
		response = "pwh_objective_interacting_with_objective",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"objective_interacting_with_objective"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_objective_interacting_with_objective_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_interacting_with_objective_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_nearing_objective_deadline",
		response = "pwh_objective_nearing_objective_deadline",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"objective_nearing_objective_deadline"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_objective_nearing_objective_deadline_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_nearing_objective_deadline_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_achieved_all_but_one_goal",
		response = "pwh_objective_achieved_all_but_one_goal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"objective_achieved_all_but_one_goal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_objective_achieved_all_but_one_goal_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_achieved_all_but_one_goal_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_goal_achieved_more_left",
		response = "pwh_objective_goal_achieved_more_left",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"objective_goal_achieved_more_left"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_objective_goal_achieved_more_left_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_goal_achieved_more_left_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_goal_achieved_escape",
		response = "pwh_objective_goal_achieved_escape",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"objective_goal_achieved_escape"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_objective_goal_achieved_escape_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_goal_achieved_escape_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_this_way",
		response = "pwh_objective_correct_path_this_way",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_up",
		response = "pwh_objective_correct_path_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way_up",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_down",
		response = "pwh_objective_correct_path_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way_down",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_street",
		response = "pwh_objective_correct_path_street",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_street"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way_street",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_street",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_door",
		response = "pwh_objective_correct_path_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_door"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way_door",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_door",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_stairs_up",
		response = "pwh_objective_correct_path_stairs_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_stairs_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"friends_distant",
				OP.GTEQ,
				1
			},
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_stairs_down",
		response = "pwh_objective_correct_path_stairs_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_stairs_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way_stairs_down",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_spotting_ferry_lady",
		response = "pwh_spotting_ferry_lady",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"generic_spotting_ferry_lady"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_spotting_ferry_lady",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_spotting_ferry_lady",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_dropping_grimoire",
		response = "pwh_objective_dropping_grimoire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"throwing_item"
			},
			{
				"query_context",
				"item_type",
				OP.EQ,
				"grimoire"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_throwing_grimoire",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_throwing_grimoire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_picking_up_grimoire",
		response = "pwh_objective_picking_up_grimoire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_pickup"
			},
			{
				"query_context",
				"pickup_name",
				OP.EQ,
				"pickup_grimoire"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_picking_up_grimoire",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_picking_up_grimoire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dead_body",
		response = "pwh_gameplay_dead_body",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"generic_spotting_dead_body"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				12
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				90
			},
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMEDIFF,
				OP.GT,
				480
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dead_end",
		response = "pwh_gameplay_dead_end",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"generic_dead_end"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_dead_end",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_dead_end",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_bridge",
		response = "pwh_objective_correct_path_bridge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_bridge"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_found_way_bridge",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_bridge",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_across",
		response = "pwh_objective_correct_path_across",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_correct_path_across"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_correct_path_across",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_across",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_alley",
		response = "pwh_objective_correct_path_alley",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_correct_path_alley"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_correct_path_alley",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_alley",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_ladder_down",
		response = "pwh_objective_correct_path_ladder_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_correct_path_ladder_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_correct_path_ladder_down",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_ladder_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_objective_correct_path_ladder_up",
		response = "pwh_objective_correct_path_ladder_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"this_way_correct_path_ladder_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_correct_path_ladder_up",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_ladder_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_casual_quotes",
		response = "pwh_gameplay_casual_quotes",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				900
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_empire_soldier_being_helped_up",
		name = "pwh_gameplay_empire_soldier_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_dwarf_ranger_being_helped_up",
		name = "pwh_gameplay_dwarf_ranger_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wood_elf_being_helped_up",
		name = "pwh_gameplay_wood_elf_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_bright_wizard_being_helped_up",
		name = "pwh_gameplay_bright_wizard_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_empire_soldier",
		response = "pwh_gameplay_healing_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_dwarf_ranger",
		response = "pwh_gameplay_healing_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_wood_elf",
		response = "pwh_gameplay_healing_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_bright_wizard",
		response = "pwh_gameplay_healing_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_helped_by_empire_soldier",
		response = "pwh_gameplay_helped_by_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"healer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_helped_by_dwarf_ranger",
		response = "pwh_gameplay_helped_by_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"healer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_helped_by_wood_elf",
		response = "pwh_gameplay_helped_by_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"healer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_helped_by_bright_wizard",
		response = "pwh_gameplay_helped_by_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"healer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_low_on_health",
		response = "pwh_gameplay_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"health_trigger"
			},
			{
				"query_context",
				"current_amount",
				OP.LTEQ,
				0.4
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				0.1
			},
			{
				"query_context",
				"trigger_type",
				OP.EQ,
				"decreasing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"low_health",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"low_health",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_empire_soldier_low_on_health",
		response = "pwh_gameplay_empire_soldier_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pes_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_low_health_pes",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_low_on_health",
		response = "pwh_gameplay_dwarf_ranger_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_low_health_pwh",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pwh",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wood_elf_low_on_health",
		response = "pwh_gameplay_wood_elf_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_low_health_pwe",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pwe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bright_wizard_low_on_health",
		response = "pwh_gameplay_bright_wizard_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_low_health_pbw",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pbw",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_ammo",
		response = "pwh_gameplay_spots_ammo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_health",
		response = "pwh_gameplay_spots_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"enemies_distant",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_draught",
		response = "pwh_gameplay_healing_draught",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"enemies_distant",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_potion",
		response = "pwh_gameplay_spots_potion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_bomb",
		response = "pwh_gameplay_spots_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_out_of_ammo",
		response = "pwh_gameplay_out_of_ammo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"reload_failed"
			},
			{
				"query_context",
				"fail_reason",
				OP.EQ,
				"out_of_ammo"
			},
			{
				"query_context",
				"item_name",
				OP.NEQ,
				"healthkit_first_aid_kit_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_using_potion",
		response = "pwh_gameplay_using_potion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_used_potion",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_used_potion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_self_heal",
		response = "pwh_gameplay_self_heal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_throwing_bomb",
		response = "pwh_gameplay_throwing_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"throwing_item"
			},
			{
				"query_context",
				"item_type",
				OP.EQ,
				"grenade"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_throwing_bomb",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_throwing_bomb",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_weapon_flair_offensive",
		response = "pwh_gameplay_weapon_flair_offensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"weapon_flair_offensive"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_weapon_flair_defensive",
		response = "pwh_gameplay_weapon_flair_defensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"weapon_flair_defensive"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_friendly_fire_dwarf_ranger",
		response = "pwh_gameplay_friendly_fire_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_friendly_fire_bright_wizard",
		response = "pwh_gameplay_friendly_fire_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_friendly_fire_wood_elf",
		response = "pwh_gameplay_friendly_fire_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_friendly_fire_empire_soldier",
		response = "pwh_gameplay_friendly_fire_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_encouraging_words",
		response = "pwh_gameplay_encouraging_words",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friends_close"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				600
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_special_enemy_kill_melee",
		response = "pwh_gameplay_special_enemy_kill_melee",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"hit_zone",
				OP.EQ,
				"head"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_special_enemy_kill_ranged",
		response = "pwh_gameplay_special_enemy_kill_ranged",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"hit_zone",
				OP.EQ,
				"head"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_special_kill_ranged",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_kill_ranged",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_empire_soldier_on_a_frenzy",
		response = "pwh_gameplay_empire_soldier_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_frenzy_empire_soldier",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_empire_soldier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_on_a_frenzy",
		response = "pwh_gameplay_dwarf_ranger_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_frenzy_witch_hunter",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_witch_hunter",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wood_elf_on_a_frenzy",
		response = "pwh_gameplay_wood_elf_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_frenzy_wood_elf",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_wood_elf",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bright_wizard_on_a_frenzy",
		response = "pwh_gameplay_bright_wizard_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_frenzy_bright_wizard",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_bright_wizard",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_armoured_enemy_dwarf_ranger",
		response = "pwh_gameplay_armoured_enemy_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_armoured_enemy_bright_wizard",
		response = "pwh_gameplay_armoured_enemy_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_armoured_enemy_wood_elf",
		response = "pwh_gameplay_armoured_enemy_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_armoured_enemy_empire_soldier",
		response = "pwh_gameplay_armoured_enemy_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bile_troll_incapacitaded",
		response = "pwh_gameplay_bile_troll_incapacitaded",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"troll_incapacitaded"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"troll_incapacitaded",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"troll_incapacitaded",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_empire_soldier_eaten",
		response = "pwh_gameplay_empire_soldier_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bright_wizard_eaten",
		response = "pwh_gameplay_bright_wizard_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_eaten",
		response = "pwh_gameplay_dwarf_ranger_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wood_elf_eaten",
		response = "pwh_gameplay_wood_elf_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_tips_wizard_wind",
		response = "pwh_gameplay_tips_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_vortex_spawned"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_tips_wizard_plague",
		response = "pwh_gameplay_tips_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"on_plague_wave_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"on_plague_wave_hit",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"on_plague_wave_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_parry_empire_soldier",
		response = "pwh_gameplay_parry_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_parry_wood_elf",
		response = "pwh_gameplay_parry_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_parry_dwarf_ranger",
		response = "pwh_gameplay_parry_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_parry_bright_wizard",
		response = "pwh_gameplay_parry_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_special_ability_captain",
		name = "pwh_special_ability_captain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_captain"
			}
		}
	})
	define_rule({
		response = "pwh_activate_ability_bounty_hunter",
		name = "pwh_activate_ability_bounty_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
			}
		}
	})
	define_rule({
		response = "pwh_activate_ability_zealot",
		name = "pwh_activate_ability_zealot",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot"
			}
		}
	})
	define_rule({
		name = "pwh_curse",
		response = "pwh_curse",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_close"
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				35
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"intensity",
				OP.GT,
				30
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_targeted_by_ratling",
		response = "pwh_targeted_by_ratling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ratling_target"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_ratling_target",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_target",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_curse_forced",
		response = "pwh_curse_forced",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_curse_vo"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_curse_vo",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_curse_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_globadier_guck",
		response = "pwh_gameplay_globadier_guck",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"pwg_projectile"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"pwg_projectile_thrown",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_projectile_thrown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hit_by_goo",
		name = "pwh_gameplay_hit_by_goo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_taking_heavy_damage",
		response = "pwh_gameplay_taking_heavy_damage",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"health_trigger"
			},
			{
				"query_context",
				"trigger_type",
				OP.EQ,
				"losing_rapidly"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_taking_heavy_damage",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taking_heavy_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_incoming_globadier",
		response = "pwh_gameplay_incoming_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"pwg_suicide_run"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"pwg_suicides",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_suicides",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_knocked_down",
		response = "pwh_gameplay_knocked_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMESET
			},
			{
				"faction_memory",
				"times_we_downed",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_player_pounced",
		response = "pwh_gameplay_player_pounced",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_empire_soldier_grabbed",
		response = "pwh_gameplay_empire_soldier_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bright_wizard_grabbed",
		response = "pwh_gameplay_bright_wizard_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_grabbed",
		response = "pwh_gameplay_dwarf_ranger_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wood_elf_grabbed",
		response = "pwh_gameplay_wood_elf_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_wizard_leech_leeching_kruber",
		response = "pwh_gameplay_chaos_wizard_leech_leeching_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_wizard_leech_leeching_sienna",
		response = "pwh_gameplay_chaos_wizard_leech_leeching_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_wizard_leech_leeching_bardin",
		response = "pwh_gameplay_chaos_wizard_leech_leeching_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_wizard_leech_leeching_keriliian",
		response = "pwh_gameplay_chaos_wizard_leech_leeching_keriliian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_empire_soldier_in_trouble",
		response = "pwh_gameplay_heard_empire_soldier_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pes_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.NEQ,
				2
			},
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_bright_wizard_in_trouble",
		response = "pwh_gameplay_heard_bright_wizard_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.NEQ,
				2
			},
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_wood_elf_in_trouble",
		response = "pwh_gameplay_heard_wood_elf_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.NEQ,
				2
			},
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_dwarf_ranger_in_trouble",
		response = "pwh_gameplay_heard_dwarf_ranger_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.NEQ,
				2
			},
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_no_nearby_teammates",
		response = "pwh_gameplay_no_nearby_teammates",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friends_distant"
			},
			{
				"user_context",
				"friends_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_empire_soldier_dead",
		response = "pwh_gameplay_empire_soldier_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_pes_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pes_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bright_wizard_dead",
		response = "pwh_gameplay_bright_wizard_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_pbw_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pbw_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wood_elf_dead",
		response = "pwh_gameplay_wood_elf_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_pwe_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pwe_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_dead",
		response = "pwh_gameplay_dwarf_ranger_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_pdr_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pdr_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bile_troll_before_puke",
		response = "pwh_gameplay_bile_troll_before_puke",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"before_puke"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"before_puke",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"before_puke",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_stormvermin",
		response = "pwh_gameplay_seeing_a_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_gutter_runner",
		response = "pwh_gameplay_seeing_a_gutter_runner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_gutter_runner",
		response = "pwh_gameplay_hearing_a_gutter_runner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_globadier",
		response = "pwh_gameplay_seeing_a_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_globadier",
		response = "pwh_gameplay_hearing_a_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_rat_ogre",
		response = "pwh_gameplay_seeing_a_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_incoming_skaven_rat_ogre",
		response = "pwh_gameplay_incoming_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"rat_ogre_charge"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"ogre_charges",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"ogre_charges",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hears_incoming_horde",
		response = "pwh_gameplay_hears_incoming_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
			},
			{
				"query_context",
				"horde_type",
				OP.EQ,
				"vector"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"time_since_horde",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_horde",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_patrol_stormvermin",
		response = "pwh_gameplay_seeing_a_skaven_patrol_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_patrol_stormvermin",
		response = "pwh_gameplay_hearing_a_skaven_patrol_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_slaver",
		response = "pwh_gameplay_seeing_a_skaven_slaver",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_ratling_gun",
		response = "pwh_gameplay_seeing_a_skaven_ratling_gun",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_ratling_gun",
		response = "pwh_gameplay_hearing_a_skaven_ratling_gun",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_tension_no_enemies",
		response = "pwh_gameplay_tension_no_enemies",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_distant"
			},
			{
				"query_context",
				"num_units",
				OP.LT,
				5
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				300
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				90
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_globadier",
		response = "pwh_gameplay_killing_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_globadier",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_globadier",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_ratling",
		response = "pwh_gameplay_killing_ratling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_ratling",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_ratling",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_packmaster",
		response = "pwh_gameplay_killing_packmaster",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_packmaster",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_packmaster",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_gutterrunner",
		response = "pwh_gameplay_killing_gutterrunner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_gutterrunner",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_gutterrunner",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_lootrat",
		response = "pwh_gameplay_killing_lootrat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_loot_rat"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_lootrat",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_lootrat",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_gutter_runner_combat",
		response = "pwh_gameplay_hearing_a_gutter_runner_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_globadier_combat",
		response = "pwh_gameplay_hearing_a_globadier_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_rat_ogre_combat",
		response = "pwh_gameplay_hearing_a_skaven_rat_ogre_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_ratling_gun_combat",
		response = "pwh_gameplay_hearing_a_skaven_ratling_gun_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_pm",
		response = "pwh_gameplay_seeing_a_pm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_scr",
		response = "pwh_gameplay_seeing_a_scr",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"seeing_a_scr",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"seeing_a_scr",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_pm",
		response = "pwh_gameplay_hearing_a_pm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"Play_plague_monk_alerted_vce"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_pm_in_combat",
		response = "pwh_gameplay_hearing_a_pm_in_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"Play_plague_monk_alerted_vce"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_spawn_combat",
		response = "pwh_gameplay_hearing_a_chaos_spawn_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_spawn",
		response = "pwh_gameplay_seeing_a_chaos_spawn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_spawn",
		response = "pwh_gameplay_hearing_a_chaos_spawn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_stormfiend",
		response = "pwh_gameplay_killing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_skaven_stormfiend",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_warrior_combat",
		response = "pwh_gameplay_hearing_a_chaos_warrior_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_plague",
		response = "pwh_gameplay_hearing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_plague_combat",
		response = "pwh_gameplay_hearing_a_chaos_wizard_plague_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_tentacle",
		response = "pwh_gameplay_hearing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		response = "pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_wind",
		response = "pwh_gameplay_hearing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_wind_combat",
		response = "pwh_gameplay_hearing_a_chaos_wizard_wind_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower",
		response = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		response = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_stormfiend",
		response = "pwh_gameplay_hearing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_stormfiend_combat",
		response = "pwh_gameplay_hearing_a_stormfiend_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_troll",
		response = "pwh_gameplay_hearing_a_troll",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_troll_combat",
		response = "pwh_gameplay_hearing_a_troll_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_marauder_berserker_combat",
		response = "pwh_gameplay_hearing_marauder_berserker_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"ecb_gameplay_running_towards_players"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_berzerker",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_berzerker",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_chaos_warrior",
		response = "pwh_gameplay_killing_a_chaos_warrior",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_warrior",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_chaos_warrior_champion",
		response = "pwh_gameplay_killing_a_chaos_warrior_champion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_exalted_champion",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_chaos_wizard_plague",
		response = "pwh_gameplay_killing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_plague_sorcerer",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_chaos_wizard_tentacle",
		response = "pwh_gameplay_killing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_chaos_wizard_tentacle",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_wizard_tentacle",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_chaos_wizard_wind",
		response = "pwh_gameplay_killing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_vortex_sorcerer",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_skaven_warpfire_thrower",
		response = "pwh_gameplay_killing_a_skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_skaven_warpfire_thrower",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_warrior",
		response = "pwh_gameplay_seeing_a_chaos_warrior",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_warrior_champion_combat",
		response = "pwh_gameplay_seeing_a_chaos_warrior_champion_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_exalted_champion"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_exalted_champion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_wizard_plague",
		response = "pwh_gameplay_seeing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_wizard_tentacle",
		response = "pwh_gameplay_seeing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_wizard_wind",
		response = "pwh_gameplay_seeing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_shield_stormvermin",
		response = "pwh_gameplay_seeing_a_shield_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_skaven_storm_vermin_with_shield",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_storm_vermin_with_shield",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_Skaven_warpfire_thrower",
		response = "pwh_gameplay_seeing_a_Skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_stormfiend",
		response = "pwh_gameplay_seeing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_troll",
		response = "pwh_gameplay_seeing_a_troll",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_rat_ogre",
		response = "pwh_gameplay_hearing_a_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_chaos_wizard_leech",
		response = "pwh_gameplay_seeing_a_chaos_wizard_leech",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_heard_leech",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_leech",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_leech",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_chaos_wizard_leech",
		response = "pwh_gameplay_killing_a_chaos_wizard_leech",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_corruptor_sorcerer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_chaos_wizard_leech",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_wizard_leech",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_ambush_horde_spawned",
		response = "pwh_gameplay_ambush_horde_spawned",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
			},
			{
				"query_context",
				"horde_type",
				OP.EQ,
				"ambush"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_ambush",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_standard_bearer",
		response = "pwh_gameplay_hearing_a_standard_bearer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_standard_bearer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_beastmen_standard_bearer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_standard_bearer_crater",
		response = "pwh_gameplay_hearing_a_standard_bearer_crater",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_standard_bearer_crater"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_beastmen_standard_bearer_crater",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer_crater",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer_crater",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_standard_bearer_has_planted_standard",
		response = "pwh_gameplay_standard_bearer_has_planted_standard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"has_planted_standard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_beastmen_standard_planted",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_beastmen_standard_planted",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_standard_bearer_has_planted_standard_crater",
		response = "pwh_gameplay_standard_bearer_has_planted_standard_crater",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"has_planted_standard_crater"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_beastmen_standard_planted_crater",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_beastmen_standard_planted_crater",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_standard_bearer_buff_active",
		response = "pwh_gameplay_standard_bearer_buff_active",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"standard_bearer_buff_active"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_standard_bearer_buff_active",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_standard_bearer_buff_active",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_standard_bearer_buff_deactivated",
		response = "pwh_gameplay_standard_bearer_buff_deactivated",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"standard_bearer_buff_deactivated"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_standard_bearer_buff_deactivated",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_standard_bearer_buff_deactivated",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_incoming_bestigor_attack",
		response = "pwh_gameplay_incoming_bestigor_attack",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"incoming_attack"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_incoming_bestigor_attack",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_incoming_bestigor_attack",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_minotaur",
		response = "pwh_gameplay_hearing_a_minotaur",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_minotaur"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_incoming_attack",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_beastmen_minotaur",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_beastmen_minotaur",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_killing_a_minotaur",
		response = "pwh_gameplay_killing_a_minotaur",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"beastmen_minotaur"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"time_since_killing_beastmen_minotaur",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_beastmen_minotaur",
				OP.TIMESET
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_ungor_archer",
		response = "pwh_gameplay_seeing_a_ungor_archer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_ungor_archer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_seen_ungor_archer",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_ungor_archer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_incoming_attack",
		response = "pwh_gameplay_incoming_attack",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"incoming_attack"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_minotaur"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_incoming_attack",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_incoming_attack",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwh_gameplay_tips_wizard_wind = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_tips_wizard_wind_01",
				"pwh_gameplay_tips_wizard_wind_02",
				"pwh_gameplay_tips_wizard_wind_03",
				"pwh_gameplay_tips_wizard_wind_04",
				"pwh_gameplay_tips_wizard_wind_05",
				"pwh_gameplay_tips_wizard_wind_06",
				"pwh_gameplay_tips_wizard_wind_07",
				"pwh_gameplay_tips_wizard_wind_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				2.7627084255219,
				3.6793541908264,
				2.6511874198914,
				3.6802916526794,
				3.1507291793823,
				3.0747499465942,
				2.9781665802002,
				3.5015416145325
			},
			localization_strings = {
				"pwh_gameplay_tips_wizard_wind_01",
				"pwh_gameplay_tips_wizard_wind_02",
				"pwh_gameplay_tips_wizard_wind_03",
				"pwh_gameplay_tips_wizard_wind_04",
				"pwh_gameplay_tips_wizard_wind_05",
				"pwh_gameplay_tips_wizard_wind_06",
				"pwh_gameplay_tips_wizard_wind_07",
				"pwh_gameplay_tips_wizard_wind_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_wood_elf_in_trouble = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_heard_wood_elf_in_trouble_05",
				"pwh_gameplay_heard_wood_elf_in_trouble_06",
				"pwh_gameplay_heard_wood_elf_in_trouble_07",
				"pwh_gameplay_heard_wood_elf_in_trouble_08",
				"pwh_gameplay_heard_wood_elf_in_trouble_09"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.1577084064484,
				2.6117084026337,
				2.8051874637604,
				3.5560207366943,
				4.2692499160767
			},
			localization_strings = {
				"pwh_gameplay_heard_wood_elf_in_trouble_05",
				"pwh_gameplay_heard_wood_elf_in_trouble_06",
				"pwh_gameplay_heard_wood_elf_in_trouble_07",
				"pwh_gameplay_heard_wood_elf_in_trouble_08",
				"pwh_gameplay_heard_wood_elf_in_trouble_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_spawn = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_spawn_01",
				"pwh_gameplay_seeing_a_chaos_spawn_02",
				"pwh_gameplay_seeing_a_chaos_spawn_03",
				"pwh_gameplay_seeing_a_chaos_spawn_04",
				"pwh_gameplay_seeing_a_chaos_spawn_05",
				"pwh_gameplay_seeing_a_chaos_spawn_06",
				"pwh_gameplay_seeing_a_chaos_spawn_07",
				"pwh_gameplay_seeing_a_chaos_spawn_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.7176876068115,
				3.915937423706,
				3.3081874847412,
				3.3229374885559,
				2.7965624332428,
				3.9403123855591,
				4.2420001029968,
				2.7758123874664
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_spawn_01",
				"pwh_gameplay_seeing_a_chaos_spawn_02",
				"pwh_gameplay_seeing_a_chaos_spawn_03",
				"pwh_gameplay_seeing_a_chaos_spawn_04",
				"pwh_gameplay_seeing_a_chaos_spawn_05",
				"pwh_gameplay_seeing_a_chaos_spawn_06",
				"pwh_gameplay_seeing_a_chaos_spawn_07",
				"pwh_gameplay_seeing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_friendly_fire_dwarf_ranger = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_friendly_fire_dwarf_ranger_01",
				"pwh_gameplay_friendly_fire_dwarf_ranger_02",
				"pwh_gameplay_friendly_fire_dwarf_ranger_03",
				"pwh_gameplay_friendly_fire_dwarf_ranger_04",
				"pwh_gameplay_friendly_fire_dwarf_ranger_05",
				"pwh_gameplay_friendly_fire_dwarf_ranger_06",
				"pwh_gameplay_friendly_fire_dwarf_ranger_07",
				"pwh_gameplay_friendly_fire_dwarf_ranger_08",
				"pwh_gameplay_friendly_fire_dwarf_ranger_09"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_neutral"
			},
			sound_events_duration = {
				1.9814374446869,
				2.2940833568573,
				2.0422291755676,
				2.0244791507721,
				2.9730207920074,
				2.3359375,
				1.7015416622162,
				5.0945210456848,
				5.3822708129883
			},
			localization_strings = {
				"pwh_gameplay_friendly_fire_dwarf_ranger_01",
				"pwh_gameplay_friendly_fire_dwarf_ranger_02",
				"pwh_gameplay_friendly_fire_dwarf_ranger_03",
				"pwh_gameplay_friendly_fire_dwarf_ranger_04",
				"pwh_gameplay_friendly_fire_dwarf_ranger_05",
				"pwh_gameplay_friendly_fire_dwarf_ranger_06",
				"pwh_gameplay_friendly_fire_dwarf_ranger_07",
				"pwh_gameplay_friendly_fire_dwarf_ranger_08",
				"pwh_gameplay_friendly_fire_dwarf_ranger_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_gutter_runner_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_gutter_runner_combat_01",
				"pwh_gameplay_hearing_a_gutter_runner_combat_03",
				"pwh_gameplay_hearing_a_gutter_runner_combat_04",
				"pwh_gameplay_hearing_a_gutter_runner_combat_05",
				"pwh_gameplay_hearing_a_gutter_runner_combat_06",
				"pwh_gameplay_hearing_a_gutter_runner_combat_07",
				"pwh_gameplay_hearing_a_gutter_runner_combat_08",
				"pwh_gameplay_hearing_a_gutter_runner_combat_09"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.2913957834244,
				1.2913957834244,
				1.5733749866486,
				1.2199374437332,
				1.5354167222977,
				1.3332500457764,
				2.4041249752045,
				1.6329166889191
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_gutter_runner_combat_01",
				"pwh_gameplay_hearing_a_gutter_runner_combat_03",
				"pwh_gameplay_hearing_a_gutter_runner_combat_04",
				"pwh_gameplay_hearing_a_gutter_runner_combat_05",
				"pwh_gameplay_hearing_a_gutter_runner_combat_06",
				"pwh_gameplay_hearing_a_gutter_runner_combat_07",
				"pwh_gameplay_hearing_a_gutter_runner_combat_08",
				"pwh_gameplay_hearing_a_gutter_runner_combat_09"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_stairs_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_stairs_down_03",
				"pwh_objective_correct_path_stairs_down_05",
				"pwh_objective_correct_path_stairs_down_06",
				"pwh_objective_correct_path_stairs_down_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.1920626163483,
				1.3082292079925,
				1.8921458721161,
				2.1920626163483
			},
			localization_strings = {
				"pwh_objective_correct_path_stairs_down_03",
				"pwh_objective_correct_path_stairs_down_05",
				"pwh_objective_correct_path_stairs_down_06",
				"pwh_objective_correct_path_stairs_down_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_bomb = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_spots_bomb_10",
				"pwh_gameplay_spots_bomb_11",
				"pwh_gameplay_spots_bomb_12",
				"pwh_gameplay_spots_bomb_13",
				"pwh_gameplay_spots_bomb_14",
				"pwh_gameplay_spots_bomb_15",
				"pwh_gameplay_spots_bomb_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				2.5675208568573,
				2.6886250972748,
				1.9807292222977,
				2.4678957462311,
				1.932833313942,
				1.9871875047684,
				2.4983541965485
			},
			localization_strings = {
				"pwh_gameplay_spots_bomb_10",
				"pwh_gameplay_spots_bomb_11",
				"pwh_gameplay_spots_bomb_12",
				"pwh_gameplay_spots_bomb_13",
				"pwh_gameplay_spots_bomb_14",
				"pwh_gameplay_spots_bomb_15",
				"pwh_gameplay_spots_bomb_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_wood_elf_being_helped_up_05",
				"pwh_gameplay_wood_elf_being_helped_up_06",
				"pwh_gameplay_wood_elf_being_helped_up_07",
				"pwh_gameplay_wood_elf_being_helped_up_08",
				"pwh_gameplay_wood_elf_being_helped_up_09",
				"pwh_gameplay_wood_elf_being_helped_up_10",
				"pwh_gameplay_wood_elf_being_helped_up_11",
				"pwh_gameplay_wood_elf_being_helped_up_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.2633541822434,
				2.0590624809265,
				3.6357500553131,
				2.7461249828339,
				3.3264374732971,
				2.9137916564941,
				3.0420207977295,
				3.1517708301544
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_being_helped_up_05",
				"pwh_gameplay_wood_elf_being_helped_up_06",
				"pwh_gameplay_wood_elf_being_helped_up_07",
				"pwh_gameplay_wood_elf_being_helped_up_08",
				"pwh_gameplay_wood_elf_being_helped_up_09",
				"pwh_gameplay_wood_elf_being_helped_up_10",
				"pwh_gameplay_wood_elf_being_helped_up_11",
				"pwh_gameplay_wood_elf_being_helped_up_12"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_across = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_across_01",
				"pwh_objective_correct_path_across_02",
				"pwh_objective_correct_path_across_03",
				"pwh_objective_correct_path_across_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.0250833034515,
				1.2188124656677,
				0.99189585447311,
				2.5838124752045
			},
			localization_strings = {
				"pwh_objective_correct_path_across_01",
				"pwh_objective_correct_path_across_02",
				"pwh_objective_correct_path_across_03",
				"pwh_objective_correct_path_across_04"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_ladder_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_ladder_up_01",
				"pwh_objective_correct_path_ladder_up_02",
				"pwh_objective_correct_path_ladder_up_03",
				"pwh_objective_correct_path_ladder_up_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.345541715622,
				2.5503957271576,
				1.569416642189,
				0.96799999475479
			},
			localization_strings = {
				"pwh_objective_correct_path_ladder_up_01",
				"pwh_objective_correct_path_ladder_up_02",
				"pwh_objective_correct_path_ladder_up_03",
				"pwh_objective_correct_path_ladder_up_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_stormfiend_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_stormfiend_combat_01",
				"pwh_gameplay_hearing_a_stormfiend_combat_02",
				"pwh_gameplay_hearing_a_stormfiend_combat_03",
				"pwh_gameplay_hearing_a_stormfiend_combat_04",
				"pwh_gameplay_hearing_a_stormfiend_combat_05",
				"pwh_gameplay_hearing_a_stormfiend_combat_06",
				"pwh_gameplay_hearing_a_stormfiend_combat_07",
				"pwh_gameplay_hearing_a_stormfiend_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.6592291593552,
				1.5400832891464,
				3.1917917728424,
				3.2584583759308,
				1.3402500152588,
				2.6421248912811,
				1.8347500562668,
				2.7560832500458
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_stormfiend_combat_01",
				"pwh_gameplay_hearing_a_stormfiend_combat_02",
				"pwh_gameplay_hearing_a_stormfiend_combat_03",
				"pwh_gameplay_hearing_a_stormfiend_combat_04",
				"pwh_gameplay_hearing_a_stormfiend_combat_05",
				"pwh_gameplay_hearing_a_stormfiend_combat_06",
				"pwh_gameplay_hearing_a_stormfiend_combat_07",
				"pwh_gameplay_hearing_a_stormfiend_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_armoured_enemy_empire_soldier = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_armoured_enemy_empire_soldier_04",
				"pwh_gameplay_armoured_enemy_empire_soldier_05",
				"pwh_gameplay_armoured_enemy_empire_soldier_06",
				"pwh_gameplay_armoured_enemy_empire_soldier_07",
				"pwh_gameplay_armoured_enemy_empire_soldier_08",
				"pwh_gameplay_armoured_enemy_empire_soldier_09",
				"pwh_gameplay_armoured_enemy_empire_soldier_10",
				"pwh_gameplay_armoured_enemy_empire_soldier_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.3040416240692,
				1.7960416078568,
				2.3179376125336,
				2.6777083873749,
				3.2721874713898,
				2.9185416698456,
				1.9503749608993,
				3.1178958415985
			},
			localization_strings = {
				"pwh_gameplay_armoured_enemy_empire_soldier_04",
				"pwh_gameplay_armoured_enemy_empire_soldier_05",
				"pwh_gameplay_armoured_enemy_empire_soldier_06",
				"pwh_gameplay_armoured_enemy_empire_soldier_07",
				"pwh_gameplay_armoured_enemy_empire_soldier_08",
				"pwh_gameplay_armoured_enemy_empire_soldier_09",
				"pwh_gameplay_armoured_enemy_empire_soldier_10",
				"pwh_gameplay_armoured_enemy_empire_soldier_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_grabbed = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				6.6559376716614,
				4.7599167823792,
				4.1109580993652,
				4.2269582748413,
				3.3395833969116,
				3.5397291183472,
				5.2292709350586,
				5.6597499847412
			},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_shield_stormvermin = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_shield_stormvermin_01",
				"pwh_gameplay_seeing_a_shield_stormvermin_02",
				"pwh_gameplay_seeing_a_shield_stormvermin_03",
				"pwh_gameplay_seeing_a_shield_stormvermin_04",
				"pwh_gameplay_seeing_a_shield_stormvermin_05",
				"pwh_gameplay_seeing_a_shield_stormvermin_06",
				"pwh_gameplay_seeing_a_shield_stormvermin_07",
				"pwh_gameplay_seeing_a_shield_stormvermin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.9392291307449,
				2,
				1.5326249599457,
				1.5886875391007,
				2.0051040649414,
				3.2488541603088,
				2.9343957901001,
				2.383291721344
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_shield_stormvermin_01",
				"pwh_gameplay_seeing_a_shield_stormvermin_02",
				"pwh_gameplay_seeing_a_shield_stormvermin_03",
				"pwh_gameplay_seeing_a_shield_stormvermin_04",
				"pwh_gameplay_seeing_a_shield_stormvermin_05",
				"pwh_gameplay_seeing_a_shield_stormvermin_06",
				"pwh_gameplay_seeing_a_shield_stormvermin_07",
				"pwh_gameplay_seeing_a_shield_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_stairs_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_stairs_up_01",
				"pwh_objective_correct_path_stairs_up_02",
				"pwh_objective_correct_path_stairs_up_05",
				"pwh_objective_correct_path_stairs_up_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.5668333768845,
				1.5912499427795,
				1.5668333768845,
				1.5912499427795
			},
			localization_strings = {
				"pwh_objective_correct_path_stairs_up_01",
				"pwh_objective_correct_path_stairs_up_02",
				"pwh_objective_correct_path_stairs_up_05",
				"pwh_objective_correct_path_stairs_up_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_globadier_guck = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_globadier_guck_02",
				"pwh_gameplay_globadier_guck_03",
				"pwh_gameplay_globadier_guck_07",
				"pwh_gameplay_globadier_guck_08",
				"pwh_gameplay_globadier_guck_09",
				"pwh_gameplay_globadier_guck_10",
				"pwh_gameplay_globadier_guck_11",
				"pwh_gameplay_globadier_guck_12"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.1234375238419,
				1.1490207910538,
				2.4861042499542,
				2.0435416698456,
				1.1234375238419,
				1.1490207910538,
				2.4861042499542,
				2.0435416698456
			},
			localization_strings = {
				"pwh_gameplay_globadier_guck_02",
				"pwh_gameplay_globadier_guck_03",
				"pwh_gameplay_globadier_guck_07",
				"pwh_gameplay_globadier_guck_08",
				"pwh_gameplay_globadier_guck_09",
				"pwh_gameplay_globadier_guck_10",
				"pwh_gameplay_globadier_guck_11",
				"pwh_gameplay_globadier_guck_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_rat_ogre_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_03",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.1632291078568,
				1.1809375286102,
				3.4567,
				3.4567,
				3.0119376182556,
				1.317166686058,
				1.0678750276566,
				1.801958322525
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_03",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.6061041355133,
				3.4500207901001,
				2.7389376163483,
				2.9523124694824,
				3.0307500362396,
				4.1424584388733,
				1.6945416927338
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_parry_bright_wizard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_parry_bright_wizard_01",
				"pwh_gameplay_parry_bright_wizard_02",
				"pwh_gameplay_parry_bright_wizard_03",
				"pwh_gameplay_parry_bright_wizard_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.8990000486374,
				2.245854139328,
				1.8154582977295,
				1.9057916402817
			},
			localization_strings = {
				"pwh_gameplay_parry_bright_wizard_01",
				"pwh_gameplay_parry_bright_wizard_02",
				"pwh_gameplay_parry_bright_wizard_03",
				"pwh_gameplay_parry_bright_wizard_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_standard_bearer_has_planted_standard = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_standard_bearer_has_planted_standard_01",
				"pwh_gameplay_standard_bearer_has_planted_standard_02",
				"pwh_gameplay_standard_bearer_has_planted_standard_03",
				"pwh_gameplay_standard_bearer_has_planted_standard_04",
				"pwh_gameplay_standard_bearer_has_planted_standard_05",
				"pwh_gameplay_standard_bearer_has_planted_standard_06",
				"pwh_gameplay_standard_bearer_has_planted_standard_07",
				"pwh_gameplay_standard_bearer_has_planted_standard_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4369165897369,
				2.329916715622,
				1.8090208768845,
				1.438395857811,
				3.0170209407806,
				0.9695833325386,
				2.9594166278839,
				4.2018542289734
			},
			localization_strings = {
				"pwh_gameplay_standard_bearer_has_planted_standard_01",
				"pwh_gameplay_standard_bearer_has_planted_standard_02",
				"pwh_gameplay_standard_bearer_has_planted_standard_03",
				"pwh_gameplay_standard_bearer_has_planted_standard_04",
				"pwh_gameplay_standard_bearer_has_planted_standard_05",
				"pwh_gameplay_standard_bearer_has_planted_standard_06",
				"pwh_gameplay_standard_bearer_has_planted_standard_07",
				"pwh_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_this_way = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_objective_correct_path_this_way_01",
				"pwh_objective_correct_path_this_way_09",
				"pwh_objective_correct_path_this_way_10",
				"pwh_objective_correct_path_this_way_11",
				"pwh_objective_correct_path_this_way_12",
				"pwh_objective_correct_path_this_way_13",
				"pwh_objective_correct_path_this_way_14",
				"pwh_objective_correct_path_this_way_15"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				0.73887497186661,
				0.73887497186661,
				1.8776041269302,
				2.9721667766571,
				0.97504168748856,
				2.0875625610352,
				1.618604183197,
				2.2388124465942
			},
			localization_strings = {
				"pwh_objective_correct_path_this_way_01",
				"pwh_objective_correct_path_this_way_09",
				"pwh_objective_correct_path_this_way_10",
				"pwh_objective_correct_path_this_way_11",
				"pwh_objective_correct_path_this_way_12",
				"pwh_objective_correct_path_this_way_13",
				"pwh_objective_correct_path_this_way_14",
				"pwh_objective_correct_path_this_way_15"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_globadier = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_globadier_05",
				"pwh_gameplay_hearing_a_globadier_07",
				"pwh_gameplay_hearing_a_globadier_08",
				"pwh_gameplay_hearing_a_globadier_09",
				"pwh_gameplay_hearing_a_globadier_10",
				"pwh_gameplay_hearing_a_globadier_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				2.5040416717529,
				2.5040416717529,
				1.0317499637604,
				3.003187417984,
				1.5783125162125,
				1.7708125114441
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_globadier_05",
				"pwh_gameplay_hearing_a_globadier_07",
				"pwh_gameplay_hearing_a_globadier_08",
				"pwh_gameplay_hearing_a_globadier_09",
				"pwh_gameplay_hearing_a_globadier_10",
				"pwh_gameplay_hearing_a_globadier_11"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_down_01",
				"pwh_objective_correct_path_down_04",
				"pwh_objective_correct_path_down_05",
				"pwh_objective_correct_path_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				0.88570833206177,
				2.291895866394,
				0.88570833206177,
				1.6231249570847
			},
			localization_strings = {
				"pwh_objective_correct_path_down_01",
				"pwh_objective_correct_path_down_04",
				"pwh_objective_correct_path_down_05",
				"pwh_objective_correct_path_down_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_incoming_bestigor_attack = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_incoming_bestigor_attack_01",
				"pwh_gameplay_incoming_bestigor_attack_02",
				"pwh_gameplay_incoming_bestigor_attack_03",
				"pwh_gameplay_incoming_bestigor_attack_04",
				"pwh_gameplay_incoming_bestigor_attack_05",
				"pwh_gameplay_incoming_bestigor_attack_06",
				"pwh_gameplay_incoming_bestigor_attack_07",
				"pwh_gameplay_incoming_bestigor_attack_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.2001041173935,
				1.3939583301544,
				2.1601874828339,
				2.0955624580383,
				3.3510415554047,
				2.8340833187103,
				2.8248541355133,
				2.1048123836517
			},
			localization_strings = {
				"pwh_gameplay_incoming_bestigor_attack_01",
				"pwh_gameplay_incoming_bestigor_attack_02",
				"pwh_gameplay_incoming_bestigor_attack_03",
				"pwh_gameplay_incoming_bestigor_attack_04",
				"pwh_gameplay_incoming_bestigor_attack_05",
				"pwh_gameplay_incoming_bestigor_attack_06",
				"pwh_gameplay_incoming_bestigor_attack_07",
				"pwh_gameplay_incoming_bestigor_attack_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_wizard_leech_leeching_kruber = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_08",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_09",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.3907084465027,
				4.5535001754761,
				4.5359168052673,
				4.8847708702087,
				1.5736666917801,
				1.6411875486374,
				4.5175623893738,
				3.0813541412353,
				6.0658750534058,
				5.4525623321533
			},
			localization_strings = {
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_08",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_09",
				"pwh_gameplay_chaos_wizard_leech_leeching_kruber_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_warrior_champion = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_warrior_champion_01",
				"pwh_gameplay_killing_a_chaos_warrior_champion_02",
				"pwh_gameplay_killing_a_chaos_warrior_champion_03",
				"pwh_gameplay_killing_a_chaos_warrior_champion_04",
				"pwh_gameplay_killing_a_chaos_warrior_champion_05",
				"pwh_gameplay_killing_a_chaos_warrior_champion_06",
				"pwh_gameplay_killing_a_chaos_warrior_champion_07",
				"pwh_gameplay_killing_a_chaos_warrior_champion_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.0201873779297,
				4.4205207824707,
				4.0177292823792,
				3.5383958816528,
				3.6567499637604,
				3.9674582481384,
				3.3354375362396,
				5.098228931427
			},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_warrior_champion_01",
				"pwh_gameplay_killing_a_chaos_warrior_champion_02",
				"pwh_gameplay_killing_a_chaos_warrior_champion_03",
				"pwh_gameplay_killing_a_chaos_warrior_champion_04",
				"pwh_gameplay_killing_a_chaos_warrior_champion_05",
				"pwh_gameplay_killing_a_chaos_warrior_champion_06",
				"pwh_gameplay_killing_a_chaos_warrior_champion_07",
				"pwh_gameplay_killing_a_chaos_warrior_champion_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_wizard_leech_leeching_keriliian = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.8604998588562,
				4.6077289581299,
				4.4033126831055,
				4.0476665496826,
				1.5507500171661,
				1.6501666307449,
				4.4225206375122,
				4.4342918395996
			},
			localization_strings = {
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_keriliian_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_wizard_plague = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_plague_01",
				"pwh_gameplay_killing_a_chaos_wizard_plague_02",
				"pwh_gameplay_killing_a_chaos_wizard_plague_03",
				"pwh_gameplay_killing_a_chaos_wizard_plague_04",
				"pwh_gameplay_killing_a_chaos_wizard_plague_05",
				"pwh_gameplay_killing_a_chaos_wizard_plague_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.792603969574,
				1.8420833349228,
				3.5264167785645,
				3.6645624637604,
				2.0455000400543,
				1.4589375257492
			},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_plague_01",
				"pwh_gameplay_killing_a_chaos_wizard_plague_02",
				"pwh_gameplay_killing_a_chaos_wizard_plague_03",
				"pwh_gameplay_killing_a_chaos_wizard_plague_04",
				"pwh_gameplay_killing_a_chaos_wizard_plague_05",
				"pwh_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_grabbed = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_bright_wizard_grabbed_07",
				"pwh_gameplay_bright_wizard_grabbed_08",
				"pwh_gameplay_bright_wizard_grabbed_09",
				"pwh_gameplay_bright_wizard_grabbed_10",
				"pwh_gameplay_bright_wizard_grabbed_11",
				"pwh_gameplay_bright_wizard_grabbed_12",
				"pwh_gameplay_bright_wizard_grabbed_13",
				"pwh_gameplay_bright_wizard_grabbed_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.6546874046326,
				4.3280210494995,
				2.0783958435059,
				3.253666639328,
				3.5987708568573,
				1.9026666879654,
				3.4486875534058,
				2.8990833759308
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_grabbed_07",
				"pwh_gameplay_bright_wizard_grabbed_08",
				"pwh_gameplay_bright_wizard_grabbed_09",
				"pwh_gameplay_bright_wizard_grabbed_10",
				"pwh_gameplay_bright_wizard_grabbed_11",
				"pwh_gameplay_bright_wizard_grabbed_12",
				"pwh_gameplay_bright_wizard_grabbed_13",
				"pwh_gameplay_bright_wizard_grabbed_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bile_troll_incapacitaded = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_bile_troll_incapacitaded_01",
				"pwh_gameplay_bile_troll_incapacitaded_02",
				"pwh_gameplay_bile_troll_incapacitaded_03",
				"pwh_gameplay_bile_troll_incapacitaded_04",
				"pwh_gameplay_bile_troll_incapacitaded_05",
				"pwh_gameplay_bile_troll_incapacitaded_06",
				"pwh_gameplay_bile_troll_incapacitaded_07",
				"pwh_gameplay_bile_troll_incapacitaded_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.575812458992,
				2.693895816803,
				2.252249956131,
				2.9127707481384,
				2.8042500019074,
				2.2748334407806,
				2.7862083911896,
				2.1198332309723
			},
			localization_strings = {
				"pwh_gameplay_bile_troll_incapacitaded_01",
				"pwh_gameplay_bile_troll_incapacitaded_02",
				"pwh_gameplay_bile_troll_incapacitaded_03",
				"pwh_gameplay_bile_troll_incapacitaded_04",
				"pwh_gameplay_bile_troll_incapacitaded_05",
				"pwh_gameplay_bile_troll_incapacitaded_06",
				"pwh_gameplay_bile_troll_incapacitaded_07",
				"pwh_gameplay_bile_troll_incapacitaded_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_pm = {
			sound_events_n = 16,
			face_animations_n = 16,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 16,
			sound_events = {
				"pwh_gameplay_seeing_a_pm_01",
				"pwh_gameplay_seeing_a_pm_02",
				"pwh_gameplay_seeing_a_pm_03",
				"pwh_gameplay_seeing_a_pm_04",
				"pwh_gameplay_seeing_a_pm_05",
				"pwh_gameplay_seeing_a_pm_06",
				"pwh_gameplay_seeing_a_pm_07",
				"pwh_gameplay_seeing_a_pm_08",
				"pwh_gameplay_seeing_a_plague_monk_01",
				"pwh_gameplay_seeing_a_plague_monk_02",
				"pwh_gameplay_seeing_a_plague_monk_03",
				"pwh_gameplay_seeing_a_plague_monk_04",
				"pwh_gameplay_seeing_a_plague_monk_05",
				"pwh_gameplay_seeing_a_plague_monk_06",
				"pwh_gameplay_seeing_a_plague_monk_07",
				"pwh_gameplay_seeing_a_plague_monk_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.4630208015442,
				2.1943957805634,
				2.1659998893738,
				1.2449791431427,
				2.3848750591278,
				1.8627916574478,
				2.3168749809265,
				1.9154583215714,
				2.8594374656677,
				2.4032707214356,
				2.5563957691193,
				1.9938541650772,
				2.5190000534058,
				3.6631875038147,
				4.0663542747498,
				3.6199791431427
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_pm_01",
				"pwh_gameplay_seeing_a_pm_02",
				"pwh_gameplay_seeing_a_pm_03",
				"pwh_gameplay_seeing_a_pm_04",
				"pwh_gameplay_seeing_a_pm_05",
				"pwh_gameplay_seeing_a_pm_06",
				"pwh_gameplay_seeing_a_pm_07",
				"pwh_gameplay_seeing_a_pm_08",
				"pwh_gameplay_seeing_a_plague_monk_01",
				"pwh_gameplay_seeing_a_plague_monk_02",
				"pwh_gameplay_seeing_a_plague_monk_03",
				"pwh_gameplay_seeing_a_plague_monk_04",
				"pwh_gameplay_seeing_a_plague_monk_05",
				"pwh_gameplay_seeing_a_plague_monk_06",
				"pwh_gameplay_seeing_a_plague_monk_07",
				"pwh_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_low_on_health = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_gameplay_low_on_health_03",
				"pwh_gameplay_low_on_health_04",
				"pwh_gameplay_low_on_health_09",
				"pwh_gameplay_low_on_health_10",
				"pwh_gameplay_low_on_health_11",
				"pwh_gameplay_low_on_health_12",
				"pwh_gameplay_low_on_health_13",
				"pwh_gameplay_low_on_health_14",
				"pwh_gameplay_low_on_health_15",
				"pwh_gameplay_low_on_health_16"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			sound_events_duration = {
				5.2520418167114,
				2.6154582500458,
				5.2520418167114,
				2.6154582500458,
				2.723249912262,
				4.3913750648499,
				3.7060208320618,
				4.2663750648499,
				2.7368125915527,
				2.8518333435059
			},
			localization_strings = {
				"pwh_gameplay_low_on_health_03",
				"pwh_gameplay_low_on_health_04",
				"pwh_gameplay_low_on_health_09",
				"pwh_gameplay_low_on_health_10",
				"pwh_gameplay_low_on_health_11",
				"pwh_gameplay_low_on_health_12",
				"pwh_gameplay_low_on_health_13",
				"pwh_gameplay_low_on_health_14",
				"pwh_gameplay_low_on_health_15",
				"pwh_gameplay_low_on_health_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_friendly_fire_wood_elf = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_friendly_fire_wood_elf_05",
				"pwh_gameplay_friendly_fire_wood_elf_06",
				"pwh_gameplay_friendly_fire_wood_elf_07",
				"pwh_gameplay_friendly_fire_wood_elf_08",
				"pwh_gameplay_friendly_fire_wood_elf_09",
				"pwh_gameplay_healing_wood_elf_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				3.3699998855591,
				1.5162916183472,
				3.9025626182556,
				3.0087082386017,
				5.885666847229,
				5.3361248970032
			},
			localization_strings = {
				"pwh_gameplay_friendly_fire_wood_elf_05",
				"pwh_gameplay_friendly_fire_wood_elf_06",
				"pwh_gameplay_friendly_fire_wood_elf_07",
				"pwh_gameplay_friendly_fire_wood_elf_08",
				"pwh_gameplay_friendly_fire_wood_elf_09",
				"pwh_gameplay_healing_wood_elf_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_on_a_frenzy = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_wood_elf_on_a_frenzy_05",
				"pwh_gameplay_wood_elf_on_a_frenzy_06",
				"pwh_gameplay_wood_elf_on_a_frenzy_07",
				"pwh_gameplay_wood_elf_on_a_frenzy_08",
				"pwh_gameplay_wood_elf_on_a_frenzy_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.8623542785644,
				4.4180002212524,
				4.0006251335144,
				6.8399167060852,
				4.2823748588562
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_on_a_frenzy_05",
				"pwh_gameplay_wood_elf_on_a_frenzy_06",
				"pwh_gameplay_wood_elf_on_a_frenzy_07",
				"pwh_gameplay_wood_elf_on_a_frenzy_08",
				"pwh_gameplay_wood_elf_on_a_frenzy_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hit_by_goo = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_hit_by_goo_02",
				"pwh_gameplay_hit_by_goo_03",
				"pwh_gameplay_hit_by_goo_04",
				"pwh_gameplay_hit_by_goo_05",
				"pwh_gameplay_hit_by_goo_06",
				"pwh_gameplay_hit_by_goo_09",
				"pwh_gameplay_hit_by_goo_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				3.3486666679382,
				5.0411043167114,
				4.9018959999084,
				3.8349583148956,
				6.6524791717529,
				3.3486666679382,
				5.0411043167114
			},
			localization_strings = {
				"pwh_gameplay_hit_by_goo_02",
				"pwh_gameplay_hit_by_goo_03",
				"pwh_gameplay_hit_by_goo_04",
				"pwh_gameplay_hit_by_goo_05",
				"pwh_gameplay_hit_by_goo_06",
				"pwh_gameplay_hit_by_goo_09",
				"pwh_gameplay_hit_by_goo_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_special_enemy_kill_ranged = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_gameplay_special_enemy_kill_ranged_09",
				"pwh_gameplay_special_enemy_kill_ranged_10",
				"pwh_gameplay_special_enemy_kill_ranged_11",
				"pwh_gameplay_special_enemy_kill_ranged_12",
				"pwh_gameplay_special_enemy_kill_ranged_13",
				"pwh_gameplay_special_enemy_kill_ranged_14",
				"pwh_gameplay_special_enemy_kill_ranged_15",
				"pwh_gameplay_special_enemy_kill_ranged_16",
				"pwh_gameplay_special_enemy_kill_ranged_17",
				"pwh_gameplay_special_enemy_kill_ranged_18",
				"pwh_gameplay_special_enemy_kill_ranged_19",
				"pwh_gameplay_special_enemy_kill_ranged_20"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.3362292051315,
				1.2206666469574,
				2.5555624961853,
				1.9279999732971,
				2.615875005722,
				3.8482291698456,
				1.3589792251587,
				2.0645208358765,
				2.342916727066,
				1.2811458110809,
				2.2888958454132,
				2.6820209026337
			},
			localization_strings = {
				"pwh_gameplay_special_enemy_kill_ranged_09",
				"pwh_gameplay_special_enemy_kill_ranged_10",
				"pwh_gameplay_special_enemy_kill_ranged_11",
				"pwh_gameplay_special_enemy_kill_ranged_12",
				"pwh_gameplay_special_enemy_kill_ranged_13",
				"pwh_gameplay_special_enemy_kill_ranged_14",
				"pwh_gameplay_special_enemy_kill_ranged_15",
				"pwh_gameplay_special_enemy_kill_ranged_16",
				"pwh_gameplay_special_enemy_kill_ranged_17",
				"pwh_gameplay_special_enemy_kill_ranged_18",
				"pwh_gameplay_special_enemy_kill_ranged_19",
				"pwh_gameplay_special_enemy_kill_ranged_20"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_on_a_frenzy = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_08",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.3016042709351,
				3.5702917575836,
				3.9806876182556,
				4.1420831680298,
				3.7837707996368
			},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_08",
				"pwh_gameplay_dwarf_ranger_on_a_frenzy_09"
			},
			randomize_indexes = {}
		},
		pwh_spotting_ferry_lady = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_spotting_ferry_lady_01",
				"pwh_spotting_ferry_lady_02",
				"pwh_spotting_ferry_lady_03",
				"pwh_spotting_ferry_lady_04",
				"pwh_spotting_ferry_lady_05",
				"pwh_spotting_ferry_lady_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.0195000171661,
				1.8042291402817,
				3.3510415554047,
				2.0333750247955,
				1.1991041898727,
				3.0760624408722
			},
			localization_strings = {
				"pwh_spotting_ferry_lady_01",
				"pwh_spotting_ferry_lady_02",
				"pwh_spotting_ferry_lady_03",
				"pwh_spotting_ferry_lady_04",
				"pwh_spotting_ferry_lady_05",
				"pwh_spotting_ferry_lady_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_low_on_health = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_empire_soldier_low_on_health_01",
				"pwh_gameplay_empire_soldier_low_on_health_05",
				"pwh_gameplay_empire_soldier_low_on_health_06",
				"pwh_gameplay_empire_soldier_low_on_health_07",
				"pwh_gameplay_empire_soldier_low_on_health_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.4624999761581,
				1.4624999761581,
				2.9811251163483,
				2.6770207881927,
				3.6535415649414
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_low_on_health_01",
				"pwh_gameplay_empire_soldier_low_on_health_05",
				"pwh_gameplay_empire_soldier_low_on_health_06",
				"pwh_gameplay_empire_soldier_low_on_health_07",
				"pwh_gameplay_empire_soldier_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_wizard_leech = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_leech_01",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_02",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_05",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_07",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_08",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_09",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.1606041193008,
				1.2302500009537,
				2.3524792194366,
				2.0774583816528,
				1.5642083883286,
				2.7610416412353,
				2.1276667118073
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_leech_01",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_02",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_05",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_07",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_08",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_09",
				"pwh_gameplay_seeing_a_chaos_wizard_leech_10"
			},
			randomize_indexes = {}
		},
		pwh_targeted_by_ratling = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_targeted_by_ratling_09",
				"pwh_targeted_by_ratling_10",
				"pwh_targeted_by_ratling_11",
				"pwh_targeted_by_ratling_12",
				"pwh_targeted_by_ratling_13",
				"pwh_targeted_by_ratling_14",
				"pwh_targeted_by_ratling_15",
				"pwh_targeted_by_ratling_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.635958313942,
				3.2364583015442,
				2.8876457214356,
				2.053750038147,
				3.5420625209808,
				3.2923541069031,
				3.5194165706634,
				2.0946249961853
			},
			localization_strings = {
				"pwh_targeted_by_ratling_09",
				"pwh_targeted_by_ratling_10",
				"pwh_targeted_by_ratling_11",
				"pwh_targeted_by_ratling_12",
				"pwh_targeted_by_ratling_13",
				"pwh_targeted_by_ratling_14",
				"pwh_targeted_by_ratling_15",
				"pwh_targeted_by_ratling_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_07",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.6568332910538,
				1.1054791212082,
				1.3664166927338,
				1.7453541755676,
				2.2313957214356,
				1.1920416355133,
				2.152583360672,
				1.9820833206177
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_07",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_17"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.5091667175293,
				2.5721666812897,
				1.8954166173935,
				1.3892707824707,
				2.6639165878296,
				2.0757501125336,
				2.7604582309723,
				3.4648332595825,
				2.3984167575836,
				2.5656042098999
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_17"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_low_on_health = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_bright_wizard_low_on_health_05",
				"pwh_gameplay_bright_wizard_low_on_health_06",
				"pwh_gameplay_bright_wizard_low_on_health_07",
				"pwh_gameplay_bright_wizard_low_on_health_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.9483333826065,
				2.9688334465027,
				2.2873957157135,
				2.4161458015442
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_low_on_health_05",
				"pwh_gameplay_bright_wizard_low_on_health_06",
				"pwh_gameplay_bright_wizard_low_on_health_07",
				"pwh_gameplay_bright_wizard_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_friendly_fire_empire_soldier = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_friendly_fire_empire_soldier_04",
				"pwh_gameplay_friendly_fire_empire_soldier_05",
				"pwh_gameplay_friendly_fire_empire_soldier_06",
				"pwh_gameplay_friendly_fire_empire_soldier_07",
				"pwh_gameplay_friendly_fire_empire_soldier_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.3938541412353,
				2.3938541412353,
				2.7055833339691,
				2.8527915477753,
				2.0943541526794
			},
			localization_strings = {
				"pwh_gameplay_friendly_fire_empire_soldier_04",
				"pwh_gameplay_friendly_fire_empire_soldier_05",
				"pwh_gameplay_friendly_fire_empire_soldier_06",
				"pwh_gameplay_friendly_fire_empire_soldier_07",
				"pwh_gameplay_friendly_fire_empire_soldier_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_taking_heavy_damage = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_taking_heavy_damage_09",
				"pwh_gameplay_taking_heavy_damage_10",
				"pwh_gameplay_taking_heavy_damage_11",
				"pwh_gameplay_taking_heavy_damage_12",
				"pwh_gameplay_taking_heavy_damage_13",
				"pwh_gameplay_taking_heavy_damage_14",
				"pwh_gameplay_taking_heavy_damage_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			sound_events_duration = {
				2.9214792251587,
				3.1016042232513,
				2.3729374408722,
				1.3423124551773,
				1.7909166812897,
				3.3971457481384,
				2.8250207901001
			},
			localization_strings = {
				"pwh_gameplay_taking_heavy_damage_09",
				"pwh_gameplay_taking_heavy_damage_10",
				"pwh_gameplay_taking_heavy_damage_11",
				"pwh_gameplay_taking_heavy_damage_12",
				"pwh_gameplay_taking_heavy_damage_13",
				"pwh_gameplay_taking_heavy_damage_14",
				"pwh_gameplay_taking_heavy_damage_15"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_wind = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_01",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_02",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_07",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.5466666221619,
				3.3521249294281,
				3.60902094841,
				4.0590834617615,
				1.7508125305176,
				1.57712495327,
				2.1300625801086,
				2.4142708778381
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_01",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_02",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_07",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_weapon_flair_defensive = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_activating_magic_weapon_defensive_01",
				"pwh_gameplay_activating_magic_weapon_defensive_02",
				"pwh_gameplay_activating_magic_weapon_defensive_03",
				"pwh_gameplay_activating_magic_weapon_defensive_04",
				"pwh_gameplay_activating_magic_weapon_defensive_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.4855208396912,
				2.7033751010895,
				1.6977916955948,
				1.6824791431427,
				2.6179165840149
			},
			localization_strings = {
				"pwh_gameplay_activating_magic_weapon_defensive_01",
				"pwh_gameplay_activating_magic_weapon_defensive_02",
				"pwh_gameplay_activating_magic_weapon_defensive_03",
				"pwh_gameplay_activating_magic_weapon_defensive_04",
				"pwh_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_lootrat = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_killing_lootrat_01",
				"pwh_gameplay_killing_lootrat_04",
				"pwh_gameplay_killing_lootrat_05",
				"pwh_gameplay_killing_lootrat_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.5474791526794,
				1.8021041154861,
				1.5474791526794,
				1.8021041154861
			},
			localization_strings = {
				"pwh_gameplay_killing_lootrat_01",
				"pwh_gameplay_killing_lootrat_04",
				"pwh_gameplay_killing_lootrat_05",
				"pwh_gameplay_killing_lootrat_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_standard_bearer_crater = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_standard_bearer_01",
				"pwh_gameplay_hearing_a_standard_bearer_02",
				"pwh_gameplay_hearing_a_standard_bearer_03",
				"pwh_gameplay_hearing_a_standard_bearer_04",
				"pwh_gameplay_hearing_a_standard_bearer_05",
				"pwh_gameplay_hearing_a_standard_bearer_06",
				"pwh_gameplay_hearing_a_standard_bearer_combat_04",
				"pwh_gameplay_hearing_a_standard_bearer_combat_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.1923749446869,
				2.2140417098999,
				1.8961666822434,
				3.1392917633057,
				1.788541674614,
				3.763729095459,
				2.5365207195282,
				3.7634999752045
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_standard_bearer_01",
				"pwh_gameplay_hearing_a_standard_bearer_02",
				"pwh_gameplay_hearing_a_standard_bearer_03",
				"pwh_gameplay_hearing_a_standard_bearer_04",
				"pwh_gameplay_hearing_a_standard_bearer_05",
				"pwh_gameplay_hearing_a_standard_bearer_06",
				"pwh_gameplay_hearing_a_standard_bearer_combat_04",
				"pwh_gameplay_hearing_a_standard_bearer_combat_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_armoured_enemy_wood_elf = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_armoured_enemy_wood_elf_04",
				"pwh_gameplay_armoured_enemy_wood_elf_05",
				"pwh_gameplay_armoured_enemy_wood_elf_06",
				"pwh_gameplay_armoured_enemy_wood_elf_07",
				"pwh_gameplay_armoured_enemy_wood_elf_08",
				"pwh_gameplay_armoured_enemy_wood_elf_09",
				"pwh_gameplay_armoured_enemy_wood_elf_10",
				"pwh_gameplay_armoured_enemy_wood_elf_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4012498855591,
				3.1709792613983,
				5.0137500762939,
				3.0319583415985,
				2.4046666622162,
				3.5645208358765,
				3.2009792327881,
				3.1575000286102
			},
			localization_strings = {
				"pwh_gameplay_armoured_enemy_wood_elf_04",
				"pwh_gameplay_armoured_enemy_wood_elf_05",
				"pwh_gameplay_armoured_enemy_wood_elf_06",
				"pwh_gameplay_armoured_enemy_wood_elf_07",
				"pwh_gameplay_armoured_enemy_wood_elf_08",
				"pwh_gameplay_armoured_enemy_wood_elf_09",
				"pwh_gameplay_armoured_enemy_wood_elf_10",
				"pwh_gameplay_armoured_enemy_wood_elf_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_standard_bearer_has_planted_standard_crater = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_standard_bearer_has_planted_standard_01",
				"pwh_gameplay_standard_bearer_has_planted_standard_02",
				"pwh_gameplay_standard_bearer_has_planted_standard_03",
				"pwh_gameplay_standard_bearer_has_planted_standard_04",
				"pwh_gameplay_standard_bearer_has_planted_standard_05",
				"pwh_gameplay_standard_bearer_has_planted_standard_06",
				"pwh_gameplay_standard_bearer_has_planted_standard_07",
				"pwh_gameplay_standard_bearer_has_planted_standard_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4369165897369,
				2.329916715622,
				1.8090208768845,
				1.438395857811,
				3.0170209407806,
				0.9695833325386,
				2.9594166278839,
				4.2018542289734
			},
			localization_strings = {
				"pwh_gameplay_standard_bearer_has_planted_standard_01",
				"pwh_gameplay_standard_bearer_has_planted_standard_02",
				"pwh_gameplay_standard_bearer_has_planted_standard_03",
				"pwh_gameplay_standard_bearer_has_planted_standard_04",
				"pwh_gameplay_standard_bearer_has_planted_standard_05",
				"pwh_gameplay_standard_bearer_has_planted_standard_06",
				"pwh_gameplay_standard_bearer_has_planted_standard_07",
				"pwh_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_gutterrunner = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_killing_gutterrunner_05",
				"pwh_gameplay_killing_gutterrunner_06",
				"pwh_gameplay_killing_gutterrunner_07",
				"pwh_gameplay_killing_gutterrunner_08",
				"pwh_gameplay_killing_gutterrunner_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.8826249837875,
				1.8826249837875,
				2.4307708740234,
				3.240770816803,
				2.0192499160767
			},
			localization_strings = {
				"pwh_gameplay_killing_gutterrunner_05",
				"pwh_gameplay_killing_gutterrunner_06",
				"pwh_gameplay_killing_gutterrunner_07",
				"pwh_gameplay_killing_gutterrunner_08",
				"pwh_gameplay_killing_gutterrunner_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_healing_bright_wizard = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_healing_bright_wizard_02",
				"pwh_gameplay_healing_bright_wizard_05",
				"pwh_gameplay_healing_bright_wizard_06",
				"pwh_gameplay_healing_bright_wizard_07",
				"pwh_gameplay_healing_bright_wizard_08",
				"pwh_gameplay_healing_bright_wizard_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.9588332176209,
				3.9588332176209,
				3.4568123817444,
				2.341020822525,
				2.6422083377838,
				3.8699584007263
			},
			localization_strings = {
				"pwh_gameplay_healing_bright_wizard_02",
				"pwh_gameplay_healing_bright_wizard_05",
				"pwh_gameplay_healing_bright_wizard_06",
				"pwh_gameplay_healing_bright_wizard_07",
				"pwh_gameplay_healing_bright_wizard_08",
				"pwh_gameplay_healing_bright_wizard_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_dwarf_ranger_in_trouble = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.5520207881927,
				2.3819582462311,
				2.0021457672119,
				2.8156666755676
			},
			localization_strings = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_player_pounced = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				7.6838126182556,
				3.0750417709351,
				3.7804374694824,
				4.1342916488647,
				7.6838126182556,
				3.0750417709351,
				3.7804374694824,
				4.1342916488647,
				2.5830624103546
			},
			localization_strings = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_gutter_runner = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_06",
				"pwh_gameplay_seeing_a_gutter_runner_07",
				"pwh_gameplay_seeing_a_gutter_runner_08",
				"pwh_gameplay_seeing_a_gutter_runner_09",
				"pwh_gameplay_seeing_a_gutter_runner_10",
				"pwh_gameplay_seeing_a_gutter_runner_11",
				"pwh_gameplay_seeing_a_gutter_runner_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.1499999761581,
				1.5026041269302,
				1.3225833177566,
				1.1653333902359,
				1.1499999761581,
				1.5026041269302,
				1.3225833177566,
				1.1653333902359
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_06",
				"pwh_gameplay_seeing_a_gutter_runner_07",
				"pwh_gameplay_seeing_a_gutter_runner_08",
				"pwh_gameplay_seeing_a_gutter_runner_09",
				"pwh_gameplay_seeing_a_gutter_runner_10",
				"pwh_gameplay_seeing_a_gutter_runner_11",
				"pwh_gameplay_seeing_a_gutter_runner_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_slaver = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_Skaven_slaver_09",
				"pwh_gameplay_seeing_a_Skaven_slaver_10",
				"pwh_gameplay_seeing_a_Skaven_slaver_11",
				"pwh_gameplay_seeing_a_Skaven_slaver_12",
				"pwh_gameplay_seeing_a_Skaven_slaver_13",
				"pwh_gameplay_seeing_a_Skaven_slaver_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				0.73816668987274,
				3.4567,
				1.5451874732971,
				1.1246249675751,
				1.4156249761581,
				1.7093750238419,
				2.2270834445953
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_Skaven_slaver_09",
				"pwh_gameplay_seeing_a_Skaven_slaver_10",
				"pwh_gameplay_seeing_a_Skaven_slaver_11",
				"pwh_gameplay_seeing_a_Skaven_slaver_12",
				"pwh_gameplay_seeing_a_Skaven_slaver_13",
				"pwh_gameplay_seeing_a_Skaven_slaver_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_out_of_ammo = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_out_of_ammo_04",
				"pwh_gameplay_out_of_ammo_05",
				"pwh_gameplay_out_of_ammo_06",
				"pwh_gameplay_out_of_ammo_07",
				"pwh_gameplay_out_of_ammo_08",
				"pwh_gameplay_out_of_ammo_09",
				"pwh_gameplay_out_of_ammo_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				0.70027083158493,
				1.5856041908264,
				0.70027083158493,
				1.5856041908264,
				1.5100208520889,
				2.401624917984,
				1.6210833787918
			},
			localization_strings = {
				"pwh_gameplay_out_of_ammo_04",
				"pwh_gameplay_out_of_ammo_05",
				"pwh_gameplay_out_of_ammo_06",
				"pwh_gameplay_out_of_ammo_07",
				"pwh_gameplay_out_of_ammo_08",
				"pwh_gameplay_out_of_ammo_09",
				"pwh_gameplay_out_of_ammo_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_being_helped_up_05",
				"pwh_gameplay_dwarf_ranger_being_helped_up_06",
				"pwh_gameplay_dwarf_ranger_being_helped_up_07",
				"pwh_gameplay_dwarf_ranger_being_helped_up_08",
				"pwh_gameplay_dwarf_ranger_being_helped_up_09",
				"pwh_gameplay_dwarf_ranger_being_helped_up_10",
				"pwh_gameplay_dwarf_ranger_being_helped_up_11",
				"pwh_gameplay_dwarf_ranger_being_helped_up_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4245417118073,
				2.4348957538605,
				4.1490001678467,
				3.5600209236145,
				1.9294791221619,
				2.4999165534973,
				3.6836874485016,
				3.3026041984558
			},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_being_helped_up_05",
				"pwh_gameplay_dwarf_ranger_being_helped_up_06",
				"pwh_gameplay_dwarf_ranger_being_helped_up_07",
				"pwh_gameplay_dwarf_ranger_being_helped_up_08",
				"pwh_gameplay_dwarf_ranger_being_helped_up_09",
				"pwh_gameplay_dwarf_ranger_being_helped_up_10",
				"pwh_gameplay_dwarf_ranger_being_helped_up_11",
				"pwh_gameplay_dwarf_ranger_being_helped_up_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_helped_by_empire_soldier = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_helped_by_empire_soldier_05",
				"pwh_gameplay_helped_by_empire_soldier_06",
				"pwh_gameplay_helped_by_empire_soldier_07",
				"pwh_gameplay_helped_by_empire_soldier_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.8230625391007,
				3.5883123874664,
				2.3576667308807,
				1.6251250505447
			},
			localization_strings = {
				"pwh_gameplay_helped_by_empire_soldier_05",
				"pwh_gameplay_helped_by_empire_soldier_06",
				"pwh_gameplay_helped_by_empire_soldier_07",
				"pwh_gameplay_helped_by_empire_soldier_11"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_alley = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_alley_01",
				"pwh_objective_correct_path_alley_02",
				"pwh_objective_correct_path_alley_03",
				"pwh_objective_correct_path_alley_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.262416601181,
				1.5025833845139,
				1.9827500581741,
				1.2842708826065
			},
			localization_strings = {
				"pwh_objective_correct_path_alley_01",
				"pwh_objective_correct_path_alley_02",
				"pwh_objective_correct_path_alley_03",
				"pwh_objective_correct_path_alley_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_healing_dwarf_ranger = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_healing_dwarf_ranger_03",
				"pwh_gameplay_healing_dwarf_ranger_04",
				"pwh_gameplay_healing_dwarf_ranger_05",
				"pwh_gameplay_healing_dwarf_ranger_06",
				"pwh_gameplay_healing_dwarf_ranger_07",
				"pwh_gameplay_healing_dwarf_ranger_08",
				"pwh_gameplay_healing_dwarf_ranger_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.8657499551773,
				3.3627290725708,
				1.8657499551773,
				3.3627290725708,
				2.2356667518616,
				2.2901666164398,
				5.3768539428711
			},
			localization_strings = {
				"pwh_gameplay_healing_dwarf_ranger_03",
				"pwh_gameplay_healing_dwarf_ranger_04",
				"pwh_gameplay_healing_dwarf_ranger_05",
				"pwh_gameplay_healing_dwarf_ranger_06",
				"pwh_gameplay_healing_dwarf_ranger_07",
				"pwh_gameplay_healing_dwarf_ranger_08",
				"pwh_gameplay_healing_dwarf_ranger_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_special_enemy_kill_melee = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 15,
			sound_events = {
				"pwh_gameplay_special_enemy_kill_melee_09",
				"pwh_gameplay_special_enemy_kill_melee_10",
				"pwh_gameplay_special_enemy_kill_melee_11",
				"pwh_gameplay_special_enemy_kill_melee_12",
				"pwh_gameplay_special_enemy_kill_melee_13",
				"pwh_gameplay_special_enemy_kill_melee_14",
				"pwh_gameplay_special_enemy_kill_melee_15",
				"pwh_gameplay_special_enemy_kill_melee_16",
				"pwh_gameplay_special_enemy_kill_melee_17",
				"pwh_gameplay_special_enemy_kill_melee_18",
				"pwh_gameplay_special_enemy_kill_melee_19",
				"pwh_gameplay_special_enemy_kill_melee_20",
				"pwh_gameplay_special_enemy_kill_melee_21",
				"pwh_gameplay_special_enemy_kill_melee_22",
				"pwh_gameplay_special_enemy_kill_melee_23"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.5544791221619,
				1.7775624990463,
				2.2608542442322,
				1.9527916908264,
				2.841979265213,
				1.6986042261124,
				3.1780624389648,
				3.3527290821075,
				1.6491249799728,
				2.4849166870117,
				2.442104101181,
				2.1051459312439,
				2.8769373893738,
				3.3775417804718,
				2.8551874160767
			},
			localization_strings = {
				"pwh_gameplay_special_enemy_kill_melee_09",
				"pwh_gameplay_special_enemy_kill_melee_10",
				"pwh_gameplay_special_enemy_kill_melee_11",
				"pwh_gameplay_special_enemy_kill_melee_12",
				"pwh_gameplay_special_enemy_kill_melee_13",
				"pwh_gameplay_special_enemy_kill_melee_14",
				"pwh_gameplay_special_enemy_kill_melee_15",
				"pwh_gameplay_special_enemy_kill_melee_16",
				"pwh_gameplay_special_enemy_kill_melee_17",
				"pwh_gameplay_special_enemy_kill_melee_18",
				"pwh_gameplay_special_enemy_kill_melee_19",
				"pwh_gameplay_special_enemy_kill_melee_20",
				"pwh_gameplay_special_enemy_kill_melee_21",
				"pwh_gameplay_special_enemy_kill_melee_22",
				"pwh_gameplay_special_enemy_kill_melee_23"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_throwing_bomb = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_throwing_bomb_01",
				"pwh_gameplay_throwing_bomb_06",
				"pwh_gameplay_throwing_bomb_07",
				"pwh_gameplay_throwing_bomb_08",
				"pwh_gameplay_throwing_bomb_09"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				0.98325002193451,
				0.90381252765655,
				0.9190416932106,
				1.5736042261124,
				1.6831874847412
			},
			localization_strings = {
				"pwh_gameplay_throwing_bomb_01",
				"pwh_gameplay_throwing_bomb_06",
				"pwh_gameplay_throwing_bomb_07",
				"pwh_gameplay_throwing_bomb_08",
				"pwh_gameplay_throwing_bomb_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_dead = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_empire_soldier_dead_01",
				"pwh_gameplay_empire_soldier_dead_05",
				"pwh_gameplay_empire_soldier_dead_06",
				"pwh_gameplay_empire_soldier_dead_07",
				"pwh_gameplay_empire_soldier_dead_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.9798958301544,
				1.9798958301544,
				4.2101459503174,
				3.7143332958221,
				3.0071249008179
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_dead_01",
				"pwh_gameplay_empire_soldier_dead_05",
				"pwh_gameplay_empire_soldier_dead_06",
				"pwh_gameplay_empire_soldier_dead_07",
				"pwh_gameplay_empire_soldier_dead_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_wizard_leech_leeching_sienna = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4477291107178,
				4.5284581184387,
				4.2370414733887,
				1.8017916679382,
				1.8082499504089,
				2.0901875495911,
				4.5482292175293,
				4.1311459541321
			},
			localization_strings = {
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_sienna_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_pm_in_combat = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_gameplay_hearing_a_pm_in_combat_01",
				"pwh_gameplay_hearing_a_pm_in_combat_02",
				"pwh_gameplay_hearing_a_pm_in_combat_03",
				"pwh_gameplay_hearing_a_pm_in_combat_04",
				"pwh_gameplay_hearing_a_plague_monk_combat_01",
				"pwh_gameplay_hearing_a_plague_monk_combat_02",
				"pwh_gameplay_hearing_a_plague_monk_combat_03",
				"pwh_gameplay_hearing_a_plague_monk_combat_04",
				"pwh_gameplay_hearing_a_plague_monk_combat_05",
				"pwh_gameplay_hearing_a_plague_monk_combat_06",
				"pwh_gameplay_hearing_a_plague_monk_combat_07",
				"pwh_gameplay_hearing_a_plague_monk_combat_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.4579792022705,
				1.6293958425522,
				1.5685416460037,
				2.3201041221619,
				1.2856249809265,
				2.2950832843781,
				1.5780625343323,
				1.3232707977295,
				2.1643126010895,
				1.5085417032242,
				1.6605833768845,
				1.6614583730698
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_pm_in_combat_01",
				"pwh_gameplay_hearing_a_pm_in_combat_02",
				"pwh_gameplay_hearing_a_pm_in_combat_03",
				"pwh_gameplay_hearing_a_pm_in_combat_04",
				"pwh_gameplay_hearing_a_plague_monk_combat_01",
				"pwh_gameplay_hearing_a_plague_monk_combat_02",
				"pwh_gameplay_hearing_a_plague_monk_combat_03",
				"pwh_gameplay_hearing_a_plague_monk_combat_04",
				"pwh_gameplay_hearing_a_plague_monk_combat_05",
				"pwh_gameplay_hearing_a_plague_monk_combat_06",
				"pwh_gameplay_hearing_a_plague_monk_combat_07",
				"pwh_gameplay_hearing_a_plague_monk_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_ammo = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_06",
				"pwh_gameplay_spots_ammo_07",
				"pwh_gameplay_spots_ammo_08",
				"pwh_gameplay_spots_ammo_09",
				"pwh_gameplay_spots_ammo_10",
				"pwh_gameplay_spots_ammo_11",
				"pwh_gameplay_spots_ammo_12",
				"pwh_gameplay_spots_ammo_13",
				"pwh_gameplay_spots_ammo_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				0.78841668367386,
				0.78841668367386,
				1.3619791269302,
				3.591854095459,
				2.9074375629425,
				2.5953750610352,
				2.0797290802002,
				2.5508124828339,
				2.2433750629425,
				2.7019374370575
			},
			localization_strings = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_06",
				"pwh_gameplay_spots_ammo_07",
				"pwh_gameplay_spots_ammo_08",
				"pwh_gameplay_spots_ammo_09",
				"pwh_gameplay_spots_ammo_10",
				"pwh_gameplay_spots_ammo_11",
				"pwh_gameplay_spots_ammo_12",
				"pwh_gameplay_spots_ammo_13",
				"pwh_gameplay_spots_ammo_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_bright_wizard_in_trouble = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_bright_wizard_in_trouble_04",
				"pwh_gameplay_heard_bright_wizard_in_trouble_05",
				"pwh_gameplay_heard_bright_wizard_in_trouble_06",
				"pwh_gameplay_heard_bright_wizard_in_trouble_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.7128541469574,
				1.7128541469574,
				1.81931245327,
				2.7918748855591
			},
			localization_strings = {
				"pwh_gameplay_heard_bright_wizard_in_trouble_04",
				"pwh_gameplay_heard_bright_wizard_in_trouble_05",
				"pwh_gameplay_heard_bright_wizard_in_trouble_06",
				"pwh_gameplay_heard_bright_wizard_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_health = {
			sound_events_n = 14,
			face_animations_n = 14,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 14,
			sound_events = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.5,
				1.1868958473206,
				2.5612082481384,
				2.2792291641235,
				1.8147916793823,
				1.974312543869,
				1.9256666898727,
				3.2132709026337,
				1.3126041889191,
				2.1138124465942,
				2.8836250305176,
				3.6013123989105,
				1.733958363533,
				2.0114998817444
			},
			localization_strings = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_incoming_globadier = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_incoming_globadier_01",
				"pwh_gameplay_incoming_globadier_02",
				"pwh_gameplay_incoming_globadier_03",
				"pwh_gameplay_incoming_globadier_04",
				"pwh_gameplay_incoming_globadier_05",
				"pwh_gameplay_incoming_globadier_06",
				"pwh_gameplay_incoming_globadier_07",
				"pwh_gameplay_incoming_globadier_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.3121249675751,
				1.5479375123978,
				1.8962708711624,
				3.5454375743866,
				3.4857499599457,
				1.8228125572205,
				2.0323958396912,
				2.1307291984558
			},
			localization_strings = {
				"pwh_gameplay_incoming_globadier_01",
				"pwh_gameplay_incoming_globadier_02",
				"pwh_gameplay_incoming_globadier_03",
				"pwh_gameplay_incoming_globadier_04",
				"pwh_gameplay_incoming_globadier_05",
				"pwh_gameplay_incoming_globadier_06",
				"pwh_gameplay_incoming_globadier_07",
				"pwh_gameplay_incoming_globadier_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_healing_empire_soldier = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_healing_empire_soldier_05",
				"pwh_gameplay_healing_empire_soldier_06",
				"pwh_gameplay_healing_empire_soldier_07",
				"pwh_gameplay_healing_empire_soldier_08",
				"pwh_gameplay_healing_empire_soldier_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.2458333969116,
				1.7514791488648,
				2.1439583301544,
				2.4165415763855,
				2.8800625801086
			},
			localization_strings = {
				"pwh_gameplay_healing_empire_soldier_05",
				"pwh_gameplay_healing_empire_soldier_06",
				"pwh_gameplay_healing_empire_soldier_07",
				"pwh_gameplay_healing_empire_soldier_08",
				"pwh_gameplay_healing_empire_soldier_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_knocked_down = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06",
				"pwh_gameplay_knocked_down_07",
				"pwh_gameplay_knocked_down_08",
				"pwh_gameplay_knocked_down_09",
				"pwh_gameplay_knocked_down_10",
				"pwh_gameplay_knocked_down_11"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			sound_events_duration = {
				1.3382083177566,
				1.4846249818802,
				2.2484166622162,
				3.4016666412353,
				1.5121250152588,
				1.3382083177566,
				1.4846249818802,
				2.2484166622162
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06",
				"pwh_gameplay_knocked_down_07",
				"pwh_gameplay_knocked_down_08",
				"pwh_gameplay_knocked_down_09",
				"pwh_gameplay_knocked_down_10",
				"pwh_gameplay_knocked_down_11"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_ladder_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_ladder_down_01",
				"pwh_objective_correct_path_ladder_down_02",
				"pwh_objective_correct_path_ladder_down_03",
				"pwh_objective_correct_path_ladder_down_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.3366874456406,
				2.1471457481384,
				1.6487292051315,
				3.7061457633972
			},
			localization_strings = {
				"pwh_objective_correct_path_ladder_down_01",
				"pwh_objective_correct_path_ladder_down_02",
				"pwh_objective_correct_path_ladder_down_03",
				"pwh_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_eaten = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_wood_elf_eaten_01",
				"pwh_wood_elf_eaten_02",
				"pwh_wood_elf_eaten_03",
				"pwh_wood_elf_eaten_04",
				"pwh_wood_elf_eaten_05",
				"pwh_wood_elf_eaten_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				6.2427916526794,
				6.5550208091736,
				6.0285210609436,
				6.8377289772034,
				9.805624961853,
				4.3017082214356
			},
			localization_strings = {
				"pwh_wood_elf_eaten_01",
				"pwh_wood_elf_eaten_02",
				"pwh_wood_elf_eaten_03",
				"pwh_wood_elf_eaten_04",
				"pwh_wood_elf_eaten_05",
				"pwh_wood_elf_eaten_06"
			},
			randomize_indexes = {}
		},
		pwh_activate_ability_zealot = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_activate_ability_zealot_01",
				"pwh_activate_ability_zealot_02",
				"pwh_activate_ability_zealot_03",
				"pwh_activate_ability_zealot_04",
				"pwh_activate_ability_zealot_05",
				"pwh_activate_ability_zealot_06",
				"pwh_activate_ability_zealot_11",
				"pwh_activate_ability_zealot_12",
				"pwh_activate_ability_zealot_13",
				"pwh_activate_ability_zealot_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.8398333787918,
				2.5024375915527,
				2.2073957920074,
				1.8702708482742,
				2.6938333511352,
				1.8445416688919,
				2.3204584121704,
				3.3400626182556,
				4.5431876182556,
				5.2194375991821
			},
			localization_strings = {
				"pwh_activate_ability_zealot_01",
				"pwh_activate_ability_zealot_02",
				"pwh_activate_ability_zealot_03",
				"pwh_activate_ability_zealot_04",
				"pwh_activate_ability_zealot_05",
				"pwh_activate_ability_zealot_06",
				"pwh_activate_ability_zealot_11",
				"pwh_activate_ability_zealot_12",
				"pwh_activate_ability_zealot_13",
				"pwh_activate_ability_zealot_14"
			},
			randomize_indexes = {}
		},
		pwh_objective_picking_up_grimoire = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_objective_picking_up_grimoire_01",
				"pwh_objective_picking_up_grimoire_02",
				"pwh_objective_picking_up_grimoire_03",
				"pwh_objective_picking_up_grimoire_04",
				"pwh_objective_picking_up_grimoire_05",
				"pwh_objective_picking_up_grimoire_06",
				"pwh_objective_picking_up_grimoire_07",
				"pwh_objective_picking_up_grimoire_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.470062494278,
				2.8498749732971,
				4.7648334503174,
				3.289895772934,
				2.4985415935516,
				4.0366249084473,
				5.1354999542236,
				4.1471042633057
			},
			localization_strings = {
				"pwh_objective_picking_up_grimoire_01",
				"pwh_objective_picking_up_grimoire_02",
				"pwh_objective_picking_up_grimoire_03",
				"pwh_objective_picking_up_grimoire_04",
				"pwh_objective_picking_up_grimoire_05",
				"pwh_objective_picking_up_grimoire_06",
				"pwh_objective_picking_up_grimoire_07",
				"pwh_objective_picking_up_grimoire_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_ungor_archer = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_ungor_archer_01",
				"pwh_gameplay_seeing_a_ungor_archer_02",
				"pwh_gameplay_seeing_a_ungor_archer_03",
				"pwh_gameplay_seeing_a_ungor_archer_04",
				"pwh_gameplay_seeing_a_ungor_archer_05",
				"pwh_gameplay_seeing_a_ungor_archer_06",
				"pwh_gameplay_seeing_a_ungor_archer_07",
				"pwh_gameplay_seeing_a_ungor_archer_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.1631875038147,
				2.298666715622,
				2.1324791908264,
				1.9478750228882,
				2.8248541355133,
				2.9171667098999,
				1.45858335495,
				2.5017499923706
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_ungor_archer_01",
				"pwh_gameplay_seeing_a_ungor_archer_02",
				"pwh_gameplay_seeing_a_ungor_archer_03",
				"pwh_gameplay_seeing_a_ungor_archer_04",
				"pwh_gameplay_seeing_a_ungor_archer_05",
				"pwh_gameplay_seeing_a_ungor_archer_06",
				"pwh_gameplay_seeing_a_ungor_archer_07",
				"pwh_gameplay_seeing_a_ungor_archer_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_warrior_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_warrior_combat_01",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_02",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_03",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_04",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_05",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_06",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_07",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.0930207967758,
				1.2835416793823,
				1.7139791250229,
				1.5832916498184,
				2.4128124713898,
				2.8318123817444,
				2.5357916355133,
				2.2198333740234
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_warrior_combat_01",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_02",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_03",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_04",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_05",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_06",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_07",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_minotaur = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_minotaur_01",
				"pwh_gameplay_killing_a_minotaur_02",
				"pwh_gameplay_killing_a_minotaur_03",
				"pwh_gameplay_killing_a_minotaur_04",
				"pwh_gameplay_killing_a_minotaur_05",
				"pwh_gameplay_killing_a_minotaur_06",
				"pwh_gameplay_killing_a_minotaur_07",
				"pwh_gameplay_killing_a_minotaur_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.249520778656,
				2.9817917346954,
				3.0094792842865,
				5.7328124046326,
				4.8835000991821,
				5.2619791030884,
				3.8218750953674,
				3.9326667785645
			},
			localization_strings = {
				"pwh_gameplay_killing_a_minotaur_01",
				"pwh_gameplay_killing_a_minotaur_02",
				"pwh_gameplay_killing_a_minotaur_03",
				"pwh_gameplay_killing_a_minotaur_04",
				"pwh_gameplay_killing_a_minotaur_05",
				"pwh_gameplay_killing_a_minotaur_06",
				"pwh_gameplay_killing_a_minotaur_07",
				"pwh_gameplay_killing_a_minotaur_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_minotaur = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_minotaur_01",
				"pwh_gameplay_hearing_a_minotaur_02",
				"pwh_gameplay_hearing_a_minotaur_03",
				"pwh_gameplay_hearing_a_minotaur_04",
				"pwh_gameplay_hearing_a_minotaur_05",
				"pwh_gameplay_hearing_a_minotaur_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.7879374027252,
				2.6402292251587,
				3.157208442688,
				2.5848541259766,
				2.6771457195282,
				3.7295625209808
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_minotaur_01",
				"pwh_gameplay_hearing_a_minotaur_02",
				"pwh_gameplay_hearing_a_minotaur_03",
				"pwh_gameplay_hearing_a_minotaur_04",
				"pwh_gameplay_hearing_a_minotaur_05",
				"pwh_gameplay_hearing_a_minotaur_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_standard_bearer_buff_deactivated = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_standard_bearer_buff_deactivated_01",
				"pwh_gameplay_standard_bearer_buff_deactivated_02",
				"pwh_gameplay_standard_bearer_buff_deactivated_03",
				"pwh_gameplay_standard_bearer_buff_deactivated_04",
				"pwh_gameplay_standard_bearer_buff_deactivated_05",
				"pwh_gameplay_standard_bearer_buff_deactivated_06",
				"pwh_gameplay_standard_bearer_buff_deactivated_07",
				"pwh_gameplay_standard_bearer_buff_deactivated_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4433751106262,
				2.6033124923706,
				2.4371249675751,
				2.0401875972748,
				4.1911458969116,
				3.8495624065399,
				3.055645942688,
				3.6003124713898
			},
			localization_strings = {
				"pwh_gameplay_standard_bearer_buff_deactivated_01",
				"pwh_gameplay_standard_bearer_buff_deactivated_02",
				"pwh_gameplay_standard_bearer_buff_deactivated_03",
				"pwh_gameplay_standard_bearer_buff_deactivated_04",
				"pwh_gameplay_standard_bearer_buff_deactivated_05",
				"pwh_gameplay_standard_bearer_buff_deactivated_06",
				"pwh_gameplay_standard_bearer_buff_deactivated_07",
				"pwh_gameplay_standard_bearer_buff_deactivated_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_standard_bearer_buff_active = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_standard_bearer_buff_active_01",
				"pwh_gameplay_standard_bearer_buff_active_02",
				"pwh_gameplay_standard_bearer_buff_active_03",
				"pwh_gameplay_standard_bearer_buff_active_04",
				"pwh_gameplay_standard_bearer_buff_active_05",
				"pwh_gameplay_standard_bearer_buff_active_06",
				"pwh_gameplay_standard_bearer_buff_active_07",
				"pwh_gameplay_standard_bearer_buff_active_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.6878125667572,
				3.4357082843781,
				3.3016874790192,
				2.0818123817444,
				1.7705625295639,
				2.2893958091736,
				3.3702917098999,
				3.8271458148956
			},
			localization_strings = {
				"pwh_gameplay_standard_bearer_buff_active_01",
				"pwh_gameplay_standard_bearer_buff_active_02",
				"pwh_gameplay_standard_bearer_buff_active_03",
				"pwh_gameplay_standard_bearer_buff_active_04",
				"pwh_gameplay_standard_bearer_buff_active_05",
				"pwh_gameplay_standard_bearer_buff_active_06",
				"pwh_gameplay_standard_bearer_buff_active_07",
				"pwh_gameplay_standard_bearer_buff_active_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_standard_bearer = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_standard_bearer_01",
				"pwh_gameplay_hearing_a_standard_bearer_02",
				"pwh_gameplay_hearing_a_standard_bearer_03",
				"pwh_gameplay_hearing_a_standard_bearer_04",
				"pwh_gameplay_hearing_a_standard_bearer_05",
				"pwh_gameplay_hearing_a_standard_bearer_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.1923749446869,
				2.2140417098999,
				1.8961666822434,
				3.1392917633057,
				1.788541674614,
				3.763729095459
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_standard_bearer_01",
				"pwh_gameplay_hearing_a_standard_bearer_02",
				"pwh_gameplay_hearing_a_standard_bearer_03",
				"pwh_gameplay_hearing_a_standard_bearer_04",
				"pwh_gameplay_hearing_a_standard_bearer_05",
				"pwh_gameplay_hearing_a_standard_bearer_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_ambush_horde_spawned = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_ambush_horde_spawned_03",
				"pwh_gameplay_ambush_horde_spawned_08",
				"pwh_gameplay_ambush_horde_spawned_09",
				"pwh_gameplay_ambush_horde_spawned_10",
				"pwh_gameplay_ambush_horde_spawned_11",
				"pwh_gameplay_ambush_horde_spawned_12",
				"pwh_gameplay_ambush_horde_spawned_13",
				"pwh_gameplay_ambush_horde_spawned_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				0.94499999284744,
				0.92485415935516,
				0.94499999284744,
				0.92485415935516,
				2.9004375934601,
				2.4927499294281,
				3.1242499351502,
				2.9557917118073
			},
			localization_strings = {
				"pwh_gameplay_ambush_horde_spawned_03",
				"pwh_gameplay_ambush_horde_spawned_08",
				"pwh_gameplay_ambush_horde_spawned_09",
				"pwh_gameplay_ambush_horde_spawned_10",
				"pwh_gameplay_ambush_horde_spawned_11",
				"pwh_gameplay_ambush_horde_spawned_12",
				"pwh_gameplay_ambush_horde_spawned_13",
				"pwh_gameplay_ambush_horde_spawned_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_eaten = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_hright_wizard_eaten_01",
				"pwe_hright_wizard_eaten_02",
				"pwe_hright_wizard_eaten_03",
				"pwe_hright_wizard_eaten_04",
				"pwe_hright_wizard_eaten_05",
				"pwe_hright_wizard_eaten_06",
				"pwe_hright_wizard_eaten_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.6714999675751,
				6.6401872634888,
				4.8842706680298,
				7.1381039619446,
				5.0564374923706,
				6.3878960609436,
				3.9909999370575
			},
			localization_strings = {
				"pwe_hright_wizard_eaten_01",
				"pwe_hright_wizard_eaten_02",
				"pwe_hright_wizard_eaten_03",
				"pwe_hright_wizard_eaten_04",
				"pwe_hright_wizard_eaten_05",
				"pwe_hright_wizard_eaten_06",
				"pwe_hright_wizard_eaten_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_healing_wood_elf = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_healing_wood_elf_05",
				"pwh_gameplay_healing_wood_elf_06",
				"pwh_gameplay_healing_wood_elf_08",
				"pwh_gameplay_healing_wood_elf_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.6238749027252,
				3.9895832538605,
				2.070770740509,
				3.1902916431427
			},
			localization_strings = {
				"pwh_gameplay_healing_wood_elf_05",
				"pwh_gameplay_healing_wood_elf_06",
				"pwh_gameplay_healing_wood_elf_08",
				"pwh_gameplay_healing_wood_elf_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_empire_soldier_in_trouble = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_05",
				"pwh_gameplay_heard_empire_soldier_in_trouble_06",
				"pwh_gameplay_heard_empire_soldier_in_trouble_07",
				"pwh_gameplay_heard_empire_soldier_in_trouble_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4131667613983,
				2.4131667613983,
				2.5152499675751,
				1.9818958044052,
				1.9552916288376
			},
			localization_strings = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_05",
				"pwh_gameplay_heard_empire_soldier_in_trouble_06",
				"pwh_gameplay_heard_empire_soldier_in_trouble_07",
				"pwh_gameplay_heard_empire_soldier_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_warrior_champion_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.1646666526794,
				3.7005207538605,
				1.2922916412354,
				2.0399167537689,
				3.0873334407806,
				2.8439791202545,
				3.3857500553131,
				2.7551040649414
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_wizard_wind = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_wind_01",
				"pwh_gameplay_killing_a_chaos_wizard_wind_02",
				"pwh_gameplay_killing_a_chaos_wizard_wind_03",
				"pwh_gameplay_killing_a_chaos_wizard_wind_04",
				"pwh_gameplay_killing_a_chaos_wizard_wind_05",
				"pwh_gameplay_killing_a_chaos_wizard_wind_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.0922291278839,
				3.3006041049957,
				2.254499912262,
				5.1373748779297,
				3.4113750457764,
				3.7598540782928
			},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_wind_01",
				"pwh_gameplay_killing_a_chaos_wizard_wind_02",
				"pwh_gameplay_killing_a_chaos_wizard_wind_03",
				"pwh_gameplay_killing_a_chaos_wizard_wind_04",
				"pwh_gameplay_killing_a_chaos_wizard_wind_05",
				"pwh_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_rat_ogre = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_12",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_13"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.6708958148956,
				2.6542291641235,
				3.7096457481384,
				3.552916765213,
				2.5273125171661,
				2.7104375362396,
				2.7176041603088
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_12",
				"pwh_gameplay_hearing_a_Skaven_rat_ogre_13"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_healing_draught = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 11,
			sound_events = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_09",
				"pwh_gameplay_healing_draught_10",
				"pwh_gameplay_healing_draught_11",
				"pwh_gameplay_healing_draught_12",
				"pwh_gameplay_healing_draught_13",
				"pwh_gameplay_healing_draught_14",
				"pwh_gameplay_healing_draught_15",
				"pwh_gameplay_healing_draught_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.167208313942,
				1.5602707862854,
				1.9068332910538,
				1.167208313942,
				1.5602707862854,
				1.9068332910538,
				1.5446041822434,
				1.56795835495,
				3.0203750133514,
				2.0703959465027,
				2.6719584465027
			},
			localization_strings = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_09",
				"pwh_gameplay_healing_draught_10",
				"pwh_gameplay_healing_draught_11",
				"pwh_gameplay_healing_draught_12",
				"pwh_gameplay_healing_draught_13",
				"pwh_gameplay_healing_draught_14",
				"pwh_gameplay_healing_draught_15",
				"pwh_gameplay_healing_draught_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_no_nearby_teammates = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_no_nearby_teammates_09",
				"pwh_gameplay_no_nearby_teammates_10",
				"pwh_gameplay_no_nearby_teammates_11",
				"pwh_gameplay_no_nearby_teammates_12",
				"pwh_gameplay_no_nearby_teammates_13",
				"pwh_gameplay_no_nearby_teammates_14",
				"pwh_gameplay_no_nearby_teammates_15",
				"pwh_gameplay_no_nearby_teammates_16"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous"
			},
			sound_events_duration = {
				3.0449166297913,
				1.7774583101273,
				1.5259375572205,
				2.6128749847412,
				3.0143749713898,
				4.3262915611267,
				3.1010625362396,
				2.2284166812897
			},
			localization_strings = {
				"pwh_gameplay_no_nearby_teammates_09",
				"pwh_gameplay_no_nearby_teammates_10",
				"pwh_gameplay_no_nearby_teammates_11",
				"pwh_gameplay_no_nearby_teammates_12",
				"pwh_gameplay_no_nearby_teammates_13",
				"pwh_gameplay_no_nearby_teammates_14",
				"pwh_gameplay_no_nearby_teammates_15",
				"pwh_gameplay_no_nearby_teammates_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_bright_wizard_being_helped_up_05",
				"pwh_gameplay_bright_wizard_being_helped_up_06",
				"pwh_gameplay_bright_wizard_being_helped_up_07",
				"pwh_gameplay_bright_wizard_being_helped_up_08",
				"pwh_gameplay_bright_wizard_being_helped_up_09",
				"pwh_gameplay_bright_wizard_being_helped_up_10",
				"pwh_gameplay_bright_wizard_being_helped_up_11",
				"pwh_gameplay_bright_wizard_being_helped_up_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.3247499465942,
				3.1895833015442,
				4.3973751068115,
				2.6344375610352,
				2.448979139328,
				4.6547918319702,
				2.5351874828339,
				2.1329998970032
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_being_helped_up_05",
				"pwh_gameplay_bright_wizard_being_helped_up_06",
				"pwh_gameplay_bright_wizard_being_helped_up_07",
				"pwh_gameplay_bright_wizard_being_helped_up_08",
				"pwh_gameplay_bright_wizard_being_helped_up_09",
				"pwh_gameplay_bright_wizard_being_helped_up_10",
				"pwh_gameplay_bright_wizard_being_helped_up_11",
				"pwh_gameplay_bright_wizard_being_helped_up_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_stormfiend = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_stormfiend_01",
				"pwh_gameplay_seeing_a_stormfiend_02",
				"pwh_gameplay_seeing_a_stormfiend_03",
				"pwh_gameplay_seeing_a_stormfiend_04",
				"pwh_gameplay_seeing_a_stormfiend_05",
				"pwh_gameplay_seeing_a_stormfiend_06",
				"pwh_gameplay_seeing_a_stormfiend_07",
				"pwh_gameplay_seeing_a_stormfiend_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.2606041431427,
				2.5906457901001,
				3.8130834102631,
				3.3619375228882,
				2.6097083091736,
				2.8463125228882,
				2.7636666297913,
				4.4331459999084
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_stormfiend_01",
				"pwh_gameplay_seeing_a_stormfiend_02",
				"pwh_gameplay_seeing_a_stormfiend_03",
				"pwh_gameplay_seeing_a_stormfiend_04",
				"pwh_gameplay_seeing_a_stormfiend_05",
				"pwh_gameplay_seeing_a_stormfiend_06",
				"pwh_gameplay_seeing_a_stormfiend_07",
				"pwh_gameplay_seeing_a_stormfiend_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_Skaven_warpfire_thrower = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.5207500457764,
				2.5623333454132,
				1.8236042261124,
				3.3464584350586,
				2.9436666965485,
				1.8281874656677,
				3.1632499694824,
				2.9568750858307
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_wizard_wind = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.0619790554047,
				2.3637082576752,
				3.3215832710266,
				3.4785833358765
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_wizard_tentacle = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.8868334293366,
				2.7578542232513,
				3.1478126049042,
				3.2129583358765
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_wizard_plague = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.2874584197998,
				1.8626874685288,
				2.6933124065399,
				2.6596667766571
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {}
		},
		pwh_special_ability_captain = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_activate_ability_captain_01",
				"pwh_activate_ability_captain_02",
				"pwh_activate_ability_captain_03",
				"pwh_activate_ability_captain_04",
				"pwh_activate_ability_captain_05",
				"pwh_activate_ability_captain_06",
				"pwh_activate_ability_captain_07",
				"pwh_activate_ability_captain_08",
				"pwh_activate_ability_captain_09",
				"pwh_activate_ability_captain_10",
				"pwh_activate_ability_captain_11",
				"pwh_activate_ability_captain_12"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				4.323625087738,
				3.9455833435059,
				4.2957501411438,
				3.2558333873749,
				5.6500625610352,
				4.8167500495911,
				4.8942499160767,
				4.2619581222534,
				4.1698126792908,
				2.877833366394,
				4.0537915229797,
				3.9332292079926
			},
			localization_strings = {
				"pwh_activate_ability_captain_01",
				"pwh_activate_ability_captain_02",
				"pwh_activate_ability_captain_03",
				"pwh_activate_ability_captain_04",
				"pwh_activate_ability_captain_05",
				"pwh_activate_ability_captain_06",
				"pwh_activate_ability_captain_07",
				"pwh_activate_ability_captain_08",
				"pwh_activate_ability_captain_09",
				"pwh_activate_ability_captain_10",
				"pwh_activate_ability_captain_11",
				"pwh_activate_ability_captain_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_wizard_leech = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_leech_01",
				"pwh_gameplay_killing_a_chaos_wizard_leech_02",
				"pwh_gameplay_killing_a_chaos_wizard_leech_03",
				"pwh_gameplay_killing_a_chaos_wizard_leech_04",
				"pwh_gameplay_killing_a_chaos_wizard_leech_05",
				"pwh_gameplay_killing_a_chaos_wizard_leech_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.770708322525,
				1.7957291603088,
				2.374520778656,
				2.209041595459,
				2.91441655159,
				1.6020624637604
			},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_leech_01",
				"pwh_gameplay_killing_a_chaos_wizard_leech_02",
				"pwh_gameplay_killing_a_chaos_wizard_leech_03",
				"pwh_gameplay_killing_a_chaos_wizard_leech_04",
				"pwh_gameplay_killing_a_chaos_wizard_leech_05",
				"pwh_gameplay_killing_a_chaos_wizard_leech_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_chaos_warrior = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_warrior_01",
				"pwh_gameplay_seeing_a_chaos_warrior_02",
				"pwh_gameplay_seeing_a_chaos_warrior_03",
				"pwh_gameplay_seeing_a_chaos_warrior_04",
				"pwh_gameplay_seeing_a_chaos_warrior_05",
				"pwh_gameplay_seeing_a_chaos_warrior_06",
				"pwh_gameplay_seeing_a_chaos_warrior_07",
				"pwh_gameplay_seeing_a_chaos_warrior_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.3892916440964,
				3.0593333244324,
				3.6088540554047,
				2.1536457538605,
				4.3406457901001,
				3.5663957595825,
				3.2569375038147,
				3.640625
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_warrior_01",
				"pwh_gameplay_seeing_a_chaos_warrior_02",
				"pwh_gameplay_seeing_a_chaos_warrior_03",
				"pwh_gameplay_seeing_a_chaos_warrior_04",
				"pwh_gameplay_seeing_a_chaos_warrior_05",
				"pwh_gameplay_seeing_a_chaos_warrior_06",
				"pwh_gameplay_seeing_a_chaos_warrior_07",
				"pwh_gameplay_seeing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_using_potion = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_using_potion_01",
				"pwh_gameplay_using_potion_06",
				"pwh_gameplay_using_potion_07",
				"pwh_gameplay_using_potion_08",
				"pwh_gameplay_using_potion_09",
				"pwh_gameplay_using_potion_10",
				"pwh_gameplay_using_potion_11",
				"pwh_gameplay_using_potion_12",
				"pwh_gameplay_using_potion_13"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.8540416955948,
				1.468333363533,
				2.2195000648499,
				1.5616458654404,
				2.0233333110809,
				1.4323542118073,
				2.2056667804718,
				2.8553957939148,
				2.5189790725708
			},
			localization_strings = {
				"pwh_gameplay_using_potion_01",
				"pwh_gameplay_using_potion_06",
				"pwh_gameplay_using_potion_07",
				"pwh_gameplay_using_potion_08",
				"pwh_gameplay_using_potion_09",
				"pwh_gameplay_using_potion_10",
				"pwh_gameplay_using_potion_11",
				"pwh_gameplay_using_potion_12",
				"pwh_gameplay_using_potion_13"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_casual_quotes = {
			sound_events_n = 30,
			face_animations_n = 30,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 30,
			sound_events = {
				"pwh_gameplay_casual_quotes_11",
				"pwh_gameplay_casual_quotes_12",
				"pwh_gameplay_casual_quotes_13",
				"pwh_gameplay_casual_quotes_14",
				"pwh_gameplay_casual_quotes_15",
				"pwh_gameplay_casual_quotes_16",
				"pwh_gameplay_casual_quotes_17",
				"pwh_gameplay_casual_quotes_18",
				"pwh_gameplay_casual_quotes_19",
				"pwh_gameplay_casual_quotes_20",
				"pwh_gameplay_casual_quotes_21",
				"pwh_gameplay_casual_quotes_22",
				"pwh_gameplay_casual_quotes_23",
				"pwh_gameplay_casual_quotes_24",
				"pwh_gameplay_casual_quotes_25",
				"pwh_gameplay_casual_quotes_26",
				"pwh_gameplay_casual_quotes_27",
				"pwh_gameplay_casual_quotes_28",
				"pwh_gameplay_casual_quotes_29",
				"pwh_gameplay_casual_quotes_30",
				"pwh_gameplay_casual_quotes_31",
				"pwh_gameplay_casual_quotes_32",
				"pwh_gameplay_casual_quotes_33",
				"pwh_gameplay_casual_quotes_34",
				"pwh_gameplay_casual_quotes_35",
				"pwh_gameplay_casual_quotes_36",
				"pwh_gameplay_casual_quotes_37",
				"pwh_gameplay_casual_quotes_38",
				"pwh_gameplay_casual_quotes_39",
				"pwh_gameplay_casual_quotes_40"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.4264168739319,
				7.1268124580383,
				7.6310210227966,
				10.193604469299,
				8.8359794616699,
				8.5133962631226,
				7.6198124885559,
				6.4998540878296,
				6.9051251411438,
				7.7688956260681,
				4.9549789428711,
				4.7905831336975,
				4.3138751983643,
				6.2084794044495,
				5.4612293243408,
				5.7284164428711,
				4.2080206871033,
				6.4612917900085,
				3.1977500915527,
				4.0721249580383,
				4.4930834770203,
				3.2740209102631,
				4.8848123550415,
				3.4436249732971,
				5.2256875038147,
				4.0530834197998,
				3.3560209274292,
				5.0961875915527,
				4.4767498970032,
				4.9449377059936
			},
			localization_strings = {
				"pwh_gameplay_casual_quotes_11",
				"pwh_gameplay_casual_quotes_12",
				"pwh_gameplay_casual_quotes_13",
				"pwh_gameplay_casual_quotes_14",
				"pwh_gameplay_casual_quotes_15",
				"pwh_gameplay_casual_quotes_16",
				"pwh_gameplay_casual_quotes_17",
				"pwh_gameplay_casual_quotes_18",
				"pwh_gameplay_casual_quotes_19",
				"pwh_gameplay_casual_quotes_20",
				"pwh_gameplay_casual_quotes_21",
				"pwh_gameplay_casual_quotes_22",
				"pwh_gameplay_casual_quotes_23",
				"pwh_gameplay_casual_quotes_24",
				"pwh_gameplay_casual_quotes_25",
				"pwh_gameplay_casual_quotes_26",
				"pwh_gameplay_casual_quotes_27",
				"pwh_gameplay_casual_quotes_28",
				"pwh_gameplay_casual_quotes_29",
				"pwh_gameplay_casual_quotes_30",
				"pwh_gameplay_casual_quotes_31",
				"pwh_gameplay_casual_quotes_32",
				"pwh_gameplay_casual_quotes_33",
				"pwh_gameplay_casual_quotes_34",
				"pwh_gameplay_casual_quotes_35",
				"pwh_gameplay_casual_quotes_36",
				"pwh_gameplay_casual_quotes_37",
				"pwh_gameplay_casual_quotes_38",
				"pwh_gameplay_casual_quotes_39",
				"pwh_gameplay_casual_quotes_40"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_skaven_warpfire_thrower = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.1155207157135,
				4.2271041870117,
				5.0612707138061,
				2.1505832672119,
				3.0059790611267,
				3.0624375343323,
				2.0495417118073,
				2.8715832233429
			},
			localization_strings = {
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_globadier_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_globaider_combat_03",
				"pwh_gameplay_hearing_a_globaider_combat_04",
				"pwh_gameplay_hearing_a_globaider_combat_05",
				"pwh_gameplay_hearing_a_globaider_combat_09",
				"pwh_gameplay_hearing_a_globaider_combat_10",
				"pwh_gameplay_hearing_a_globaider_combat_11",
				"pwh_gameplay_hearing_a_globaider_combat_12",
				"pwh_gameplay_hearing_a_globaider_combat_13"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.2148541212082,
				1.4310833215714,
				1.8515625,
				2.3374373912811,
				1.8471457958221,
				1.7715833187103,
				1.8747500181198,
				1.5464792251587
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_globaider_combat_03",
				"pwh_gameplay_hearing_a_globaider_combat_04",
				"pwh_gameplay_hearing_a_globaider_combat_05",
				"pwh_gameplay_hearing_a_globaider_combat_09",
				"pwh_gameplay_hearing_a_globaider_combat_10",
				"pwh_gameplay_hearing_a_globaider_combat_11",
				"pwh_gameplay_hearing_a_globaider_combat_12",
				"pwh_gameplay_hearing_a_globaider_combat_13"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_stormfiend = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_stormfiend_01",
				"pwh_gameplay_killing_a_stormfiend_02",
				"pwh_gameplay_killing_a_stormfiend_03",
				"pwh_gameplay_killing_a_stormfiend_04",
				"pwh_gameplay_killing_a_stormfiend_05",
				"pwh_gameplay_killing_a_stormfiend_06",
				"pwh_gameplay_killing_a_stormfiend_07",
				"pwh_gameplay_killing_a_stormfiend_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.3135209083557,
				3.6036040782928,
				3.0741457939148,
				2.7582292556763,
				2.9649374485016,
				3.2365624904633,
				1.9317291975021,
				2.7531249523163
			},
			localization_strings = {
				"pwh_gameplay_killing_a_stormfiend_01",
				"pwh_gameplay_killing_a_stormfiend_02",
				"pwh_gameplay_killing_a_stormfiend_03",
				"pwh_gameplay_killing_a_stormfiend_04",
				"pwh_gameplay_killing_a_stormfiend_05",
				"pwh_gameplay_killing_a_stormfiend_06",
				"pwh_gameplay_killing_a_stormfiend_07",
				"pwh_gameplay_killing_a_stormfiend_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_helped_by_dwarf_ranger = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_helped_by_dwarf_ranger_01",
				"pwh_gameplay_helped_by_dwarf_ranger_02",
				"pwh_gameplay_helped_by_dwarf_ranger_03",
				"pwh_gameplay_helped_by_dwarf_ranger_04",
				"pwh_gameplay_helped_by_dwarf_ranger_05",
				"pwh_gameplay_helped_by_dwarf_ranger_06",
				"pwh_gameplay_helped_by_dwarf_ranger_07",
				"pwh_gameplay_helped_by_empire_soldier_09",
				"pwh_gameplay_helped_by_empire_soldier_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.2588332891464,
				2.3998749256134,
				1.3598958253861,
				3.7912707328796,
				2.5315208435059,
				1.6549583673477,
				1.5482499599457,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_gameplay_helped_by_dwarf_ranger_01",
				"pwh_gameplay_helped_by_dwarf_ranger_02",
				"pwh_gameplay_helped_by_dwarf_ranger_03",
				"pwh_gameplay_helped_by_dwarf_ranger_04",
				"pwh_gameplay_helped_by_dwarf_ranger_05",
				"pwh_gameplay_helped_by_dwarf_ranger_06",
				"pwh_gameplay_helped_by_dwarf_ranger_07",
				"pwh_gameplay_helped_by_empire_soldier_09",
				"pwh_gameplay_helped_by_empire_soldier_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_warrior = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_warrior_01",
				"pwh_gameplay_killing_a_chaos_warrior_02",
				"pwh_gameplay_killing_a_chaos_warrior_03",
				"pwh_gameplay_killing_a_chaos_warrior_04",
				"pwh_gameplay_killing_a_chaos_warrior_05",
				"pwh_gameplay_killing_a_chaos_warrior_06",
				"pwh_gameplay_killing_a_chaos_warrior_07",
				"pwh_gameplay_killing_a_chaos_warrior_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.0691249370575,
				2.0295207500458,
				2.8494791984558,
				3.3012082576752,
				3.7788124084473,
				4.6155834197998,
				3.3726458549499,
				3.0421667098999
			},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_warrior_01",
				"pwh_gameplay_killing_a_chaos_warrior_02",
				"pwh_gameplay_killing_a_chaos_warrior_03",
				"pwh_gameplay_killing_a_chaos_warrior_04",
				"pwh_gameplay_killing_a_chaos_warrior_05",
				"pwh_gameplay_killing_a_chaos_warrior_06",
				"pwh_gameplay_killing_a_chaos_warrior_07",
				"pwh_gameplay_killing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_on_a_frenzy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_empire_soldier_on_a_frenzy_01",
				"pwh_gameplay_empire_soldier_on_a_frenzy_02",
				"pwh_gameplay_empire_soldier_on_a_frenzy_03",
				"pwh_gameplay_empire_soldier_on_a_frenzy_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.3685208559036,
				1.6015416383743,
				2.5509583950043,
				2.3036041259766
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_on_a_frenzy_01",
				"pwh_gameplay_empire_soldier_on_a_frenzy_02",
				"pwh_gameplay_empire_soldier_on_a_frenzy_03",
				"pwh_gameplay_empire_soldier_on_a_frenzy_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hears_incoming_horde = {
			sound_events_n = 19,
			face_animations_n = 19,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 19,
			sound_events = {
				"pwh_gameplay_hears_incoming_horde_10",
				"pwh_gameplay_hears_incoming_horde_11",
				"pwh_gameplay_hears_incoming_horde_12",
				"pwh_gameplay_hears_incoming_horde_13",
				"pwh_gameplay_hears_incoming_horde_14",
				"pwh_gameplay_hears_incoming_horde_15",
				"pwh_gameplay_hears_incoming_horde_16",
				"pwh_gameplay_hears_incoming_horde_17",
				"pwh_gameplay_hears_incoming_horde_18",
				"pwh_gameplay_hears_incoming_horde_19",
				"pwh_gameplay_hears_incoming_horde_20",
				"pwh_gameplay_hears_incoming_horde_21",
				"pwh_gameplay_hears_incoming_horde_22",
				"pwh_gameplay_hears_incoming_horde_23",
				"pwh_gameplay_hears_incoming_horde_24",
				"pwh_gameplay_hears_incoming_horde_25",
				"pwh_gameplay_hears_incoming_horde_26",
				"pwh_gameplay_hears_incoming_horde_27",
				"pwh_gameplay_hears_incoming_horde_28"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_smug",
				"face_smug",
				"face_smug",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				2.8540415763855,
				3.1505000591278,
				2.7698333263397,
				2.3357291221619,
				3.6595416069031,
				2.1621458530426,
				3.2892916202545,
				4.3789167404175,
				2.6191458702087,
				1.6259791851044,
				2.6888959407806,
				3.4123332500458,
				3.0564999580383,
				2.3843750953674,
				2.8994584083557,
				3.8784375190735,
				3.5231249332428,
				2.2664999961853,
				2.7848124504089
			},
			localization_strings = {
				"pwh_gameplay_hears_incoming_horde_10",
				"pwh_gameplay_hears_incoming_horde_11",
				"pwh_gameplay_hears_incoming_horde_12",
				"pwh_gameplay_hears_incoming_horde_13",
				"pwh_gameplay_hears_incoming_horde_14",
				"pwh_gameplay_hears_incoming_horde_15",
				"pwh_gameplay_hears_incoming_horde_16",
				"pwh_gameplay_hears_incoming_horde_17",
				"pwh_gameplay_hears_incoming_horde_18",
				"pwh_gameplay_hears_incoming_horde_19",
				"pwh_gameplay_hears_incoming_horde_20",
				"pwh_gameplay_hears_incoming_horde_21",
				"pwh_gameplay_hears_incoming_horde_22",
				"pwh_gameplay_hears_incoming_horde_23",
				"pwh_gameplay_hears_incoming_horde_24",
				"pwh_gameplay_hears_incoming_horde_25",
				"pwh_gameplay_hears_incoming_horde_26",
				"pwh_gameplay_hears_incoming_horde_27",
				"pwh_gameplay_hears_incoming_horde_28"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_marauder_berserker_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_marauder_berserker_combat_01",
				"pwh_gameplay_hearing_marauder_berserker_combat_02",
				"pwh_gameplay_hearing_marauder_berserker_combat_03",
				"pwh_gameplay_hearing_marauder_berserker_combat_04",
				"pwh_gameplay_hearing_marauder_berserker_combat_05",
				"pwh_gameplay_hearing_marauder_berserker_combat_06",
				"pwh_gameplay_hearing_marauder_berserker_combat_07",
				"pwh_gameplay_hearing_marauder_berserker_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.8604583740234,
				0.7803750038147,
				0.94412499666214,
				1.1969583034515,
				1.6923542022705,
				2.4954583644867,
				1.5255000591278,
				1.5495208501816
			},
			localization_strings = {
				"pwh_gameplay_hearing_marauder_berserker_combat_01",
				"pwh_gameplay_hearing_marauder_berserker_combat_02",
				"pwh_gameplay_hearing_marauder_berserker_combat_03",
				"pwh_gameplay_hearing_marauder_berserker_combat_04",
				"pwh_gameplay_hearing_marauder_berserker_combat_05",
				"pwh_gameplay_hearing_marauder_berserker_combat_06",
				"pwh_gameplay_hearing_marauder_berserker_combat_07",
				"pwh_gameplay_hearing_marauder_berserker_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_grabbed = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_07",
				"pwh_gameplay_empire_soldier_grabbed_08",
				"pwh_gameplay_empire_soldier_grabbed_09",
				"pwh_gameplay_empire_soldier_grabbed_10",
				"pwh_gameplay_empire_soldier_grabbed_11",
				"pwh_gameplay_empire_soldier_grabbed_12",
				"pwh_gameplay_empire_soldier_grabbed_13",
				"pwh_gameplay_empire_soldier_grabbed_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.6487708091736,
				5.6487708091736,
				3.1056666374206,
				1.9552083015442,
				3.7383542060852,
				5.4269375801086,
				2.7813541889191,
				2.8479790687561,
				4.1601457595825
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_07",
				"pwh_gameplay_empire_soldier_grabbed_08",
				"pwh_gameplay_empire_soldier_grabbed_09",
				"pwh_gameplay_empire_soldier_grabbed_10",
				"pwh_gameplay_empire_soldier_grabbed_11",
				"pwh_gameplay_empire_soldier_grabbed_12",
				"pwh_gameplay_empire_soldier_grabbed_13",
				"pwh_gameplay_empire_soldier_grabbed_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_spawn = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_spawn_01",
				"pwh_gameplay_hearing_a_chaos_spawn_02",
				"pwh_gameplay_hearing_a_chaos_spawn_03",
				"pwh_gameplay_hearing_a_chaos_spawn_04",
				"pwh_gameplay_hearing_a_chaos_spawn_05",
				"pwh_gameplay_hearing_a_chaos_spawn_06",
				"pwh_gameplay_hearing_a_chaos_spawn_07",
				"pwh_gameplay_hearing_a_chaos_spawn_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.3970415592194,
				2.9136667251587,
				2.3558125495911,
				3.1198959350586,
				1.706375002861,
				1.0322916507721,
				2.3063333034515,
				1.9142916202545
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_spawn_01",
				"pwh_gameplay_hearing_a_chaos_spawn_02",
				"pwh_gameplay_hearing_a_chaos_spawn_03",
				"pwh_gameplay_hearing_a_chaos_spawn_04",
				"pwh_gameplay_hearing_a_chaos_spawn_05",
				"pwh_gameplay_hearing_a_chaos_spawn_06",
				"pwh_gameplay_hearing_a_chaos_spawn_07",
				"pwh_gameplay_hearing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_troll = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_troll_01",
				"pwh_gameplay_hearing_a_troll_02",
				"pwh_gameplay_hearing_a_troll_03",
				"pwh_gameplay_hearing_a_troll_04",
				"pwh_gameplay_hearing_a_troll_05",
				"pwh_gameplay_hearing_a_troll_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.0798332691193,
				3.4201250076294,
				2.7738125324249,
				3.3578333854675,
				3.1308751106262,
				3.1733748912811
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_troll_01",
				"pwh_gameplay_hearing_a_troll_02",
				"pwh_gameplay_hearing_a_troll_03",
				"pwh_gameplay_hearing_a_troll_04",
				"pwh_gameplay_hearing_a_troll_05",
				"pwh_gameplay_hearing_a_troll_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_plague = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.9182708263397,
				5.2907500267029,
				3.7517499923706,
				5.158145904541,
				3.2472915649414,
				2.836895942688,
				2.0083959102631,
				2.5031042098999
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_armoured_enemy_bright_wizard = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_armoured_enemy_bright_wizard_04",
				"pwh_gameplay_armoured_enemy_bright_wizard_05",
				"pwh_gameplay_armoured_enemy_bright_wizard_06",
				"pwh_gameplay_armoured_enemy_bright_wizard_07",
				"pwh_gameplay_armoured_enemy_bright_wizard_08",
				"pwh_gameplay_armoured_enemy_bright_wizard_09",
				"pwh_gameplay_armoured_enemy_bright_wizard_10",
				"pwh_gameplay_armoured_enemy_bright_wizard_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.9241042137146,
				2.2415416240692,
				2.673645734787,
				4.4753541946411,
				2.1779792308807,
				2.6775417327881,
				2.7420833110809,
				2.4986457824707
			},
			localization_strings = {
				"pwh_gameplay_armoured_enemy_bright_wizard_04",
				"pwh_gameplay_armoured_enemy_bright_wizard_05",
				"pwh_gameplay_armoured_enemy_bright_wizard_06",
				"pwh_gameplay_armoured_enemy_bright_wizard_07",
				"pwh_gameplay_armoured_enemy_bright_wizard_08",
				"pwh_gameplay_armoured_enemy_bright_wizard_09",
				"pwh_gameplay_armoured_enemy_bright_wizard_10",
				"pwh_gameplay_armoured_enemy_bright_wizard_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_stormfiend = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_stormfiend_01",
				"pwh_gameplay_hearing_a_stormfiend_02",
				"pwh_gameplay_hearing_a_stormfiend_03",
				"pwh_gameplay_hearing_a_stormfiend_04",
				"pwh_gameplay_hearing_a_stormfiend_05",
				"pwh_gameplay_hearing_a_stormfiend_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.9813749790192,
				2.2892708778381,
				4.8232707977295,
				3.0719165802002,
				3.2645416259766,
				2.3358333110809
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_stormfiend_01",
				"pwh_gameplay_hearing_a_stormfiend_02",
				"pwh_gameplay_hearing_a_stormfiend_03",
				"pwh_gameplay_hearing_a_stormfiend_04",
				"pwh_gameplay_hearing_a_stormfiend_05",
				"pwh_gameplay_hearing_a_stormfiend_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_09",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.8273333311081,
				3.4567,
				1.8662707805634,
				2.1331040859222,
				1.0874166488648,
				0.71152085065842,
				1.2081458568573,
				1.3057916164398
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_09",
				"pwh_gameplay_hearing_a_Skaven_ratling_gun_combat_10"
			},
			randomize_indexes = {}
		},
		pwh_objective_nearing_objective_deadline = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_objective_nearing_objective_deadline_02",
				"pwh_objective_nearing_objective_deadline_05",
				"pwh_objective_nearing_objective_deadline_06",
				"pwh_objective_nearing_objective_deadline_07",
				"pwh_objective_nearing_objective_deadline_08",
				"pwh_objective_nearing_objective_deadline_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				0.4600625038147,
				2.0736041069031,
				1.0814583301544,
				1.6690624952316,
				1.5622500181198,
				3.4567
			},
			localization_strings = {
				"pwh_objective_nearing_objective_deadline_02",
				"pwh_objective_nearing_objective_deadline_05",
				"pwh_objective_nearing_objective_deadline_06",
				"pwh_objective_nearing_objective_deadline_07",
				"pwh_objective_nearing_objective_deadline_08",
				"pwh_objective_nearing_objective_deadline_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_weapon_flair_offensive = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_activating_magic_weapon_offensive_01",
				"pwh_gameplay_activating_magic_weapon_offensive_03",
				"pwh_gameplay_activating_magic_weapon_offensive_04",
				"pwh_gameplay_activating_magic_weapon_offensive_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.9133749008179,
				2.5871875286102,
				2.0320415496826,
				1.8132708072662
			},
			localization_strings = {
				"pwh_gameplay_activating_magic_weapon_offensive_01",
				"pwh_gameplay_activating_magic_weapon_offensive_03",
				"pwh_gameplay_activating_magic_weapon_offensive_04",
				"pwh_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.7322707176209,
				1.135541677475,
				2.6719584465027,
				3.5476250648499,
				2.7562291622162,
				1.3727291822434,
				3.1708958148956,
				2.8697917461395
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_tentacle = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.7142915725708,
				3.4277291297913,
				4.3478126525879,
				4.2340416908264,
				2.4661874771118,
				1.8862500190735,
				2.0664374828339,
				2.5227084159851
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_13",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_14"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.9940625429153,
				2.7962083816528,
				2.8688957691193,
				3.3076667785645,
				4.0964584350586,
				2.2903332710266,
				3.1372499465942
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_13",
				"pwh_gameplay_seeing_a_Skaven_patrol_stormvermin_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_eaten = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_empire_soldier_eaten_01",
				"pwh_empire_soldier_eaten_02",
				"pwh_empire_soldier_eaten_03",
				"pwh_empire_soldier_eaten_04",
				"pwh_empire_soldier_eaten_05",
				"pwh_empire_soldier_eaten_06",
				"pwh_empire_soldier_eaten_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.7433543205261,
				4.9594583511353,
				4.1155624389648,
				6.0699791908264,
				5.7175002098083,
				4.4329376220703,
				3.3173749446869
			},
			localization_strings = {
				"pwh_empire_soldier_eaten_01",
				"pwh_empire_soldier_eaten_02",
				"pwh_empire_soldier_eaten_03",
				"pwh_empire_soldier_eaten_04",
				"pwh_empire_soldier_eaten_05",
				"pwh_empire_soldier_eaten_06",
				"pwh_empire_soldier_eaten_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_tension_no_enemies = {
			sound_events_n = 16,
			face_animations_n = 16,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 16,
			sound_events = {
				"pwh_gameplay_tension_no_enemies_01",
				"pwh_gameplay_tension_no_enemies_09",
				"pwh_gameplay_tension_no_enemies_10",
				"pwh_gameplay_tension_no_enemies_11",
				"pwh_gameplay_tension_no_enemies_12",
				"pwh_gameplay_tension_no_enemies_13",
				"pwh_gameplay_tension_no_enemies_14",
				"pwh_gameplay_tension_no_enemies_15",
				"pwh_gameplay_tension_no_enemies_16",
				"pwh_gameplay_tension_no_enemies_17",
				"pwh_gameplay_tension_no_enemies_18",
				"pwh_gameplay_tension_no_enemies_19",
				"pwh_gameplay_tension_no_enemies_20",
				"pwh_gameplay_tension_no_enemies_21",
				"pwh_gameplay_tension_no_enemies_22",
				"pwh_gameplay_tension_no_enemies_23"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				0.80066668987274,
				3.4391458034515,
				4.0271248817444,
				3.2430624961853,
				3.0742707252502,
				2.5651667118073,
				3.4642083644867,
				2.7783749103546,
				3.8988749980927,
				3.0346250534058,
				4.9591460227966,
				3.3762290477753,
				4.9995832443237,
				2.6275207996368,
				4.6578330993652,
				3.854395866394
			},
			localization_strings = {
				"pwh_gameplay_tension_no_enemies_01",
				"pwh_gameplay_tension_no_enemies_09",
				"pwh_gameplay_tension_no_enemies_10",
				"pwh_gameplay_tension_no_enemies_11",
				"pwh_gameplay_tension_no_enemies_12",
				"pwh_gameplay_tension_no_enemies_13",
				"pwh_gameplay_tension_no_enemies_14",
				"pwh_gameplay_tension_no_enemies_15",
				"pwh_gameplay_tension_no_enemies_16",
				"pwh_gameplay_tension_no_enemies_17",
				"pwh_gameplay_tension_no_enemies_18",
				"pwh_gameplay_tension_no_enemies_19",
				"pwh_gameplay_tension_no_enemies_20",
				"pwh_gameplay_tension_no_enemies_21",
				"pwh_gameplay_tension_no_enemies_22",
				"pwh_gameplay_tension_no_enemies_23"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_empire_soldier_being_helped_up_03",
				"pwh_gameplay_empire_soldier_being_helped_up_05",
				"pwh_gameplay_empire_soldier_being_helped_up_06",
				"pwh_gameplay_empire_soldier_being_helped_up_07",
				"pwh_gameplay_empire_soldier_being_helped_up_08",
				"pwh_gameplay_empire_soldier_being_helped_up_09",
				"pwh_gameplay_empire_soldier_being_helped_up_10",
				"pwh_gameplay_empire_soldier_being_helped_up_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.1272292137146,
				2.1272292137146,
				1.5265417098999,
				2.1024792194366,
				2.7359375953674,
				2.5977499485016,
				2.0640208721161,
				2.5158333778381
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_being_helped_up_03",
				"pwh_gameplay_empire_soldier_being_helped_up_05",
				"pwh_gameplay_empire_soldier_being_helped_up_06",
				"pwh_gameplay_empire_soldier_being_helped_up_07",
				"pwh_gameplay_empire_soldier_being_helped_up_08",
				"pwh_gameplay_empire_soldier_being_helped_up_09",
				"pwh_gameplay_empire_soldier_being_helped_up_10",
				"pwh_gameplay_empire_soldier_being_helped_up_11"
			},
			randomize_indexes = {}
		},
		pwh_objective_achieved_all_but_one_goal = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_objective_achieved_all_but_one_goal_01",
				"pwh_objective_achieved_all_but_one_goal_02",
				"pwh_objective_achieved_all_but_one_goal_03",
				"pwh_objective_achieved_all_but_one_goal_05",
				"pwh_objective_achieved_all_but_one_goal_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.2862499952316,
				1.5706042051315,
				1.4304374456406,
				1.2862499952316,
				1.5706042051315
			},
			localization_strings = {
				"pwh_objective_achieved_all_but_one_goal_01",
				"pwh_objective_achieved_all_but_one_goal_02",
				"pwh_objective_achieved_all_but_one_goal_03",
				"pwh_objective_achieved_all_but_one_goal_05",
				"pwh_objective_achieved_all_but_one_goal_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_troll_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_troll_combat_01",
				"pwh_gameplay_hearing_a_troll_combat_02",
				"pwh_gameplay_hearing_a_troll_combat_03",
				"pwh_gameplay_hearing_a_troll_combat_04",
				"pwh_gameplay_hearing_a_troll_combat_05",
				"pwh_gameplay_hearing_a_troll_combat_06",
				"pwh_gameplay_hearing_a_troll_combat_07",
				"pwh_gameplay_hearing_a_troll_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				0.78835415840149,
				0.90762501955032,
				1.5771458148956,
				1.523854136467,
				3.1536874771118,
				2.2649583816528,
				4.0302500724792,
				1.3572291135788
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_troll_combat_01",
				"pwh_gameplay_hearing_a_troll_combat_02",
				"pwh_gameplay_hearing_a_troll_combat_03",
				"pwh_gameplay_hearing_a_troll_combat_04",
				"pwh_gameplay_hearing_a_troll_combat_05",
				"pwh_gameplay_hearing_a_troll_combat_06",
				"pwh_gameplay_hearing_a_troll_combat_07",
				"pwh_gameplay_hearing_a_troll_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_spawn_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_spawn_combat_01",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_02",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_03",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_04",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_05",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_06",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_07",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.2853125333786,
				1.074979186058,
				1.3404582738876,
				1.1725833415985,
				1.7478749752045,
				1.3083125352859,
				1.3879791498184,
				2.1899375915527
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_spawn_combat_01",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_02",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_03",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_04",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_05",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_06",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_07",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_helped_by_bright_wizard = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_helped_by_bright_wizard_03",
				"pwh_gameplay_helped_by_bright_wizard_05",
				"pwh_gameplay_helped_by_bright_wizard_06",
				"pwh_gameplay_helped_by_bright_wizard_07",
				"pwh_gameplay_helped_by_bright_wizard_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.5048333406448,
				1.5048333406448,
				1.2281874418259,
				1.5620000362396,
				2.9541459083557
			},
			localization_strings = {
				"pwh_gameplay_helped_by_bright_wizard_03",
				"pwh_gameplay_helped_by_bright_wizard_05",
				"pwh_gameplay_helped_by_bright_wizard_06",
				"pwh_gameplay_helped_by_bright_wizard_07",
				"pwh_gameplay_helped_by_bright_wizard_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_scr = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 15,
			sound_events = {
				"pwh_gameplay_seeing_a_scr_01",
				"pwh_gameplay_seeing_a_scr_02",
				"pwh_gameplay_seeing_a_scr_03",
				"pwh_gameplay_seeing_a_scr_04",
				"pwh_gameplay_seeing_a_scr_05",
				"pwh_gameplay_seeing_a_scr_06",
				"pwh_gameplay_seeing_a_scr_07",
				"pwh_gameplay_seeing_a_shield_clanrat_01",
				"pwh_gameplay_seeing_a_shield_clanrat_02",
				"pwh_gameplay_seeing_a_shield_clanrat_03",
				"pwh_gameplay_seeing_a_shield_clanrat_04",
				"pwh_gameplay_seeing_a_shield_clanrat_05",
				"pwh_gameplay_seeing_a_shield_clanrat_06",
				"pwh_gameplay_seeing_a_shield_clanrat_07",
				"pwh_gameplay_seeing_a_shield_clanrat_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.8533333539963,
				2.250937461853,
				1.3402291536331,
				2.1374790668488,
				2.0327291488648,
				2.698041677475,
				1.6820625066757,
				1.0814583301544,
				1.93068754673,
				1.6217082738876,
				1.5820416212082,
				1.2600417137146,
				2.9505207538605,
				2.0148749351502,
				2.2593541145325
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_scr_01",
				"pwh_gameplay_seeing_a_scr_02",
				"pwh_gameplay_seeing_a_scr_03",
				"pwh_gameplay_seeing_a_scr_04",
				"pwh_gameplay_seeing_a_scr_05",
				"pwh_gameplay_seeing_a_scr_06",
				"pwh_gameplay_seeing_a_scr_07",
				"pwh_gameplay_seeing_a_shield_clanrat_01",
				"pwh_gameplay_seeing_a_shield_clanrat_02",
				"pwh_gameplay_seeing_a_shield_clanrat_03",
				"pwh_gameplay_seeing_a_shield_clanrat_04",
				"pwh_gameplay_seeing_a_shield_clanrat_05",
				"pwh_gameplay_seeing_a_shield_clanrat_06",
				"pwh_gameplay_seeing_a_shield_clanrat_07",
				"pwh_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_eaten = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_dwarf_ranger_eaten_01",
				"pwh_dwarf_ranger_eaten_02",
				"pwh_dwarf_ranger_eaten_03",
				"pwh_dwarf_ranger_eaten_04",
				"pwh_dwarf_ranger_eaten_05",
				"pwh_dwarf_ranger_eaten_06",
				"pwh_dwarf_ranger_eaten_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.7453126907349,
				4.1110210418701,
				4.3707709312439,
				7.7767915725708,
				5.4734997749329,
				6.8324999809265,
				7.2381043434143
			},
			localization_strings = {
				"pwh_dwarf_ranger_eaten_01",
				"pwh_dwarf_ranger_eaten_02",
				"pwh_dwarf_ranger_eaten_03",
				"pwh_dwarf_ranger_eaten_04",
				"pwh_dwarf_ranger_eaten_05",
				"pwh_dwarf_ranger_eaten_06",
				"pwh_dwarf_ranger_eaten_07"
			},
			randomize_indexes = {}
		},
		pwh_objective_goal_achieved_more_left = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_objective_goal_achieved_more_left_01",
				"pwh_objective_goal_achieved_more_left_03",
				"pwh_objective_goal_achieved_more_left_04",
				"pwh_objective_goal_achieved_more_left_06",
				"pwh_objective_goal_achieved_more_left_07",
				"pwh_objective_goal_achieved_more_left_09",
				"pwh_objective_goal_achieved_more_left_10",
				"pwh_objective_goal_achieved_more_left_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.8792916536331,
				1.1111874580383,
				1.3193333148956,
				0.99791663885117,
				2.2075417041779,
				1.8792916536331,
				1.1111874580383,
				1.3193333148956
			},
			localization_strings = {
				"pwh_objective_goal_achieved_more_left_01",
				"pwh_objective_goal_achieved_more_left_03",
				"pwh_objective_goal_achieved_more_left_04",
				"pwh_objective_goal_achieved_more_left_06",
				"pwh_objective_goal_achieved_more_left_07",
				"pwh_objective_goal_achieved_more_left_09",
				"pwh_objective_goal_achieved_more_left_10",
				"pwh_objective_goal_achieved_more_left_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_Skaven_warpfire_thrower = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.8008124828339,
				3.9004375934601,
				3.3390207290649,
				5.1754999160767,
				2.2306458950043,
				1.2797291278839
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			randomize_indexes = {}
		},
		pwh_objective_goal_achieved_escape = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_objective_goal_achieved_escape_01",
				"pwh_objective_goal_achieved_escape_02",
				"pwh_objective_goal_achieved_escape_05",
				"pwh_objective_goal_achieved_escape_06",
				"pwh_objective_goal_achieved_escape_07",
				"pwh_objective_goal_achieved_escape_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.9884999990463,
				0.89804166555405,
				1.9884999990463,
				0.89804166555405,
				1.099249958992,
				2.3577709197998
			},
			localization_strings = {
				"pwh_objective_goal_achieved_escape_01",
				"pwh_objective_goal_achieved_escape_02",
				"pwh_objective_goal_achieved_escape_05",
				"pwh_objective_goal_achieved_escape_06",
				"pwh_objective_goal_achieved_escape_07",
				"pwh_objective_goal_achieved_escape_08"
			},
			randomize_indexes = {}
		},
		pwh_activate_ability_bounty_hunter = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_activate_ability_bounty_hunter_01",
				"pwh_activate_ability_bounty_hunter_02",
				"pwh_activate_ability_bounty_hunter_03",
				"pwh_activate_ability_bounty_hunter_04",
				"pwh_activate_ability_bounty_hunter_05",
				"pwh_activate_ability_bounty_hunter_06",
				"pwh_activate_ability_bounty_hunter_07",
				"pwh_activate_ability_bounty_hunter_08",
				"pwh_activate_ability_bounty_hunter_09",
				"pwh_activate_ability_bounty_hunter_10",
				"pwh_activate_ability_bounty_hunter_11",
				"pwh_activate_ability_bounty_hunter_12"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.792791724205,
				1.7863124608993,
				2.0773749351502,
				2.5558958053589,
				1.3838958740234,
				1.8010624647141,
				2.5448124408722,
				1.6548957824707,
				1.8603333234787,
				2.3688333034515,
				2.6929376125336,
				2.3858749866486
			},
			localization_strings = {
				"pwh_activate_ability_bounty_hunter_01",
				"pwh_activate_ability_bounty_hunter_02",
				"pwh_activate_ability_bounty_hunter_03",
				"pwh_activate_ability_bounty_hunter_04",
				"pwh_activate_ability_bounty_hunter_05",
				"pwh_activate_ability_bounty_hunter_06",
				"pwh_activate_ability_bounty_hunter_07",
				"pwh_activate_ability_bounty_hunter_08",
				"pwh_activate_ability_bounty_hunter_09",
				"pwh_activate_ability_bounty_hunter_10",
				"pwh_activate_ability_bounty_hunter_11",
				"pwh_activate_ability_bounty_hunter_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_ratling = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_killing_ratling_05",
				"pwh_gameplay_killing_ratling_06",
				"pwh_gameplay_killing_ratling_07",
				"pwh_gameplay_killing_ratling_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.2401666641235,
				1.6679166555405,
				1.5047291517258,
				2.9404792785645
			},
			localization_strings = {
				"pwh_gameplay_killing_ratling_05",
				"pwh_gameplay_killing_ratling_06",
				"pwh_gameplay_killing_ratling_07",
				"pwh_gameplay_killing_ratling_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_wizard_tentacle = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.0966041088104,
				2.4180624485016,
				2.8248751163483,
				4.710000038147,
				2.8280000686645,
				1.8997708559036
			},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_incoming_attack = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_gameplay_seeing_a_minotaur_01",
				"pwh_gameplay_seeing_a_minotaur_02",
				"pwh_gameplay_seeing_a_minotaur_03",
				"pwh_gameplay_seeing_a_minotaur_06",
				"pwh_gameplay_seeing_a_minotaur_08",
				"pwh_gameplay_hearing_a_minotaur_combat_01",
				"pwh_gameplay_hearing_a_minotaur_combat_05",
				"pwh_gameplay_hearing_a_minotaur_combat_06",
				"pwh_gameplay_hearing_a_minotaur_combat_08",
				"pwh_gameplay_hearing_a_minotaur_combat_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.8218750953674,
				4.0249581336975,
				4.3480625152588,
				2.5017499923706,
				3.0187082290649,
				2.326354265213,
				1.8555417060852,
				2.1786458492279,
				2.5478959083557,
				2.7140834331513
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_minotaur_01",
				"pwh_gameplay_seeing_a_minotaur_02",
				"pwh_gameplay_seeing_a_minotaur_03",
				"pwh_gameplay_seeing_a_minotaur_06",
				"pwh_gameplay_seeing_a_minotaur_08",
				"pwh_gameplay_hearing_a_minotaur_combat_01",
				"pwh_gameplay_hearing_a_minotaur_combat_05",
				"pwh_gameplay_hearing_a_minotaur_combat_06",
				"pwh_gameplay_hearing_a_minotaur_combat_08",
				"pwh_gameplay_hearing_a_minotaur_combat_07"
			},
			randomize_indexes = {}
		},
		pwh_curse_forced = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "mutator_special_occasion",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_curse_01",
				"pwh_curse_02",
				"pwh_curse_03",
				"pwh_curse_04",
				"pwh_curse_05",
				"pwh_curse_06",
				"pwh_curse_07",
				"pwh_curse_08",
				"pwh_curse_09",
				"pwh_curse_10",
				"pwh_curse_11",
				"pwh_curse_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.3804792165756,
				1.7233749628067,
				4.5214376449585,
				2.0933542251587,
				1.0487500429153,
				2.3764791488648,
				3.4099791049957,
				1.3287291526794,
				1.5369166135788,
				3.0420832633972,
				3.4376873970032,
				2.6176249980927
			},
			localization_strings = {
				"pwh_curse_01",
				"pwh_curse_02",
				"pwh_curse_03",
				"pwh_curse_04",
				"pwh_curse_05",
				"pwh_curse_06",
				"pwh_curse_07",
				"pwh_curse_08",
				"pwh_curse_09",
				"pwh_curse_10",
				"pwh_curse_11",
				"pwh_curse_12"
			},
			randomize_indexes = {}
		},
		pwh_objective_dropping_grimoire = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_objective_dropping_grimoire_09",
				"pwh_objective_dropping_grimoire_10",
				"pwh_objective_dropping_grimoire_11",
				"pwh_objective_dropping_grimoire_12",
				"pwh_objective_dropping_grimoire_13",
				"pwh_objective_dropping_grimoire_14",
				"pwh_objective_dropping_grimoire_15",
				"pwh_objective_dropping_grimoire_16"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.7743542194366,
				2.3479583263397,
				3.3758749961853,
				2.3181250095367,
				2.0717709064484,
				4.4998126029968,
				2.7132916450501,
				2.8747708797455
			},
			localization_strings = {
				"pwh_objective_dropping_grimoire_09",
				"pwh_objective_dropping_grimoire_10",
				"pwh_objective_dropping_grimoire_11",
				"pwh_objective_dropping_grimoire_12",
				"pwh_objective_dropping_grimoire_13",
				"pwh_objective_dropping_grimoire_14",
				"pwh_objective_dropping_grimoire_15",
				"pwh_objective_dropping_grimoire_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_parry_dwarf_ranger = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_parry_dwarf_ranger_01",
				"pwh_gameplay_parry_dwarf_ranger_02",
				"pwh_gameplay_parry_dwarf_ranger_03",
				"pwh_gameplay_parry_dwarf_ranger_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.4166874885559,
				2.4599165916443,
				1.555104136467,
				3.6871666908264
			},
			localization_strings = {
				"pwh_gameplay_parry_dwarf_ranger_01",
				"pwh_gameplay_parry_dwarf_ranger_02",
				"pwh_gameplay_parry_dwarf_ranger_03",
				"pwh_gameplay_parry_dwarf_ranger_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dead_end = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_dead_end_03",
				"pwh_gameplay_dead_end_07",
				"pwh_gameplay_dead_end_08",
				"pwh_gameplay_dead_end_09",
				"pwh_gameplay_dead_end_10",
				"pwh_gameplay_dead_end_11"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.0372290611267,
				2.0372290611267,
				2.1573541164398,
				2.4061875343323,
				2.9245624542236,
				2.3011875152588
			},
			localization_strings = {
				"pwh_gameplay_dead_end_03",
				"pwh_gameplay_dead_end_07",
				"pwh_gameplay_dead_end_08",
				"pwh_gameplay_dead_end_09",
				"pwh_gameplay_dead_end_10",
				"pwh_gameplay_dead_end_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_globadier = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_killing_globadier_02",
				"pwh_gameplay_killing_globadier_03",
				"pwh_gameplay_killing_globadier_05",
				"pwh_gameplay_killing_globadier_06",
				"pwh_gameplay_killing_globadier_07",
				"pwh_gameplay_killing_globadier_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.1777917146683,
				1.4542083740234,
				2.0470416545868,
				1.550541639328,
				1.1777917146683,
				1.4542083740234
			},
			localization_strings = {
				"pwh_gameplay_killing_globadier_02",
				"pwh_gameplay_killing_globadier_03",
				"pwh_gameplay_killing_globadier_05",
				"pwh_gameplay_killing_globadier_06",
				"pwh_gameplay_killing_globadier_07",
				"pwh_gameplay_killing_globadier_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_pm = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_gameplay_hearing_a_pm_01",
				"pwh_gameplay_hearing_a_pm_02",
				"pwh_gameplay_hearing_a_pm_03",
				"pwh_gameplay_hearing_a_pm_04",
				"pwh_gameplay_hearing_a_plague_monk_01",
				"pwh_gameplay_hearing_a_plague_monk_02",
				"pwh_gameplay_hearing_a_plague_monk_03",
				"pwh_gameplay_hearing_a_plague_monk_04",
				"pwh_gameplay_hearing_a_plague_monk_05",
				"pwh_gameplay_hearing_a_plague_monk_06",
				"pwh_gameplay_hearing_a_plague_monk_07",
				"pwh_gameplay_hearing_a_plague_monk_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.9910416603088,
				4.0498542785644,
				2.5540833473206,
				2.1320209503174,
				3.675062417984,
				3.0011875629425,
				3.9522292613983,
				4.310124874115,
				1.3590416908264,
				1.4879167079925,
				2.6002082824707,
				1.6687500476837
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_pm_01",
				"pwh_gameplay_hearing_a_pm_02",
				"pwh_gameplay_hearing_a_pm_03",
				"pwh_gameplay_hearing_a_pm_04",
				"pwh_gameplay_hearing_a_plague_monk_01",
				"pwh_gameplay_hearing_a_plague_monk_02",
				"pwh_gameplay_hearing_a_plague_monk_03",
				"pwh_gameplay_hearing_a_plague_monk_04",
				"pwh_gameplay_hearing_a_plague_monk_05",
				"pwh_gameplay_hearing_a_plague_monk_06",
				"pwh_gameplay_hearing_a_plague_monk_07",
				"pwh_gameplay_hearing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_low_on_health = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_low_on_health_02",
				"pwh_gameplay_dwarf_ranger_low_on_health_05",
				"pwh_gameplay_dwarf_ranger_low_on_health_06",
				"pwh_gameplay_dwarf_ranger_low_on_health_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.9755833148956,
				2.9755833148956,
				3.659458398819,
				2.0665833950043
			},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_low_on_health_02",
				"pwh_gameplay_dwarf_ranger_low_on_health_05",
				"pwh_gameplay_dwarf_ranger_low_on_health_06",
				"pwh_gameplay_dwarf_ranger_low_on_health_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_tips_wizard_plague = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_tips_wizard_plague_01",
				"pwh_gameplay_tips_wizard_plague_02",
				"pwh_gameplay_tips_wizard_plague_03",
				"pwh_gameplay_tips_wizard_plague_04",
				"pwh_gameplay_tips_wizard_plague_05",
				"pwh_gameplay_tips_wizard_plague_06",
				"pwh_gameplay_tips_wizard_plague_07",
				"pwh_gameplay_tips_wizard_plague_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				3.3577082157135,
				2.9172916412353,
				1.7569583654404,
				3.8457083702087,
				4.4365835189819,
				3.4392082691193,
				2.5930624008179,
				3.2620000839233
			},
			localization_strings = {
				"pwh_gameplay_tips_wizard_plague_01",
				"pwh_gameplay_tips_wizard_plague_02",
				"pwh_gameplay_tips_wizard_plague_03",
				"pwh_gameplay_tips_wizard_plague_04",
				"pwh_gameplay_tips_wizard_plague_05",
				"pwh_gameplay_tips_wizard_plague_06",
				"pwh_gameplay_tips_wizard_plague_07",
				"pwh_gameplay_tips_wizard_plague_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_friendly_fire_bright_wizard = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_friendly_fire_bright_wizard_02",
				"pwh_gameplay_friendly_fire_bright_wizard_05",
				"pwh_gameplay_friendly_fire_bright_wizard_06",
				"pwh_gameplay_friendly_fire_bright_wizard_07",
				"pwh_gameplay_friendly_fire_bright_wizard_08",
				"pwh_gameplay_friendly_fire_bright_wizard_09"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.8437708616257,
				1.8437708616257,
				4.0555415153503,
				3.7145624160767,
				4.0358543395996,
				3.247270822525
			},
			localization_strings = {
				"pwh_gameplay_friendly_fire_bright_wizard_02",
				"pwh_gameplay_friendly_fire_bright_wizard_05",
				"pwh_gameplay_friendly_fire_bright_wizard_06",
				"pwh_gameplay_friendly_fire_bright_wizard_07",
				"pwh_gameplay_friendly_fire_bright_wizard_08",
				"pwh_gameplay_friendly_fire_bright_wizard_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_plague_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.4007499217987,
				1.2270624637604,
				1.5171666145325,
				3.5665209293366,
				2.9372916221619,
				2.917729139328,
				2.8675000667572,
				4.0422706604004
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_globadier = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_07",
				"pwh_gameplay_seeing_a_globadier_08",
				"pwh_gameplay_seeing_a_globadier_09",
				"pwh_gameplay_seeing_a_globadier_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.1562291383743,
				0.72389584779739,
				1.1562291383743,
				0.72389584779739,
				2.0891873836517,
				1.9136874675751
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_07",
				"pwh_gameplay_seeing_a_globadier_08",
				"pwh_gameplay_seeing_a_globadier_09",
				"pwh_gameplay_seeing_a_globadier_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_incoming_skaven_rat_ogre = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_incoming_skaven_rat_ogre_06",
				"pwh_gameplay_incoming_skaven_rat_ogre_07",
				"pwh_gameplay_incoming_Skaven_rat_ogre_09",
				"pwh_gameplay_incoming_Skaven_rat_ogre_10",
				"pwh_gameplay_incoming_Skaven_rat_ogre_11",
				"pwh_gameplay_incoming_Skaven_rat_ogre_12",
				"pwh_gameplay_incoming_Skaven_rat_ogre_13",
				"pwh_gameplay_incoming_Skaven_rat_ogre_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.0751041173935,
				0.85377085208893,
				3.4567,
				3.4567,
				3.4211666584015,
				2.7916874885559,
				2.7809584140778,
				3.7776875495911
			},
			localization_strings = {
				"pwh_gameplay_incoming_skaven_rat_ogre_06",
				"pwh_gameplay_incoming_skaven_rat_ogre_07",
				"pwh_gameplay_incoming_Skaven_rat_ogre_09",
				"pwh_gameplay_incoming_Skaven_rat_ogre_10",
				"pwh_gameplay_incoming_Skaven_rat_ogre_11",
				"pwh_gameplay_incoming_Skaven_rat_ogre_12",
				"pwh_gameplay_incoming_Skaven_rat_ogre_13",
				"pwh_gameplay_incoming_Skaven_rat_ogre_14"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_troll = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_troll_01",
				"pwh_gameplay_seeing_a_troll_02",
				"pwh_gameplay_seeing_a_troll_03",
				"pwh_gameplay_seeing_a_troll_04",
				"pwh_gameplay_seeing_a_troll_05",
				"pwh_gameplay_seeing_a_troll_06",
				"pwh_gameplay_seeing_a_troll_07",
				"pwh_gameplay_seeing_a_troll_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.00745844841,
				1.6679375171661,
				2.9149374961853,
				4.0016875267029,
				3.6269791126251,
				4.5096459388733,
				4.1006665229797,
				3.4137291908264
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_troll_01",
				"pwh_gameplay_seeing_a_troll_02",
				"pwh_gameplay_seeing_a_troll_03",
				"pwh_gameplay_seeing_a_troll_04",
				"pwh_gameplay_seeing_a_troll_05",
				"pwh_gameplay_seeing_a_troll_06",
				"pwh_gameplay_seeing_a_troll_07",
				"pwh_gameplay_seeing_a_troll_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_gutter_runner = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_gutter_runner_01",
				"pwh_gameplay_hearing_a_gutter_runner_03",
				"pwh_gameplay_hearing_a_gutter_runner_07",
				"pwh_gameplay_hearing_a_gutter_runner_08",
				"pwh_gameplay_hearing_a_gutter_runner_09",
				"pwh_gameplay_hearing_a_gutter_runner_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				0.77458333969116,
				1.8757916688919,
				0.77458333969116,
				1.8757916688919,
				2.7084999084473,
				1.6126041412354
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_gutter_runner_01",
				"pwh_gameplay_hearing_a_gutter_runner_03",
				"pwh_gameplay_hearing_a_gutter_runner_07",
				"pwh_gameplay_hearing_a_gutter_runner_08",
				"pwh_gameplay_hearing_a_gutter_runner_09",
				"pwh_gameplay_hearing_a_gutter_runner_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bile_troll_before_puke = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_bile_troll_before_puke_01",
				"pwh_gameplay_bile_troll_before_puke_02",
				"pwh_gameplay_bile_troll_before_puke_03",
				"pwh_gameplay_bile_troll_before_puke_04",
				"pwh_gameplay_bile_troll_before_puke_05",
				"pwh_gameplay_bile_troll_before_puke_06",
				"pwh_gameplay_bile_troll_before_puke_07",
				"pwh_gameplay_bile_troll_before_puke_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				2.2480833530426,
				2.8430416584015,
				1.8309166431427,
				2.8532917499542,
				3.354749917984,
				1.6827291250229,
				1.6993541717529,
				2.0971040725708
			},
			localization_strings = {
				"pwh_gameplay_bile_troll_before_puke_01",
				"pwh_gameplay_bile_troll_before_puke_02",
				"pwh_gameplay_bile_troll_before_puke_03",
				"pwh_gameplay_bile_troll_before_puke_04",
				"pwh_gameplay_bile_troll_before_puke_05",
				"pwh_gameplay_bile_troll_before_puke_06",
				"pwh_gameplay_bile_troll_before_puke_07",
				"pwh_gameplay_bile_troll_before_puke_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_potion = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 15,
			sound_events = {
				"pwh_gameplay_spots_potion_03",
				"pwh_gameplay_spots_potion_04",
				"pwh_gameplay_spots_potion_06",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.6538749933243,
				1.5522708892822,
				1.016937494278,
				1.0672708749771,
				1.3848750591278,
				1.0501041412354,
				1.6987916231155,
				1.3762916326523,
				1.9510416984558,
				2.1991457939148,
				1.7391250133514,
				2.3171665668488,
				3.1935625076294,
				1.8360625505447,
				1.2418124675751
			},
			localization_strings = {
				"pwh_gameplay_spots_potion_03",
				"pwh_gameplay_spots_potion_04",
				"pwh_gameplay_spots_potion_06",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_wood_elf_dead_01",
				"pwh_gameplay_wood_elf_dead_04",
				"pwh_gameplay_wood_elf_dead_05",
				"pwh_gameplay_wood_elf_dead_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			sound_events_duration = {
				1.5181041955948,
				1.2921041250229,
				1.5181041955948,
				1.2921041250229
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_dead_01",
				"pwh_gameplay_wood_elf_dead_04",
				"pwh_gameplay_wood_elf_dead_05",
				"pwh_gameplay_wood_elf_dead_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_dead = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_bright_wizard_dead_05",
				"pwh_gameplay_bright_wizard_dead_06",
				"pwh_gameplay_bright_wizard_dead_07",
				"pwh_gameplay_bright_wizard_dead_08",
				"pwh_gameplay_bright_wizard_dead_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.4537916183472,
				1.4537916183472,
				2.4266250133514,
				3.1315834522247,
				3.8671040534973
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_dead_05",
				"pwh_gameplay_bright_wizard_dead_06",
				"pwh_gameplay_bright_wizard_dead_07",
				"pwh_gameplay_bright_wizard_dead_08",
				"pwh_gameplay_bright_wizard_dead_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_wizard_leech_leeching_bardin = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.5913543701172,
				3.7838957309723,
				5.6741666793823,
				5.3922290802002,
				1.6647083759308,
				1.9982916116715,
				4.6352915763855,
				4.0145831108093
			},
			localization_strings = {
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_01",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_02",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_03",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_04",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_05",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_06",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_07",
				"pwh_gameplay_chaos_wizard_leech_leeching_bardin_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_on_a_frenzy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_bright_wizard_on_a_frenzy_05",
				"pwh_gameplay_bright_wizard_on_a_frenzy_06",
				"pwh_gameplay_bright_wizard_on_a_frenzy_07",
				"pwh_gameplay_bright_wizard_on_a_frenzy_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.2633125782013,
				3.2954790592194,
				2.7722916603088,
				2.717437505722
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_on_a_frenzy_05",
				"pwh_gameplay_bright_wizard_on_a_frenzy_06",
				"pwh_gameplay_bright_wizard_on_a_frenzy_07",
				"pwh_gameplay_bright_wizard_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_grabbed = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_wood_elf_grabbed_07",
				"pwh_gameplay_wood_elf_grabbed_08",
				"pwh_gameplay_wood_elf_grabbed_09",
				"pwh_gameplay_wood_elf_grabbed_10",
				"pwh_gameplay_wood_elf_grabbed_11",
				"pwh_gameplay_wood_elf_grabbed_12",
				"pwh_gameplay_wood_elf_grabbed_13",
				"pwh_gameplay_wood_elf_grabbed_14",
				"pwh_gameplay_wood_elf_grabbed_15"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.2457082271576,
				1.854291677475,
				1.3640208244324,
				2.3885834217072,
				2.2923123836517,
				2.3419375419617,
				1.9316458702087,
				2.8733124732971,
				2.1823332309723
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_grabbed_07",
				"pwh_gameplay_wood_elf_grabbed_08",
				"pwh_gameplay_wood_elf_grabbed_09",
				"pwh_gameplay_wood_elf_grabbed_10",
				"pwh_gameplay_wood_elf_grabbed_11",
				"pwh_gameplay_wood_elf_grabbed_12",
				"pwh_gameplay_wood_elf_grabbed_13",
				"pwh_gameplay_wood_elf_grabbed_14",
				"pwh_gameplay_wood_elf_grabbed_15"
			},
			randomize_indexes = {}
		},
		pwh_objective_interacting_with_objective = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_objective_interacting_with_objective_02",
				"pwh_objective_interacting_with_objective_04",
				"pwh_objective_interacting_with_objective_05",
				"pwh_objective_interacting_with_objective_06",
				"pwh_objective_interacting_with_objective_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.168666601181,
				2.168666601181,
				2.5168125629425,
				2.1721875667572,
				2.7611875534058
			},
			localization_strings = {
				"pwh_objective_interacting_with_objective_02",
				"pwh_objective_interacting_with_objective_04",
				"pwh_objective_interacting_with_objective_05",
				"pwh_objective_interacting_with_objective_06",
				"pwh_objective_interacting_with_objective_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_rat_ogre = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_11",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_12"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				0.99374997615814,
				3.4567,
				3.4567,
				3.4567,
				3.7822709083557,
				3.5577292442322,
				3.5610625743866
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_11",
				"pwh_gameplay_seeing_a_Skaven_rat_ogre_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_ratling_gun = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_11"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.6915208101273,
				1.688812494278,
				1.0182499885559,
				3.4567,
				3.4567,
				3.4567,
				1.8875207901001
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pwh_gameplay_seeing_a_Skaven_ratling_gun_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_wind_combat = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.6075415611267,
				1.4169791936874,
				2.0190207958221,
				2.816645860672,
				1.8283333778381,
				3.2214167118073,
				2.9673125743866
			},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dead_body = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_dead_body_06",
				"pwh_gameplay_dead_body_07",
				"pwh_gameplay_dead_body_08",
				"pwh_gameplay_dead_body_09",
				"pwh_gameplay_dead_body_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.051374912262,
				2.6331458091736,
				3.4142916202545,
				2.8696041107178,
				3.4532709121704
			},
			localization_strings = {
				"pwh_gameplay_dead_body_06",
				"pwh_gameplay_dead_body_07",
				"pwh_gameplay_dead_body_08",
				"pwh_gameplay_dead_body_09",
				"pwh_gameplay_dead_body_10"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_dead_05",
				"pwh_gameplay_dwarf_ranger_dead_06",
				"pwh_gameplay_dwarf_ranger_dead_07",
				"pwh_gameplay_dwarf_ranger_dead_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.8757499456406,
				3.3898541927338,
				2.4035415649414,
				3.2698750495911
			},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_dead_05",
				"pwh_gameplay_dwarf_ranger_dead_06",
				"pwh_gameplay_dwarf_ranger_dead_07",
				"pwh_gameplay_dwarf_ranger_dead_08"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_door = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_objective_correct_path_door_01",
				"pwh_objective_correct_path_door_02",
				"pwh_objective_correct_path_door_03",
				"pwh_objective_correct_path_door_04",
				"pwh_objective_correct_path_door_05",
				"pwh_objective_correct_path_door_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.0930416584015,
				1.6446458101273,
				1.2521666288376,
				1.8872499465942,
				1.0930416584015,
				1.2521666288376
			},
			localization_strings = {
				"pwh_objective_correct_path_door_01",
				"pwh_objective_correct_path_door_02",
				"pwh_objective_correct_path_door_03",
				"pwh_objective_correct_path_door_04",
				"pwh_objective_correct_path_door_05",
				"pwh_objective_correct_path_door_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_low_on_health = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_wood_elf_low_on_health_05",
				"pwh_gameplay_wood_elf_low_on_health_06",
				"pwh_gameplay_wood_elf_low_on_health_07",
				"pwh_gameplay_wood_elf_low_on_health_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.5910832881927,
				2.7195415496826,
				2.6752917766571,
				2.0489165782928
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_low_on_health_05",
				"pwh_gameplay_wood_elf_low_on_health_06",
				"pwh_gameplay_wood_elf_low_on_health_07",
				"pwh_gameplay_wood_elf_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_helped_by_wood_elf = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_helped_by_wood_elf_01",
				"pwh_gameplay_helped_by_wood_elf_02",
				"pwh_gameplay_helped_by_wood_elf_05",
				"pwh_gameplay_helped_by_wood_elf_06",
				"pwh_gameplay_helped_by_wood_elf_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.7400624752045,
				1.9810416698456,
				1.7400624752045,
				1.9810416698456,
				1.6733750104904
			},
			localization_strings = {
				"pwh_gameplay_helped_by_wood_elf_01",
				"pwh_gameplay_helped_by_wood_elf_02",
				"pwh_gameplay_helped_by_wood_elf_05",
				"pwh_gameplay_helped_by_wood_elf_06",
				"pwh_gameplay_helped_by_wood_elf_07"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_bridge = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_bridge_01",
				"pwh_objective_correct_path_bridge_14",
				"pwh_objective_correct_path_bridge_15",
				"pwh_objective_correct_path_bridge_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.5383750200272,
				1.0283750295639,
				1.2142499685288,
				1.511062502861
			},
			localization_strings = {
				"pwh_objective_correct_path_bridge_01",
				"pwh_objective_correct_path_bridge_14",
				"pwh_objective_correct_path_bridge_15",
				"pwh_objective_correct_path_bridge_16"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_street = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_street_01",
				"pwh_objective_correct_path_street_05",
				"pwh_objective_correct_path_street_06",
				"pwh_objective_correct_path_street_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.2942082881927,
				3.2825417518616,
				2.0084373950958,
				2.9340832233429
			},
			localization_strings = {
				"pwh_objective_correct_path_street_01",
				"pwh_objective_correct_path_street_05",
				"pwh_objective_correct_path_street_06",
				"pwh_objective_correct_path_street_07"
			},
			randomize_indexes = {}
		},
		pwh_curse = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 12,
			sound_events = {
				"pwh_curse_01",
				"pwh_curse_02",
				"pwh_curse_03",
				"pwh_curse_04",
				"pwh_curse_05",
				"pwh_curse_06",
				"pwh_curse_07",
				"pwh_curse_08",
				"pwh_curse_09",
				"pwh_curse_10",
				"pwh_curse_11",
				"pwh_curse_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.3804792165756,
				1.7233749628067,
				4.5214376449585,
				2.0933542251587,
				1.0487500429153,
				2.3764791488648,
				3.4099791049957,
				1.3287291526794,
				1.5369166135788,
				3.0420832633972,
				3.4376873970032,
				2.6176249980927
			},
			localization_strings = {
				"pwh_curse_01",
				"pwh_curse_02",
				"pwh_curse_03",
				"pwh_curse_04",
				"pwh_curse_05",
				"pwh_curse_06",
				"pwh_curse_07",
				"pwh_curse_08",
				"pwh_curse_09",
				"pwh_curse_10",
				"pwh_curse_11",
				"pwh_curse_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_stormvermin = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_09",
				"pwh_gameplay_seeing_a_stormvermin_10",
				"pwh_gameplay_seeing_a_stormvermin_11",
				"pwh_gameplay_seeing_a_stormvermin_12",
				"pwh_gameplay_seeing_a_stormvermin_13",
				"pwh_gameplay_seeing_a_stormvermin_14",
				"pwh_gameplay_seeing_a_stormvermin_15",
				"pwh_gameplay_seeing_a_stormvermin_16",
				"pwh_gameplay_seeing_a_stormvermin_17"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				0.926020860672,
				2.2008540630341,
				1.0907291173935,
				0.926020860672,
				2.2008540630341,
				1.0907291173935,
				2.2998125553131,
				2.6547915935516,
				3.0249373912811,
				2.4939374923706
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_09",
				"pwh_gameplay_seeing_a_stormvermin_10",
				"pwh_gameplay_seeing_a_stormvermin_11",
				"pwh_gameplay_seeing_a_stormvermin_12",
				"pwh_gameplay_seeing_a_stormvermin_13",
				"pwh_gameplay_seeing_a_stormvermin_14",
				"pwh_gameplay_seeing_a_stormvermin_15",
				"pwh_gameplay_seeing_a_stormvermin_16",
				"pwh_gameplay_seeing_a_stormvermin_17"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_parry_wood_elf = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_parry_wood_elf_01",
				"pwh_gameplay_parry_wood_elf_02",
				"pwh_gameplay_parry_wood_elf_03",
				"pwh_gameplay_parry_wood_elf_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.2831250429153,
				1.5553333759308,
				1.9364166259766,
				1.7434375286102
			},
			localization_strings = {
				"pwh_gameplay_parry_wood_elf_01",
				"pwh_gameplay_parry_wood_elf_02",
				"pwh_gameplay_parry_wood_elf_03",
				"pwh_gameplay_parry_wood_elf_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_parry_empire_soldier = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_parry_empire_soldier_01",
				"pwh_gameplay_parry_empire_soldier_02",
				"pwh_gameplay_parry_empire_soldier_03",
				"pwh_gameplay_parry_empire_soldier_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.1079374551773,
				2.7800834178925,
				1.7810833454132,
				1.5756875276566
			},
			localization_strings = {
				"pwh_gameplay_parry_empire_soldier_01",
				"pwh_gameplay_parry_empire_soldier_02",
				"pwh_gameplay_parry_empire_soldier_03",
				"pwh_gameplay_parry_empire_soldier_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_armoured_enemy_dwarf_ranger = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 11,
			sound_events = {
				"pwh_gameplay_armoured_enemy_dwarf_01",
				"pwh_gameplay_armoured_enemy_dwarf_02",
				"pwh_gameplay_armoured_enemy_dwarf_03",
				"pwh_gameplay_armoured_enemy_dwarf_04",
				"pwh_gameplay_armoured_enemy_dwarf_05",
				"pwh_gameplay_armoured_enemy_dwarf_06",
				"pwh_gameplay_armoured_enemy_dwarf_07",
				"pwh_gameplay_armoured_enemy_dwarf_08",
				"pwh_gameplay_armoured_enemy_dwarf_09",
				"pwh_gameplay_armoured_enemy_dwarf_10",
				"pwh_gameplay_armoured_enemy_dwarf_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.079541683197,
				2.743499994278,
				3.3616459369659,
				3.2032084465027,
				2.0045208930969,
				3.1652915477753,
				2.0421874523163,
				2.098833322525,
				2.5952084064484,
				2.0861876010895,
				1.6452499628067
			},
			localization_strings = {
				"pwh_gameplay_armoured_enemy_dwarf_01",
				"pwh_gameplay_armoured_enemy_dwarf_02",
				"pwh_gameplay_armoured_enemy_dwarf_03",
				"pwh_gameplay_armoured_enemy_dwarf_04",
				"pwh_gameplay_armoured_enemy_dwarf_05",
				"pwh_gameplay_armoured_enemy_dwarf_06",
				"pwh_gameplay_armoured_enemy_dwarf_07",
				"pwh_gameplay_armoured_enemy_dwarf_08",
				"pwh_gameplay_armoured_enemy_dwarf_09",
				"pwh_gameplay_armoured_enemy_dwarf_10",
				"pwh_gameplay_armoured_enemy_dwarf_11"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_packmaster = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_killing_packmaster_05",
				"pwh_gameplay_killing_packmaster_06",
				"pwh_gameplay_killing_packmaster_07",
				"pwh_gameplay_killing_packmaster_08",
				"pwh_gameplay_killing_packmaster_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.9673750400543,
				3.9673750400543,
				3.65625,
				3.126791715622,
				1.8016458749771
			},
			localization_strings = {
				"pwh_gameplay_killing_packmaster_05",
				"pwh_gameplay_killing_packmaster_06",
				"pwh_gameplay_killing_packmaster_07",
				"pwh_gameplay_killing_packmaster_08",
				"pwh_gameplay_killing_packmaster_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_encouraging_words = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_encouraging_words_11",
				"pwh_gameplay_encouraging_words_12",
				"pwh_gameplay_encouraging_words_13",
				"pwh_gameplay_encouraging_words_14",
				"pwh_gameplay_encouraging_words_15",
				"pwh_gameplay_encouraging_words_16",
				"pwh_gameplay_encouraging_words_17",
				"pwh_gameplay_encouraging_words_18",
				"pwh_gameplay_encouraging_words_19"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.12735414505,
				2.6679167747498,
				3.2691249847412,
				2.9296040534973,
				3.4613125324249,
				3.7484374046326,
				4.1710624694824,
				3.7418541908264,
				2.583104133606
			},
			localization_strings = {
				"pwh_gameplay_encouraging_words_11",
				"pwh_gameplay_encouraging_words_12",
				"pwh_gameplay_encouraging_words_13",
				"pwh_gameplay_encouraging_words_14",
				"pwh_gameplay_encouraging_words_15",
				"pwh_gameplay_encouraging_words_16",
				"pwh_gameplay_encouraging_words_17",
				"pwh_gameplay_encouraging_words_18",
				"pwh_gameplay_encouraging_words_19"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_self_heal = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_self_heal_06",
				"pwh_gameplay_self_heal_02",
				"pwh_gameplay_self_heal_07",
				"pwh_gameplay_self_heal_08",
				"pwh_gameplay_self_heal_09",
				"pwh_gameplay_self_heal_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			sound_events_duration = {
				0.74968749284744,
				6.3066248893738,
				3.2419166564941,
				3.1528959274292,
				3.1719374656677,
				0.89620834589005
			},
			localization_strings = {
				"pwh_gameplay_self_heal_06",
				"pwh_gameplay_self_heal_02",
				"pwh_gameplay_self_heal_07",
				"pwh_gameplay_self_heal_08",
				"pwh_gameplay_self_heal_09",
				"pwh_gameplay_self_heal_10"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_objective_correct_path_up_03",
				"pwh_objective_correct_path_up_04",
				"pwh_objective_correct_path_up_05",
				"pwh_objective_correct_path_up_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4753334522247,
				1.7298958301544,
				1.4500000476837,
				1.0222083330154
			},
			localization_strings = {
				"pwh_objective_correct_path_up_03",
				"pwh_objective_correct_path_up_04",
				"pwh_objective_correct_path_up_05",
				"pwh_objective_correct_path_up_06"
			},
			randomize_indexes = {}
		}
	})
end
