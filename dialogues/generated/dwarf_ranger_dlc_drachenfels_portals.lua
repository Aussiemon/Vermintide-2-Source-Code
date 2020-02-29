return function ()
	define_rule({
		name = "pdr_portals_intro_line_a",
		response = "pdr_portals_intro_line_a",
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
		name = "pdr_portals_intro_line_b",
		response = "pdr_portals_intro_line_b",
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
		name = "pdr_portals_intro_line_c",
		response = "pdr_portals_intro_line_c",
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
		name = "pdr_portals_enter_village",
		response = "pdr_portals_enter_village",
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
		name = "pdr_portals_village_raided",
		response = "pdr_portals_village_raided",
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
		name = "pdr_portals_find_survivors",
		response = "pdr_portals_find_survivors",
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
		name = "pdr_portals_everyone_gone",
		response = "pdr_portals_everyone_gone",
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
		name = "pdr_portals_raid_trace",
		response = "pdr_portals_raid_trace",
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
		name = "pdr_portals_kidnapped_traces",
		response = "pdr_portals_kidnapped_traces",
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
		name = "pdr_portals_get_to_temple",
		response = "pdr_portals_get_to_temple",
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
		name = "pdr_portals_the_temple",
		response = "pdr_portals_the_temple",
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
		name = "pdr_portals_temple_locked",
		response = "pdr_portals_temple_locked",
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
		name = "pdr_portals_temple_bell_tower",
		response = "pdr_portals_temple_bell_tower",
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
		name = "pdr_portals_find_map",
		response = "pdr_portals_find_map",
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
		name = "pdr_portals_help_search",
		response = "pdr_portals_help_search",
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
		name = "pdr_portals_the_map",
		response = "pdr_portals_the_map",
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
		name = "pdr_portals_temple_event",
		response = "pdr_portals_temple_event",
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
		name = "pdr_portals_get_out",
		response = "pdr_portals_get_out",
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
		name = "pdr_portals_follow_trail",
		response = "pdr_portals_follow_trail",
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
		name = "pdr_portals_trail_found ",
		response = "pdr_portals_trail_found ",
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
		name = "pdr_portals_objective_recap",
		response = "pdr_portals_objective_recap",
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
		name = "pdr_portals_memory_path",
		response = "pdr_portals_memory_path",
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
		name = "pdr_portals_pdr_castle_vista",
		response = "pdr_portals_pdr_castle_vista",
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
		name = "pdr_portals_memory_portals",
		response = "pdr_portals_memory_portals",
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
		name = "pdr_portals_portal_interact_one",
		response = "pdr_portals_portal_interact_one",
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
		name = "pdr_portals_portal_interact_two",
		response = "pdr_portals_portal_interact_two",
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
		name = "pdr_portals_portal_interact_three",
		response = "pdr_portals_portal_interact_three",
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
		name = "pdr_portals_portal_event",
		response = "pdr_portals_portal_event",
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
		name = "pdr_portals_castle_road",
		response = "pdr_portals_castle_road",
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
		name = "pdr_portals_castle_gate",
		response = "pdr_portals_castle_gate",
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
		name = "pdr_portals_map_first_clue",
		response = "pdr_portals_map_first_clue",
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
		name = "pdr_portals_map_second_clue",
		response = "pdr_portals_map_second_clue",
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
		name = "pdr_portals_secret_entrance_gate_opens",
		response = "pdr_portals_secret_entrance_gate_opens",
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
		name = "pdr_portals_crypt_event_entering_crypt",
		response = "pdr_portals_crypt_event_entering_crypt",
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
		name = "pdr_portals_crypt_event_blood",
		response = "pdr_portals_crypt_event_blood",
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
		name = "pdr_portals_crypt_event_hole",
		response = "pdr_portals_crypt_event_hole",
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
		name = "pdr_portals_stairs",
		response = "pdr_portals_stairs",
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
		name = "pdr_portals_crypt_exit",
		response = "pdr_portals_crypt_exit",
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
		name = "pdr_portals_waystone",
		response = "pdr_portals_waystone",
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
		name = "pdr_portals_event_missing_gargoyle_heads",
		response = "pdr_portals_event_missing_gargoyle_heads",
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
		pdr_portals_temple_bell_tower = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_temple_bell_tower_01",
				"pdr_portals_temple_bell_tower_02",
				"pdr_portals_temple_bell_tower_03",
				"pdr_portals_temple_bell_tower_04"
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
				2.373125076294,
				2.2153542041779,
				2.2984375953674,
				2.5051667690277
			},
			localization_strings = {
				"pdr_portals_temple_bell_tower_01",
				"pdr_portals_temple_bell_tower_02",
				"pdr_portals_temple_bell_tower_03",
				"pdr_portals_temple_bell_tower_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_crypt_event_entering_crypt = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_crypt_event_entering_crypt_01",
				"pdr_portals_crypt_event_entering_crypt_02",
				"pdr_portals_crypt_event_entering_crypt_03",
				"pdr_portals_crypt_event_entering_crypt_04"
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
				3.801854133606,
				2.8164999485016,
				3.6594998836517,
				3.282666683197
			},
			localization_strings = {
				"pdr_portals_crypt_event_entering_crypt_01",
				"pdr_portals_crypt_event_entering_crypt_02",
				"pdr_portals_crypt_event_entering_crypt_03",
				"pdr_portals_crypt_event_entering_crypt_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_memory_portals = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_memory_portals_01",
				"pdr_portals_memory_portals_02",
				"pdr_portals_memory_portals_03",
				"pdr_portals_memory_portals_04"
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
				1.9373333454132,
				4.2992916107178,
				3.7203540802002,
				3.7742500305176
			},
			localization_strings = {
				"pdr_portals_memory_portals_01",
				"pdr_portals_memory_portals_02",
				"pdr_portals_memory_portals_03",
				"pdr_portals_memory_portals_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_crypt_event_blood = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_crypt_event_blood_01",
				"pdr_portals_crypt_event_blood_02",
				"pdr_portals_crypt_event_blood_03",
				"pdr_portals_crypt_event_blood_04"
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
				2.5176665782928,
				2.597895860672,
				3.9730625152588,
				4.3146667480469
			},
			localization_strings = {
				"pdr_portals_crypt_event_blood_01",
				"pdr_portals_crypt_event_blood_02",
				"pdr_portals_crypt_event_blood_03",
				"pdr_portals_crypt_event_blood_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_find_map = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_find_map_01",
				"pdr_portals_find_map_02",
				"pdr_portals_find_map_03",
				"pdr_portals_find_map_04"
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
				1.8728749752045,
				1.8596458435059,
				1.5075207948685,
				2.1322083473206
			},
			localization_strings = {
				"pdr_portals_find_map_01",
				"pdr_portals_find_map_02",
				"pdr_portals_find_map_03",
				"pdr_portals_find_map_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_raid_trace = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_raid_trace_01",
				"pdr_portals_raid_trace_02",
				"pdr_portals_raid_trace_03",
				"pdr_portals_raid_trace_04"
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
				3.2924582958221,
				4.3683958053589,
				5.048770904541,
				2.8352708816528
			},
			localization_strings = {
				"pdr_portals_raid_trace_01",
				"pdr_portals_raid_trace_02",
				"pdr_portals_raid_trace_03",
				"pdr_portals_raid_trace_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_temple_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_temple_event_01",
				"pdr_portals_temple_event_02",
				"pdr_portals_temple_event_03",
				"pdr_portals_temple_event_04"
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
				3.4652707576752,
				4.3851251602173,
				3.4265208244324,
				4.0008749961853
			},
			localization_strings = {
				"pdr_portals_temple_event_01",
				"pdr_portals_temple_event_02",
				"pdr_portals_temple_event_03",
				"pdr_portals_temple_event_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_temple_locked = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_temple_locked_01",
				"pdr_portals_temple_locked_02",
				"pdr_portals_temple_locked_03",
				"pdr_portals_temple_locked_04"
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
				1.3803750276566,
				3.2601873874664,
				4.5154166221619,
				2.520604133606
			},
			localization_strings = {
				"pdr_portals_temple_locked_01",
				"pdr_portals_temple_locked_02",
				"pdr_portals_temple_locked_03",
				"pdr_portals_temple_locked_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_event_missing_gargoyle_heads = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_event_missing_gargoyle_heads_01",
				"pdr_portals_event_missing_gargoyle_heads_02",
				"pdr_portals_event_missing_gargoyle_heads_03",
				"pdr_portals_event_missing_gargoyle_heads_04"
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
				3.1395416259766,
				3.8555624485016,
				4.5760626792908,
				2.1306250095367
			},
			localization_strings = {
				"pdr_portals_event_missing_gargoyle_heads_01",
				"pdr_portals_event_missing_gargoyle_heads_02",
				"pdr_portals_event_missing_gargoyle_heads_03",
				"pdr_portals_event_missing_gargoyle_heads_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_objective_recap = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_objective_recap_01",
				"pdr_portals_objective_recap_02",
				"pdr_portals_objective_recap_03",
				"pdr_portals_objective_recap_04"
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
				3.164520740509,
				3.7482707500458,
				7.2048335075378,
				5.369083404541
			},
			localization_strings = {
				"pdr_portals_objective_recap_01",
				"pdr_portals_objective_recap_02",
				"pdr_portals_objective_recap_03",
				"pdr_portals_objective_recap_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_memory_path = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_memory_path_01",
				"pdr_portals_memory_path_02",
				"pdr_portals_memory_path_03",
				"pdr_portals_memory_path_04"
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
				1.9520208835602,
				5.8859376907349,
				3.9595625400543,
				3.8618540763855
			},
			localization_strings = {
				"pdr_portals_memory_path_01",
				"pdr_portals_memory_path_02",
				"pdr_portals_memory_path_03",
				"pdr_portals_memory_path_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_get_out = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_get_out_01",
				"pdr_portals_get_out_02",
				"pdr_portals_get_out_03",
				"pdr_portals_get_out_04"
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
				2.2926249504089,
				2.2681875228882,
				3.021541595459,
				2.723249912262
			},
			localization_strings = {
				"pdr_portals_get_out_01",
				"pdr_portals_get_out_02",
				"pdr_portals_get_out_03",
				"pdr_portals_get_out_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_secret_entrance_gate_opens = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_secret_entrance_gate_opens_01",
				"pdr_portals_secret_entrance_gate_opens_02",
				"pdr_portals_secret_entrance_gate_opens_03",
				"pdr_portals_secret_entrance_gate_opens_04"
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
				2.5504167079926,
				2.970541715622,
				2.6088125705719,
				3.4367709159851
			},
			localization_strings = {
				"pdr_portals_secret_entrance_gate_opens_01",
				"pdr_portals_secret_entrance_gate_opens_02",
				"pdr_portals_secret_entrance_gate_opens_03",
				"pdr_portals_secret_entrance_gate_opens_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_portal_interact_one = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_portal_interact_one_01",
				"pdr_portals_portal_interact_one_02",
				"pdr_portals_portal_interact_one_03",
				"pdr_portals_portal_interact_one_04"
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
				1.8881875276566,
				1.7003124952316,
				1.9408333301544,
				2.0270624160767
			},
			localization_strings = {
				"pdr_portals_portal_interact_one_01",
				"pdr_portals_portal_interact_one_02",
				"pdr_portals_portal_interact_one_03",
				"pdr_portals_portal_interact_one_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_the_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_the_temple_01",
				"pdr_portals_the_temple_02",
				"pdr_portals_the_temple_03",
				"pdr_portals_the_temple_04"
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
				1.9982916116715,
				1.2698541879654,
				2.107500076294,
				1.6979374885559
			},
			localization_strings = {
				"pdr_portals_the_temple_01",
				"pdr_portals_the_temple_02",
				"pdr_portals_the_temple_03",
				"pdr_portals_the_temple_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_the_map = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_the_map_01",
				"pdr_portals_the_map_02",
				"pdr_portals_the_map_03",
				"pdr_portals_the_map_04"
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
				1.7609791755676,
				3.0936040878296,
				3.5689792633057,
				5.0584373474121
			},
			localization_strings = {
				"pdr_portals_the_map_01",
				"pdr_portals_the_map_02",
				"pdr_portals_the_map_03",
				"pdr_portals_the_map_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_intro_line_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_portals_intro_line_a_01",
				[2.0] = "pdr_portals_intro_line_a_02"
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
				[1.0] = 4.2832918167114,
				[2.0] = 4.1354374885559
			},
			localization_strings = {
				[1.0] = "pdr_portals_intro_line_a_01",
				[2.0] = "pdr_portals_intro_line_a_02"
			},
			randomize_indexes = {}
		},
		pdr_portals_portal_interact_two = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_portal_interact_two_01",
				"pdr_portals_portal_interact_two_02",
				"pdr_portals_portal_interact_two_03",
				"pdr_portals_portal_interact_two_04"
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
				2.3622708320618,
				2.7994167804718,
				3.2282083034515,
				2.288583278656
			},
			localization_strings = {
				"pdr_portals_portal_interact_two_01",
				"pdr_portals_portal_interact_two_02",
				"pdr_portals_portal_interact_two_03",
				"pdr_portals_portal_interact_two_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_kidnapped_traces = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_kidnapped_traces_01",
				"pdr_portals_kidnapped_traces_02",
				"pdr_portals_kidnapped_traces_03",
				"pdr_portals_kidnapped_traces_04"
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
				5.1509790420532,
				3.4852499961853,
				3.5635209083557,
				5.9269375801086
			},
			localization_strings = {
				"pdr_portals_kidnapped_traces_01",
				"pdr_portals_kidnapped_traces_02",
				"pdr_portals_kidnapped_traces_03",
				"pdr_portals_kidnapped_traces_04"
			},
			randomize_indexes = {}
		},
		["pdr_portals_trail_found "] = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_trail_found_01",
				"pdr_portals_trail_found_02",
				"pdr_portals_trail_found_03",
				"pdr_portals_trail_found_04"
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
				2.2002084255219,
				2.2051875591278,
				5.1897082328796,
				3.9325625896454
			},
			localization_strings = {
				"pdr_portals_trail_found_01",
				"pdr_portals_trail_found_02",
				"pdr_portals_trail_found_03",
				"pdr_portals_trail_found_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_intro_line_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_portals_intro_line_c_01",
				[2.0] = "pdr_portals_intro_line_c_02"
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
				[1.0] = 5.1424374580383,
				[2.0] = 6.4237499237061
			},
			localization_strings = {
				[1.0] = "pdr_portals_intro_line_c_01",
				[2.0] = "pdr_portals_intro_line_c_02"
			},
			randomize_indexes = {}
		},
		pdr_portals_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_waystone_01",
				"pdr_portals_waystone_02",
				"pdr_portals_waystone_03",
				"pdr_portals_waystone_04"
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
				2.194854259491,
				3.5263125896454,
				4.2331876754761,
				5.9562706947327
			},
			localization_strings = {
				"pdr_portals_waystone_01",
				"pdr_portals_waystone_02",
				"pdr_portals_waystone_03",
				"pdr_portals_waystone_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_everyone_gone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_everyone_gone_01",
				"pdr_portals_everyone_gone_02",
				"pdr_portals_everyone_gone_03",
				"pdr_portals_everyone_gone_04"
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
				4.599645614624,
				2.0298750400543,
				3.2122292518616,
				4.0136876106262
			},
			localization_strings = {
				"pdr_portals_everyone_gone_01",
				"pdr_portals_everyone_gone_02",
				"pdr_portals_everyone_gone_03",
				"pdr_portals_everyone_gone_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_pdr_castle_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_pdr_castle_vista_01",
				"pdr_portals_pdr_castle_vista_02",
				"pdr_portals_pdr_castle_vista_03",
				"pdr_portals_pdr_castle_vista_04"
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
				3.8941042423248,
				8.1136665344238,
				4.5717082023621,
				6.9002499580383
			},
			localization_strings = {
				"pdr_portals_pdr_castle_vista_01",
				"pdr_portals_pdr_castle_vista_02",
				"pdr_portals_pdr_castle_vista_03",
				"pdr_portals_pdr_castle_vista_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_map_second_clue = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_map_second_clue_01",
				"pdr_portals_map_second_clue_02",
				"pdr_portals_map_second_clue_03",
				"pdr_portals_map_second_clue_04"
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
				4.1407918930054,
				3.938916683197,
				7.1688542366028,
				4.4988751411438
			},
			localization_strings = {
				"pdr_portals_map_second_clue_01",
				"pdr_portals_map_second_clue_02",
				"pdr_portals_map_second_clue_03",
				"pdr_portals_map_second_clue_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_stairs = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_stairs_01",
				"pdr_portals_stairs_02",
				"pdr_portals_stairs_03",
				"pdr_portals_stairs_04"
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
				2.6765415668488,
				3.2164165973663,
				2.0672917366028,
				2.1892499923706
			},
			localization_strings = {
				"pdr_portals_stairs_01",
				"pdr_portals_stairs_02",
				"pdr_portals_stairs_03",
				"pdr_portals_stairs_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_crypt_exit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_crypt_exit_01",
				"pdr_portals_crypt_exit_02",
				"pdr_portals_crypt_exit_03",
				"pdr_portals_crypt_exit_04"
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
				1.3857916593552,
				4.701208114624,
				3.5011458396912,
				2.9575417041779
			},
			localization_strings = {
				"pdr_portals_crypt_exit_01",
				"pdr_portals_crypt_exit_02",
				"pdr_portals_crypt_exit_03",
				"pdr_portals_crypt_exit_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_crypt_event_hole = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_crypt_event_hole_01",
				"pdr_portals_crypt_event_hole_02",
				"pdr_portals_crypt_event_hole_03",
				"pdr_portals_crypt_event_hole_04"
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
				1.9557291269302,
				2.519770860672,
				2.6164791584015,
				3.5243542194366
			},
			localization_strings = {
				"pdr_portals_crypt_event_hole_01",
				"pdr_portals_crypt_event_hole_02",
				"pdr_portals_crypt_event_hole_03",
				"pdr_portals_crypt_event_hole_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_map_first_clue = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_map_first_clue_01",
				"pdr_portals_map_first_clue_02",
				"pdr_portals_map_first_clue_03",
				"pdr_portals_map_first_clue_04"
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
				3.7592709064484,
				4.4668960571289,
				2.3800001144409,
				2.988979101181
			},
			localization_strings = {
				"pdr_portals_map_first_clue_01",
				"pdr_portals_map_first_clue_02",
				"pdr_portals_map_first_clue_03",
				"pdr_portals_map_first_clue_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_help_search = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_help_search_01",
				"pdr_portals_help_search_02",
				"pdr_portals_help_search_03",
				"pdr_portals_help_search_04"
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
				1.9802708625793,
				2.3532292842865,
				4.1663331985474,
				2.2709374427795
			},
			localization_strings = {
				"pdr_portals_help_search_01",
				"pdr_portals_help_search_02",
				"pdr_portals_help_search_03",
				"pdr_portals_help_search_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_castle_road = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_pdr_castle_road_01",
				"pdr_portals_pdr_castle_road_02",
				"pdr_portals_pdr_castle_road_03",
				"pdr_portals_pdr_castle_road_04"
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
				2.4391458034515,
				3.4967291355133,
				1.7319375276566,
				1.922812461853
			},
			localization_strings = {
				"pdr_portals_pdr_castle_road_01",
				"pdr_portals_pdr_castle_road_02",
				"pdr_portals_pdr_castle_road_03",
				"pdr_portals_pdr_castle_road_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_portal_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_portal_event_01",
				"pdr_portals_portal_event_02",
				"pdr_portals_portal_event_03",
				"pdr_portals_portal_event_04"
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
				2.4660415649414,
				2.0357916355133,
				1.7479166984558,
				1.0102708339691
			},
			localization_strings = {
				"pdr_portals_portal_event_01",
				"pdr_portals_portal_event_02",
				"pdr_portals_portal_event_03",
				"pdr_portals_portal_event_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_castle_gate = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_pdr_castle_gate_01",
				"pdr_portals_pdr_castle_gate_02",
				"pdr_portals_pdr_castle_gate_03",
				"pdr_portals_pdr_castle_gate_04"
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
				2.6097917556763,
				3.7534375190735,
				4.507833480835,
				5.7198543548584
			},
			localization_strings = {
				"pdr_portals_pdr_castle_gate_01",
				"pdr_portals_pdr_castle_gate_02",
				"pdr_portals_pdr_castle_gate_03",
				"pdr_portals_pdr_castle_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_intro_line_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_portals_intro_line_b_01",
				[2.0] = "pdr_portals_intro_line_b_02"
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
				[1.0] = 3.0291042327881,
				[2.0] = 2.1175625324249
			},
			localization_strings = {
				[1.0] = "pdr_portals_intro_line_b_01",
				[2.0] = "pdr_portals_intro_line_b_02"
			},
			randomize_indexes = {}
		},
		pdr_portals_find_survivors = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_find_survivors_01",
				"pdr_portals_find_survivors_02",
				"pdr_portals_find_survivors_03",
				"pdr_portals_find_survivors_04"
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
				1.0876874923706,
				1.2934792041779,
				2.3003957271576,
				3.7007915973663
			},
			localization_strings = {
				"pdr_portals_find_survivors_01",
				"pdr_portals_find_survivors_02",
				"pdr_portals_find_survivors_03",
				"pdr_portals_find_survivors_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_enter_village = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_enter_village_01",
				"pdr_portals_enter_village_02",
				"pdr_portals_enter_village_03",
				"pdr_portals_enter_village_04"
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
				2.5471251010895,
				2.4860417842865,
				2.9819374084473,
				3.1439790725708
			},
			localization_strings = {
				"pdr_portals_enter_village_01",
				"pdr_portals_enter_village_02",
				"pdr_portals_enter_village_03",
				"pdr_portals_enter_village_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_portal_interact_three = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_portal_interact_three_01",
				"pdr_portals_portal_interact_three_02",
				"pdr_portals_portal_interact_three_03",
				"pdr_portals_portal_interact_three_04"
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
				2.1382291316986,
				3.4571249485016,
				3.5154166221619,
				4.5105624198914
			},
			localization_strings = {
				"pdr_portals_portal_interact_three_01",
				"pdr_portals_portal_interact_three_02",
				"pdr_portals_portal_interact_three_03",
				"pdr_portals_portal_interact_three_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_get_to_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_get_to_temple_01",
				"pdr_portals_get_to_temple_02",
				"pdr_portals_get_to_temple_03",
				"pdr_portals_get_to_temple_04"
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
				4.1665625572205,
				5.8541460037231,
				6.2903542518616,
				4.0804376602173
			},
			localization_strings = {
				"pdr_portals_get_to_temple_01",
				"pdr_portals_get_to_temple_02",
				"pdr_portals_get_to_temple_03",
				"pdr_portals_get_to_temple_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_follow_trail = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_follow_trail_01",
				"pdr_portals_follow_trail_02",
				"pdr_portals_follow_trail_03",
				"pdr_portals_follow_trail_04"
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
				1.5213958024979,
				4.0594792366028,
				2.8762500286102,
				2.8272500038147
			},
			localization_strings = {
				"pdr_portals_follow_trail_01",
				"pdr_portals_follow_trail_02",
				"pdr_portals_follow_trail_03",
				"pdr_portals_follow_trail_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_village_raided = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_village_raided_01",
				"pdr_portals_village_raided_02",
				"pdr_portals_village_raided_03",
				"pdr_portals_village_raided_04"
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
				3.1593749523163,
				2.7212290763855,
				2.8910624980927,
				4.4975833892822
			},
			localization_strings = {
				"pdr_portals_village_raided_01",
				"pdr_portals_village_raided_02",
				"pdr_portals_village_raided_03",
				"pdr_portals_village_raided_04"
			},
			randomize_indexes = {}
		}
	})
end
