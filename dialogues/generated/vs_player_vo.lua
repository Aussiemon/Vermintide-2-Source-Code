return function ()
	define_rule({
		name = "pwh_vw_affirmative",
		response = "pwh_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_negation",
		response = "pwh_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_gather",
		response = "pwh_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_wait",
		response = "pwh_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_attack_now",
		response = "pwh_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_cover_me",
		response = "pwh_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_go_here",
		response = "pwh_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_witch_hunter_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_witch_hunter_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_objective_in_sight",
		response = "pwh_vw_objective_in_sight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_in_sight"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_thank_you",
		response = "pwh_vw_thank_you",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"thank_you"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_thank_you",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_thank_you",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_vw_answer_ping",
		response = "pwh_vw_answer_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"answer_ping"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_answer_ping",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_answer_ping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_affirmative",
		response = "pbw_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_negation",
		response = "pbw_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_gather",
		response = "pbw_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_wait",
		response = "pbw_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_attack_now",
		response = "pbw_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_cover_me",
		response = "pbw_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_go_here",
		response = "pbw_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_bright_wizard_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_bright_wizard_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_objective_in_sight",
		response = "pbw_vw_objective_in_sight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_in_sight"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_thank_you",
		response = "pbw_vw_thank_you",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"thank_you"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_thank_you",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_thank_you",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_vw_answer_ping",
		response = "pbw_vw_answer_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"answer_ping"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_answer_ping",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_answer_ping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_affirmative",
		response = "pdr_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_negation",
		response = "pdr_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_gather",
		response = "pdr_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_wait",
		response = "pdr_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_attack_now",
		response = "pdr_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_cover_me",
		response = "pdr_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_go_here",
		response = "pdr_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_dwarf_ranger_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_ranger_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_objective_in_sight",
		response = "pdr_vw_objective_in_sight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_in_sight"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_thank_you",
		response = "pdr_vw_thank_you",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"thank_you"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_thank_you",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_thank_you",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_vw_answer_ping",
		response = "pdr_vw_answer_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"answer_ping"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_answer_ping",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_answer_ping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_affirmative",
		response = "pwe_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_negation",
		response = "pwe_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_gather",
		response = "pwe_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_wait",
		response = "pwe_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_attack_now",
		response = "pwe_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_cover_me",
		response = "pwe_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_go_here",
		response = "pwe_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_wood_elf_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_wood_elf_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_objective_in_sight",
		response = "pwe_vw_objective_in_sight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_in_sight"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_objective_in_sight",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_thank_you",
		response = "pwe_vw_thank_you",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"thank_you"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_thank_you",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_thank_you",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_vw_answer_ping",
		response = "pwe_vw_answer_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"answer_ping"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
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
				"user_memory",
				"time_since_answer_ping",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_answer_ping",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwe_vw_answer_ping = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_answer_ping_01",
				"pwe_vw_answer_ping_02",
				"pwe_vw_answer_ping_03",
				"pwe_vw_answer_ping_04",
				"pwe_vw_answer_ping_05",
				"pwe_vw_answer_ping_06",
				"pwe_vw_answer_ping_07",
				"pwe_vw_answer_ping_08",
				"pwe_vw_answer_ping_09",
				"pwe_vw_answer_ping_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_answer_ping_01",
				"pwe_vw_answer_ping_02",
				"pwe_vw_answer_ping_03",
				"pwe_vw_answer_ping_04",
				"pwe_vw_answer_ping_05",
				"pwe_vw_answer_ping_06",
				"pwe_vw_answer_ping_07",
				"pwe_vw_answer_ping_08",
				"pwe_vw_answer_ping_09",
				"pwe_vw_answer_ping_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_thank_you = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_thank_you_01",
				"pbw_vw_thank_you_02",
				"pbw_vw_thank_you_03",
				"pbw_vw_thank_you_04",
				"pbw_vw_thank_you_05",
				"pbw_vw_thank_you_06",
				"pbw_vw_thank_you_07",
				"pbw_vw_thank_you_08",
				"pbw_vw_thank_you_09",
				"pbw_vw_thank_you_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_thank_you_01",
				"pbw_vw_thank_you_02",
				"pbw_vw_thank_you_03",
				"pbw_vw_thank_you_04",
				"pbw_vw_thank_you_05",
				"pbw_vw_thank_you_06",
				"pbw_vw_thank_you_07",
				"pbw_vw_thank_you_08",
				"pbw_vw_thank_you_09",
				"pbw_vw_thank_you_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_thank_you = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_thank_you_01",
				"pdr_vw_thank_you_02",
				"pdr_vw_thank_you_03",
				"pdr_vw_thank_you_04",
				"pdr_vw_thank_you_05",
				"pdr_vw_thank_you_06",
				"pdr_vw_thank_you_07",
				"pdr_vw_thank_you_08",
				"pdr_vw_thank_you_09",
				"pdr_vw_thank_you_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_thank_you_01",
				"pdr_vw_thank_you_02",
				"pdr_vw_thank_you_03",
				"pdr_vw_thank_you_04",
				"pdr_vw_thank_you_05",
				"pdr_vw_thank_you_06",
				"pdr_vw_thank_you_07",
				"pdr_vw_thank_you_08",
				"pdr_vw_thank_you_09",
				"pdr_vw_thank_you_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_wait_01",
				"pdr_vw_wait_02",
				"pdr_vw_wait_03",
				"pdr_vw_wait_04",
				"pdr_vw_wait_05",
				"pdr_vw_wait_06",
				"pdr_vw_wait_07",
				"pdr_vw_wait_08",
				"pdr_vw_wait_09",
				"pdr_vw_wait_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_wait_01",
				"pdr_vw_wait_02",
				"pdr_vw_wait_03",
				"pdr_vw_wait_04",
				"pdr_vw_wait_05",
				"pdr_vw_wait_06",
				"pdr_vw_wait_07",
				"pdr_vw_wait_08",
				"pdr_vw_wait_09",
				"pdr_vw_wait_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_attack_now_01",
				"pwe_vw_attack_now_02",
				"pwe_vw_attack_now_03",
				"pwe_vw_attack_now_04",
				"pwe_vw_attack_now_05",
				"pwe_vw_attack_now_06",
				"pwe_vw_attack_now_07",
				"pwe_vw_attack_now_08",
				"pwe_vw_attack_now_09",
				"pwe_vw_attack_now_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_attack_now_01",
				"pwe_vw_attack_now_02",
				"pwe_vw_attack_now_03",
				"pwe_vw_attack_now_04",
				"pwe_vw_attack_now_05",
				"pwe_vw_attack_now_06",
				"pwe_vw_attack_now_07",
				"pwe_vw_attack_now_08",
				"pwe_vw_attack_now_09",
				"pwe_vw_attack_now_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_attack_now_01",
				"pdr_vw_attack_now_02",
				"pdr_vw_attack_now_03",
				"pdr_vw_attack_now_04",
				"pdr_vw_attack_now_05",
				"pdr_vw_attack_now_06",
				"pdr_vw_attack_now_07",
				"pdr_vw_attack_now_08",
				"pdr_vw_attack_now_09",
				"pdr_vw_attack_now_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_attack_now_01",
				"pdr_vw_attack_now_02",
				"pdr_vw_attack_now_03",
				"pdr_vw_attack_now_04",
				"pdr_vw_attack_now_05",
				"pdr_vw_attack_now_06",
				"pdr_vw_attack_now_07",
				"pdr_vw_attack_now_08",
				"pdr_vw_attack_now_09",
				"pdr_vw_attack_now_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_objective_in_sight = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_objective_in_sight_01",
				"pdr_vw_objective_in_sight_02",
				"pdr_vw_objective_in_sight_03",
				"pdr_vw_objective_in_sight_04",
				"pdr_vw_objective_in_sight_05",
				"pdr_vw_objective_in_sight_06",
				"pdr_vw_objective_in_sight_07",
				"pdr_vw_objective_in_sight_08",
				"pdr_vw_objective_in_sight_09",
				"pdr_vw_objective_in_sight_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_objective_in_sight_01",
				"pdr_vw_objective_in_sight_02",
				"pdr_vw_objective_in_sight_03",
				"pdr_vw_objective_in_sight_04",
				"pdr_vw_objective_in_sight_05",
				"pdr_vw_objective_in_sight_06",
				"pdr_vw_objective_in_sight_07",
				"pdr_vw_objective_in_sight_08",
				"pdr_vw_objective_in_sight_09",
				"pdr_vw_objective_in_sight_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_affirmative_01",
				"pwh_vw_affirmative_02",
				"pwh_vw_affirmative_03",
				"pwh_vw_affirmative_04",
				"pwh_vw_affirmative_05",
				"pwh_vw_affirmative_06",
				"pwh_vw_affirmative_07",
				"pwh_vw_affirmative_08",
				"pwh_vw_affirmative_09",
				"pwh_vw_affirmative_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_affirmative_01",
				"pwh_vw_affirmative_02",
				"pwh_vw_affirmative_03",
				"pwh_vw_affirmative_04",
				"pwh_vw_affirmative_05",
				"pwh_vw_affirmative_06",
				"pwh_vw_affirmative_07",
				"pwh_vw_affirmative_08",
				"pwh_vw_affirmative_09",
				"pwh_vw_affirmative_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_attack_now_01",
				"pwh_vw_attack_now_02",
				"pwh_vw_attack_now_03",
				"pwh_vw_attack_now_04",
				"pwh_vw_attack_now_05",
				"pwh_vw_attack_now_06",
				"pwh_vw_attack_now_07",
				"pwh_vw_attack_now_08",
				"pwh_vw_attack_now_09",
				"pwh_vw_attack_now_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_attack_now_01",
				"pwh_vw_attack_now_02",
				"pwh_vw_attack_now_03",
				"pwh_vw_attack_now_04",
				"pwh_vw_attack_now_05",
				"pwh_vw_attack_now_06",
				"pwh_vw_attack_now_07",
				"pwh_vw_attack_now_08",
				"pwh_vw_attack_now_09",
				"pwh_vw_attack_now_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_gather_01",
				"pbw_vw_gather_02",
				"pbw_vw_gather_03",
				"pbw_vw_gather_04",
				"pbw_vw_gather_05",
				"pbw_vw_gather_06",
				"pbw_vw_gather_07",
				"pbw_vw_gather_08",
				"pbw_vw_gather_09",
				"pbw_vw_gather_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_gather_01",
				"pbw_vw_gather_02",
				"pbw_vw_gather_03",
				"pbw_vw_gather_04",
				"pbw_vw_gather_05",
				"pbw_vw_gather_06",
				"pbw_vw_gather_07",
				"pbw_vw_gather_08",
				"pbw_vw_gather_09",
				"pbw_vw_gather_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_negation_01",
				"pwe_vw_negation_02",
				"pwe_vw_negation_03",
				"pwe_vw_negation_04",
				"pwe_vw_negation_05",
				"pwe_vw_negation_06",
				"pwe_vw_negation_07",
				"pwe_vw_negation_08",
				"pwe_vw_negation_09",
				"pwe_vw_negation_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_negation_01",
				"pwe_vw_negation_02",
				"pwe_vw_negation_03",
				"pwe_vw_negation_04",
				"pwe_vw_negation_05",
				"pwe_vw_negation_06",
				"pwe_vw_negation_07",
				"pwe_vw_negation_08",
				"pwe_vw_negation_09",
				"pwe_vw_negation_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_answer_ping = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_answer_ping_01",
				"pwh_vw_answer_ping_02",
				"pwh_vw_answer_ping_03",
				"pwh_vw_answer_ping_04",
				"pwh_vw_answer_ping_05",
				"pwh_vw_answer_ping_06",
				"pwh_vw_answer_ping_07",
				"pwh_vw_answer_ping_08",
				"pwh_vw_answer_ping_09",
				"pwh_vw_answer_ping_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_answer_ping_01",
				"pwh_vw_answer_ping_02",
				"pwh_vw_answer_ping_03",
				"pwh_vw_answer_ping_04",
				"pwh_vw_answer_ping_05",
				"pwh_vw_answer_ping_06",
				"pwh_vw_answer_ping_07",
				"pwh_vw_answer_ping_08",
				"pwh_vw_answer_ping_09",
				"pwh_vw_answer_ping_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_wait_01",
				"pwe_vw_wait_02",
				"pwe_vw_wait_03",
				"pwe_vw_wait_04",
				"pwe_vw_wait_05",
				"pwe_vw_wait_06",
				"pwe_vw_wait_07",
				"pwe_vw_wait_08",
				"pwe_vw_wait_09",
				"pwe_vw_wait_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_wait_01",
				"pwe_vw_wait_02",
				"pwe_vw_wait_03",
				"pwe_vw_wait_04",
				"pwe_vw_wait_05",
				"pwe_vw_wait_06",
				"pwe_vw_wait_07",
				"pwe_vw_wait_08",
				"pwe_vw_wait_09",
				"pwe_vw_wait_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_affirmative_01",
				"pwe_vw_affirmative_02",
				"pwe_vw_affirmative_03",
				"pwe_vw_affirmative_04",
				"pwe_vw_affirmative_05",
				"pwe_vw_affirmative_06",
				"pwe_vw_affirmative_07",
				"pwe_vw_affirmative_08",
				"pwe_vw_affirmative_09",
				"pwe_vw_affirmative_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_affirmative_01",
				"pwe_vw_affirmative_02",
				"pwe_vw_affirmative_03",
				"pwe_vw_affirmative_04",
				"pwe_vw_affirmative_05",
				"pwe_vw_affirmative_06",
				"pwe_vw_affirmative_07",
				"pwe_vw_affirmative_08",
				"pwe_vw_affirmative_09",
				"pwe_vw_affirmative_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_thank_you = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_thank_you_01",
				"pwe_vw_thank_you_02",
				"pwe_vw_thank_you_03",
				"pwe_vw_thank_you_04",
				"pwe_vw_thank_you_05",
				"pwe_vw_thank_you_06",
				"pwe_vw_thank_you_07",
				"pwe_vw_thank_you_08",
				"pwe_vw_thank_you_09",
				"pwe_vw_thank_you_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_thank_you_01",
				"pwe_vw_thank_you_02",
				"pwe_vw_thank_you_03",
				"pwe_vw_thank_you_04",
				"pwe_vw_thank_you_05",
				"pwe_vw_thank_you_06",
				"pwe_vw_thank_you_07",
				"pwe_vw_thank_you_08",
				"pwe_vw_thank_you_09",
				"pwe_vw_thank_you_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_answer_ping = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_answer_ping_01",
				"pbw_vw_answer_ping_02",
				"pbw_vw_answer_ping_03",
				"pbw_vw_answer_ping_04",
				"pbw_vw_answer_ping_05",
				"pbw_vw_answer_ping_06",
				"pbw_vw_answer_ping_07",
				"pbw_vw_answer_ping_08",
				"pbw_vw_answer_ping_09",
				"pbw_vw_answer_ping_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_answer_ping_01",
				"pbw_vw_answer_ping_02",
				"pbw_vw_answer_ping_03",
				"pbw_vw_answer_ping_04",
				"pbw_vw_answer_ping_05",
				"pbw_vw_answer_ping_06",
				"pbw_vw_answer_ping_07",
				"pbw_vw_answer_ping_08",
				"pbw_vw_answer_ping_09",
				"pbw_vw_answer_ping_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_go_here_01",
				"pdr_vw_go_here_02",
				"pdr_vw_go_here_03",
				"pdr_vw_go_here_04",
				"pdr_vw_go_here_05",
				"pdr_vw_go_here_06",
				"pdr_vw_go_here_07",
				"pdr_vw_go_here_08",
				"pdr_vw_go_here_09",
				"pdr_vw_go_here_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_go_here_01",
				"pdr_vw_go_here_02",
				"pdr_vw_go_here_03",
				"pdr_vw_go_here_04",
				"pdr_vw_go_here_05",
				"pdr_vw_go_here_06",
				"pdr_vw_go_here_07",
				"pdr_vw_go_here_08",
				"pdr_vw_go_here_09",
				"pdr_vw_go_here_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_negation_01",
				"pbw_vw_negation_02",
				"pbw_vw_negation_03",
				"pbw_vw_negation_04",
				"pbw_vw_negation_05",
				"pbw_vw_negation_06",
				"pbw_vw_negation_07",
				"pbw_vw_negation_08",
				"pbw_vw_negation_09",
				"pbw_vw_negation_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_negation_01",
				"pbw_vw_negation_02",
				"pbw_vw_negation_03",
				"pbw_vw_negation_04",
				"pbw_vw_negation_05",
				"pbw_vw_negation_06",
				"pbw_vw_negation_07",
				"pbw_vw_negation_08",
				"pbw_vw_negation_09",
				"pbw_vw_negation_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_affirmative_01",
				"pdr_vw_affirmative_02",
				"pdr_vw_affirmative_03",
				"pdr_vw_affirmative_04",
				"pdr_vw_affirmative_05",
				"pdr_vw_affirmative_06",
				"pdr_vw_affirmative_07",
				"pdr_vw_affirmative_08",
				"pdr_vw_affirmative_09",
				"pdr_vw_affirmative_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_affirmative_01",
				"pdr_vw_affirmative_02",
				"pdr_vw_affirmative_03",
				"pdr_vw_affirmative_04",
				"pdr_vw_affirmative_05",
				"pdr_vw_affirmative_06",
				"pdr_vw_affirmative_07",
				"pdr_vw_affirmative_08",
				"pdr_vw_affirmative_09",
				"pdr_vw_affirmative_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_objective_in_sight = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_objective_in_sight_01",
				"pwh_vw_objective_in_sight_02",
				"pwh_vw_objective_in_sight_03",
				"pwh_vw_objective_in_sight_04",
				"pwh_vw_objective_in_sight_05",
				"pwh_vw_objective_in_sight_06",
				"pwh_vw_objective_in_sight_07",
				"pwh_vw_objective_in_sight_08",
				"pwh_vw_objective_in_sight_09",
				"pwh_vw_objective_in_sight_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_objective_in_sight_01",
				"pwh_vw_objective_in_sight_02",
				"pwh_vw_objective_in_sight_03",
				"pwh_vw_objective_in_sight_04",
				"pwh_vw_objective_in_sight_05",
				"pwh_vw_objective_in_sight_06",
				"pwh_vw_objective_in_sight_07",
				"pwh_vw_objective_in_sight_08",
				"pwh_vw_objective_in_sight_09",
				"pwh_vw_objective_in_sight_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_thank_you = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_thank_you_01",
				"pwh_vw_thank_you_02",
				"pwh_vw_thank_you_03",
				"pwh_vw_thank_you_04",
				"pwh_vw_thank_you_05",
				"pwh_vw_thank_you_06",
				"pwh_vw_thank_you_07",
				"pwh_vw_thank_you_08",
				"pwh_vw_thank_you_09",
				"pwh_vw_thank_you_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_thank_you_01",
				"pwh_vw_thank_you_02",
				"pwh_vw_thank_you_03",
				"pwh_vw_thank_you_04",
				"pwh_vw_thank_you_05",
				"pwh_vw_thank_you_06",
				"pwh_vw_thank_you_07",
				"pwh_vw_thank_you_08",
				"pwh_vw_thank_you_09",
				"pwh_vw_thank_you_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_go_here_01",
				"pwh_vw_go_here_02",
				"pwh_vw_go_here_03",
				"pwh_vw_go_here_04",
				"pwh_vw_go_here_05",
				"pwh_vw_go_here_06",
				"pwh_vw_go_here_07",
				"pwh_vw_go_here_08",
				"pwh_vw_go_here_09",
				"pwh_vw_go_here_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_go_here_01",
				"pwh_vw_go_here_02",
				"pwh_vw_go_here_03",
				"pwh_vw_go_here_04",
				"pwh_vw_go_here_05",
				"pwh_vw_go_here_06",
				"pwh_vw_go_here_07",
				"pwh_vw_go_here_08",
				"pwh_vw_go_here_09",
				"pwh_vw_go_here_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_objective_in_sight = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_objective_in_sight_01",
				"pwe_vw_objective_in_sight_02",
				"pwe_vw_objective_in_sight_03",
				"pwe_vw_objective_in_sight_04",
				"pwe_vw_objective_in_sight_05",
				"pwe_vw_objective_in_sight_06",
				"pwe_vw_objective_in_sight_07",
				"pwe_vw_objective_in_sight_08",
				"pwe_vw_objective_in_sight_09",
				"pwe_vw_objective_in_sight_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_objective_in_sight_01",
				"pwe_vw_objective_in_sight_02",
				"pwe_vw_objective_in_sight_03",
				"pwe_vw_objective_in_sight_04",
				"pwe_vw_objective_in_sight_05",
				"pwe_vw_objective_in_sight_06",
				"pwe_vw_objective_in_sight_07",
				"pwe_vw_objective_in_sight_08",
				"pwe_vw_objective_in_sight_09",
				"pwe_vw_objective_in_sight_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_negation_01",
				"pwh_vw_negation_02",
				"pwh_vw_negation_03",
				"pwh_vw_negation_04",
				"pwh_vw_negation_05",
				"pwh_vw_negation_06",
				"pwh_vw_negation_07",
				"pwh_vw_negation_08",
				"pwh_vw_negation_09",
				"pwh_vw_negation_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_negation_01",
				"pwh_vw_negation_02",
				"pwh_vw_negation_03",
				"pwh_vw_negation_04",
				"pwh_vw_negation_05",
				"pwh_vw_negation_06",
				"pwh_vw_negation_07",
				"pwh_vw_negation_08",
				"pwh_vw_negation_09",
				"pwh_vw_negation_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_go_here_01",
				"pwe_vw_go_here_02",
				"pwe_vw_go_here_03",
				"pwe_vw_go_here_04",
				"pwe_vw_go_here_05",
				"pwe_vw_go_here_06",
				"pwe_vw_go_here_07",
				"pwe_vw_go_here_08",
				"pwe_vw_go_here_09",
				"pwe_vw_go_here_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_go_here_01",
				"pwe_vw_go_here_02",
				"pwe_vw_go_here_03",
				"pwe_vw_go_here_04",
				"pwe_vw_go_here_05",
				"pwe_vw_go_here_06",
				"pwe_vw_go_here_07",
				"pwe_vw_go_here_08",
				"pwe_vw_go_here_09",
				"pwe_vw_go_here_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_attack_now_01",
				"pbw_vw_attack_now_02",
				"pbw_vw_attack_now_03",
				"pbw_vw_attack_now_04",
				"pbw_vw_attack_now_05",
				"pbw_vw_attack_now_06",
				"pbw_vw_attack_now_07",
				"pbw_vw_attack_now_08",
				"pbw_vw_attack_now_09",
				"pbw_vw_attack_now_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_attack_now_01",
				"pbw_vw_attack_now_02",
				"pbw_vw_attack_now_03",
				"pbw_vw_attack_now_04",
				"pbw_vw_attack_now_05",
				"pbw_vw_attack_now_06",
				"pbw_vw_attack_now_07",
				"pbw_vw_attack_now_08",
				"pbw_vw_attack_now_09",
				"pbw_vw_attack_now_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_objective_in_sight = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_objective_in_sight_01",
				"pbw_vw_objective_in_sight_02",
				"pbw_vw_objective_in_sight_03",
				"pbw_vw_objective_in_sight_04",
				"pbw_vw_objective_in_sight_05",
				"pbw_vw_objective_in_sight_06",
				"pbw_vw_objective_in_sight_07",
				"pbw_vw_objective_in_sight_08",
				"pbw_vw_objective_in_sight_09",
				"pbw_vw_objective_in_sight_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_objective_in_sight_01",
				"pbw_vw_objective_in_sight_02",
				"pbw_vw_objective_in_sight_03",
				"pbw_vw_objective_in_sight_04",
				"pbw_vw_objective_in_sight_05",
				"pbw_vw_objective_in_sight_06",
				"pbw_vw_objective_in_sight_07",
				"pbw_vw_objective_in_sight_08",
				"pbw_vw_objective_in_sight_09",
				"pbw_vw_objective_in_sight_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_cover_me_01",
				"pwe_vw_cover_me_02",
				"pwe_vw_cover_me_03",
				"pwe_vw_cover_me_04",
				"pwe_vw_cover_me_05",
				"pwe_vw_cover_me_06",
				"pwe_vw_cover_me_07",
				"pwe_vw_cover_me_08",
				"pwe_vw_cover_me_09",
				"pwe_vw_cover_me_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_cover_me_01",
				"pwe_vw_cover_me_02",
				"pwe_vw_cover_me_03",
				"pwe_vw_cover_me_04",
				"pwe_vw_cover_me_05",
				"pwe_vw_cover_me_06",
				"pwe_vw_cover_me_07",
				"pwe_vw_cover_me_08",
				"pwe_vw_cover_me_09",
				"pwe_vw_cover_me_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_wait_01",
				"pwh_vw_wait_02",
				"pwh_vw_wait_03",
				"pwh_vw_wait_04",
				"pwh_vw_wait_05",
				"pwh_vw_wait_06",
				"pwh_vw_wait_07",
				"pwh_vw_wait_08",
				"pwh_vw_wait_09",
				"pwh_vw_wait_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_wait_01",
				"pwh_vw_wait_02",
				"pwh_vw_wait_03",
				"pwh_vw_wait_04",
				"pwh_vw_wait_05",
				"pwh_vw_wait_06",
				"pwh_vw_wait_07",
				"pwh_vw_wait_08",
				"pwh_vw_wait_09",
				"pwh_vw_wait_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_cover_me_01",
				"pdr_vw_cover_me_02",
				"pdr_vw_cover_me_03",
				"pdr_vw_cover_me_04",
				"pdr_vw_cover_me_05",
				"pdr_vw_cover_me_06",
				"pdr_vw_cover_me_07",
				"pdr_vw_cover_me_08",
				"pdr_vw_cover_me_09",
				"pdr_vw_cover_me_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_cover_me_01",
				"pdr_vw_cover_me_02",
				"pdr_vw_cover_me_03",
				"pdr_vw_cover_me_04",
				"pdr_vw_cover_me_05",
				"pdr_vw_cover_me_06",
				"pdr_vw_cover_me_07",
				"pdr_vw_cover_me_08",
				"pdr_vw_cover_me_09",
				"pdr_vw_cover_me_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_cover_me_01",
				"pwh_vw_cover_me_02",
				"pwh_vw_cover_me_03",
				"pwh_vw_cover_me_04",
				"pwh_vw_cover_me_05",
				"pwh_vw_cover_me_06",
				"pwh_vw_cover_me_07",
				"pwh_vw_cover_me_08",
				"pwh_vw_cover_me_09",
				"pwh_vw_cover_me_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_cover_me_01",
				"pwh_vw_cover_me_02",
				"pwh_vw_cover_me_03",
				"pwh_vw_cover_me_04",
				"pwh_vw_cover_me_05",
				"pwh_vw_cover_me_06",
				"pwh_vw_cover_me_07",
				"pwh_vw_cover_me_08",
				"pwh_vw_cover_me_09",
				"pwh_vw_cover_me_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_affirmative_01",
				"pbw_vw_affirmative_02",
				"pbw_vw_affirmative_03",
				"pbw_vw_affirmative_04",
				"pbw_vw_affirmative_05",
				"pbw_vw_affirmative_06",
				"pbw_vw_affirmative_07",
				"pbw_vw_affirmative_08",
				"pbw_vw_affirmative_09",
				"pbw_vw_affirmative_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_affirmative_01",
				"pbw_vw_affirmative_02",
				"pbw_vw_affirmative_03",
				"pbw_vw_affirmative_04",
				"pbw_vw_affirmative_05",
				"pbw_vw_affirmative_06",
				"pbw_vw_affirmative_07",
				"pbw_vw_affirmative_08",
				"pbw_vw_affirmative_09",
				"pbw_vw_affirmative_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_cover_me_01",
				"pbw_vw_cover_me_02",
				"pbw_vw_cover_me_03",
				"pbw_vw_cover_me_04",
				"pbw_vw_cover_me_05",
				"pbw_vw_cover_me_06",
				"pbw_vw_cover_me_07",
				"pbw_vw_cover_me_08",
				"pbw_vw_cover_me_09",
				"pbw_vw_cover_me_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_cover_me_01",
				"pbw_vw_cover_me_02",
				"pbw_vw_cover_me_03",
				"pbw_vw_cover_me_04",
				"pbw_vw_cover_me_05",
				"pbw_vw_cover_me_06",
				"pbw_vw_cover_me_07",
				"pbw_vw_cover_me_08",
				"pbw_vw_cover_me_09",
				"pbw_vw_cover_me_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_wait_01",
				"pbw_vw_wait_02",
				"pbw_vw_wait_03",
				"pbw_vw_wait_04",
				"pbw_vw_wait_05",
				"pbw_vw_wait_06",
				"pbw_vw_wait_07",
				"pbw_vw_wait_08",
				"pbw_vw_wait_09",
				"pbw_vw_wait_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_wait_01",
				"pbw_vw_wait_02",
				"pbw_vw_wait_03",
				"pbw_vw_wait_04",
				"pbw_vw_wait_05",
				"pbw_vw_wait_06",
				"pbw_vw_wait_07",
				"pbw_vw_wait_08",
				"pbw_vw_wait_09",
				"pbw_vw_wait_10"
			},
			randomize_indexes = {}
		},
		pwh_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwh_vw_gather_01",
				"pwh_vw_gather_02",
				"pwh_vw_gather_03",
				"pwh_vw_gather_04",
				"pwh_vw_gather_05",
				"pwh_vw_gather_06",
				"pwh_vw_gather_07",
				"pwh_vw_gather_08",
				"pwh_vw_gather_09",
				"pwh_vw_gather_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwh_vw_gather_01",
				"pwh_vw_gather_02",
				"pwh_vw_gather_03",
				"pwh_vw_gather_04",
				"pwh_vw_gather_05",
				"pwh_vw_gather_06",
				"pwh_vw_gather_07",
				"pwh_vw_gather_08",
				"pwh_vw_gather_09",
				"pwh_vw_gather_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_answer_ping = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_answer_ping_01",
				"pdr_vw_answer_ping_02",
				"pdr_vw_answer_ping_03",
				"pdr_vw_answer_ping_04",
				"pdr_vw_answer_ping_05",
				"pdr_vw_answer_ping_06",
				"pdr_vw_answer_ping_07",
				"pdr_vw_answer_ping_08",
				"pdr_vw_answer_ping_09",
				"pdr_vw_answer_ping_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_answer_ping_01",
				"pdr_vw_answer_ping_02",
				"pdr_vw_answer_ping_03",
				"pdr_vw_answer_ping_04",
				"pdr_vw_answer_ping_05",
				"pdr_vw_answer_ping_06",
				"pdr_vw_answer_ping_07",
				"pdr_vw_answer_ping_08",
				"pdr_vw_answer_ping_09",
				"pdr_vw_answer_ping_10"
			},
			randomize_indexes = {}
		},
		pwe_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_vw_gather_01",
				"pwe_vw_gather_02",
				"pwe_vw_gather_03",
				"pwe_vw_gather_04",
				"pwe_vw_gather_05",
				"pwe_vw_gather_06",
				"pwe_vw_gather_07",
				"pwe_vw_gather_08",
				"pwe_vw_gather_09",
				"pwe_vw_gather_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_vw_gather_01",
				"pwe_vw_gather_02",
				"pwe_vw_gather_03",
				"pwe_vw_gather_04",
				"pwe_vw_gather_05",
				"pwe_vw_gather_06",
				"pwe_vw_gather_07",
				"pwe_vw_gather_08",
				"pwe_vw_gather_09",
				"pwe_vw_gather_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_negation_01",
				"pdr_vw_negation_02",
				"pdr_vw_negation_03",
				"pdr_vw_negation_04",
				"pdr_vw_negation_05",
				"pdr_vw_negation_06",
				"pdr_vw_negation_07",
				"pdr_vw_negation_08",
				"pdr_vw_negation_09",
				"pdr_vw_negation_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_negation_01",
				"pdr_vw_negation_02",
				"pdr_vw_negation_03",
				"pdr_vw_negation_04",
				"pdr_vw_negation_05",
				"pdr_vw_negation_06",
				"pdr_vw_negation_07",
				"pdr_vw_negation_08",
				"pdr_vw_negation_09",
				"pdr_vw_negation_10"
			},
			randomize_indexes = {}
		},
		pdr_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pdr_vw_gather_01",
				"pdr_vw_gather_02",
				"pdr_vw_gather_03",
				"pdr_vw_gather_04",
				"pdr_vw_gather_05",
				"pdr_vw_gather_06",
				"pdr_vw_gather_07",
				"pdr_vw_gather_08",
				"pdr_vw_gather_09",
				"pdr_vw_gather_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pdr_vw_gather_01",
				"pdr_vw_gather_02",
				"pdr_vw_gather_03",
				"pdr_vw_gather_04",
				"pdr_vw_gather_05",
				"pdr_vw_gather_06",
				"pdr_vw_gather_07",
				"pdr_vw_gather_08",
				"pdr_vw_gather_09",
				"pdr_vw_gather_10"
			},
			randomize_indexes = {}
		},
		pbw_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "vs_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			sound_events = {
				"pbw_vw_go_here_01",
				"pbw_vw_go_here_02",
				"pbw_vw_go_here_03",
				"pbw_vw_go_here_04",
				"pbw_vw_go_here_05",
				"pbw_vw_go_here_06",
				"pbw_vw_go_here_07",
				"pbw_vw_go_here_08",
				"pbw_vw_go_here_09",
				"pbw_vw_go_here_10"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_vw_go_here_01",
				"pbw_vw_go_here_02",
				"pbw_vw_go_here_03",
				"pbw_vw_go_here_04",
				"pbw_vw_go_here_05",
				"pbw_vw_go_here_06",
				"pbw_vw_go_here_07",
				"pbw_vw_go_here_08",
				"pbw_vw_go_here_09",
				"pbw_vw_go_here_10"
			},
			randomize_indexes = {}
		}
	})
end
