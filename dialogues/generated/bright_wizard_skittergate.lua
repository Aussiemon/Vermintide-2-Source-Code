return function ()
	define_rule({
		name = "pbw_level_skittergate_elevator_01",
		response = "pbw_level_skittergate_elevator_01",
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
		name = "pbw_level_skittergate_crater_01",
		response = "pbw_level_skittergate_crater_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_skittergate_cave_entrance_01",
		response = "pbw_level_skittergate_cave_entrance_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_skittergate_skittergate_found_01",
		response = "pbw_level_skittergate_skittergate_found_01",
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
		name = "pbw_level_skittergate_vacated_area_01",
		response = "pbw_level_skittergate_vacated_area_01",
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
		name = "pbw_level_skittergate_activate_gate_01",
		response = "pbw_level_skittergate_activate_gate_01",
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
		name = "pbw_level_skittergate_gate_activated_01",
		response = "pbw_level_skittergate_gate_activated_01",
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
				"level_skittergate_gate_activated"
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
			}
		}
	})
	define_rule({
		name = "pbw_level_skittergate_enter_gate_01",
		response = "pbw_level_skittergate_enter_gate_01",
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
			}
		}
	})
	define_rule({
		name = "pbw_level_skittergate_arrive_01",
		response = "pbw_level_skittergate_arrive_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_skittergate_welcome_to_norsca_01",
		response = "pbw_level_skittergate_welcome_to_norsca_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_skittergate_start_up_gate_01",
		response = "pbw_level_skittergate_start_up_gate_01",
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
		name = "pbw_level_skittergate_vista_01",
		response = "pbw_level_skittergate_vista_01",
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
		name = "pbw_level_skittergate_contol_panel_01",
		response = "pbw_level_skittergate_contol_panel_01",
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
		name = "pbw_level_skittergate_spotting_docks_01",
		response = "pbw_level_skittergate_spotting_docks_01",
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
		name = "pbw_level_skittergate_ships_01",
		response = "pbw_level_skittergate_ships_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_skittergate_docks_gate_01",
		response = "pbw_level_skittergate_docks_gate_01",
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
		name = "pbw_level_skittergate_searching_gatekeeper_01",
		response = "pbw_level_skittergate_searching_gatekeeper_01",
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
		name = "pbw_level_skittergate_gatekeeper_appear_01",
		response = "pbw_level_skittergate_gatekeeper_appear_01",
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
		name = "pbw_level_skittergate_get_back_to_gate_01",
		response = "pbw_level_skittergate_get_back_to_gate_01",
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
		name = "pbw_level_skittergate_get_down_to_the_cooling_01",
		response = "pbw_level_skittergate_get_down_to_the_cooling_01",
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
		name = "pbw_level_skittergate_sabotage_cooling_01",
		response = "pbw_level_skittergate_sabotage_cooling_01",
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
		name = "pbw_level_skittergate_run_for_the_gate_01",
		response = "pbw_level_skittergate_run_for_the_gate_01",
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
			}
		}
	})
	define_rule({
		name = "pbw_level_skittergate_through_the_gate_01",
		response = "pbw_level_skittergate_through_the_gate_01",
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
			}
		}
	})
	define_rule({
		name = "pbw_level_skittergate_back_home_01",
		response = "pbw_level_skittergate_back_home_01",
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
		name = "pbw_level_skittergate_dead_seer_01",
		response = "pbw_level_skittergate_dead_seer_01",
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
		name = "pbw_level_skittergate_BOOM_01",
		response = "pbw_level_skittergate_BOOM_01",
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
		name = "pbw_level_skittergate_leave_01",
		response = "pbw_level_skittergate_leave_01",
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
		name = "pbw_level_skittergate_tunnel_collapses_01",
		response = "pbw_level_skittergate_tunnel_collapses_01",
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
		name = "pbw_skittergate_intro_a",
		response = "pbw_skittergate_intro_a",
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
		name = "pbw_skittergate_intro_b",
		response = "pbw_skittergate_intro_b",
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
				"bright_wizard"
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
		name = "pbw_skittergate_intro_c",
		response = "pbw_skittergate_intro_c",
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
				"skittergate_intro_c"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
	define_rule({
		response = "pbw_level_skittergate_rasknitt_gate_reply",
		name = "pbw_level_skittergate_rasknitt_gate_reply",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_level_skittergate_rasknitt_dismounted_one",
		name = "pbw_level_skittergate_rasknitt_dismounted_one",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_level_skittergate_rasknitt_death_rattler_invulnerable",
		response = "pbw_level_skittergate_rasknitt_death_rattler_invulnerable",
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
		name = "pbw_level_skittergate_rasknitt_interrupt_and_focus",
		response = "pbw_level_skittergate_rasknitt_interrupt_and_focus",
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
		name = "pbw_level_skittergate_rasknitt_stormfiend_dead",
		response = "pbw_level_skittergate_rasknitt_stormfiend_dead",
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
		name = "pbw_level_skittergate_dead_seer",
		response = "pbw_level_skittergate_dead_seer",
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
		name = "pbw_level_skittergate_activate_gate_01a",
		response = "pbw_level_skittergate_activate_gate_01a",
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
	add_dialogues({
		pbw_level_skittergate_rasknitt_death_rattler_invulnerable = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_01",
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_02",
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_03",
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_04"
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
				3.2651875019074,
				3.2512083053589,
				2.442583322525,
				3.2891249656677
			},
			localization_strings = {
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_01",
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_02",
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_03",
				"pbw_level_skittergate_rasknitt_death_rattler_invulnerable_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_spotting_docks_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_spotting_docks_01",
				"pbw_level_skittergate_spotting_docks_02",
				"pbw_level_skittergate_spotting_docks_03",
				"pbw_level_skittergate_spotting_docks_04"
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
				2.7027916908264,
				3.1727499961853,
				3.5943124294281,
				3.0815625190735
			},
			localization_strings = {
				"pbw_level_skittergate_spotting_docks_01",
				"pbw_level_skittergate_spotting_docks_02",
				"pbw_level_skittergate_spotting_docks_03",
				"pbw_level_skittergate_spotting_docks_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_BOOM_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_BOOM_01",
				"pbw_level_skittergate_BOOM_02",
				"pbw_level_skittergate_BOOM_03",
				"pbw_level_skittergate_BOOM_04"
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
				5.9375,
				7.5481247901917,
				2.6309583187103,
				5.9303126335144
			},
			localization_strings = {
				"pbw_level_skittergate_BOOM_01",
				"pbw_level_skittergate_BOOM_02",
				"pbw_level_skittergate_BOOM_03",
				"pbw_level_skittergate_BOOM_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_run_for_the_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_run_for_the_gate_01",
				"pbw_level_skittergate_run_for_the_gate_02",
				"pbw_level_skittergate_run_for_the_gate_03",
				"pbw_level_skittergate_run_for_the_gate_04"
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
				4.4909167289734,
				3.3341250419617,
				3.9149167537689,
				6.7131252288818
			},
			localization_strings = {
				"pbw_level_skittergate_run_for_the_gate_01",
				"pbw_level_skittergate_run_for_the_gate_02",
				"pbw_level_skittergate_run_for_the_gate_03",
				"pbw_level_skittergate_run_for_the_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_contol_panel_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_contol_panel_01",
				"pbw_level_skittergate_contol_panel_02",
				"pbw_level_skittergate_contol_panel_03",
				"pbw_level_skittergate_contol_panel_04"
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
				3.5112707614899,
				3.438812494278,
				3.9105832576752,
				4.7794585227966
			},
			localization_strings = {
				"pbw_level_skittergate_contol_panel_01",
				"pbw_level_skittergate_contol_panel_02",
				"pbw_level_skittergate_contol_panel_03",
				"pbw_level_skittergate_contol_panel_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_start_up_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_start_up_gate_01",
				"pbw_level_skittergate_start_up_gate_02",
				"pbw_level_skittergate_start_up_gate_03",
				"pbw_level_skittergate_start_up_gate_04"
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
				5.4882082939148,
				4.9784164428711,
				5.7294793128967,
				4.8108959197998
			},
			localization_strings = {
				"pbw_level_skittergate_start_up_gate_01",
				"pbw_level_skittergate_start_up_gate_02",
				"pbw_level_skittergate_start_up_gate_03",
				"pbw_level_skittergate_start_up_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_rasknitt_interrupt_and_focus = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_01",
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_02",
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_03",
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_04"
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
				4.6357707977295,
				3.7829582691193,
				3.2063958644867,
				5.8838748931885
			},
			localization_strings = {
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_01",
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_02",
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_03",
				"pbw_level_skittergate_rasknitt_interrupt_and_focus_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_cave_entrance_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_cave_entrance_01",
				"pbw_level_skittergate_cave_entrance_02",
				"pbw_level_skittergate_cave_entrance_03",
				"pbw_level_skittergate_cave_entrance_04"
			},
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
			sound_events_duration = {
				6.0704998970032,
				8.7690210342407,
				6.7178959846497,
				7.375458240509
			},
			localization_strings = {
				"pbw_level_skittergate_cave_entrance_01",
				"pbw_level_skittergate_cave_entrance_02",
				"pbw_level_skittergate_cave_entrance_03",
				"pbw_level_skittergate_cave_entrance_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_dead_seer_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_dead_seer_01",
				"pbw_level_skittergate_dead_seer_02",
				"pbw_level_skittergate_dead_seer_03",
				"pbw_level_skittergate_dead_seer_04"
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
				14.928166389465,
				14.675895690918,
				14.598291397095,
				13.892645835877
			},
			localization_strings = {
				"pbw_level_skittergate_dead_seer_01",
				"pbw_level_skittergate_dead_seer_02",
				"pbw_level_skittergate_dead_seer_03",
				"pbw_level_skittergate_dead_seer_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_vacated_area_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_vacated_area_01",
				"pbw_level_skittergate_vacated_area_02",
				"pbw_level_skittergate_vacated_area_03",
				"pbw_level_skittergate_vacated_area_04"
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
				10.075520515442,
				5.8260207176208,
				6.4503960609436,
				6.0906248092651
			},
			localization_strings = {
				"pbw_level_skittergate_vacated_area_01",
				"pbw_level_skittergate_vacated_area_02",
				"pbw_level_skittergate_vacated_area_03",
				"pbw_level_skittergate_vacated_area_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_elevator_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_elevator_01",
				"pbw_level_skittergate_elevator_02",
				"pbw_level_skittergate_elevator_03",
				"pbw_level_skittergate_elevator_04"
			},
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
			sound_events_duration = {
				4.2965207099915,
				3.8926875591278,
				2.5613334178925,
				3.1435415744781
			},
			localization_strings = {
				"pbw_level_skittergate_elevator_01",
				"pbw_level_skittergate_elevator_02",
				"pbw_level_skittergate_elevator_03",
				"pbw_level_skittergate_elevator_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_rasknitt_gate_reply = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pbw_level_skittergate_rasknitt_gate_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 13.971375465393,
				[2.0] = 11.041166305542
			},
			localization_strings = {
				[1.0] = "pbw_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pbw_level_skittergate_rasknitt_gate_reply_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_get_down_to_the_cooling_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_get_down_to_the_cooling_01",
				"pbw_level_skittergate_get_down_to_the_cooling_02",
				"pbw_level_skittergate_get_down_to_the_cooling_03",
				"pbw_level_skittergate_get_down_to_the_cooling_04"
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
				6.356999874115,
				7.0564999580383,
				5.1056456565857,
				5.3960418701172
			},
			localization_strings = {
				"pbw_level_skittergate_get_down_to_the_cooling_01",
				"pbw_level_skittergate_get_down_to_the_cooling_02",
				"pbw_level_skittergate_get_down_to_the_cooling_03",
				"pbw_level_skittergate_get_down_to_the_cooling_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_skittergate_found_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_skittergate_found_01",
				"pbw_level_skittergate_skittergate_found_02",
				"pbw_level_skittergate_skittergate_found_03",
				"pbw_level_skittergate_skittergate_found_04"
			},
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
			sound_events_duration = {
				3.4603333473206,
				3.5183334350586,
				3.8508541584015,
				2.5769374370575
			},
			localization_strings = {
				"pbw_level_skittergate_skittergate_found_01",
				"pbw_level_skittergate_skittergate_found_02",
				"pbw_level_skittergate_skittergate_found_03",
				"pbw_level_skittergate_skittergate_found_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_rasknitt_dismounted_one = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_level_skittergate_rasknitt_dismounted_one_01",
				"pbw_level_skittergate_rasknitt_dismounted_one_02",
				"pbw_level_skittergate_rasknitt_dismounted_one_03",
				"pbw_level_skittergate_rasknitt_dismounted_one_04",
				"pbw_level_skittergate_rasknitt_dismounted_one_05"
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
				4.5720415115356,
				3.2491457462311,
				6.3715624809265,
				5.1418123245239,
				6.4218335151672
			},
			localization_strings = {
				"pbw_level_skittergate_rasknitt_dismounted_one_01",
				"pbw_level_skittergate_rasknitt_dismounted_one_02",
				"pbw_level_skittergate_rasknitt_dismounted_one_03",
				"pbw_level_skittergate_rasknitt_dismounted_one_04",
				"pbw_level_skittergate_rasknitt_dismounted_one_05"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_activate_gate_01a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_activate_gate_01a",
				"pbw_level_skittergate_activate_gate_02a",
				"pbw_level_skittergate_activate_gate_03a",
				"pbw_level_skittergate_activate_gate_04a"
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
				3.2599999904633,
				6.6057500839233,
				4.0950627326965,
				3.9601249694824
			},
			localization_strings = {
				"pbw_level_skittergate_activate_gate_01a",
				"pbw_level_skittergate_activate_gate_02a",
				"pbw_level_skittergate_activate_gate_03a",
				"pbw_level_skittergate_activate_gate_04a"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_vista_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_vista_01",
				"pbw_level_skittergate_vista_02",
				"pbw_level_skittergate_vista_03",
				"pbw_level_skittergate_vista_04"
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
				5.9623332023621,
				5.6332082748413,
				5.7530627250671,
				6.0333747863769
			},
			localization_strings = {
				"pbw_level_skittergate_vista_01",
				"pbw_level_skittergate_vista_02",
				"pbw_level_skittergate_vista_03",
				"pbw_level_skittergate_vista_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_welcome_to_norsca_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_welcome_to_norsca_01",
				"pbw_level_skittergate_welcome_to_norsca_02",
				"pbw_level_skittergate_welcome_to_norsca_03",
				"pbw_level_skittergate_welcome_to_norsca_04"
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
				7.0650210380554,
				4.038562297821,
				4.8351874351502,
				4.9473333358765
			},
			localization_strings = {
				"pbw_level_skittergate_welcome_to_norsca_01",
				"pbw_level_skittergate_welcome_to_norsca_02",
				"pbw_level_skittergate_welcome_to_norsca_03",
				"pbw_level_skittergate_welcome_to_norsca_04"
			},
			randomize_indexes = {}
		},
		pbw_skittergate_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_skittergate_intro_c_01",
				[2.0] = "pbw_skittergate_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3333749771118,
				[2.0] = 6.3568124771118
			},
			localization_strings = {
				[1.0] = "pbw_skittergate_intro_c_01",
				[2.0] = "pbw_skittergate_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_leave_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_leave_01",
				"pbw_level_skittergate_leave_02",
				"pbw_level_skittergate_leave_03",
				"pbw_level_skittergate_leave_04"
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
				3.0107917785645,
				5.3272085189819,
				3.5613541603088,
				6.5771250724792
			},
			localization_strings = {
				"pbw_level_skittergate_leave_01",
				"pbw_level_skittergate_leave_02",
				"pbw_level_skittergate_leave_03",
				"pbw_level_skittergate_leave_04"
			},
			randomize_indexes = {}
		},
		pbw_skittergate_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_skittergate_intro_b_01",
				[2.0] = "pbw_skittergate_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.1687293052673,
				[2.0] = 6.3164167404175
			},
			localization_strings = {
				[1.0] = "pbw_skittergate_intro_b_01",
				[2.0] = "pbw_skittergate_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_gate_activated_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_gate_activated_01",
				"pbw_level_skittergate_gate_activated_02",
				"pbw_level_skittergate_gate_activated_03",
				"pbw_level_skittergate_gate_activated_04"
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
				5.704562664032,
				4.9866042137146,
				6.6412916183472,
				6.457624912262
			},
			localization_strings = {
				"pbw_level_skittergate_gate_activated_01",
				"pbw_level_skittergate_gate_activated_02",
				"pbw_level_skittergate_gate_activated_03",
				"pbw_level_skittergate_gate_activated_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_back_home_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_back_home_01",
				"pbw_level_skittergate_back_home_02",
				"pbw_level_skittergate_back_home_03",
				"pbw_level_skittergate_back_home_04"
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
				6.7414584159851,
				8.991021156311,
				7.6207914352417,
				8.2177705764771
			},
			localization_strings = {
				"pbw_level_skittergate_back_home_01",
				"pbw_level_skittergate_back_home_02",
				"pbw_level_skittergate_back_home_03",
				"pbw_level_skittergate_back_home_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_get_back_to_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_get_back_to_gate_01",
				"pbw_level_skittergate_get_back_to_gate_02",
				"pbw_level_skittergate_get_back_to_gate_03",
				"pbw_level_skittergate_get_back_to_gate_04"
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
				3.0456249713898,
				6.0692915916443,
				3.6519999504089,
				4.6210417747498
			},
			localization_strings = {
				"pbw_level_skittergate_get_back_to_gate_01",
				"pbw_level_skittergate_get_back_to_gate_02",
				"pbw_level_skittergate_get_back_to_gate_03",
				"pbw_level_skittergate_get_back_to_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_crater_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_crater_01",
				"pbw_level_skittergate_crater_02",
				"pbw_level_skittergate_crater_03",
				"pbw_level_skittergate_crater_04"
			},
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
			sound_events_duration = {
				7.3424167633057,
				6.2221250534058,
				4.6605625152588,
				6.5122499465942
			},
			localization_strings = {
				"pbw_level_skittergate_crater_01",
				"pbw_level_skittergate_crater_02",
				"pbw_level_skittergate_crater_03",
				"pbw_level_skittergate_crater_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_gatekeeper_appear_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_gatekeeper_appear_01",
				"pbw_level_skittergate_gatekeeper_appear_02",
				"pbw_level_skittergate_gatekeeper_appear_03",
				"pbw_level_skittergate_gatekeeper_appear_04"
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
				8.1352920532227,
				7.0762710571289,
				6.4445834159851,
				9.9681873321533
			},
			localization_strings = {
				"pbw_level_skittergate_gatekeeper_appear_01",
				"pbw_level_skittergate_gatekeeper_appear_02",
				"pbw_level_skittergate_gatekeeper_appear_03",
				"pbw_level_skittergate_gatekeeper_appear_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_activate_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_activate_gate_01",
				"pbw_level_skittergate_activate_gate_02",
				"pbw_level_skittergate_activate_gate_03",
				"pbw_level_skittergate_activate_gate_04"
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
				4.6512084007263,
				5.2125835418701,
				3.8795833587647,
				4.2259168624878
			},
			localization_strings = {
				"pbw_level_skittergate_activate_gate_01",
				"pbw_level_skittergate_activate_gate_02",
				"pbw_level_skittergate_activate_gate_03",
				"pbw_level_skittergate_activate_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_dead_seer = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_dead_seer_01",
				"pbw_level_skittergate_dead_seer_02",
				"pbw_level_skittergate_dead_seer_03",
				"pbw_level_skittergate_dead_seer_04"
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
				14.928166389465,
				14.675895690918,
				14.598291397095,
				13.892645835877
			},
			localization_strings = {
				"pbw_level_skittergate_dead_seer_01",
				"pbw_level_skittergate_dead_seer_02",
				"pbw_level_skittergate_dead_seer_03",
				"pbw_level_skittergate_dead_seer_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_docks_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_docks_gate_01",
				"pbw_level_skittergate_docks_gate_02",
				"pbw_level_skittergate_docks_gate_03",
				"pbw_level_skittergate_docks_gate_04"
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
				3.7298123836517,
				6.5879793167114,
				4.5680418014526,
				3.1808125972748
			},
			localization_strings = {
				"pbw_level_skittergate_docks_gate_01",
				"pbw_level_skittergate_docks_gate_02",
				"pbw_level_skittergate_docks_gate_03",
				"pbw_level_skittergate_docks_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_rasknitt_stormfiend_dead = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pbw_level_skittergate_rasknitt_stormfiend_dead_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9797081947327,
				[2.0] = 3.6709582805634
			},
			localization_strings = {
				[1.0] = "pbw_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pbw_level_skittergate_rasknitt_stormfiend_dead_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_ships_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_ships_01",
				"pbw_level_skittergate_ships_02",
				"pbw_level_skittergate_ships_03",
				"pbw_level_skittergate_ships_04"
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
				3.337729215622,
				4.1762709617615,
				3.8146874904633,
				6.7218956947327
			},
			localization_strings = {
				"pbw_level_skittergate_ships_01",
				"pbw_level_skittergate_ships_02",
				"pbw_level_skittergate_ships_03",
				"pbw_level_skittergate_ships_04"
			},
			randomize_indexes = {}
		},
		pbw_skittergate_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_skittergate_intro_a_01",
				[2.0] = "pbw_skittergate_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.4391040802002,
				[2.0] = 7.4518542289734
			},
			localization_strings = {
				[1.0] = "pbw_skittergate_intro_a_01",
				[2.0] = "pbw_skittergate_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_arrive_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_arrive_01",
				"pbw_level_skittergate_arrive_02",
				"pbw_level_skittergate_arrive_03",
				"pbw_level_skittergate_arrive_04"
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
				6.7965416908264,
				4.2213959693909,
				5.3927083015442,
				6.6420001983643
			},
			localization_strings = {
				"pbw_level_skittergate_arrive_01",
				"pbw_level_skittergate_arrive_02",
				"pbw_level_skittergate_arrive_03",
				"pbw_level_skittergate_arrive_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_sabotage_cooling_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_sabotage_cooling_01",
				"pbw_level_skittergate_sabotage_cooling_02",
				"pbw_level_skittergate_sabotage_cooling_03",
				"pbw_level_skittergate_sabotage_cooling_04"
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
				5.4033126831055,
				3.5739583969116,
				3.4932708740234,
				4.5915417671204
			},
			localization_strings = {
				"pbw_level_skittergate_sabotage_cooling_01",
				"pbw_level_skittergate_sabotage_cooling_02",
				"pbw_level_skittergate_sabotage_cooling_03",
				"pbw_level_skittergate_sabotage_cooling_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_searching_gatekeeper_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_searching_gatekeeper_01",
				"pbw_level_skittergate_searching_gatekeeper_02",
				"pbw_level_skittergate_searching_gatekeeper_03",
				"pbw_level_skittergate_searching_gatekeeper_04"
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
				9.5241250991821,
				6.2206873893738,
				4.8866248130798,
				5.7271666526794
			},
			localization_strings = {
				"pbw_level_skittergate_searching_gatekeeper_01",
				"pbw_level_skittergate_searching_gatekeeper_02",
				"pbw_level_skittergate_searching_gatekeeper_03",
				"pbw_level_skittergate_searching_gatekeeper_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_tunnel_collapses_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_tunnel_collapses_01",
				"pbw_level_skittergate_tunnel_collapses_02",
				"pbw_level_skittergate_tunnel_collapses_03",
				"pbw_level_skittergate_tunnel_collapses_04"
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
				5.1802291870117,
				4.3072915077209,
				4.7973957061768,
				3.2994167804718
			},
			localization_strings = {
				"pbw_level_skittergate_tunnel_collapses_01",
				"pbw_level_skittergate_tunnel_collapses_02",
				"pbw_level_skittergate_tunnel_collapses_03",
				"pbw_level_skittergate_tunnel_collapses_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_enter_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_enter_gate_01",
				"pbw_level_skittergate_enter_gate_02",
				"pbw_level_skittergate_enter_gate_03",
				"pbw_level_skittergate_enter_gate_04"
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
				5.9762706756592,
				4.4578957557678,
				8.0134162902832,
				5.2585206031799
			},
			localization_strings = {
				"pbw_level_skittergate_enter_gate_01",
				"pbw_level_skittergate_enter_gate_02",
				"pbw_level_skittergate_enter_gate_03",
				"pbw_level_skittergate_enter_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_through_the_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_skittergate_through_the_gate_01",
				"pbw_level_skittergate_through_the_gate_02",
				"pbw_level_skittergate_through_the_gate_03",
				"pbw_level_skittergate_through_the_gate_04"
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
				4.001895904541,
				2.4259374141693,
				4.8383541107178,
				3.9877083301544
			},
			localization_strings = {
				"pbw_level_skittergate_through_the_gate_01",
				"pbw_level_skittergate_through_the_gate_02",
				"pbw_level_skittergate_through_the_gate_03",
				"pbw_level_skittergate_through_the_gate_04"
			},
			randomize_indexes = {}
		}
	})
end
