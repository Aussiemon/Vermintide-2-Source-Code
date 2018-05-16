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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
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
			localization_strings = {
				[1.0] = "pbw_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pbw_level_skittergate_rasknitt_gate_reply_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_get_down_to_the_cooling_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
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
			localization_strings = {
				[1.0] = "pbw_skittergate_intro_c_01",
				[2.0] = "pbw_skittergate_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_leave_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
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
			localization_strings = {
				[1.0] = "pbw_skittergate_intro_b_01",
				[2.0] = "pbw_skittergate_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_gate_activated_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
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
			localization_strings = {
				[1.0] = "pbw_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pbw_level_skittergate_rasknitt_stormfiend_dead_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_ships_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_skittergate",
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
			localization_strings = {
				[1.0] = "pbw_skittergate_intro_a_01",
				[2.0] = "pbw_skittergate_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_skittergate_arrive_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_skittergate",
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
