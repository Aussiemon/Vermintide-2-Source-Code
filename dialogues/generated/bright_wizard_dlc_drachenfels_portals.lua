return function ()
	define_rule({
		name = "pbw_portals_intro_line_a",
		response = "pbw_portals_intro_line_a",
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
				"portals_intro_line_a"
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
				"portals_intro_line_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_intro_line_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_intro_line_b",
		response = "pbw_portals_intro_line_b",
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
				"portals_intro_line_a"
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
				"portals_intro_line_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_intro_line_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_intro_line_c",
		response = "pbw_portals_intro_line_c",
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
				"portals_intro_line_b"
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
				"portals_intro_line_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_intro_line_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_enter_village",
		response = "pbw_portals_enter_village",
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
				"portals_enter_village"
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
				"portals_enter_village",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_enter_village",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_village_raided",
		response = "pbw_portals_village_raided",
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
				"portals_village_raided "
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
				"portals_village_raided ",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_village_raided ",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_find_survivors",
		response = "pbw_portals_find_survivors",
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
				"portals_find_survivors"
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
				"portals_find_survivors",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_find_survivors",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_everyone_gone",
		response = "pbw_portals_everyone_gone",
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
				"portals_everyone_gone"
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
				"portals_everyone_gone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_everyone_gone",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_raid_trace",
		response = "pbw_portals_raid_trace",
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
				"portals_raid_trace"
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
				"portals_raid_trace",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_raid_trace",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_kidnapped_traces",
		response = "pbw_portals_kidnapped_traces",
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
				"portals_kidnapped_traces"
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
				"portals_kidnapped_traces",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_kidnapped_traces",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_get_to_temple",
		response = "pbw_portals_get_to_temple",
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
				"portals_get_to_temple"
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
				"portals_get_to_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_get_to_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_the_temple",
		response = "pbw_portals_the_temple",
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
				"portals_the_temple"
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
				"portals_the_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_the_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_temple_locked",
		response = "pbw_portals_temple_locked",
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
				"portals_temple_locked"
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
				"portals_temple_locked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_temple_locked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_temple_bell_tower",
		response = "pbw_portals_temple_bell_tower",
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
				"portals_temple_bell_tower"
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
				"portals_temple_bell_tower",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_temple_bell_tower",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_find_map",
		response = "pbw_portals_find_map",
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
				"portals_find_map"
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
				"portals_find_map",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_find_map",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_help_search",
		response = "pbw_portals_help_search",
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
				"portals_help_search"
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
				"portals_help_search",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_help_search",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_the_map",
		response = "pbw_portals_the_map",
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
				"portals_the_map"
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
				"portals_the_map",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_the_map",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_temple_event",
		response = "pbw_portals_temple_event",
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
				"portals_temple_event"
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
				"portals_temple_event",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_temple_event",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_get_out",
		response = "pbw_portals_get_out",
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
				"portals_get_out"
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
				"portals_get_out",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_get_out",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_follow_trail",
		response = "pbw_portals_follow_trail",
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
				"portals_follow_trail"
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
				"portals_follow_trail",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_follow_trail",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_trail_found ",
		response = "pbw_portals_trail_found ",
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
				"portals_trail_found "
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
				"portals_trail_found ",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_trail_found ",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_objective_recap",
		response = "pbw_portals_objective_recap",
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
				"portals_objective_recap"
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
				"portals_objective_recap",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_objective_recap",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_memory_path",
		response = "pbw_portals_memory_path",
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
				"portals_memory_path"
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
				"portals_memory_path",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_memory_path",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_pbw_castle_vista",
		response = "pbw_portals_pbw_castle_vista",
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
				"portals_castle_vista"
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
				"portals_castle_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_castle_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_memory_portals",
		response = "pbw_portals_memory_portals",
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
				"portals_memory_portals"
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
				"portals_memory_path",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_memory_path",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_portal_interact_one",
		response = "pbw_portals_portal_interact_one",
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
				"portals_portal_interact_one"
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
				"portals_portal_interact_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_portal_interact_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_portal_interact_two",
		response = "pbw_portals_portal_interact_two",
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
				"portals_portal_interact_two"
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
				"portals_portal_interact_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_portal_interact_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_portal_interact_three",
		response = "pbw_portals_portal_interact_three",
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
				"portals_portal_interact_three"
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
				"portals_portal_interact_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_portal_interact_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_portal_event",
		response = "pbw_portals_portal_event",
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
				"portals_portal_event"
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
				"portals_portal_event",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_portal_event",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_castle_road",
		response = "pbw_portals_castle_road",
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
				"portals_castle_road"
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
				"portals_castle_road",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_castle_road",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_castle_gate",
		response = "pbw_portals_castle_gate",
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
				"portals_castle_gate"
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
				"portals_castle_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_castle_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_map_first_clue",
		response = "pbw_portals_map_first_clue",
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
				"portals_map_first_clue"
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
				"portals_map_first_clue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_map_first_clue",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_map_second_clue",
		response = "pbw_portals_map_second_clue",
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
				"portals_map_second_clue"
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
				"portals_map_second_clue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_map_second_clue",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_secret_entrance_gate_opens",
		response = "pbw_portals_secret_entrance_gate_opens",
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
				"portals_secret_entrance_gate_opens"
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
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_crypt_event_entering_crypt",
		response = "pbw_portals_crypt_event_entering_crypt",
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
				"portals_crypt_event_entering_crypt"
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
				"portals_crypt_event_entering_crypt",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_crypt_event_entering_crypt",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_crypt_event_blood",
		response = "pbw_portals_crypt_event_blood",
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
				"portals_crypt_event_blood"
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
				"portals_crypt_event_blood",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_crypt_event_blood",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_crypt_event_hole",
		response = "pbw_portals_crypt_event_hole",
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
				"portals_crypt_event_hole"
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
				"portals_crypt_event_hole",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_crypt_event_hole",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_stairs",
		response = "pbw_portals_stairs",
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
				"portals_stairs"
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
				"portals_stairs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_stairs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_crypt_exit",
		response = "pbw_portals_crypt_exit",
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
				"portals_crypt_exit"
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
				"portals_crypt_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_crypt_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_waystone",
		response = "pbw_portals_waystone",
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
				"portals_waystone"
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
				"portals_waystone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_waystone",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_portals_event_missing_gargoyle_heads",
		response = "pbw_portals_event_missing_gargoyle_heads",
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
				"portals_event_missing_gargoyle_heads"
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
				"portals_event_missing_gargoyle_heads",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"portals_event_missing_gargoyle_heads",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_portals_enter_village = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_enter_village_01",
				"pbw_portals_enter_village_02",
				"pbw_portals_enter_village_03",
				"pbw_portals_enter_village_04"
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
				3.7460207939148,
				2.0971040725708,
				3.6499791145325,
				3.493124961853
			},
			localization_strings = {
				"pbw_portals_enter_village_01",
				"pbw_portals_enter_village_02",
				"pbw_portals_enter_village_03",
				"pbw_portals_enter_village_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_portal_interact_three = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_portal_interact_three_01",
				"pbw_portals_portal_interact_three_02",
				"pbw_portals_portal_interact_three_03",
				"pbw_portals_portal_interact_three_04"
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
				3.4343333244324,
				4.6172709465027,
				2.943437576294,
				3.3148541450501
			},
			localization_strings = {
				"pbw_portals_portal_interact_three_01",
				"pbw_portals_portal_interact_three_02",
				"pbw_portals_portal_interact_three_03",
				"pbw_portals_portal_interact_three_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_intro_line_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_portals_intro_line_b_01",
				[2.0] = "pbw_portals_intro_line_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.87089586257935,
				[2.0] = 1.3114374876022
			},
			localization_strings = {
				[1.0] = "pbw_portals_intro_line_b_01",
				[2.0] = "pbw_portals_intro_line_b_02"
			},
			randomize_indexes = {}
		},
		pbw_portals_crypt_event_entering_crypt = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_crypt_event_entering_crypt_01",
				"pbw_portals_crypt_event_entering_crypt_02",
				"pbw_portals_crypt_event_entering_crypt_03",
				"pbw_portals_crypt_event_entering_crypt_04"
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
				2.7709999084473,
				2.8007917404175,
				3.9145834445953,
				2.5874791145325
			},
			localization_strings = {
				"pbw_portals_crypt_event_entering_crypt_01",
				"pbw_portals_crypt_event_entering_crypt_02",
				"pbw_portals_crypt_event_entering_crypt_03",
				"pbw_portals_crypt_event_entering_crypt_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_raid_trace = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_raid_trace_01",
				"pbw_portals_raid_trace_02",
				"pbw_portals_raid_trace_03",
				"pbw_portals_raid_trace_04"
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
				2.3053123950958,
				4.7272915840149,
				4.5714998245239,
				3.2814791202545
			},
			localization_strings = {
				"pbw_portals_raid_trace_01",
				"pbw_portals_raid_trace_02",
				"pbw_portals_raid_trace_03",
				"pbw_portals_raid_trace_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_memory_path = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_memory_path_01",
				"pbw_portals_memory_path_02",
				"pbw_portals_memory_path_03",
				"pbw_portals_memory_path_04"
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
				2.1421875953674,
				2.6837291717529,
				3.0516250133514,
				3.7053959369659
			},
			localization_strings = {
				"pbw_portals_memory_path_01",
				"pbw_portals_memory_path_02",
				"pbw_portals_memory_path_03",
				"pbw_portals_memory_path_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_help_search = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_help_search_01",
				"pbw_portals_help_search_02",
				"pbw_portals_help_search_03",
				"pbw_portals_help_search_04"
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
				2.0911250114441,
				2.092437505722,
				3.5943541526794,
				1.9420000314713
			},
			localization_strings = {
				"pbw_portals_help_search_01",
				"pbw_portals_help_search_02",
				"pbw_portals_help_search_03",
				"pbw_portals_help_search_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_get_to_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_get_to_temple_01",
				"pbw_portals_get_to_temple_02",
				"pbw_portals_get_to_temple_03",
				"pbw_portals_get_to_temple_04"
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
				3.1009166240692,
				2.4956457614899,
				4.161208152771,
				4.3693542480469
			},
			localization_strings = {
				"pbw_portals_get_to_temple_01",
				"pbw_portals_get_to_temple_02",
				"pbw_portals_get_to_temple_03",
				"pbw_portals_get_to_temple_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_map_first_clue = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_map_first_clue_01",
				"pbw_portals_map_first_clue_02",
				"pbw_portals_map_first_clue_03",
				"pbw_portals_map_first_clue_04"
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
				3.2333126068115,
				2.1980834007263,
				3.3917915821075,
				4.9581456184387
			},
			localization_strings = {
				"pbw_portals_map_first_clue_01",
				"pbw_portals_map_first_clue_02",
				"pbw_portals_map_first_clue_03",
				"pbw_portals_map_first_clue_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_crypt_event_hole = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_crypt_event_hole_01",
				"pbw_portals_crypt_event_hole_02",
				"pbw_portals_crypt_event_hole_03",
				"pbw_portals_crypt_event_hole_04"
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
				1.8911875486374,
				2.8775000572205,
				1.4428333044052,
				2.8237500190735
			},
			localization_strings = {
				"pbw_portals_crypt_event_hole_01",
				"pbw_portals_crypt_event_hole_02",
				"pbw_portals_crypt_event_hole_03",
				"pbw_portals_crypt_event_hole_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_intro_line_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_portals_intro_line_c_01",
				[2.0] = "pbw_portals_intro_line_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.6593332290649,
				[2.0] = 3.532562494278
			},
			localization_strings = {
				[1.0] = "pbw_portals_intro_line_c_01",
				[2.0] = "pbw_portals_intro_line_c_02"
			},
			randomize_indexes = {}
		},
		pbw_portals_get_out = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_get_out_01",
				"pbw_portals_get_out_02",
				"pbw_portals_get_out_03",
				"pbw_portals_get_out_04"
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
				1.6350417137146,
				2.9886875152588,
				3.2802708148956,
				2.6005625724792
			},
			localization_strings = {
				"pbw_portals_get_out_01",
				"pbw_portals_get_out_02",
				"pbw_portals_get_out_03",
				"pbw_portals_get_out_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_secret_entrance_gate_opens = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_secret_entrance_gate_opens_01",
				"pbw_portals_secret_entrance_gate_opens_02",
				"pbw_portals_secret_entrance_gate_opens_03",
				"pbw_portals_secret_entrance_gate_opens_04"
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
				2.5954375267029,
				3.1587083339691,
				3.9019999504089,
				3.3213748931885
			},
			localization_strings = {
				"pbw_portals_secret_entrance_gate_opens_01",
				"pbw_portals_secret_entrance_gate_opens_02",
				"pbw_portals_secret_entrance_gate_opens_03",
				"pbw_portals_secret_entrance_gate_opens_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_crypt_exit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_crypt_exit_01",
				"pbw_portals_crypt_exit_02",
				"pbw_portals_crypt_exit_03",
				"pbw_portals_crypt_exit_04"
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
				2.7468750476837,
				1.7144583463669,
				3.2083957195282,
				3.1726875305176
			},
			localization_strings = {
				"pbw_portals_crypt_exit_01",
				"pbw_portals_crypt_exit_02",
				"pbw_portals_crypt_exit_03",
				"pbw_portals_crypt_exit_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_temple_bell_tower = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_temple_bell_tower_01",
				"pbw_portals_temple_bell_tower_02",
				"pbw_portals_temple_bell_tower_03",
				"pbw_portals_temple_bell_tower_04"
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
				1.1682292222977,
				1.2477083206177,
				2.4817292690277,
				1.8798749446869
			},
			localization_strings = {
				"pbw_portals_temple_bell_tower_01",
				"pbw_portals_temple_bell_tower_02",
				"pbw_portals_temple_bell_tower_03",
				"pbw_portals_temple_bell_tower_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_temple_locked = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_temple_locked_01",
				"pbw_portals_temple_locked_02",
				"pbw_portals_temple_locked_03",
				"pbw_portals_temple_locked_04"
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
				2.3232707977295,
				2.8351459503174,
				3.1303334236145,
				2.1192500591278
			},
			localization_strings = {
				"pbw_portals_temple_locked_01",
				"pbw_portals_temple_locked_02",
				"pbw_portals_temple_locked_03",
				"pbw_portals_temple_locked_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_castle_gate = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_pbw_castle_gate_01",
				"pbw_portals_pbw_castle_gate_02",
				"pbw_portals_pbw_castle_gate_03",
				"pbw_portals_pbw_castle_gate_04"
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
				3.4427292346954,
				4.7234373092651,
				3.6768333911896,
				2.9187083244324
			},
			localization_strings = {
				"pbw_portals_pbw_castle_gate_01",
				"pbw_portals_pbw_castle_gate_02",
				"pbw_portals_pbw_castle_gate_03",
				"pbw_portals_pbw_castle_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_portal_interact_one = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_portal_interact_one_01",
				"pbw_portals_portal_interact_one_02",
				"pbw_portals_portal_interact_one_03",
				"pbw_portals_portal_interact_one_04"
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
				0.98362499475479,
				3.372270822525,
				1.8647083044052,
				2.9401249885559
			},
			localization_strings = {
				"pbw_portals_portal_interact_one_01",
				"pbw_portals_portal_interact_one_02",
				"pbw_portals_portal_interact_one_03",
				"pbw_portals_portal_interact_one_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_portal_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_portal_event_01",
				"pbw_portals_portal_event_02",
				"pbw_portals_portal_event_03",
				"pbw_portals_portal_event_04"
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
				1.658499956131,
				1.8424999713898,
				2.0953750610352,
				2.5225417613983
			},
			localization_strings = {
				"pbw_portals_portal_event_01",
				"pbw_portals_portal_event_02",
				"pbw_portals_portal_event_03",
				"pbw_portals_portal_event_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_stairs = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_stairs_01",
				"pbw_portals_stairs_02",
				"pbw_portals_stairs_03",
				"pbw_portals_stairs_04"
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
				5.7001667022705,
				4.4888124465942,
				3.7477083206177,
				6.0510625839233
			},
			localization_strings = {
				"pbw_portals_stairs_01",
				"pbw_portals_stairs_02",
				"pbw_portals_stairs_03",
				"pbw_portals_stairs_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_waystone_01",
				"pbw_portals_waystone_02",
				"pbw_portals_waystone_03",
				"pbw_portals_waystone_04"
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
				4.4178957939148,
				2.5936458110809,
				5.0320415496826,
				4.8370623588562
			},
			localization_strings = {
				"pbw_portals_waystone_01",
				"pbw_portals_waystone_02",
				"pbw_portals_waystone_03",
				"pbw_portals_waystone_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_intro_line_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_portals_intro_line_a_01",
				[2.0] = "pbw_portals_intro_line_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4621665477753,
				[2.0] = 3.1718957424164
			},
			localization_strings = {
				[1.0] = "pbw_portals_intro_line_a_01",
				[2.0] = "pbw_portals_intro_line_a_02"
			},
			randomize_indexes = {}
		},
		pbw_portals_event_missing_gargoyle_heads = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_event_missing_gargoyle_heads_01",
				"pbw_portals_event_missing_gargoyle_heads_02",
				"pbw_portals_event_missing_gargoyle_heads_03",
				"pbw_portals_event_missing_gargoyle_heads_04"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pbw_portals_event_missing_gargoyle_heads_01",
				"pbw_portals_event_missing_gargoyle_heads_02",
				"pbw_portals_event_missing_gargoyle_heads_03",
				"pbw_portals_event_missing_gargoyle_heads_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_portal_interact_two = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_portal_interact_two_01",
				"pbw_portals_portal_interact_two_02",
				"pbw_portals_portal_interact_two_03",
				"pbw_portals_portal_interact_two_04"
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
				1.126833319664,
				0.66716665029526,
				2.2947916984558,
				4.3304166793823
			},
			localization_strings = {
				"pbw_portals_portal_interact_two_01",
				"pbw_portals_portal_interact_two_02",
				"pbw_portals_portal_interact_two_03",
				"pbw_portals_portal_interact_two_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_temple_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_temple_event_01",
				"pbw_portals_temple_event_02",
				"pbw_portals_temple_event_03",
				"pbw_portals_temple_event_04"
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
				3.6408541202545,
				3.3572292327881,
				2.9662292003632,
				3.4310417175293
			},
			localization_strings = {
				"pbw_portals_temple_event_01",
				"pbw_portals_temple_event_02",
				"pbw_portals_temple_event_03",
				"pbw_portals_temple_event_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_everyone_gone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_everyone_gone_01",
				"pbw_portals_everyone_gone_02",
				"pbw_portals_everyone_gone_03",
				"pbw_portals_everyone_gone_04"
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
				2.4527082443237,
				2.5679583549499,
				4.5967082977295,
				4.930624961853
			},
			localization_strings = {
				"pbw_portals_everyone_gone_01",
				"pbw_portals_everyone_gone_02",
				"pbw_portals_everyone_gone_03",
				"pbw_portals_everyone_gone_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_kidnapped_traces = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_kidnapped_traces_01",
				"pbw_portals_kidnapped_traces_02",
				"pbw_portals_kidnapped_traces_03",
				"pbw_portals_kidnapped_traces_04"
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
				2.5605208873749,
				4.165500164032,
				4.1310415267944,
				2.4577083587647
			},
			localization_strings = {
				"pbw_portals_kidnapped_traces_01",
				"pbw_portals_kidnapped_traces_02",
				"pbw_portals_kidnapped_traces_03",
				"pbw_portals_kidnapped_traces_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_crypt_event_blood = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_crypt_event_blood_01",
				"pbw_portals_crypt_event_blood_02",
				"pbw_portals_crypt_event_blood_03",
				"pbw_portals_crypt_event_blood_04"
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
				1.5199583768845,
				2.9321041107178,
				3.3226249217987,
				5.2336459159851
			},
			localization_strings = {
				"pbw_portals_crypt_event_blood_01",
				"pbw_portals_crypt_event_blood_02",
				"pbw_portals_crypt_event_blood_03",
				"pbw_portals_crypt_event_blood_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_follow_trail = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_follow_trail_01",
				"pbw_portals_follow_trail_02",
				"pbw_portals_follow_trail_03",
				"pbw_portals_follow_trail_04"
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
				1.9084583520889,
				3.520250082016,
				1.8062291145325,
				3.2300624847412
			},
			localization_strings = {
				"pbw_portals_follow_trail_01",
				"pbw_portals_follow_trail_02",
				"pbw_portals_follow_trail_03",
				"pbw_portals_follow_trail_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_map_second_clue = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_map_second_clue_01",
				"pbw_portals_map_second_clue_02",
				"pbw_portals_map_second_clue_03",
				"pbw_portals_map_second_clue_04"
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
				2.5974373817444,
				2.9932708740234,
				2.9374792575836,
				1.8214999437332
			},
			localization_strings = {
				"pbw_portals_map_second_clue_01",
				"pbw_portals_map_second_clue_02",
				"pbw_portals_map_second_clue_03",
				"pbw_portals_map_second_clue_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_find_survivors = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_find_survivors_01",
				"pbw_portals_find_survivors_02",
				"pbw_portals_find_survivors_03",
				"pbw_portals_find_survivors_04"
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
				2.6980624198914,
				1.8010417222977,
				2.1922707557678,
				1.8293541669846
			},
			localization_strings = {
				"pbw_portals_find_survivors_01",
				"pbw_portals_find_survivors_02",
				"pbw_portals_find_survivors_03",
				"pbw_portals_find_survivors_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_castle_road = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_pbw_castle_road_01",
				"pbw_portals_pbw_castle_road_02",
				"pbw_portals_pbw_castle_road_03",
				"pbw_portals_pbw_castle_road_04"
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
				2.34375,
				2.3078124523163,
				2.8592083454132,
				2.4117708206177
			},
			localization_strings = {
				"pbw_portals_pbw_castle_road_01",
				"pbw_portals_pbw_castle_road_02",
				"pbw_portals_pbw_castle_road_03",
				"pbw_portals_pbw_castle_road_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_village_raided = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_village_raided_01",
				"pbw_portals_village_raided_02",
				"pbw_portals_village_raided_03",
				"pbw_portals_village_raided_04"
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
				5.4182500839233,
				3.6536457538605,
				2.6304790973663,
				4.0040626525879
			},
			localization_strings = {
				"pbw_portals_village_raided_01",
				"pbw_portals_village_raided_02",
				"pbw_portals_village_raided_03",
				"pbw_portals_village_raided_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_the_map = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_the_map_01",
				"pbw_portals_the_map_02",
				"pbw_portals_the_map_03",
				"pbw_portals_the_map_04"
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
				2.3458750247955,
				3.4149582386017,
				1.8581875562668,
				1.726145863533
			},
			localization_strings = {
				"pbw_portals_the_map_01",
				"pbw_portals_the_map_02",
				"pbw_portals_the_map_03",
				"pbw_portals_the_map_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_memory_portals = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_memory_portals_01",
				"pbw_portals_memory_portals_02",
				"pbw_portals_memory_portals_03",
				"pbw_portals_memory_portals_04"
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
				3.1365833282471,
				3.2694582939148,
				4.789041519165,
				2.9895625114441
			},
			localization_strings = {
				"pbw_portals_memory_portals_01",
				"pbw_portals_memory_portals_02",
				"pbw_portals_memory_portals_03",
				"pbw_portals_memory_portals_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_find_map = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_find_map_01",
				"pbw_portals_find_map_02",
				"pbw_portals_find_map_03",
				"pbw_portals_find_map_04"
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
				2.6698541641235,
				1.7009166479111,
				1.5387083292007,
				1.4542499780655
			},
			localization_strings = {
				"pbw_portals_find_map_01",
				"pbw_portals_find_map_02",
				"pbw_portals_find_map_03",
				"pbw_portals_find_map_04"
			},
			randomize_indexes = {}
		},
		["pbw_portals_trail_found "] = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_trail_found_01",
				"pbw_portals_trail_found_02",
				"pbw_portals_trail_found_03",
				"pbw_portals_trail_found_04"
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
				1.0589166879654,
				1.7266875505447,
				1.4307291507721,
				1.7774583101273
			},
			localization_strings = {
				"pbw_portals_trail_found_01",
				"pbw_portals_trail_found_02",
				"pbw_portals_trail_found_03",
				"pbw_portals_trail_found_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_pbw_castle_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_pbw_castle_vista_01",
				"pbw_portals_pbw_castle_vista_02",
				"pbw_portals_pbw_castle_vista_03",
				"pbw_portals_pbw_castle_vista_04"
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
				4.6121459007263,
				4.3052082061768,
				6.2826251983643,
				5.7022290229797
			},
			localization_strings = {
				"pbw_portals_pbw_castle_vista_01",
				"pbw_portals_pbw_castle_vista_02",
				"pbw_portals_pbw_castle_vista_03",
				"pbw_portals_pbw_castle_vista_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_the_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_the_temple_01",
				"pbw_portals_the_temple_02",
				"pbw_portals_the_temple_03",
				"pbw_portals_the_temple_04"
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
				1.2518750429153,
				3.191645860672,
				2.3513541221619,
				3.3843333721161
			},
			localization_strings = {
				"pbw_portals_the_temple_01",
				"pbw_portals_the_temple_02",
				"pbw_portals_the_temple_03",
				"pbw_portals_the_temple_04"
			},
			randomize_indexes = {}
		},
		pbw_portals_objective_recap = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_objective_recap_01",
				"pbw_portals_objective_recap_02",
				"pbw_portals_objective_recap_03",
				"pbw_portals_objective_recap_04"
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
				3.5480000972748,
				3.9051666259766,
				3.6802084445953,
				5.2584166526794
			},
			localization_strings = {
				"pbw_portals_objective_recap_01",
				"pbw_portals_objective_recap_02",
				"pbw_portals_objective_recap_03",
				"pbw_portals_objective_recap_04"
			},
			randomize_indexes = {}
		}
	})
end
