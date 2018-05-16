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
				20
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
				20
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
				20
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
				20
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
				20
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
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMEDIFF,
				OP.GT,
				20
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
				20
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
				"global_context",
				"level_time ",
				OP.GT,
				120
			},
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMEDIFF,
				OP.GT,
				180
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
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found way_bridge",
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
				20
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
				20
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
				"time_since_correct_path_ladder_down",
				OP.TIMEDIFF,
				OP.GT,
				20
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
				"time_since_correct_path_ladder_up",
				OP.TIMEDIFF,
				OP.GT,
				20
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
				OP.EQ,
				0
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
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				720
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_activating_magic_weapon_offensive",
		response = "pwh_gameplay_activating_magic_weapon_offensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"stance_triggered"
			},
			{
				"query_context",
				"stance_type",
				OP.EQ,
				"offensive"
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
				1
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
		name = "pwh_gameplay_activating_magic_weapon_defensive",
		response = "pwh_gameplay_activating_magic_weapon_defensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"stance_triggered"
			},
			{
				"query_context",
				"stance_type",
				OP.EQ,
				"defensive"
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
				1
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
				"dwarf_ranger"
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
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				720
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
				600
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
				600
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
				600
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
				600
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
				600
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
				600
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
				600
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
				600
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
				600
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
				600
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
				"num_units      ",
				OP.GT,
				5
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
				600
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
				"user_memory",
				"time_since_alone",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"user_memory",
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
				10
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
				10
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
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rate_ogre",
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
				10
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
				"distance",
				OP.GT,
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
				10
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
				OP.GT,
				10
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				90
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				120
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
				10
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
				10
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
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				10
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
				10
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
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
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
				10
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
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
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
				10
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
				10
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
				10
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
		name = "pwh_gameplay_killing_a_chaos_spawn",
		response = "pwh_gameplay_killing_a_chaos_spawn",
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
				"chaos_spawn"
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
				"time_since_killing_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_chaos_spawn",
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				10
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
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_berzerker"
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
		name = "pwh_gameplay_killing_a_troll",
		response = "pwh_gameplay_killing_a_troll",
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
				"chaos_troll"
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
				"time_since_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_troll",
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
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				10
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_leech",
		response = "pwh_gameplay_hearing_a_chaos_wizard_leech",
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
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_leech",
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
	add_dialogues({
		pwh_gameplay_tips_wizard_wind = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_killing_a_troll = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_troll_01",
				"pwh_gameplay_killing_a_troll_02",
				"pwh_gameplay_killing_a_troll_03",
				"pwh_gameplay_killing_a_troll_04",
				"pwh_gameplay_killing_a_troll_05",
				"pwh_gameplay_killing_a_troll_06",
				"pwh_gameplay_killing_a_troll_07",
				"pwh_gameplay_killing_a_troll_08"
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
			localization_strings = {
				"pwh_gameplay_killing_a_troll_01",
				"pwh_gameplay_killing_a_troll_02",
				"pwh_gameplay_killing_a_troll_03",
				"pwh_gameplay_killing_a_troll_04",
				"pwh_gameplay_killing_a_troll_05",
				"pwh_gameplay_killing_a_troll_06",
				"pwh_gameplay_killing_a_troll_07",
				"pwh_gameplay_killing_a_troll_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_being_helped_up = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_killing_a_chaos_spawn = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_killing_a_chaos_spawn_01",
				"pwh_gameplay_killing_a_chaos_spawn_02",
				"pwh_gameplay_killing_a_chaos_spawn_03",
				"pwh_gameplay_killing_a_chaos_spawn_04",
				"pwh_gameplay_killing_a_chaos_spawn_05",
				"pwh_gameplay_killing_a_chaos_spawn_06",
				"pwh_gameplay_killing_a_chaos_spawn_07",
				"pwh_gameplay_killing_a_chaos_spawn_08"
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
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_spawn_01",
				"pwh_gameplay_killing_a_chaos_spawn_02",
				"pwh_gameplay_killing_a_chaos_spawn_03",
				"pwh_gameplay_killing_a_chaos_spawn_04",
				"pwh_gameplay_killing_a_chaos_spawn_05",
				"pwh_gameplay_killing_a_chaos_spawn_06",
				"pwh_gameplay_killing_a_chaos_spawn_07",
				"pwh_gameplay_killing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_parry_bright_wizard_01",
				"pwh_gameplay_parry_bright_wizard_02",
				"pwh_gameplay_parry_bright_wizard_03",
				"pwh_gameplay_parry_bright_wizard_04"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_this_way = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_objective_correct_path_down_01",
				"pwh_objective_correct_path_down_04",
				"pwh_objective_correct_path_down_05",
				"pwh_objective_correct_path_down_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_wizard_leech_leeching_kruber = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
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
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_friendly_fire_wood_elf_05",
				"pwh_gameplay_friendly_fire_wood_elf_06",
				"pwh_gameplay_friendly_fire_wood_elf_07",
				"pwh_gameplay_friendly_fire_wood_elf_08",
				"pwh_gameplay_friendly_fire_wood_elf_09"
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
			localization_strings = {
				"pwh_gameplay_friendly_fire_wood_elf_05",
				"pwh_gameplay_friendly_fire_wood_elf_06",
				"pwh_gameplay_friendly_fire_wood_elf_07",
				"pwh_gameplay_friendly_fire_wood_elf_08",
				"pwh_gameplay_friendly_fire_wood_elf_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_on_a_frenzy = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_empire_soldier_low_on_health_01",
				"pwh_gameplay_empire_soldier_low_on_health_05",
				"pwh_gameplay_empire_soldier_low_on_health_06",
				"pwh_gameplay_empire_soldier_low_on_health_07",
				"pwh_gameplay_empire_soldier_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pwh_targeted_by_ratling = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
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
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_troll = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_gameplay_killing_lootrat = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_killing_lootrat_01",
				"pwh_gameplay_killing_lootrat_04",
				"pwh_gameplay_killing_lootrat_05",
				"pwh_gameplay_killing_lootrat_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_activating_magic_weapon_defensive = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_activating_magic_weapon_defensive_01",
				"pwh_gameplay_activating_magic_weapon_defensive_02",
				"pwh_gameplay_activating_magic_weapon_defensive_03",
				"pwh_gameplay_activating_magic_weapon_defensive_04",
				"pwh_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_armoured_enemy_wood_elf = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_killing_gutterrunner = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_activating_magic_weapon_offensive = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_activating_magic_weapon_offensive_01",
				"pwh_gameplay_activating_magic_weapon_offensive_03",
				"pwh_gameplay_activating_magic_weapon_offensive_04",
				"pwh_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_player_pounced = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "help_talk",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_helped_by_empire_soldier_05",
				"pwh_gameplay_helped_by_empire_soldier_06",
				"pwh_gameplay_helped_by_empire_soldier_07",
				"pwh_gameplay_helped_by_empire_soldier_08",
				"pwh_gameplay_helped_by_empire_soldier_09",
				"pwh_gameplay_helped_by_empire_soldier_10",
				"pwh_gameplay_helped_by_empire_soldier_11"
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_helped_by_empire_soldier_05",
				"pwh_gameplay_helped_by_empire_soldier_06",
				"pwh_gameplay_helped_by_empire_soldier_07",
				"pwh_gameplay_helped_by_empire_soldier_08",
				"pwh_gameplay_helped_by_empire_soldier_09",
				"pwh_gameplay_helped_by_empire_soldier_10",
				"pwh_gameplay_helped_by_empire_soldier_11"
			},
			randomize_indexes = {}
		},
		pwh_objective_correct_path_alley = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_objective_correct_path_ladder_down_01",
				"pwh_objective_correct_path_ladder_down_02",
				"pwh_objective_correct_path_ladder_down_03",
				"pwh_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_helped_by_bright_wizard = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			category = "help_talk",
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
			localization_strings = {
				"pwh_gameplay_helped_by_bright_wizard_03",
				"pwh_gameplay_helped_by_bright_wizard_05",
				"pwh_gameplay_helped_by_bright_wizard_06",
				"pwh_gameplay_helped_by_bright_wizard_07",
				"pwh_gameplay_helped_by_bright_wizard_08"
			},
			randomize_indexes = {}
		},
		pwh_activate_ability_zealot = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_chaos_warrior_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_bright_wizard_eaten = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_healing_wood_elf_05",
				"pwh_gameplay_healing_wood_elf_06",
				"pwh_gameplay_healing_wood_elf_07",
				"pwh_gameplay_healing_wood_elf_08",
				"pwh_gameplay_healing_wood_elf_09"
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
			localization_strings = {
				"pwh_gameplay_healing_wood_elf_05",
				"pwh_gameplay_healing_wood_elf_06",
				"pwh_gameplay_healing_wood_elf_07",
				"pwh_gameplay_healing_wood_elf_08",
				"pwh_gameplay_healing_wood_elf_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_empire_soldier_in_trouble = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_05",
				"pwh_gameplay_heard_empire_soldier_in_trouble_06",
				"pwh_gameplay_heard_empire_soldier_in_trouble_07",
				"pwh_gameplay_heard_empire_soldier_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_chaos_wizard_wind = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_seeing_a_chaos_wizard_tentacle = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_chaos_wizard_leech = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_gameplay_no_nearby_teammates = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_healing_draught = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_skaven_rat_ogre = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_hears_incoming_horde = {
			sound_events_n = 19,
			randomize_indexes_n = 0,
			face_animations_n = 19,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_seeing_a_stormfiend = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {}
		},
		pwh_special_ability_captain = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_seeing_a_chaos_wizard_plague = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_using_potion = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 30,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_seeing_a_chaos_warrior_champion_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_gameplay_seeing_a_chaos_warrior = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_killing_a_stormfiend = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
			category = "help_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_helped_by_dwarf_ranger_01",
				"pwh_gameplay_helped_by_dwarf_ranger_02",
				"pwh_gameplay_helped_by_dwarf_ranger_03",
				"pwh_gameplay_helped_by_dwarf_ranger_04"
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
			localization_strings = {
				"pwh_gameplay_helped_by_dwarf_ranger_01",
				"pwh_gameplay_helped_by_dwarf_ranger_02",
				"pwh_gameplay_helped_by_dwarf_ranger_03",
				"pwh_gameplay_helped_by_dwarf_ranger_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_a_skaven_warpfire_thrower = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_empire_soldier_on_a_frenzy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_empire_soldier_on_a_frenzy_01",
				"pwh_gameplay_empire_soldier_on_a_frenzy_02",
				"pwh_gameplay_empire_soldier_on_a_frenzy_03",
				"pwh_gameplay_empire_soldier_on_a_frenzy_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_ambush_horde_spawned = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "player_alerts",
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
		pwh_objective_goal_achieved_escape = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_empire_soldier_grabbed = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_killing_a_chaos_warrior = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_marauder_berserker_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_chaos_wizard_plague = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_bright_wizard_on_a_frenzy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_bright_wizard_on_a_frenzy_05",
				"pwh_gameplay_bright_wizard_on_a_frenzy_06",
				"pwh_gameplay_bright_wizard_on_a_frenzy_07",
				"pwh_gameplay_bright_wizard_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hearing_a_stormfiend = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_objective_nearing_objective_deadline = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_seeing_a_scr = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_wood_elf_grabbed = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_empire_soldier_eaten = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_friendly_fire_bright_wizard = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_troll_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_gameplay_hearing_a_chaos_spawn = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_hearing_a_chaos_spawn_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_dead_end = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_dwarf_ranger_eaten = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_skaven_ratling_gun_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_activate_ability_bounty_hunter = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_globadier_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_gameplay_wood_elf_eaten = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_objective_picking_up_grimoire = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_parry_dwarf_ranger = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_parry_dwarf_ranger_01",
				"pwh_gameplay_parry_dwarf_ranger_02",
				"pwh_gameplay_parry_dwarf_ranger_03",
				"pwh_gameplay_parry_dwarf_ranger_04"
			},
			randomize_indexes = {}
		},
		pwh_objective_achieved_all_but_one_goal = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_objective_achieved_all_but_one_goal_01",
				"pwh_objective_achieved_all_but_one_goal_02",
				"pwh_objective_achieved_all_but_one_goal_03",
				"pwh_objective_achieved_all_but_one_goal_05",
				"pwh_objective_achieved_all_but_one_goal_06"
			},
			randomize_indexes = {}
		},
		pwh_objective_dropping_grimoire = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_pm = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_low_on_health_02",
				"pwh_gameplay_dwarf_ranger_low_on_health_05",
				"pwh_gameplay_dwarf_ranger_low_on_health_06",
				"pwh_gameplay_dwarf_ranger_low_on_health_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_killing_globadier = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_tips_wizard_plague = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_chaos_wizard_plague_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
		pwh_gameplay_seeing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_seeing_a_troll = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_incoming_skaven_rat_ogre = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
		pwh_gameplay_bright_wizard_being_helped_up = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_hearing_a_gutter_runner = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_spots_potion = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_bile_troll_before_puke = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_gameplay_bright_wizard_dead = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_bright_wizard_dead_05",
				"pwh_gameplay_bright_wizard_dead_06",
				"pwh_gameplay_bright_wizard_dead_07",
				"pwh_gameplay_bright_wizard_dead_08",
				"pwh_gameplay_bright_wizard_dead_09"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			localization_strings = {
				"pwh_gameplay_wood_elf_dead_01",
				"pwh_gameplay_wood_elf_dead_04",
				"pwh_gameplay_wood_elf_dead_05",
				"pwh_gameplay_wood_elf_dead_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_wizard_leech_leeching_bardin = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "witch_hunter_honduras",
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
		pwh_objective_interacting_with_objective = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts_boss",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "witch_hunter_honduras",
			category = "enemy_alerts",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
			category = "help_talk",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "witch_hunter_honduras",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_honduras",
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
