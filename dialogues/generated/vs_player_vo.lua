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
		pbw_vw_gather = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwh_vw_negation = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pdr_vw_objective_in_sight = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.557000041008,
				2.2374582290649,
				1.3622291088104,
				2.3962292671204,
				1.9630833864212,
				2.0790417194366,
				3.1857917308807,
				1.7673958539963,
				1.8910207748413,
				1.8203333616257
			}
		},
		pwe_vw_wait = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.71335417032242,
				1.0182291269302,
				1.3835417032242,
				1.2356666326523,
				1.8120416402817,
				1.7982083559036,
				2.2461457252502,
				2.3549582958221,
				1.3669999837875,
				2.1563334465027
			}
		},
		pdr_vw_wait = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.8768749833107,
				1.4595832824707,
				1.7282916307449,
				0.85141664743423,
				1.2106666564941,
				2.353437423706,
				1.0268125534058,
				1.5387707948685,
				1.402999997139,
				2.113979101181
			}
		},
		pdr_vw_go_here = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_vw_attack_now = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.8115832805634,
				0.7421041727066,
				0.84362500905991,
				1.1518125534058,
				1.493124961853,
				1.2139166593552,
				1.8293958902359,
				1.8021458387375,
				0.96718752384186,
				1.1587707996368
			}
		},
		pbw_vw_affirmative = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pbw_vw_negation = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_vw_objective_in_sight = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.1396250724792,
				2.3070623874664,
				1.2838749885559,
				1.7724583148956,
				1.6269583702087,
				1.7566457986832,
				2.1227290630341,
				1.2981250286102,
				1.7858749628067,
				2.3026874065399
			}
		},
		pbw_vw_thank_you = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_vw_cover_me = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.82764583826065,
				0.98091667890549,
				1.594229221344,
				1.4658333063126,
				1.2950208187103,
				1.3100625276566,
				0.74643748998642,
				1.1786458492279,
				1.9590624570847,
				1.1946874856949
			}
		},
		pwe_vw_thank_you = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.9679166674614,
				1.8994582891464,
				0.81397914886475,
				2.5536665916443,
				1.4867916107178,
				1.3284583091736,
				2.2402501106262,
				1.659083366394,
				1.0800000429153,
				2.6415417194366
			}
		},
		pwh_vw_wait = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pdr_vw_cover_me = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.1092292070389,
				1.0202292203903,
				1.1795417070389,
				1.2581458091736,
				1.5613958835602,
				1.6688958406448,
				1.6915208101273,
				2.3251457214356,
				1.1031666994095,
				1.62600004673
			}
		},
		pwh_vw_gather = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pdr_vw_attack_now = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.93062502145767,
				1.3266249895096,
				1.5896874666214,
				0.99566668272018,
				1.0098333358765,
				1.2672291994095,
				1.7254583835602,
				1.3074791431427,
				2.2233126163483,
				1.8131458759308
			}
		},
		pwh_vw_cover_me = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pbw_vw_attack_now = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_vw_answer_ping = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.0845415592194,
				0.83399999141693,
				1.6170208454132,
				1.8930208683014,
				2.2513959407806,
				2.6429998874664,
				1.8805832862854,
				1.0112082958221,
				2.0785417556763,
				2.4505832195282
			}
		},
		pdr_vw_affirmative = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.85399997234345,
				1.1022917032242,
				1.1888333559036,
				1.858479142189,
				0.89912497997284,
				0.91418749094009,
				1.2264374494553,
				1.6327291727066,
				1.7757083177566,
				1.114458322525
			}
		},
		pdr_vw_negation = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.4527083337307,
				1.1361666917801,
				1.4145624637604,
				1.2903958559036,
				1.7042291164398,
				1.7493749856949,
				1.4605417251587,
				1.4483958482742,
				1.7568957805634,
				1.5687916278839
			}
		},
		pwe_vw_gather = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.9375,
				1.3143957853317,
				1.7177083492279,
				0.79354166984558,
				0.71956247091293,
				1.5406249761581,
				2.3310625553131,
				1.9371249675751,
				1.3551249504089,
				1.3200833797455
			}
		},
		pwe_vw_negation = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.6318541765213,
				0.94014585018158,
				1.3568958044052,
				1.0191874504089,
				1.4438124895096,
				1.0963749885559,
				1.2406250238419,
				1.1729791164398,
				1.3037707805634,
				1.705895781517
			}
		},
		pbw_vw_cover_me = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_vw_affirmative = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.88606250286102,
				1.7126041650772,
				1.1651666164398,
				1.108062505722,
				0.92250001430511,
				1.3496249914169,
				0.82352083921432,
				1.0060000419617,
				1.7763541936874,
				2.3509166240692
			}
		},
		pdr_vw_answer_ping = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.3205624818802,
				0.78097915649414,
				0.97268748283386,
				1.9193124771118,
				1.5901458263397,
				1.2148125171661,
				2.0552084445953,
				1.6849792003632,
				1.3354375362396,
				1.574041724205
			}
		},
		pwh_vw_attack_now = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwh_vw_objective_in_sight = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pdr_vw_gather = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.69693750143051,
				1.2866250276566,
				0.76535415649414,
				0.90906250476837,
				1.7456041574478,
				1.3769375085831,
				1.4916042089462,
				1.3071875572205,
				1.6279791593552,
				1.2289791107178
			}
		},
		pbw_vw_objective_in_sight = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pdr_vw_thank_you = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.2268542051315,
				1.1733332872391,
				1.041312456131,
				0.78333336114883,
				0.88985419273376,
				0.6738333106041,
				0.96558332443237,
				1.1904166936874,
				1.5051457881927,
				1.1336041688919
			}
		},
		pbw_vw_wait = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pbw_vw_answer_ping = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwh_vw_affirmative = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_vw_go_here = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwh_vw_thank_you = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwh_vw_go_here = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwh_vw_answer_ping = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pbw_vw_go_here = {
			face_animations_n = 10,
			database = "vs_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		}
	})
end
