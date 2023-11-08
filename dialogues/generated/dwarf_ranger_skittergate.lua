return function ()
	define_rule({
		name = "pdr_level_skittergate_BOOM_01",
		response = "pdr_level_skittergate_BOOM_01",
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
				"skittergate_BOOM"
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
				"skittergate_BOOM",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_BOOM",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_activate_gate_01",
		response = "pdr_level_skittergate_activate_gate_01",
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
				"skittergate_activate_gate_helmgart"
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
				"skittergate_activate_gate_helmgart",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_activate_gate_helmgart",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_activate_gate_01a",
		response = "pdr_level_skittergate_activate_gate_01a",
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
				"skittergate_activate_gate_norsca"
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
				"level_skittergate_activate_gate_norsca",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_activate_gate_norsca",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_arrive_01",
		response = "pdr_level_skittergate_arrive_01",
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
				"skittergate_arrive"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_skittergate_arrive",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_arrive",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_back_home_01",
		response = "pdr_level_skittergate_back_home_01",
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
				"skittergate_back_home"
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
				"skittergate_back_home",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_back_home",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_cave_entrance_01",
		response = "pdr_level_skittergate_cave_entrance_01",
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
				"skittergate_cave_entrance"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_skittergate_cave_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_cave_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_contol_panel_01",
		response = "pdr_level_skittergate_contol_panel_01",
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
				"skittergate_contol_panel"
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
				"level_skittergate_contol_panel",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_contol_panel",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_crater_01",
		response = "pdr_level_skittergate_crater_01",
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
				"skittergate_crater"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_skittergate_crater",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_crater",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_dead_seer",
		response = "pdr_level_skittergate_dead_seer",
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
				"skaven_grey_seer"
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
				"skittergate_dead_seer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_dead_seer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_dead_seer_01",
		response = "pdr_level_skittergate_dead_seer_01",
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
				"skittergate_dead_seer"
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
				"skittergate_dead_seer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_dead_seer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_docks_gate_01",
		response = "pdr_level_skittergate_docks_gate_01",
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
				"skittergate_docks_gate"
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
				"skittergate_docks_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_docks_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_elevator_01",
		response = "pdr_level_skittergate_elevator_01",
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
				"skittergate_elevator"
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
				"level_skittergate_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_enter_gate_01",
		response = "pdr_level_skittergate_enter_gate_01",
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
				"skittergate_enter_gate"
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
				"level_skittergate_enter_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_enter_gate",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_gate_activated_01",
		response = "pdr_level_skittergate_gate_activated_01",
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
				"skittergate_gate_activated"
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
				"level_skittergate_gate_activated",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_gate_activated",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_gatekeeper_appear_01",
		response = "pdr_level_skittergate_gatekeeper_appear_01",
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
				"skittergate_gatekeeper_appear"
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
				"skittergate_gatekeeper_appear",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_gatekeeper_appear",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_gatekeeper_death_01",
		response = "pdr_level_skittergate_gatekeeper_death_01",
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
				"skittergate_gatekeeper_death"
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
				"skittergate_gatekeeper_death",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_gatekeeper_death",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_get_back_to_gate_01",
		response = "pdr_level_skittergate_get_back_to_gate_01",
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
				"skittergate_get_back_to_gate"
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
				"skittergate_get_back_to_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_get_back_to_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_get_down_to_the_cooling_01",
		response = "pdr_level_skittergate_get_down_to_the_cooling_01",
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
				"skittergate_get_down_to_the_cooling"
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
				"skittergate_get_down_to_the_cooling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_get_down_to_the_cooling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_leave_01",
		response = "pdr_level_skittergate_leave_01",
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
				"skittergate_leave"
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
				"skittergate_leave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_leave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_rasknitt_death_rattler_invulnerable",
		response = "pdr_level_skittergate_rasknitt_death_rattler_invulnerable",
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
				"egs_level_skittergate_rasknitt_on_stormfiend"
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
				"rattler_invulnerable",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"rattler_invulnerable",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pdr_level_skittergate_rasknitt_dismounted_one",
		name = "pdr_level_skittergate_rasknitt_dismounted_one",
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
				"egs_level_skittergate_rasknitt_dismounted"
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
			}
		}
	})
	define_rule({
		response = "pdr_level_skittergate_rasknitt_gate_reply",
		name = "pdr_level_skittergate_rasknitt_gate_reply",
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
				"egs_level_skittergate_rasknitt_calls_mount_intro"
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
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_rasknitt_interrupt_and_focus",
		response = "pdr_level_skittergate_rasknitt_interrupt_and_focus",
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
				"egs_level_skittergate_teleport_away"
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
				"interrupt_and_focus",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"interrupt_and_focus",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_rasknitt_stormfiend_dead",
		response = "pdr_level_skittergate_rasknitt_stormfiend_dead",
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
				"skaven_stormfiend_boss"
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
				"rasknitt_stormfiend_dead",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"rasknitt_stormfiend_dead",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_run_for_the_gate_01",
		response = "pdr_level_skittergate_run_for_the_gate_01",
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
				"skittergate_run_for_the_gate"
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
				"skittergate_run_for_the_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_run_for_the_gate",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_sabotage_cooling_01",
		response = "pdr_level_skittergate_sabotage_cooling_01",
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
				"skittergate_sabotage_cooling"
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
				"skittergate_sabotage_cooling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_sabotage_cooling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_searching_gatekeeper_01",
		response = "pdr_level_skittergate_searching_gatekeeper_01",
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
				"skittergate_searching_gatekeeper"
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
				"skittergate_searching_gatekeeper",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_searching_gatekeeper",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_ships_01",
		response = "pdr_level_skittergate_ships_01",
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
				"skittergate_ships"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"skittergate_ships",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_ships",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_skittergate_found_01",
		response = "pdr_level_skittergate_skittergate_found_01",
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
				"skittergate_skittergate_found"
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
				"level_skittergate_skittergate_found",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_skittergate_found",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_spotting_docks_01",
		response = "pdr_level_skittergate_spotting_docks_01",
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
				"skittergate_spotting_docks"
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
				"skittergate_spotting_docks",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_spotting_docks",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_start_up_gate_01",
		response = "pdr_level_skittergate_start_up_gate_01",
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
				"skittergate_start_up_gate"
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
				"level_skittergate_start_up_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_start_up_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_through_the_gate",
		response = "pdr_level_skittergate_through_the_gate",
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
				"skittergate_through the gate"
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
				"skittergate_through the gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_through the gate",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_tunnel_collapses_01",
		response = "pdr_level_skittergate_tunnel_collapses_01",
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
				"skittergate_tunnel_collapses"
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
				"skittergate_tunnel_collapses",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_tunnel_collapses",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_vacated_area_01",
		response = "pdr_level_skittergate_vacated_area_01",
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
				"skittergate_vacated_area"
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
				"level_skittergate_vacated_area",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_vacated_area",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_vista_01",
		response = "pdr_level_skittergate_vista_01",
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
				"skittergate_vista"
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
				"level_skittergate_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skittergate_welcome_to_norsca_01",
		response = "pdr_level_skittergate_welcome_to_norsca_01",
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
				"skittergate_welcome_to_norsca"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_skittergate_welcome_to_norsca",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_welcome_to_norsca",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_skittergate_intro_a",
		response = "pdr_skittergate_intro_a",
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
				"skittergate_intro_a"
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
				"skittergate_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_skittergate_intro_b",
		response = "pdr_skittergate_intro_b",
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
				"skittergate_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"skittergate_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_skittergate_intro_c",
		response = "pdr_skittergate_intro_c",
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
				"skittergate_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"skittergate_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_level_skittergate_BOOM_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_BOOM_01",
				"pdr_level_skittergate_BOOM_02",
				"pdr_level_skittergate_BOOM_03",
				"pdr_level_skittergate_BOOM_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_BOOM_01",
				"pdr_level_skittergate_BOOM_02",
				"pdr_level_skittergate_BOOM_03",
				"pdr_level_skittergate_BOOM_04"
			},
			sound_events_duration = {
				4.8375415802002,
				11.525458335877,
				5.7420415878296,
				6.799729347229
			}
		},
		pdr_level_skittergate_activate_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_activate_gate_01",
				"pdr_level_skittergate_activate_gate_02",
				"pdr_level_skittergate_activate_gate_03",
				"pdr_level_skittergate_activate_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_activate_gate_01",
				"pdr_level_skittergate_activate_gate_02",
				"pdr_level_skittergate_activate_gate_03",
				"pdr_level_skittergate_activate_gate_04"
			},
			sound_events_duration = {
				3.7039165496826,
				2.9507708549499,
				4.2595415115356,
				3.1891458034515
			}
		},
		pdr_level_skittergate_activate_gate_01a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_activate_gate_01a",
				"pdr_level_skittergate_activate_gate_02a",
				"pdr_level_skittergate_activate_gate_03a",
				"pdr_level_skittergate_activate_gate_04a"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_activate_gate_01a",
				"pdr_level_skittergate_activate_gate_02a",
				"pdr_level_skittergate_activate_gate_03a",
				"pdr_level_skittergate_activate_gate_04a"
			},
			sound_events_duration = {
				4.0609793663025,
				3.2262291908264,
				5.0346460342407,
				2.6031665802002
			}
		},
		pdr_level_skittergate_arrive_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_arrive_01",
				"pdr_level_skittergate_arrive_02",
				"pdr_level_skittergate_arrive_03",
				"pdr_level_skittergate_arrive_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_arrive_01",
				"pdr_level_skittergate_arrive_02",
				"pdr_level_skittergate_arrive_03",
				"pdr_level_skittergate_arrive_04"
			},
			sound_events_duration = {
				3.3501040935516,
				4.8946042060852,
				6.8318123817444,
				3.5365417003632
			}
		},
		pdr_level_skittergate_back_home_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_back_home_01",
				"pdr_level_skittergate_back_home_02",
				"pdr_level_skittergate_back_home_03",
				"pdr_level_skittergate_back_home_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_back_home_01",
				"pdr_level_skittergate_back_home_02",
				"pdr_level_skittergate_back_home_03",
				"pdr_level_skittergate_back_home_04"
			},
			sound_events_duration = {
				4.6349582672119,
				5.6578125953674,
				4.8311667442322,
				7.5983748435974
			}
		},
		pdr_level_skittergate_cave_entrance_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_skittergate_cave_entrance_01",
				"pdr_level_skittergate_cave_entrance_02",
				"pdr_level_skittergate_cave_entrance_03",
				"pdr_level_skittergate_cave_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_cave_entrance_01",
				"pdr_level_skittergate_cave_entrance_02",
				"pdr_level_skittergate_cave_entrance_03",
				"pdr_level_skittergate_cave_entrance_04"
			},
			sound_events_duration = {
				4.7863125801086,
				7.1585416793823,
				5.0093541145325,
				7.1756043434143
			}
		},
		pdr_level_skittergate_contol_panel_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_contol_panel_01",
				"pdr_level_skittergate_contol_panel_02",
				"pdr_level_skittergate_contol_panel_03",
				"pdr_level_skittergate_contol_panel_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_contol_panel_01",
				"pdr_level_skittergate_contol_panel_02",
				"pdr_level_skittergate_contol_panel_03",
				"pdr_level_skittergate_contol_panel_04"
			},
			sound_events_duration = {
				4.7028541564941,
				6.2557291984558,
				3.4567084312439,
				7.5183539390564
			}
		},
		pdr_level_skittergate_crater_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 3,
			category = "level_talk",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_skittergate_crater_02",
				"pdr_level_skittergate_crater_03",
				"pdr_level_skittergate_crater_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_crater_02",
				"pdr_level_skittergate_crater_03",
				"pdr_level_skittergate_crater_04"
			},
			sound_events_duration = {
				3.9571874141693,
				3.5451667308807,
				3.9333958625794
			}
		},
		pdr_level_skittergate_dead_seer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_dead_seer_01",
				"pdr_level_skittergate_dead_seer_02",
				"pdr_level_skittergate_dead_seer_03",
				"pdr_level_skittergate_dead_seer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_dead_seer_01",
				"pdr_level_skittergate_dead_seer_02",
				"pdr_level_skittergate_dead_seer_03",
				"pdr_level_skittergate_dead_seer_04"
			},
			sound_events_duration = {
				8.3091039657593,
				9.0807294845581,
				9.6396045684815,
				9.5054378509522
			}
		},
		pdr_level_skittergate_dead_seer_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_dead_seer_01",
				"pdr_level_skittergate_dead_seer_02",
				"pdr_level_skittergate_dead_seer_03",
				"pdr_level_skittergate_dead_seer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_dead_seer_01",
				"pdr_level_skittergate_dead_seer_02",
				"pdr_level_skittergate_dead_seer_03",
				"pdr_level_skittergate_dead_seer_04"
			},
			sound_events_duration = {
				8.3091039657593,
				9.0807294845581,
				9.6396045684815,
				9.5054378509522
			}
		},
		pdr_level_skittergate_docks_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_docks_gate_01",
				"pdr_level_skittergate_docks_gate_02",
				"pdr_level_skittergate_docks_gate_03",
				"pdr_level_skittergate_docks_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_docks_gate_01",
				"pdr_level_skittergate_docks_gate_02",
				"pdr_level_skittergate_docks_gate_03",
				"pdr_level_skittergate_docks_gate_04"
			},
			sound_events_duration = {
				2.5360000133514,
				3.4402499198914,
				3.1429998874664,
				2.4633541107178
			}
		},
		pdr_level_skittergate_elevator_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_skittergate_elevator_01",
				"pdr_level_skittergate_elevator_02",
				"pdr_level_skittergate_elevator_03",
				"pdr_level_skittergate_elevator_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_elevator_01",
				"pdr_level_skittergate_elevator_02",
				"pdr_level_skittergate_elevator_03",
				"pdr_level_skittergate_elevator_04"
			},
			sound_events_duration = {
				2.731645822525,
				1.5632292032242,
				2.893458366394,
				2.7420001029968
			}
		},
		pdr_level_skittergate_enter_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_enter_gate_01",
				"pdr_level_skittergate_enter_gate_02",
				"pdr_level_skittergate_enter_gate_03",
				"pdr_level_skittergate_enter_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_enter_gate_01",
				"pdr_level_skittergate_enter_gate_02",
				"pdr_level_skittergate_enter_gate_03",
				"pdr_level_skittergate_enter_gate_04"
			},
			sound_events_duration = {
				6.2809581756592,
				2.9823749065399,
				6.9395418167114,
				3.7655832767487
			}
		},
		pdr_level_skittergate_gate_activated_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_gate_activated_01",
				"pdr_level_skittergate_gate_activated_02",
				"pdr_level_skittergate_gate_activated_03",
				"pdr_level_skittergate_gate_activated_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_gate_activated_01",
				"pdr_level_skittergate_gate_activated_02",
				"pdr_level_skittergate_gate_activated_03",
				"pdr_level_skittergate_gate_activated_04"
			},
			sound_events_duration = {
				2.4059166908264,
				3.8231041431427,
				3.3689167499542,
				4.1802501678467
			}
		},
		pdr_level_skittergate_gatekeeper_appear_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 3,
			category = "level_talk",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_skittergate_gatekeeper_appear_01",
				"pdr_level_skittergate_gatekeeper_appear_02",
				"pdr_level_skittergate_gatekeeper_appear_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_gatekeeper_appear_01",
				"pdr_level_skittergate_gatekeeper_appear_02",
				"pdr_level_skittergate_gatekeeper_appear_04"
			},
			sound_events_duration = {
				11.584812164307,
				7.1301250457764,
				5.9200210571289
			}
		},
		pdr_level_skittergate_gatekeeper_death_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_gatekeeper_death_01",
				"pdr_level_skittergate_gatekeeper_death_02",
				"pdr_level_skittergate_gatekeeper_death_03",
				"pdr_level_skittergate_gatekeeper_death_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_gatekeeper_death_01",
				"pdr_level_skittergate_gatekeeper_death_02",
				"pdr_level_skittergate_gatekeeper_death_03",
				"pdr_level_skittergate_gatekeeper_death_04"
			},
			sound_events_duration = {
				4.7819375991821,
				5.4367709159851,
				7.1086459159851,
				7.0735206604004
			}
		},
		pdr_level_skittergate_get_back_to_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_get_back_to_gate_01",
				"pdr_level_skittergate_get_back_to_gate_02",
				"pdr_level_skittergate_get_back_to_gate_03",
				"pdr_level_skittergate_get_back_to_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_get_back_to_gate_01",
				"pdr_level_skittergate_get_back_to_gate_02",
				"pdr_level_skittergate_get_back_to_gate_03",
				"pdr_level_skittergate_get_back_to_gate_04"
			},
			sound_events_duration = {
				3.7197291851044,
				3.2892291545868,
				4.3313331604004,
				3.2842082977295
			}
		},
		pdr_level_skittergate_get_down_to_the_cooling_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_get_down_to_the_cooling_01",
				"pdr_level_skittergate_get_down_to_the_cooling_02",
				"pdr_level_skittergate_get_down_to_the_cooling_03",
				"pdr_level_skittergate_get_down_to_the_cooling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_get_down_to_the_cooling_01",
				"pdr_level_skittergate_get_down_to_the_cooling_02",
				"pdr_level_skittergate_get_down_to_the_cooling_03",
				"pdr_level_skittergate_get_down_to_the_cooling_04"
			},
			sound_events_duration = {
				5.3670001029968,
				6.5571250915527,
				8.1804790496826,
				8.2494373321533
			}
		},
		pdr_level_skittergate_leave_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_leave_01",
				"pdr_level_skittergate_leave_02",
				"pdr_level_skittergate_leave_03",
				"pdr_level_skittergate_leave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_leave_01",
				"pdr_level_skittergate_leave_02",
				"pdr_level_skittergate_leave_03",
				"pdr_level_skittergate_leave_04"
			},
			sound_events_duration = {
				8.947229385376,
				6.927312374115,
				6.689875125885,
				7.7811665534973
			}
		},
		pdr_level_skittergate_rasknitt_death_rattler_invulnerable = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_01",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_02",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_03",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_01",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_02",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_03",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_04"
			},
			sound_events_duration = {
				4.8958959579468,
				5.0378127098083,
				5.7311043739319,
				8.1022081375122
			}
		},
		pdr_level_skittergate_rasknitt_dismounted_one = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 5,
			category = "player_alerts_boss",
			dialogue_animations_n = 5,
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
				"pdr_level_skittergate_rasknitt_dismounted_one_01",
				"pdr_level_skittergate_rasknitt_dismounted_one_02",
				"pdr_level_skittergate_rasknitt_dismounted_one_03",
				"pdr_level_skittergate_rasknitt_dismounted_one_04",
				"pdr_level_skittergate_rasknitt_dismounted_one_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_rasknitt_dismounted_one_01",
				"pdr_level_skittergate_rasknitt_dismounted_one_02",
				"pdr_level_skittergate_rasknitt_dismounted_one_03",
				"pdr_level_skittergate_rasknitt_dismounted_one_04",
				"pdr_level_skittergate_rasknitt_dismounted_one_05"
			},
			sound_events_duration = {
				6.8662085533142,
				5.0881876945496,
				5.5590415000916,
				4.8490624427795,
				4.9763331413269
			}
		},
		pdr_level_skittergate_rasknitt_gate_reply = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 2,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pdr_level_skittergate_rasknitt_gate_reply_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pdr_level_skittergate_rasknitt_gate_reply_02"
			},
			sound_events_duration = {
				[1.0] = 7.8104791641235,
				[2.0] = 10.880520820618
			}
		},
		pdr_level_skittergate_rasknitt_interrupt_and_focus = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_01",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_02",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_03",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_01",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_02",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_03",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_04"
			},
			sound_events_duration = {
				6.4050831794739,
				5.7648124694824,
				5.5532293319702,
				6.4276041984558
			}
		},
		pdr_level_skittergate_rasknitt_stormfiend_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 2,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_02"
			},
			sound_events_duration = {
				[1.0] = 6.2777915000916,
				[2.0] = 3.4720833301544
			}
		},
		pdr_level_skittergate_run_for_the_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_run_for_the_gate_01",
				"pdr_level_skittergate_run_for_the_gate_02",
				"pdr_level_skittergate_run_for_the_gate_03",
				"pdr_level_skittergate_run_for_the_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_run_for_the_gate_01",
				"pdr_level_skittergate_run_for_the_gate_02",
				"pdr_level_skittergate_run_for_the_gate_03",
				"pdr_level_skittergate_run_for_the_gate_04"
			},
			sound_events_duration = {
				3.3352291584015,
				3.7618958950043,
				3.6221458911896,
				3.1514792442322
			}
		},
		pdr_level_skittergate_sabotage_cooling_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_sabotage_cooling_01",
				"pdr_level_skittergate_sabotage_cooling_02",
				"pdr_level_skittergate_sabotage_cooling_03",
				"pdr_level_skittergate_sabotage_cooling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_sabotage_cooling_01",
				"pdr_level_skittergate_sabotage_cooling_02",
				"pdr_level_skittergate_sabotage_cooling_03",
				"pdr_level_skittergate_sabotage_cooling_04"
			},
			sound_events_duration = {
				5.335916519165,
				5.8283333778381,
				3.6005415916443,
				3.6703333854675
			}
		},
		pdr_level_skittergate_searching_gatekeeper_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_searching_gatekeeper_01",
				"pdr_level_skittergate_searching_gatekeeper_02",
				"pdr_level_skittergate_searching_gatekeeper_03",
				"pdr_level_skittergate_searching_gatekeeper_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_searching_gatekeeper_01",
				"pdr_level_skittergate_searching_gatekeeper_02",
				"pdr_level_skittergate_searching_gatekeeper_03",
				"pdr_level_skittergate_searching_gatekeeper_04"
			},
			sound_events_duration = {
				8.8165836334228,
				8.6786041259766,
				6.5471043586731,
				6.1156668663025
			}
		},
		pdr_level_skittergate_ships_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_ships_01",
				"pdr_level_skittergate_ships_02",
				"pdr_level_skittergate_ships_03",
				"pdr_level_skittergate_ships_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_ships_01",
				"pdr_level_skittergate_ships_02",
				"pdr_level_skittergate_ships_03",
				"pdr_level_skittergate_ships_04"
			},
			sound_events_duration = {
				5.3776459693909,
				4.4225001335144,
				4.1757082939148,
				5.670458316803
			}
		},
		pdr_level_skittergate_skittergate_found_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pdr_level_skittergate_skittergate_found_01",
				"pdr_level_skittergate_skittergate_found_02",
				"pdr_level_skittergate_skittergate_found_03",
				"pdr_level_skittergate_skittergate_found_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_skittergate_found_01",
				"pdr_level_skittergate_skittergate_found_02",
				"pdr_level_skittergate_skittergate_found_03",
				"pdr_level_skittergate_skittergate_found_04"
			},
			sound_events_duration = {
				2.2429583072662,
				2.0660834312439,
				4.0137500762939,
				1.9862291812897
			}
		},
		pdr_level_skittergate_spotting_docks_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_spotting_docks_01",
				"pdr_level_skittergate_spotting_docks_02",
				"pdr_level_skittergate_spotting_docks_03",
				"pdr_level_skittergate_spotting_docks_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_spotting_docks_01",
				"pdr_level_skittergate_spotting_docks_02",
				"pdr_level_skittergate_spotting_docks_03",
				"pdr_level_skittergate_spotting_docks_04"
			},
			sound_events_duration = {
				3.2965834140778,
				4.0271668434143,
				9.2084169387817,
				3.2632291316986
			}
		},
		pdr_level_skittergate_start_up_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_start_up_gate_01",
				"pdr_level_skittergate_start_up_gate_02",
				"pdr_level_skittergate_start_up_gate_03",
				"pdr_level_skittergate_start_up_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_start_up_gate_01",
				"pdr_level_skittergate_start_up_gate_02",
				"pdr_level_skittergate_start_up_gate_03",
				"pdr_level_skittergate_start_up_gate_04"
			},
			sound_events_duration = {
				5.3348126411438,
				4.0098958015442,
				6.8684372901917,
				7.5251460075378
			}
		},
		pdr_level_skittergate_through_the_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_through_the_gate_01",
				"pdr_level_skittergate_through_the_gate_02",
				"pdr_level_skittergate_through_the_gate_03",
				"pdr_level_skittergate_through_the_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_through_the_gate_01",
				"pdr_level_skittergate_through_the_gate_02",
				"pdr_level_skittergate_through_the_gate_03",
				"pdr_level_skittergate_through_the_gate_04"
			},
			sound_events_duration = {
				2.2635207176209,
				3.1326251029968,
				5.4084582328796,
				2.456333398819
			}
		},
		pdr_level_skittergate_tunnel_collapses_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_tunnel_collapses_01",
				"pdr_level_skittergate_tunnel_collapses_02",
				"pdr_level_skittergate_tunnel_collapses_03",
				"pdr_level_skittergate_tunnel_collapses_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_tunnel_collapses_01",
				"pdr_level_skittergate_tunnel_collapses_02",
				"pdr_level_skittergate_tunnel_collapses_03",
				"pdr_level_skittergate_tunnel_collapses_04"
			},
			sound_events_duration = {
				5.0236043930054,
				4.6555209159851,
				4.276291847229,
				3.728354215622
			}
		},
		pdr_level_skittergate_vacated_area_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_vacated_area_01",
				"pdr_level_skittergate_vacated_area_02",
				"pdr_level_skittergate_vacated_area_03",
				"pdr_level_skittergate_vacated_area_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_vacated_area_01",
				"pdr_level_skittergate_vacated_area_02",
				"pdr_level_skittergate_vacated_area_03",
				"pdr_level_skittergate_vacated_area_04"
			},
			sound_events_duration = {
				7.2602291107178,
				3.2569582462311,
				2.0608749389648,
				3.7211875915527
			}
		},
		pdr_level_skittergate_vista_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_vista_01",
				"pdr_level_skittergate_vista_02",
				"pdr_level_skittergate_vista_03",
				"pdr_level_skittergate_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_vista_01",
				"pdr_level_skittergate_vista_02",
				"pdr_level_skittergate_vista_03",
				"pdr_level_skittergate_vista_04"
			},
			sound_events_duration = {
				5.9305210113525,
				5.7461667060852,
				5.1384582519531,
				6.1395206451416
			}
		},
		pdr_level_skittergate_welcome_to_norsca_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pdr_level_skittergate_welcome_to_norsca_01",
				"pdr_level_skittergate_welcome_to_norsca_02",
				"pdr_level_skittergate_welcome_to_norsca_03",
				"pdr_level_skittergate_welcome_to_norsca_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_skittergate_welcome_to_norsca_01",
				"pdr_level_skittergate_welcome_to_norsca_02",
				"pdr_level_skittergate_welcome_to_norsca_03",
				"pdr_level_skittergate_welcome_to_norsca_04"
			},
			sound_events_duration = {
				2.6210207939148,
				3.620854139328,
				2.7474999427795,
				6.4290833473206
			}
		},
		pdr_skittergate_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_skittergate_intro_a_01",
				[2.0] = "pdr_skittergate_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_skittergate_intro_a_01",
				[2.0] = "pdr_skittergate_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 8.1024580001831,
				[2.0] = 8.089937210083
			}
		},
		pdr_skittergate_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_skittergate_intro_b_01",
				[2.0] = "pdr_skittergate_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_skittergate_intro_b_01",
				[2.0] = "pdr_skittergate_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 6.277937412262,
				[2.0] = 7.4738335609436
			}
		},
		pdr_skittergate_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_skittergate_intro_c_01",
				[2.0] = "pdr_skittergate_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_skittergate_intro_c_01",
				[2.0] = "pdr_skittergate_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.610333442688,
				[2.0] = 4.733416557312
			}
		}
	})
end
