return function ()
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_two_branch_one",
		response = "pwh_morris_loading_conversation_alpha_two_branch_one",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_one"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_two_branch_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_two_branch_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_three_branch_four_reply",
		response = "pwh_morris_loading_conversation_alpha_three_branch_four_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_alpha_three_branch_four_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_three_branch_four_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_three_branch_two_reply",
		response = "pwh_morris_loading_conversation_alpha_three_branch_two_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_alpha_three_branch_two_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_three_branch_two_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_a",
		response = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_b",
		response = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_c",
		response = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_d",
		response = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_one",
		response = "pwh_morris_loading_conversation_delta_one",
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
				15
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_two_branch_one",
		response = "pwh_morris_loading_conversation_delta_two_branch_one",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_two_branch_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_two_branch_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_three_branch_five_reply",
		response = "pwh_morris_loading_conversation_delta_three_branch_five_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_three_branch_five_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_three_branch_five_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_three_branch_two_reply",
		response = "pwh_morris_loading_conversation_delta_three_branch_two_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_three_branch_two_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_three_branch_two_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_three_all_branches_reply_a",
		response = "pwh_morris_loading_conversation_delta_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_three_all_branches_reply_b",
		response = "pwh_morris_loading_conversation_delta_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_three_all_branches_reply_c",
		response = "pwh_morris_loading_conversation_delta_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_delta_three_all_branches_reply_d",
		response = "pwh_morris_loading_conversation_delta_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_beta_one",
		response = "pwh_morris_loading_conversation_beta_one",
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
				15
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_beta_two",
		response = "pwh_morris_loading_conversation_beta_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_beta_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_beta_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_beta_three",
		response = "pwh_morris_loading_conversation_beta_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_beta_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_beta_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_gamma_one",
		response = "pwh_morris_loading_conversation_gamma_one",
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
				15
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_gamma_two",
		response = "pwh_morris_loading_conversation_gamma_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_gamma_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_gamma_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_loading_conversation_gamma_three",
		response = "pwh_morris_loading_conversation_gamma_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
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
				"pwh_morris_loading_conversation_gamma_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_loading_conversation_gamma_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_one",
		response = "pbw_morris_loading_conversation_alpha_one",
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
				15
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_two_branch_two",
		response = "pbw_morris_loading_conversation_alpha_two_branch_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_two_branch_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_two_branch_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_three_branch_three_reply",
		response = "pbw_morris_loading_conversation_alpha_three_branch_three_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_branch_three_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_branch_three_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_three_branch_five_reply",
		response = "pbw_morris_loading_conversation_alpha_three_branch_five_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_branch_five_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_branch_five_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_a",
		response = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_b",
		response = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_c",
		response = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_d",
		response = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_one",
		response = "pbw_morris_loading_conversation_delta_one",
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
				15
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_two_branch_two",
		response = "pbw_morris_loading_conversation_delta_two_branch_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_two_branch_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_two_branch_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_three_branch_four_reply",
		response = "pbw_morris_loading_conversation_delta_three_branch_four_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_branch_four_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_branch_four_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_three_branch_five_reply",
		response = "pbw_morris_loading_conversation_delta_three_branch_five_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_branch_five_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_branch_five_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_three_all_branches_reply_a",
		response = "pbw_morris_loading_conversation_delta_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_three_all_branches_reply_b",
		response = "pbw_morris_loading_conversation_delta_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_three_all_branches_reply_c",
		response = "pbw_morris_loading_conversation_delta_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_delta_three_all_branches_reply_d",
		response = "pbw_morris_loading_conversation_delta_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_beta_one",
		response = "pbw_morris_loading_conversation_beta_one",
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
				15
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_beta_two",
		response = "pbw_morris_loading_conversation_beta_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_beta_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_beta_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_beta_three",
		response = "pbw_morris_loading_conversation_beta_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_beta_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_beta_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_gamma_one",
		response = "pbw_morris_loading_conversation_gamma_one",
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
				15
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_gamma_two",
		response = "pbw_morris_loading_conversation_gamma_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_gamma_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_gamma_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_loading_conversation_gamma_three",
		response = "pbw_morris_loading_conversation_gamma_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_morris_loading_conversation_gamma_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_loading_conversation_gamma_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_one",
		response = "pdr_morris_loading_conversation_alpha_one",
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
				15
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_two_branch_three",
		response = "pdr_morris_loading_conversation_alpha_two_branch_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_two_branch_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_two_branch_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_three_branch_five_reply",
		response = "pdr_morris_loading_conversation_alpha_three_branch_five_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_branch_five_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_branch_five_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_three_branch_one_reply",
		response = "pdr_morris_loading_conversation_alpha_three_branch_one_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_branch_one_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_branch_one_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_a",
		response = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_b",
		response = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_c",
		response = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_d",
		response = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_one",
		response = "pdr_morris_loading_conversation_delta_one",
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
				15
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_two_branch_three",
		response = "pdr_morris_loading_conversation_delta_two_branch_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_two_branch_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_two_branch_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_three_branch_four_reply",
		response = "pdr_morris_loading_conversation_delta_three_branch_four_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_branch_four_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_branch_four_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_three_branch_one_reply",
		response = "pdr_morris_loading_conversation_delta_three_branch_one_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_branch_one_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_branch_one_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_three_all_branches_reply_a",
		response = "pdr_morris_loading_conversation_delta_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_three_all_branches_reply_b",
		response = "pdr_morris_loading_conversation_delta_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_three_all_branches_reply_c",
		response = "pdr_morris_loading_conversation_delta_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_delta_three_all_branches_reply_d",
		response = "pdr_morris_loading_conversation_delta_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_beta_one",
		response = "pdr_morris_loading_conversation_beta_one",
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
				15
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_beta_two",
		response = "pdr_morris_loading_conversation_beta_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_beta_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_beta_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_beta_three",
		response = "pdr_morris_loading_conversation_beta_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_beta_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_beta_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_gamma_one",
		response = "pdr_morris_loading_conversation_gamma_one",
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
				15
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_gamma_two",
		response = "pdr_morris_loading_conversation_gamma_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_gamma_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_gamma_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_loading_conversation_gamma_three",
		response = "pdr_morris_loading_conversation_gamma_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_morris_loading_conversation_gamma_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_loading_conversation_gamma_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_one",
		response = "pwe_morris_loading_conversation_alpha_one",
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
				15
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_two_branch_four",
		response = "pwe_morris_loading_conversation_alpha_two_branch_four",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_two_branch_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_two_branch_four",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_three_branch_one_reply",
		response = "pwe_morris_loading_conversation_alpha_three_branch_one_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_branch_one_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_branch_one_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_three_branch_three_reply",
		response = "pwe_morris_loading_conversation_alpha_three_branch_three_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_branch_three_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_branch_three_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_a",
		response = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_b",
		response = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_c",
		response = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_d",
		response = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_one",
		response = "pwe_morris_loading_conversation_delta_one",
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
				15
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_two_branch_four",
		response = "pwe_morris_loading_conversation_delta_two_branch_four",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_two_branch_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_two_branch_four",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_three_branch_three_reply",
		response = "pwe_morris_loading_conversation_delta_three_branch_three_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_branch_three_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_branch_three_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_three_all_branches_reply_a",
		response = "pwe_morris_loading_conversation_delta_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_three_all_branches_reply_b",
		response = "pwe_morris_loading_conversation_delta_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_three_all_branches_reply_c",
		response = "pwe_morris_loading_conversation_delta_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_delta_three_all_branches_reply_d",
		response = "pwe_morris_loading_conversation_delta_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_five"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_beta_one",
		response = "pwe_morris_loading_conversation_beta_one",
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
				15
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_beta_two",
		response = "pwe_morris_loading_conversation_beta_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_beta_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_beta_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_beta_three",
		response = "pwe_morris_loading_conversation_beta_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_beta_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_beta_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_gamma_one",
		response = "pwe_morris_loading_conversation_gamma_one",
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
				15
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_gamma_two",
		response = "pwe_morris_loading_conversation_gamma_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_gamma_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_gamma_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_loading_conversation_gamma_three",
		response = "pwe_morris_loading_conversation_gamma_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_morris_loading_conversation_gamma_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_loading_conversation_gamma_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_one",
		response = "pes_morris_loading_conversation_alpha_one",
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
				15
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_alpha",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_two_branch_five",
		response = "pes_morris_loading_conversation_alpha_two_branch_five",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_two_branch_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_two_branch_five",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_three_branch_four_reply",
		response = "pes_morris_loading_conversation_alpha_three_branch_four_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_branch_four_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_branch_four_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_three_branch_two_reply",
		response = "pes_morris_loading_conversation_alpha_three_branch_two_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_branch_two_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_branch_two_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_three_all_branches_reply_a",
		response = "pes_morris_loading_conversation_alpha_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_three_all_branches_reply_b",
		response = "pes_morris_loading_conversation_alpha_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_three_all_branches_reply_c",
		response = "pes_morris_loading_conversation_alpha_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_alpha_three_all_branches_reply_d",
		response = "pes_morris_loading_conversation_alpha_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_alpha_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_alpha_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_one",
		response = "pes_morris_loading_conversation_delta_one",
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
				15
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_delta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_two_branch_five",
		response = "pes_morris_loading_conversation_delta_two_branch_five",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_two_branch_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_two_branch_five",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_three_branch_one_reply",
		response = "pes_morris_loading_conversation_delta_three_branch_one_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_branch_one_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_branch_one_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_three_branch_two_reply",
		response = "pes_morris_loading_conversation_delta_three_branch_two_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_branch_two_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_branch_two_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_three_all_branches_reply_a",
		response = "pes_morris_loading_conversation_delta_three_all_branches_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_three_all_branches_reply_b",
		response = "pes_morris_loading_conversation_delta_three_all_branches_reply_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_three_all_branches_reply_c",
		response = "pes_morris_loading_conversation_delta_three_all_branches_reply_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_three"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_delta_three_all_branches_reply_d",
		response = "pes_morris_loading_conversation_delta_three_all_branches_reply_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_delta_two_branch_four"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_delta_three_all_branches_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_beta_one",
		response = "pes_morris_loading_conversation_beta_one",
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
				15
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_beta",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_beta_two",
		response = "pes_morris_loading_conversation_beta_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_beta_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_beta_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_beta_three",
		response = "pes_morris_loading_conversation_beta_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_beta_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_beta_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_beta_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_gamma_one",
		response = "pes_morris_loading_conversation_gamma_one",
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
				15
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_loading_conversation_gamma",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_gamma_two",
		response = "pes_morris_loading_conversation_gamma_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_one"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_gamma_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_gamma_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_loading_conversation_gamma_three",
		response = "pes_morris_loading_conversation_gamma_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"morris_loading_conversation_gamma_two"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_morris_loading_conversation_gamma_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_loading_conversation_gamma_three",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_loading_conversation_delta_three_branch_four_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_branch_four_reply_01"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_branch_four_reply_01"
			},
			sound_events_duration = {
				[1.0] = 3.8499584197998
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_beta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_beta_one_01",
				[2.0] = "pwh_morris_loading_conversation_beta_one_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_beta_one_01",
				[2.0] = "pwh_morris_loading_conversation_beta_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.9221873283386,
				[2.0] = 6.2024583816528
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_three_branch_four_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_branch_four_reply_01"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_branch_four_reply_01"
			},
			sound_events_duration = {
				[1.0] = 3.8881459236145
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_two_branch_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_two_branch_three_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_two_branch_three_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_two_branch_three_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_two_branch_three_02"
			},
			sound_events_duration = {
				[1.0] = 7.0542917251587,
				[2.0] = 6.5180830955505
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.2937707901001,
				[2.0] = 4.2180833816528
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_two_branch_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_two_branch_three_01",
				[2.0] = "pdr_morris_loading_conversation_delta_two_branch_three_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_two_branch_three_01",
				[2.0] = "pdr_morris_loading_conversation_delta_two_branch_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.6271877288818,
				[2.0] = 4.7880206108093
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_beta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_beta_one_01",
				[2.0] = "pes_morris_loading_conversation_beta_one_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_beta_one_01",
				[2.0] = "pes_morris_loading_conversation_beta_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.8370416164398,
				[2.0] = 5.2964582443237
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_beta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_beta_one_01",
				[2.0] = "pbw_morris_loading_conversation_beta_one_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_beta_one_01",
				[2.0] = "pbw_morris_loading_conversation_beta_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.9350624084473,
				[2.0] = 4.7141666412353
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_beta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_beta_one_01",
				[2.0] = "pdr_morris_loading_conversation_beta_one_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_beta_one_01",
				[2.0] = "pdr_morris_loading_conversation_beta_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.1243958473206,
				[2.0] = 3.8855209350586
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.5116250514984,
				[2.0] = 2.8059792518616
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_three_branch_four_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_branch_four_reply_01"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_branch_four_reply_01"
			},
			sound_events_duration = {
				[1.0] = 4.9005832672119
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_three_branch_four_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_branch_four_reply_01"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_branch_four_reply_01"
			},
			sound_events_duration = {
				[1.0] = 5.4587917327881
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 4.4761247634888,
				[2.0] = 4.463770866394
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_three_branch_one_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_branch_one_reply_01"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_branch_one_reply_01"
			},
			sound_events_duration = {
				[1.0] = 5.6494584083557
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_gamma_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_gamma_one_01",
				[2.0] = "pes_morris_loading_conversation_gamma_one_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_gamma_one_01",
				[2.0] = "pes_morris_loading_conversation_gamma_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.6461250782013,
				[2.0] = 2.8560416698456
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.5116250514984,
				[2.0] = 2.8059792518616
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_gamma_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_gamma_two_01",
				[2.0] = "pes_morris_loading_conversation_gamma_two_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_gamma_two_01",
				[2.0] = "pes_morris_loading_conversation_gamma_two_02"
			},
			sound_events_duration = {
				[1.0] = 3.4725415706634,
				[2.0] = 4.280312538147
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.8299374580383,
				[2.0] = 1.7303124666214
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_three_branch_one_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_branch_one_reply_01"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_branch_one_reply_01"
			},
			sound_events_duration = {
				[1.0] = 2.4486665725708
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_gamma_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_gamma_two_01",
				[2.0] = "pdr_morris_loading_conversation_gamma_two_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_gamma_two_01",
				[2.0] = "pdr_morris_loading_conversation_gamma_two_02"
			},
			sound_events_duration = {
				[1.0] = 7.7713956832886,
				[2.0] = 5.9175209999084
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_three_branch_one_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_three_branch_one_reply_01"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_three_branch_one_reply_01"
			},
			sound_events_duration = {
				[1.0] = 3.8368124961853
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7625207901001,
				[2.0] = 2.8942291736603
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_gamma_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_gamma_one_01",
				[2.0] = "pdr_morris_loading_conversation_gamma_one_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_gamma_one_01",
				[2.0] = "pdr_morris_loading_conversation_gamma_one_02"
			},
			sound_events_duration = {
				[1.0] = 4.6062293052673,
				[2.0] = 5.4491248130798
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 4.4761247634888,
				[2.0] = 4.463770866394
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7625207901001,
				[2.0] = 2.8942291736603
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7625207901001,
				[2.0] = 2.8942291736603
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7625207901001,
				[2.0] = 2.8942291736603
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_gamma_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_gamma_one_01",
				[2.0] = "pbw_morris_loading_conversation_gamma_one_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_gamma_one_01",
				[2.0] = "pbw_morris_loading_conversation_gamma_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.2238750457764,
				[2.0] = 2.9021458625794
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_three_branch_one_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_branch_one_reply_01"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_branch_one_reply_01"
			},
			sound_events_duration = {
				[1.0] = 2.3087708950043
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_gamma_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_gamma_two_01",
				[2.0] = "pwh_morris_loading_conversation_gamma_two_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_gamma_two_01",
				[2.0] = "pwh_morris_loading_conversation_gamma_two_02"
			},
			sound_events_duration = {
				[1.0] = 7.0304374694824,
				[2.0] = 7.3197917938232
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_gamma_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_gamma_two_01",
				[2.0] = "pwe_morris_loading_conversation_gamma_two_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_gamma_two_01",
				[2.0] = "pwe_morris_loading_conversation_gamma_two_02"
			},
			sound_events_duration = {
				[1.0] = 3.8883125782013,
				[2.0] = 5.762770652771
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9663125276566,
				[2.0] = 1.3035416603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_two_branch_five = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_two_branch_five_01",
				[2.0] = "pes_morris_loading_conversation_delta_two_branch_five_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_two_branch_five_01",
				[2.0] = "pes_morris_loading_conversation_delta_two_branch_five_02"
			},
			sound_events_duration = {
				[1.0] = 5.2307081222534,
				[2.0] = 5.3550415039063
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 4.4761247634888,
				[2.0] = 4.463770866394
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_one_01",
				[2.0] = "pes_morris_loading_conversation_delta_one_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_one_01",
				[2.0] = "pes_morris_loading_conversation_delta_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.4748957157135,
				[2.0] = 3.3060624599457
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.5116250514984,
				[2.0] = 2.8059792518616
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.1086041927338,
				[2.0] = 2.0055415630341
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_gamma_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_gamma_one_01",
				[2.0] = "pwe_morris_loading_conversation_gamma_one_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_gamma_one_01",
				[2.0] = "pwe_morris_loading_conversation_gamma_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.9323959350586,
				[2.0] = 4.5798335075378
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.1086041927338,
				[2.0] = 2.0055415630341
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.1086041927338,
				[2.0] = 2.0055415630341
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_gamma_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_gamma_one_01",
				[2.0] = "pwh_morris_loading_conversation_gamma_one_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_gamma_one_01",
				[2.0] = "pwh_morris_loading_conversation_gamma_one_02"
			},
			sound_events_duration = {
				[1.0] = 7.089271068573,
				[2.0] = 4.6596875190735
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pes_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.1086041927338,
				[2.0] = 2.0055415630341
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 4.4761247634888,
				[2.0] = 4.463770866394
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_three_branch_two_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_branch_two_reply_01"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_three_branch_two_reply_01"
			},
			sound_events_duration = {
				[1.0] = 2.8380832672119
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_three_branch_three_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_branch_three_reply_01"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_branch_three_reply_01"
			},
			sound_events_duration = {
				[1.0] = 5.5299372673035
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7413333654404,
				[2.0] = 2.7447917461395
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_three_branch_five_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_branch_five_reply_01"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_branch_five_reply_01"
			},
			sound_events_duration = {
				[1.0] = 7.7223124504089
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9735833406448,
				[2.0] = 2.6238541603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_beta_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_beta_two_01",
				[2.0] = "pes_morris_loading_conversation_beta_two_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_beta_two_01",
				[2.0] = "pes_morris_loading_conversation_beta_two_02"
			},
			sound_events_duration = {
				[1.0] = 1.5695416927338,
				[2.0] = 3.6552500724792
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_beta_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_beta_three_01",
				[2.0] = "pwe_morris_loading_conversation_beta_three_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_beta_three_01",
				[2.0] = "pwe_morris_loading_conversation_beta_three_02"
			},
			sound_events_duration = {
				[1.0] = 3.9621665477753,
				[2.0] = 4.2246041297913
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_beta_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_beta_two_01",
				[2.0] = "pwe_morris_loading_conversation_beta_two_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_beta_two_01",
				[2.0] = "pwe_morris_loading_conversation_beta_two_02"
			},
			sound_events_duration = {
				[1.0] = 5.624499797821,
				[2.0] = 5.8501873016357
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_three_branch_five_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_branch_five_reply_01"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_branch_five_reply_01"
			},
			sound_events_duration = {
				[1.0] = 4.0417084693909
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_three_branch_five_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_branch_five_reply_01"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_branch_five_reply_01"
			},
			sound_events_duration = {
				[1.0] = 4.4208960533142
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_beta_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_beta_two_01",
				[2.0] = "pbw_morris_loading_conversation_beta_two_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_beta_two_01",
				[2.0] = "pbw_morris_loading_conversation_beta_two_02"
			},
			sound_events_duration = {
				[1.0] = 7.9328126907349,
				[2.0] = 5.9330835342407
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_beta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_beta_one_01",
				[2.0] = "pwe_morris_loading_conversation_beta_one_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_beta_one_01",
				[2.0] = "pwe_morris_loading_conversation_beta_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.143479347229,
				[2.0] = 6.1333541870117
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_beta_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_beta_two_01",
				[2.0] = "pdr_morris_loading_conversation_beta_two_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_beta_two_01",
				[2.0] = "pdr_morris_loading_conversation_beta_two_02"
			},
			sound_events_duration = {
				[1.0] = 6.1490626335144,
				[2.0] = 6.2148122787476
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.3333957195282,
				[2.0] = 3.793562412262
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.3333957195282,
				[2.0] = 3.793562412262
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.3333957195282,
				[2.0] = 3.793562412262
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_beta_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_beta_three_01",
				[2.0] = "pwh_morris_loading_conversation_beta_three_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_beta_three_01",
				[2.0] = "pwh_morris_loading_conversation_beta_three_02"
			},
			sound_events_duration = {
				[1.0] = 3.1951665878296,
				[2.0] = 6.5097918510437
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.3333957195282,
				[2.0] = 3.793562412262
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_one_01",
				[2.0] = "pbw_morris_loading_conversation_delta_one_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_one_01",
				[2.0] = "pbw_morris_loading_conversation_delta_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.3597500324249,
				[2.0] = 2.8168125152588
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_three_branch_three_reply = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_branch_three_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_branch_three_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_three_branch_three_reply_01",
				[2.0] = "pwe_morris_loading_conversation_delta_three_branch_three_reply_02"
			},
			sound_events_duration = {
				[1.0] = 4.3955416679382,
				[2.0] = 4.5130414962769
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_two_branch_four = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_two_branch_four_01",
				[2.0] = "pwe_morris_loading_conversation_delta_two_branch_four_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_two_branch_four_01",
				[2.0] = "pwe_morris_loading_conversation_delta_two_branch_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.1574373245239,
				[2.0] = 4.147937297821
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_gamma_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_gamma_three_01",
				[2.0] = "pwh_morris_loading_conversation_gamma_three_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_gamma_three_01",
				[2.0] = "pwh_morris_loading_conversation_gamma_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.0050415992737,
				[2.0] = 3.2201042175293
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_three_branch_two_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_branch_two_reply_01"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_branch_two_reply_01"
			},
			sound_events_duration = {
				[1.0] = 5.5884165763855
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_beta_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_beta_two_01",
				[2.0] = "pwh_morris_loading_conversation_beta_two_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_beta_two_01",
				[2.0] = "pwh_morris_loading_conversation_beta_two_02"
			},
			sound_events_duration = {
				[1.0] = 5.5134372711182,
				[2.0] = 6.7169585227966
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7413333654404,
				[2.0] = 2.7447917461395
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7413333654404,
				[2.0] = 2.7447917461395
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.7413333654404,
				[2.0] = 2.7447917461395
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_two_branch_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_two_branch_one_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_two_branch_one_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_two_branch_one_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_two_branch_one_02"
			},
			sound_events_duration = {
				[1.0] = 8.2261037826538,
				[2.0] = 4.9583125114441
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_two_branch_five = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_two_branch_five_01",
				[2.0] = "pes_morris_loading_conversation_alpha_two_branch_five_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_two_branch_five_01",
				[2.0] = "pes_morris_loading_conversation_alpha_two_branch_five_02"
			},
			sound_events_duration = {
				[1.0] = 7.9902291297913,
				[2.0] = 5.3526248931885
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_gamma_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_gamma_three_01",
				[2.0] = "pwe_morris_loading_conversation_gamma_three_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_gamma_three_01",
				[2.0] = "pwe_morris_loading_conversation_gamma_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.0860834121704,
				[2.0] = 5.3957290649414
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_two_branch_four = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_two_branch_four_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_two_branch_four_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_two_branch_four_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_two_branch_four_02"
			},
			sound_events_duration = {
				[1.0] = 5.6805834770203,
				[2.0] = 6.2556877136231
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_alpha_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_alpha_one_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_one_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_alpha_one_01",
				[2.0] = "pwe_morris_loading_conversation_alpha_one_02"
			},
			sound_events_duration = {
				[1.0] = 4.684093952179,
				[2.0] = 5.7096457481384
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_two_branch_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_two_branch_two_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_two_branch_two_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_two_branch_two_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_two_branch_two_02"
			},
			sound_events_duration = {
				[1.0] = 4.5552916526794,
				[2.0] = 7.6287708282471
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_two_branch_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_two_branch_two_01",
				[2.0] = "pbw_morris_loading_conversation_delta_two_branch_two_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_two_branch_two_01",
				[2.0] = "pbw_morris_loading_conversation_delta_two_branch_two_02"
			},
			sound_events_duration = {
				[1.0] = 4.1875624656677,
				[2.0] = 3.0829999446869
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_one_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_one_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_one_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.8612084388733,
				[2.0] = 7.8022084236145
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_gamma_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_gamma_three_01",
				[2.0] = "pbw_morris_loading_conversation_gamma_three_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_gamma_three_01",
				[2.0] = "pbw_morris_loading_conversation_gamma_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.6916041374206,
				[2.0] = 1.9203333854675
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_morris_loading_conversation_delta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwe_morris_loading_conversation_delta_one_01",
				[2.0] = "pwe_morris_loading_conversation_delta_one_02"
			},
			localization_strings = {
				[1.0] = "pwe_morris_loading_conversation_delta_one_01",
				[2.0] = "pwe_morris_loading_conversation_delta_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.1905417442322,
				[2.0] = 5.8947706222534
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_gamma_two = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_gamma_two_01",
				[2.0] = "pbw_morris_loading_conversation_gamma_two_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_gamma_two_01",
				[2.0] = "pbw_morris_loading_conversation_gamma_two_02"
			},
			sound_events_duration = {
				[1.0] = 5.0797080993652,
				[2.0] = 6.1515417098999
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.8299374580383,
				[2.0] = 1.7303124666214
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_one_01",
				[2.0] = "pwh_morris_loading_conversation_delta_one_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_one_01",
				[2.0] = "pwh_morris_loading_conversation_delta_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.9175832271576,
				[2.0] = 5.0455622673035
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9735833406448,
				[2.0] = 2.6238541603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.5116250514984,
				[2.0] = 2.8059792518616
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9735833406448,
				[2.0] = 2.6238541603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9735833406448,
				[2.0] = 2.6238541603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_alpha_three_branch_three_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_branch_three_reply_01"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_alpha_three_branch_three_reply_01"
			},
			sound_events_duration = {
				[1.0] = 5.2306876182556
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_one_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_one_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_one_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.9768748283386,
				[2.0] = 6.419979095459
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_alpha_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_alpha_one_01",
				[2.0] = "pes_morris_loading_conversation_alpha_one_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_alpha_one_01",
				[2.0] = "pes_morris_loading_conversation_alpha_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.1246042251587,
				[2.0] = 4.2682709693909
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_gamma_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_gamma_three_01",
				[2.0] = "pes_morris_loading_conversation_gamma_three_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_gamma_three_01",
				[2.0] = "pes_morris_loading_conversation_gamma_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.0207707881927,
				[2.0] = 3.1640417575836
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_gamma_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_gamma_three_01",
				[2.0] = "pdr_morris_loading_conversation_gamma_three_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_gamma_three_01",
				[2.0] = "pdr_morris_loading_conversation_gamma_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.6457290649414,
				[2.0] = 5.8121042251587
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_delta_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_delta_one_01",
				[2.0] = "pdr_morris_loading_conversation_delta_one_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_delta_one_01",
				[2.0] = "pdr_morris_loading_conversation_delta_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.7287082672119,
				[2.0] = 3.6695625782013
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_three_branch_five_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_branch_five_reply_01"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_branch_five_reply_01"
			},
			sound_events_duration = {
				[1.0] = 6.299708366394
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9663125276566,
				[2.0] = 1.3035416603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9663125276566,
				[2.0] = 1.3035416603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_alpha_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pdr_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 1.9663125276566,
				[2.0] = 1.3035416603088
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_three_all_branches_reply_c = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.2937707901001,
				[2.0] = 4.2180833816528
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_delta_three_branch_two_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_delta_three_branch_two_reply_01"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_delta_three_branch_two_reply_01"
			},
			sound_events_duration = {
				[1.0] = 7.9654998779297
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_three_branch_two_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			category = "story_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_branch_two_reply_01"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_three_branch_two_reply_01"
			},
			sound_events_duration = {
				[1.0] = 6.1662502288818
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_three_all_branches_reply_b = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.2937707901001,
				[2.0] = 4.2180833816528
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.8299374580383,
				[2.0] = 1.7303124666214
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_beta_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_beta_three_01",
				[2.0] = "pbw_morris_loading_conversation_beta_three_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_beta_three_01",
				[2.0] = "pbw_morris_loading_conversation_beta_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.9712917804718,
				[2.0] = 2.6163125038147
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_morris_loading_conversation_delta_three_all_branches_reply_a = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_01",
				[2.0] = "pbw_morris_loading_conversation_delta_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 2.8299374580383,
				[2.0] = 1.7303124666214
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_morris_loading_conversation_beta_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pdr_morris_loading_conversation_beta_three_01",
				[2.0] = "pdr_morris_loading_conversation_beta_three_02"
			},
			localization_strings = {
				[1.0] = "pdr_morris_loading_conversation_beta_three_01",
				[2.0] = "pdr_morris_loading_conversation_beta_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.8943333625794,
				[2.0] = 3.5502290725708
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_morris_loading_conversation_beta_three = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pes_morris_loading_conversation_beta_three_01",
				[2.0] = "pes_morris_loading_conversation_beta_three_02"
			},
			localization_strings = {
				[1.0] = "pes_morris_loading_conversation_beta_three_01",
				[2.0] = "pes_morris_loading_conversation_beta_three_02"
			},
			sound_events_duration = {
				[1.0] = 3.3831040859222,
				[2.0] = 3.1371457576752
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_delta_two_branch_one = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_delta_two_branch_one_01",
				[2.0] = "pwh_morris_loading_conversation_delta_two_branch_one_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_delta_two_branch_one_01",
				[2.0] = "pwh_morris_loading_conversation_delta_two_branch_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.0041251182556,
				[2.0] = 3.9530208110809
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_morris_loading_conversation_alpha_three_all_branches_reply_d = {
			face_animations_n = 2,
			database = "hero_conversations_dlc_morris_level_banter_branched",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			localization_strings = {
				[1.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_01",
				[2.0] = "pwh_morris_loading_conversation_alpha_three_all_branches_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.2937707901001,
				[2.0] = 4.2180833816528
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		}
	})
end
