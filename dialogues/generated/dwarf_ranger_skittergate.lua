return function ()
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
				"skittergate_activate_gate"
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
				"level_skittergate_activate_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skittergate_activate_gate",
				OP.ADD,
				1
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
				"skittergate_activate_gate"
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
				"skittergate_activate_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skittergate_activate_gate",
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
				"skittergate_intro_c"
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
	define_rule({
		response = "egs_level_skittergate_rasknitt_appears",
		name = "egs_level_skittergate_rasknitt_appears",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_intro"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_calls_mount",
		name = "egs_level_skittergate_rasknitt_calls_mount",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_call_mount"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_shielded",
		name = "egs_gameplay_shielded",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_shielded"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_witchhunter_knock_down",
		name = "egs_gameplay_witchhunter_knock_down",
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
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_brightwizard_knock_down",
		name = "egs_gameplay_brightwizard_knock_down",
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
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_dwarfranger_knock_down",
		name = "egs_gameplay_dwarfranger_knock_down",
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
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_woodelf_knock_down",
		name = "egs_gameplay_woodelf_knock_down",
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
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_empiresoldier_knock_down",
		name = "egs_gameplay_empiresoldier_knock_down",
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
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_witchhunter_killed",
		name = "egs_gameplay_witchhunter_killed",
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
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_brightwizard_killed",
		name = "egs_gameplay_brightwizard_killed",
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
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_dwarfranger_killed",
		name = "egs_gameplay_dwarfranger_killed",
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
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_woodelf_killed",
		name = "egs_gameplay_woodelf_killed",
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
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_empiresoldier_killed",
		name = "egs_gameplay_empiresoldier_killed",
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
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_mounting_stormfiend",
		name = "egs_level_skittergate_rasknitt_mounting_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_mounting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_on_stormfiend",
		name = "egs_level_skittergate_rasknitt_on_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_shooting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_dismounted",
		name = "egs_level_skittergate_rasknitt_dismounted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_rasknitt_dismounted"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_calls_mount_battle",
		name = "egs_level_skittergate_rasknitt_calls_mount_battle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_calls_mount_battle"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_stormfiend_dead",
		name = "egs_level_skittergate_stormfiend_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_stormfiend_dead"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_summon_skaven",
		name = "egs_level_skittergate_summon_skaven",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_summon"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_cast_lightning",
		name = "egs_level_skittergate_cast_lightning",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_cast_lightning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_cast_vermintide",
		name = "egs_level_skittergate_cast_vermintide",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_cast_vermintide"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skitter_gate_teleport_death",
		name = "egs_level_skitter_gate_teleport_death",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_teleport_to_death"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_teleport_away",
		name = "egs_level_skittergate_teleport_away",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_teleport_away"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_death_scene_01",
		name = "egs_death_scene_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_death_scene"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
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
				"egs_level_skittergate_rasknitt_appears"
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
	add_dialogues({
		egs_level_skittergate_rasknitt_mounting_stormfiend = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_mounting_stormfiend_01",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_02",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_03",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_04"
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
				"egs_level_skittergate_rasknitt_mounting_stormfiend_01",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_02",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_03",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_BOOM_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_BOOM_01",
				"pdr_level_skittergate_BOOM_02",
				"pdr_level_skittergate_BOOM_03",
				"pdr_level_skittergate_BOOM_04"
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
				"pdr_level_skittergate_BOOM_01",
				"pdr_level_skittergate_BOOM_02",
				"pdr_level_skittergate_BOOM_03",
				"pdr_level_skittergate_BOOM_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_run_for_the_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_run_for_the_gate_01",
				"pdr_level_skittergate_run_for_the_gate_02",
				"pdr_level_skittergate_run_for_the_gate_03",
				"pdr_level_skittergate_run_for_the_gate_04"
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
				"pdr_level_skittergate_run_for_the_gate_01",
				"pdr_level_skittergate_run_for_the_gate_02",
				"pdr_level_skittergate_run_for_the_gate_03",
				"pdr_level_skittergate_run_for_the_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_contol_panel_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_contol_panel_01",
				"pdr_level_skittergate_contol_panel_02",
				"pdr_level_skittergate_contol_panel_03",
				"pdr_level_skittergate_contol_panel_04"
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
				"pdr_level_skittergate_contol_panel_01",
				"pdr_level_skittergate_contol_panel_02",
				"pdr_level_skittergate_contol_panel_03",
				"pdr_level_skittergate_contol_panel_04"
			},
			randomize_indexes = {}
		},
		pdr_skittergate_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_skittergate_intro_b_01",
				[2.0] = "pdr_skittergate_intro_b_02"
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
				[1.0] = "pdr_skittergate_intro_b_01",
				[2.0] = "pdr_skittergate_intro_b_02"
			},
			randomize_indexes = {}
		},
		egs_level_skitter_gate_teleport_death = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_skitter_gate_teleport_death"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_skitter_gate_teleport_death"
			}
		},
		egs_level_skittergate_rasknitt_dismounted = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_distance = 50,
			category = "boss_talk_interrupt",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_dismounted_01",
				"egs_level_skittergate_rasknitt_dismounted_02",
				"egs_level_skittergate_rasknitt_dismounted_03",
				"egs_level_skittergate_rasknitt_dismounted_04"
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
				"egs_level_skittergate_rasknitt_dismounted_01",
				"egs_level_skittergate_rasknitt_dismounted_02",
				"egs_level_skittergate_rasknitt_dismounted_03",
				"egs_level_skittergate_rasknitt_dismounted_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_cast_vermintide = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_cast_vermintide_01",
				"egs_level_skittergate_cast_vermintide_02",
				"egs_level_skittergate_cast_vermintide_03",
				"egs_level_skittergate_cast_vermintide_04"
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
				"egs_level_skittergate_cast_vermintide_01",
				"egs_level_skittergate_cast_vermintide_02",
				"egs_level_skittergate_cast_vermintide_03",
				"egs_level_skittergate_cast_vermintide_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_shielded = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_reaction_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_gameplay_shielded_01",
				"egs_gameplay_shielded_02",
				"egs_gameplay_shielded_03",
				"egs_gameplay_shielded_04"
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
				"egs_gameplay_shielded_01",
				"egs_gameplay_shielded_02",
				"egs_gameplay_shielded_03",
				"egs_gameplay_shielded_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_rasknitt_stormfiend_dead = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_02"
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
				[1.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_01",
				[2.0] = "pdr_level_skittergate_rasknitt_stormfiend_dead_02"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_cave_entrance_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_cave_entrance_01",
				"pdr_level_skittergate_cave_entrance_02",
				"pdr_level_skittergate_cave_entrance_03",
				"pdr_level_skittergate_cave_entrance_04"
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
				"pdr_level_skittergate_cave_entrance_01",
				"pdr_level_skittergate_cave_entrance_02",
				"pdr_level_skittergate_cave_entrance_03",
				"pdr_level_skittergate_cave_entrance_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_leave_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_leave_01",
				"pdr_level_skittergate_leave_02",
				"pdr_level_skittergate_leave_03",
				"pdr_level_skittergate_leave_04"
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
				"pdr_level_skittergate_leave_01",
				"pdr_level_skittergate_leave_02",
				"pdr_level_skittergate_leave_03",
				"pdr_level_skittergate_leave_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_rasknitt_interrupt_and_focus = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_01",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_02",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_03",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_04"
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
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_01",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_02",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_03",
				"pdr_level_skittergate_rasknitt_interrupt_and_focus_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_rasknitt_death_rattler_invulnerable = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_01",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_02",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_03",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_04"
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
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_01",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_02",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_03",
				"pdr_level_skittergate_rasknitt_death_rattler_invulnerable_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_gatekeeper_appear_01 = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_level_skittergate_gatekeeper_appear_01",
				"pdr_level_skittergate_gatekeeper_appear_02",
				"pdr_level_skittergate_gatekeeper_appear_04"
			},
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
			randomize_indexes = {}
		},
		pdr_level_skittergate_vacated_area_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_vacated_area_01",
				"pdr_level_skittergate_vacated_area_02",
				"pdr_level_skittergate_vacated_area_03",
				"pdr_level_skittergate_vacated_area_04"
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
				"pdr_level_skittergate_vacated_area_01",
				"pdr_level_skittergate_vacated_area_02",
				"pdr_level_skittergate_vacated_area_03",
				"pdr_level_skittergate_vacated_area_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_rasknitt_dismounted_one = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "player_alerts_boss",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_level_skittergate_rasknitt_dismounted_one_01",
				"pdr_level_skittergate_rasknitt_dismounted_one_02",
				"pdr_level_skittergate_rasknitt_dismounted_one_03",
				"pdr_level_skittergate_rasknitt_dismounted_one_04",
				"pdr_level_skittergate_rasknitt_dismounted_one_05"
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
				"pdr_level_skittergate_rasknitt_dismounted_one_01",
				"pdr_level_skittergate_rasknitt_dismounted_one_02",
				"pdr_level_skittergate_rasknitt_dismounted_one_03",
				"pdr_level_skittergate_rasknitt_dismounted_one_04",
				"pdr_level_skittergate_rasknitt_dismounted_one_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_arrive_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_arrive_01",
				"pdr_level_skittergate_arrive_02",
				"pdr_level_skittergate_arrive_03",
				"pdr_level_skittergate_arrive_04"
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
				"pdr_level_skittergate_arrive_01",
				"pdr_level_skittergate_arrive_02",
				"pdr_level_skittergate_arrive_03",
				"pdr_level_skittergate_arrive_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_cast_lightning = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_cast_lightning_01",
				"egs_level_skittergate_cast_lightning_02",
				"egs_level_skittergate_cast_lightning_03",
				"egs_level_skittergate_cast_lightning_04"
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
				"egs_level_skittergate_cast_lightning_01",
				"egs_level_skittergate_cast_lightning_02",
				"egs_level_skittergate_cast_lightning_03",
				"egs_level_skittergate_cast_lightning_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_gate_activated_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_gate_activated_01",
				"pdr_level_skittergate_gate_activated_02",
				"pdr_level_skittergate_gate_activated_03",
				"pdr_level_skittergate_gate_activated_04"
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
				"pdr_level_skittergate_gate_activated_01",
				"pdr_level_skittergate_gate_activated_02",
				"pdr_level_skittergate_gate_activated_03",
				"pdr_level_skittergate_gate_activated_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_rasknitt_gate_reply = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pdr_level_skittergate_rasknitt_gate_reply_02"
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
				[1.0] = "pdr_level_skittergate_rasknitt_gate_reply_01",
				[2.0] = "pdr_level_skittergate_rasknitt_gate_reply_02"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_activate_gate_01a = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_activate_gate_01a",
				"pdr_level_skittergate_activate_gate_02a",
				"pdr_level_skittergate_activate_gate_03a",
				"pdr_level_skittergate_activate_gate_04a"
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
				"pdr_level_skittergate_activate_gate_01a",
				"pdr_level_skittergate_activate_gate_02a",
				"pdr_level_skittergate_activate_gate_03a",
				"pdr_level_skittergate_activate_gate_04a"
			},
			randomize_indexes = {}
		},
		egs_death_scene_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_death_scene_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_death_scene_01"
			}
		},
		pdr_level_skittergate_get_down_to_the_cooling_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_get_down_to_the_cooling_01",
				"pdr_level_skittergate_get_down_to_the_cooling_02",
				"pdr_level_skittergate_get_down_to_the_cooling_03",
				"pdr_level_skittergate_get_down_to_the_cooling_04"
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
				"pdr_level_skittergate_get_down_to_the_cooling_01",
				"pdr_level_skittergate_get_down_to_the_cooling_02",
				"pdr_level_skittergate_get_down_to_the_cooling_03",
				"pdr_level_skittergate_get_down_to_the_cooling_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_teleport_away = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_teleport_away_01",
				"egs_level_skittergate_teleport_away_02",
				"egs_level_skittergate_teleport_away_03",
				"egs_level_skittergate_teleport_away_04"
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
				"egs_level_skittergate_teleport_away_01",
				"egs_level_skittergate_teleport_away_02",
				"egs_level_skittergate_teleport_away_03",
				"egs_level_skittergate_teleport_away_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_summon_skaven = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_summon_skaven_01",
				"egs_level_skittergate_summon_skaven_02",
				"egs_level_skittergate_summon_skaven_03",
				"egs_level_skittergate_summon_skaven_04"
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
				"egs_level_skittergate_summon_skaven_01",
				"egs_level_skittergate_summon_skaven_02",
				"egs_level_skittergate_summon_skaven_03",
				"egs_level_skittergate_summon_skaven_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_stormfiend_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_stormfiend_dead_01",
				"egs_level_skittergate_stormfiend_dead_02",
				"egs_level_skittergate_stormfiend_dead_03",
				"egs_level_skittergate_stormfiend_dead_04"
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
				"egs_level_skittergate_stormfiend_dead_01",
				"egs_level_skittergate_stormfiend_dead_02",
				"egs_level_skittergate_stormfiend_dead_03",
				"egs_level_skittergate_stormfiend_dead_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_brightwizard_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_brightwizard_killed_01",
				"egs_gameplay_brightwizard_killed_02",
				"egs_gameplay_brightwizard_killed_03",
				"egs_gameplay_brightwizard_killed_04",
				"egs_gameplay_brightwizard_killed_05"
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
				"egs_gameplay_brightwizard_killed_01",
				"egs_gameplay_brightwizard_killed_02",
				"egs_gameplay_brightwizard_killed_03",
				"egs_gameplay_brightwizard_killed_04",
				"egs_gameplay_brightwizard_killed_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_skittergate_found_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_skittergate_found_01",
				"pdr_level_skittergate_skittergate_found_02",
				"pdr_level_skittergate_skittergate_found_03",
				"pdr_level_skittergate_skittergate_found_04"
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
				"pdr_level_skittergate_skittergate_found_01",
				"pdr_level_skittergate_skittergate_found_02",
				"pdr_level_skittergate_skittergate_found_03",
				"pdr_level_skittergate_skittergate_found_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_calls_mount_battle = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk_interrupt",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_calls_mount_battle_01",
				"egs_level_skittergate_rasknitt_calls_mount_battle_02",
				"egs_level_skittergate_rasknitt_calls_mount_battle_03",
				"egs_level_skittergate_rasknitt_calls_mount_battle_04"
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
				"egs_level_skittergate_rasknitt_calls_mount_battle_01",
				"egs_level_skittergate_rasknitt_calls_mount_battle_02",
				"egs_level_skittergate_rasknitt_calls_mount_battle_03",
				"egs_level_skittergate_rasknitt_calls_mount_battle_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_dwarfranger_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_dwarfranger_killed_01",
				"egs_gameplay_dwarfranger_killed_02",
				"egs_gameplay_dwarfranger_killed_03",
				"egs_gameplay_dwarfranger_killed_04",
				"egs_gameplay_dwarfranger_killed_05"
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
				"egs_gameplay_dwarfranger_killed_01",
				"egs_gameplay_dwarfranger_killed_02",
				"egs_gameplay_dwarfranger_killed_03",
				"egs_gameplay_dwarfranger_killed_04",
				"egs_gameplay_dwarfranger_killed_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_get_back_to_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_get_back_to_gate_01",
				"pdr_level_skittergate_get_back_to_gate_02",
				"pdr_level_skittergate_get_back_to_gate_03",
				"pdr_level_skittergate_get_back_to_gate_04"
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
				"pdr_level_skittergate_get_back_to_gate_01",
				"pdr_level_skittergate_get_back_to_gate_02",
				"pdr_level_skittergate_get_back_to_gate_03",
				"pdr_level_skittergate_get_back_to_gate_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_woodelf_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_woodelf_knock_down_01",
				"egs_gameplay_woodelf_knock_down_02",
				"egs_gameplay_woodelf_knock_down_03",
				"egs_gameplay_woodelf_knock_down_04",
				"egs_gameplay_woodelf_knock_down_05"
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
				"egs_gameplay_woodelf_knock_down_01",
				"egs_gameplay_woodelf_knock_down_02",
				"egs_gameplay_woodelf_knock_down_03",
				"egs_gameplay_woodelf_knock_down_04",
				"egs_gameplay_woodelf_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_gameplay_empiresoldier_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_empiresoldier_killed_01",
				"egs_gameplay_empiresoldier_killed_02",
				"egs_gameplay_empiresoldier_killed_03",
				"egs_gameplay_empiresoldier_killed_04",
				"egs_gameplay_empiresoldier_killed_05"
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
				"egs_gameplay_empiresoldier_killed_01",
				"egs_gameplay_empiresoldier_killed_02",
				"egs_gameplay_empiresoldier_killed_03",
				"egs_gameplay_empiresoldier_killed_04",
				"egs_gameplay_empiresoldier_killed_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_ships_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_ships_01",
				"pdr_level_skittergate_ships_02",
				"pdr_level_skittergate_ships_03",
				"pdr_level_skittergate_ships_04"
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
				"pdr_level_skittergate_ships_01",
				"pdr_level_skittergate_ships_02",
				"pdr_level_skittergate_ships_03",
				"pdr_level_skittergate_ships_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_welcome_to_norsca_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_welcome_to_norsca_01",
				"pdr_level_skittergate_welcome_to_norsca_02",
				"pdr_level_skittergate_welcome_to_norsca_03",
				"pdr_level_skittergate_welcome_to_norsca_04"
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
				"pdr_level_skittergate_welcome_to_norsca_01",
				"pdr_level_skittergate_welcome_to_norsca_02",
				"pdr_level_skittergate_welcome_to_norsca_03",
				"pdr_level_skittergate_welcome_to_norsca_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_back_home_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_back_home_01",
				"pdr_level_skittergate_back_home_02",
				"pdr_level_skittergate_back_home_03",
				"pdr_level_skittergate_back_home_04"
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
				"pdr_level_skittergate_back_home_01",
				"pdr_level_skittergate_back_home_02",
				"pdr_level_skittergate_back_home_03",
				"pdr_level_skittergate_back_home_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_dwarfranger_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_dwarfranger_knock_down_01",
				"egs_gameplay_dwarfranger_knock_down_02",
				"egs_gameplay_dwarfranger_knock_down_03",
				"egs_gameplay_dwarfranger_knock_down_04",
				"egs_gameplay_dwarfranger_knock_down_05"
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
				"egs_gameplay_dwarfranger_knock_down_01",
				"egs_gameplay_dwarfranger_knock_down_02",
				"egs_gameplay_dwarfranger_knock_down_03",
				"egs_gameplay_dwarfranger_knock_down_04",
				"egs_gameplay_dwarfranger_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_gameplay_empiresoldier_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_empiresoldier_knock_down_01",
				"egs_gameplay_empiresoldier_knock_down_02",
				"egs_gameplay_empiresoldier_knock_down_03",
				"egs_gameplay_empiresoldier_knock_down_04",
				"egs_gameplay_empiresoldier_knock_down_05"
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
				"egs_gameplay_empiresoldier_knock_down_01",
				"egs_gameplay_empiresoldier_knock_down_02",
				"egs_gameplay_empiresoldier_knock_down_03",
				"egs_gameplay_empiresoldier_knock_down_04",
				"egs_gameplay_empiresoldier_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_on_stormfiend = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_skittergate",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"egs_level_skittergate_rasknitt_on_stormfiend_01",
				"egs_level_skittergate_rasknitt_on_stormfiend_02",
				"egs_level_skittergate_rasknitt_on_stormfiend_03",
				"egs_level_skittergate_rasknitt_on_stormfiend_04",
				"egs_shooting_01",
				"egs_shooting_02",
				"egs_shooting_03",
				"egs_shooting_04"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_rasknitt_on_stormfiend_01",
				"egs_level_skittergate_rasknitt_on_stormfiend_02",
				"egs_level_skittergate_rasknitt_on_stormfiend_03",
				"egs_level_skittergate_rasknitt_on_stormfiend_04",
				"egs_shooting_01",
				"egs_shooting_02",
				"egs_shooting_03",
				"egs_shooting_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_brightwizard_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_brightwizard_knock_down_01",
				"egs_gameplay_brightwizard_knock_down_02",
				"egs_gameplay_brightwizard_knock_down_03",
				"egs_gameplay_brightwizard_knock_down_04",
				"egs_gameplay_brightwizard_knock_down_05"
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
				"egs_gameplay_brightwizard_knock_down_01",
				"egs_gameplay_brightwizard_knock_down_02",
				"egs_gameplay_brightwizard_knock_down_03",
				"egs_gameplay_brightwizard_knock_down_04",
				"egs_gameplay_brightwizard_knock_down_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_enter_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_enter_gate_01",
				"pdr_level_skittergate_enter_gate_02",
				"pdr_level_skittergate_enter_gate_03",
				"pdr_level_skittergate_enter_gate_04"
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
				"pdr_level_skittergate_enter_gate_01",
				"pdr_level_skittergate_enter_gate_02",
				"pdr_level_skittergate_enter_gate_03",
				"pdr_level_skittergate_enter_gate_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_witchhunter_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_witchhunter_knock_down_01",
				"egs_gameplay_witchhunter_knock_down_02",
				"egs_gameplay_witchhunter_knock_down_03",
				"egs_gameplay_witchhunter_knock_down_04",
				"egs_gameplay_witchhunter_knock_down_05"
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
				"egs_gameplay_witchhunter_knock_down_01",
				"egs_gameplay_witchhunter_knock_down_02",
				"egs_gameplay_witchhunter_knock_down_03",
				"egs_gameplay_witchhunter_knock_down_04",
				"egs_gameplay_witchhunter_knock_down_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_gatekeeper_death_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_gatekeeper_death_01",
				"pdr_level_skittergate_gatekeeper_death_02",
				"pdr_level_skittergate_gatekeeper_death_03",
				"pdr_level_skittergate_gatekeeper_death_04"
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
				"pdr_level_skittergate_gatekeeper_death_01",
				"pdr_level_skittergate_gatekeeper_death_02",
				"pdr_level_skittergate_gatekeeper_death_03",
				"pdr_level_skittergate_gatekeeper_death_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_calls_mount = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_calls_mount_01",
				"egs_level_skittergate_rasknitt_calls_mount_02",
				"egs_level_skittergate_rasknitt_calls_mount_03",
				"egs_level_skittergate_rasknitt_calls_mount_04"
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
				"egs_level_skittergate_rasknitt_calls_mount_01",
				"egs_level_skittergate_rasknitt_calls_mount_02",
				"egs_level_skittergate_rasknitt_calls_mount_03",
				"egs_level_skittergate_rasknitt_calls_mount_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_crater_01 = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_level_skittergate_crater_02",
				"pdr_level_skittergate_crater_03",
				"pdr_level_skittergate_crater_04"
			},
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
			randomize_indexes = {}
		},
		pdr_level_skittergate_docks_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_docks_gate_01",
				"pdr_level_skittergate_docks_gate_02",
				"pdr_level_skittergate_docks_gate_03",
				"pdr_level_skittergate_docks_gate_04"
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
				"pdr_level_skittergate_docks_gate_01",
				"pdr_level_skittergate_docks_gate_02",
				"pdr_level_skittergate_docks_gate_03",
				"pdr_level_skittergate_docks_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_skittergate_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_skittergate_intro_c_01",
				[2.0] = "pdr_skittergate_intro_c_02"
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
				[1.0] = "pdr_skittergate_intro_c_01",
				[2.0] = "pdr_skittergate_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_activate_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_activate_gate_01",
				"pdr_level_skittergate_activate_gate_02",
				"pdr_level_skittergate_activate_gate_03",
				"pdr_level_skittergate_activate_gate_04"
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
				"pdr_level_skittergate_activate_gate_01",
				"pdr_level_skittergate_activate_gate_02",
				"pdr_level_skittergate_activate_gate_03",
				"pdr_level_skittergate_activate_gate_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_witchhunter_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_witchhunter_killed_01",
				"egs_gameplay_witchhunter_killed_02",
				"egs_gameplay_witchhunter_killed_03",
				"egs_gameplay_witchhunter_killed_04",
				"egs_gameplay_witchhunter_killed_05"
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
				"egs_gameplay_witchhunter_killed_01",
				"egs_gameplay_witchhunter_killed_02",
				"egs_gameplay_witchhunter_killed_03",
				"egs_gameplay_witchhunter_killed_04",
				"egs_gameplay_witchhunter_killed_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_start_up_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_start_up_gate_01",
				"pdr_level_skittergate_start_up_gate_02",
				"pdr_level_skittergate_start_up_gate_03",
				"pdr_level_skittergate_start_up_gate_04"
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
				"pdr_level_skittergate_start_up_gate_01",
				"pdr_level_skittergate_start_up_gate_02",
				"pdr_level_skittergate_start_up_gate_03",
				"pdr_level_skittergate_start_up_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_vista_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_vista_01",
				"pdr_level_skittergate_vista_02",
				"pdr_level_skittergate_vista_03",
				"pdr_level_skittergate_vista_04"
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
				"pdr_level_skittergate_vista_01",
				"pdr_level_skittergate_vista_02",
				"pdr_level_skittergate_vista_03",
				"pdr_level_skittergate_vista_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_woodelf_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_woodelf_killed_01",
				"egs_gameplay_woodelf_killed_02",
				"egs_gameplay_woodelf_killed_03",
				"egs_gameplay_woodelf_killed_04",
				"egs_gameplay_woodelf_killed_05"
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
				"egs_gameplay_woodelf_killed_01",
				"egs_gameplay_woodelf_killed_02",
				"egs_gameplay_woodelf_killed_03",
				"egs_gameplay_woodelf_killed_04",
				"egs_gameplay_woodelf_killed_05"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_searching_gatekeeper_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_searching_gatekeeper_01",
				"pdr_level_skittergate_searching_gatekeeper_02",
				"pdr_level_skittergate_searching_gatekeeper_03",
				"pdr_level_skittergate_searching_gatekeeper_04"
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
				"pdr_level_skittergate_searching_gatekeeper_01",
				"pdr_level_skittergate_searching_gatekeeper_02",
				"pdr_level_skittergate_searching_gatekeeper_03",
				"pdr_level_skittergate_searching_gatekeeper_04"
			},
			randomize_indexes = {}
		},
		pdr_skittergate_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_skittergate_intro_a_01",
				[2.0] = "pdr_skittergate_intro_a_02"
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
				[1.0] = "pdr_skittergate_intro_a_01",
				[2.0] = "pdr_skittergate_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_spotting_docks_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_spotting_docks_01",
				"pdr_level_skittergate_spotting_docks_02",
				"pdr_level_skittergate_spotting_docks_03",
				"pdr_level_skittergate_spotting_docks_04"
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
				"pdr_level_skittergate_spotting_docks_01",
				"pdr_level_skittergate_spotting_docks_02",
				"pdr_level_skittergate_spotting_docks_03",
				"pdr_level_skittergate_spotting_docks_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_dead_seer_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_dead_seer_01",
				"pdr_level_skittergate_dead_seer_02",
				"pdr_level_skittergate_dead_seer_03",
				"pdr_level_skittergate_dead_seer_04"
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
				"pdr_level_skittergate_dead_seer_01",
				"pdr_level_skittergate_dead_seer_02",
				"pdr_level_skittergate_dead_seer_03",
				"pdr_level_skittergate_dead_seer_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_appears = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_appears_01",
				"egs_level_skittergate_rasknitt_appears_02",
				"egs_level_skittergate_rasknitt_appears_03",
				"egs_level_skittergate_rasknitt_appears_04"
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
				"egs_level_skittergate_rasknitt_appears_01",
				"egs_level_skittergate_rasknitt_appears_02",
				"egs_level_skittergate_rasknitt_appears_03",
				"egs_level_skittergate_rasknitt_appears_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_sabotage_cooling_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_sabotage_cooling_01",
				"pdr_level_skittergate_sabotage_cooling_02",
				"pdr_level_skittergate_sabotage_cooling_03",
				"pdr_level_skittergate_sabotage_cooling_04"
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
				"pdr_level_skittergate_sabotage_cooling_01",
				"pdr_level_skittergate_sabotage_cooling_02",
				"pdr_level_skittergate_sabotage_cooling_03",
				"pdr_level_skittergate_sabotage_cooling_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_tunnel_collapses_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_tunnel_collapses_01",
				"pdr_level_skittergate_tunnel_collapses_02",
				"pdr_level_skittergate_tunnel_collapses_03",
				"pdr_level_skittergate_tunnel_collapses_04"
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
				"pdr_level_skittergate_tunnel_collapses_01",
				"pdr_level_skittergate_tunnel_collapses_02",
				"pdr_level_skittergate_tunnel_collapses_03",
				"pdr_level_skittergate_tunnel_collapses_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_through_the_gate = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_through_the_gate_01",
				"pdr_level_skittergate_through_the_gate_02",
				"pdr_level_skittergate_through_the_gate_03",
				"pdr_level_skittergate_through_the_gate_04"
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
				"pdr_level_skittergate_through_the_gate_01",
				"pdr_level_skittergate_through_the_gate_02",
				"pdr_level_skittergate_through_the_gate_03",
				"pdr_level_skittergate_through_the_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skittergate_elevator_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skittergate",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skittergate_elevator_01",
				"pdr_level_skittergate_elevator_02",
				"pdr_level_skittergate_elevator_03",
				"pdr_level_skittergate_elevator_04"
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
				"pdr_level_skittergate_elevator_01",
				"pdr_level_skittergate_elevator_02",
				"pdr_level_skittergate_elevator_03",
				"pdr_level_skittergate_elevator_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
