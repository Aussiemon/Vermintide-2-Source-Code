return function ()
	define_rule({
		name = "pes_portals_intro_line_a",
		response = "pes_portals_intro_line_a",
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
		name = "pes_portals_intro_line_b",
		response = "pes_portals_intro_line_b",
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
		name = "pes_portals_intro_line_c",
		response = "pes_portals_intro_line_c",
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
		name = "pes_portals_enter_village",
		response = "pes_portals_enter_village",
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
		name = "pes_portals_village_raided",
		response = "pes_portals_village_raided",
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
		name = "pes_portals_find_survivors",
		response = "pes_portals_find_survivors",
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
		name = "pes_portals_everyone_gone",
		response = "pes_portals_everyone_gone",
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
		name = "pes_portals_raid_trace",
		response = "pes_portals_raid_trace",
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
		name = "pes_portals_kidnapped_traces",
		response = "pes_portals_kidnapped_traces",
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
		name = "pes_portals_get_to_temple",
		response = "pes_portals_get_to_temple",
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
		name = "pes_portals_the_temple",
		response = "pes_portals_the_temple",
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
		name = "pes_portals_temple_locked",
		response = "pes_portals_temple_locked",
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
		name = "pes_portals_temple_bell_tower",
		response = "pes_portals_temple_bell_tower",
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
		name = "pes_portals_find_map",
		response = "pes_portals_find_map",
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
		name = "pes_portals_help_search",
		response = "pes_portals_help_search",
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
		name = "pes_portals_the_map",
		response = "pes_portals_the_map",
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
		name = "pes_portals_temple_event",
		response = "pes_portals_temple_event",
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
		name = "pes_portals_get_out",
		response = "pes_portals_get_out",
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
		name = "pes_portals_follow_trail",
		response = "pes_portals_follow_trail",
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
		name = "pes_portals_trail_found ",
		response = "pes_portals_trail_found ",
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
		name = "pes_portals_objective_recap",
		response = "pes_portals_objective_recap",
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
		name = "pes_portals_memory_path",
		response = "pes_portals_memory_path",
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
		name = "pes_portals_pes_castle_vista",
		response = "pes_portals_pes_castle_vista",
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
		name = "pes_portals_memory_portals",
		response = "pes_portals_memory_portals",
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
		name = "pes_portals_portal_interact_one",
		response = "pes_portals_portal_interact_one",
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
		name = "pes_portals_portal_interact_two",
		response = "pes_portals_portal_interact_two",
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
		name = "pes_portals_portal_interact_three",
		response = "pes_portals_portal_interact_three",
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
		name = "pes_portals_portal_event",
		response = "pes_portals_portal_event",
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
		name = "pes_portals_castle_road",
		response = "pes_portals_castle_road",
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
		name = "pes_portals_castle_gate",
		response = "pes_portals_castle_gate",
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
		name = "pes_portals_map_first_clue",
		response = "pes_portals_map_first_clue",
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
		name = "pes_portals_map_second_clue",
		response = "pes_portals_map_second_clue",
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
		name = "pes_portals_secret_entrance_gate_opens",
		response = "pes_portals_secret_entrance_gate_opens",
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
		name = "pes_portals_crypt_event_entering_crypt",
		response = "pes_portals_crypt_event_entering_crypt",
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
		name = "pes_portals_crypt_event_blood",
		response = "pes_portals_crypt_event_blood",
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
		name = "pes_portals_crypt_event_hole",
		response = "pes_portals_crypt_event_hole",
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
		name = "pes_portals_stairs",
		response = "pes_portals_stairs",
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
		name = "pes_portals_crypt_exit",
		response = "pes_portals_crypt_exit",
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
		name = "pes_portals_waystone",
		response = "pes_portals_waystone",
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
		name = "pes_portals_event_missing_gargoyle_heads",
		response = "pes_portals_event_missing_gargoyle_heads",
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
		pes_portals_castle_gate = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_pes_castle_gate_01",
				"pes_portals_pes_castle_gate_02",
				"pes_portals_pes_castle_gate_03",
				"pes_portals_pes_castle_gate_04"
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
				3.6137917041779,
				2.9426457881927,
				2.7608957290649,
				2.1520416736603
			},
			localization_strings = {
				"pes_portals_pes_castle_gate_01",
				"pes_portals_pes_castle_gate_02",
				"pes_portals_pes_castle_gate_03",
				"pes_portals_pes_castle_gate_04"
			},
			randomize_indexes = {}
		},
		pes_portals_portal_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_portal_event_01",
				"pes_portals_portal_event_02",
				"pes_portals_portal_event_03",
				"pes_portals_portal_event_04"
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
				1.3688541650772,
				2.7437083721161,
				1.8569999933243,
				2.3892500400543
			},
			localization_strings = {
				"pes_portals_portal_event_01",
				"pes_portals_portal_event_02",
				"pes_portals_portal_event_03",
				"pes_portals_portal_event_04"
			},
			randomize_indexes = {}
		},
		pes_portals_portal_interact_two = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_portal_interact_two_01",
				"pes_portals_portal_interact_two_02",
				"pes_portals_portal_interact_two_03",
				"pes_portals_portal_interact_two_04"
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
				1.6765625476837,
				2.0279166698456,
				2.6119792461395,
				1.836833357811
			},
			localization_strings = {
				"pes_portals_portal_interact_two_01",
				"pes_portals_portal_interact_two_02",
				"pes_portals_portal_interact_two_03",
				"pes_portals_portal_interact_two_04"
			},
			randomize_indexes = {}
		},
		pes_portals_temple_locked = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_temple_locked_01",
				"pes_portals_temple_locked_02",
				"pes_portals_temple_locked_03",
				"pes_portals_temple_locked_04"
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
				3.842333316803,
				2.1356875896454,
				1.5652916431427,
				3.2523541450501
			},
			localization_strings = {
				"pes_portals_temple_locked_01",
				"pes_portals_temple_locked_02",
				"pes_portals_temple_locked_03",
				"pes_portals_temple_locked_04"
			},
			randomize_indexes = {}
		},
		pes_portals_castle_road = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_pes_castle_road_01",
				"pes_portals_pes_castle_road_02",
				"pes_portals_pes_castle_road_03",
				"pes_portals_pes_castle_road_04"
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
				2.3881249427795,
				2.7681250572205,
				1.7300833463669,
				3.7454166412353
			},
			localization_strings = {
				"pes_portals_pes_castle_road_01",
				"pes_portals_pes_castle_road_02",
				"pes_portals_pes_castle_road_03",
				"pes_portals_pes_castle_road_04"
			},
			randomize_indexes = {}
		},
		pes_portals_memory_portals = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_memory_portals_01",
				"pes_portals_memory_portals_02",
				"pes_portals_memory_portals_03",
				"pes_portals_memory_portals_04"
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
				2.411229133606,
				1.8528125286102,
				4.0036873817444,
				3.2008125782013
			},
			localization_strings = {
				"pes_portals_memory_portals_01",
				"pes_portals_memory_portals_02",
				"pes_portals_memory_portals_03",
				"pes_portals_memory_portals_04"
			},
			randomize_indexes = {}
		},
		pes_portals_pes_castle_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_pes_castle_vista_01",
				"pes_portals_pes_castle_vista_02",
				"pes_portals_pes_castle_vista_03",
				"pes_portals_pes_castle_vista_04"
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
				4.6535835266113,
				3.8447291851044,
				4.3029584884644,
				5.2277083396912
			},
			localization_strings = {
				"pes_portals_pes_castle_vista_01",
				"pes_portals_pes_castle_vista_02",
				"pes_portals_pes_castle_vista_03",
				"pes_portals_pes_castle_vista_04"
			},
			randomize_indexes = {}
		},
		pes_portals_find_map = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_find_map_01",
				"pes_portals_find_map_02",
				"pes_portals_find_map_03",
				"pes_portals_find_map_04"
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
				1.8250833749771,
				1.603354215622,
				2.1428542137146,
				2.318437576294
			},
			localization_strings = {
				"pes_portals_find_map_01",
				"pes_portals_find_map_02",
				"pes_portals_find_map_03",
				"pes_portals_find_map_04"
			},
			randomize_indexes = {}
		},
		pes_portals_map_second_clue = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_map_second_clue_01",
				"pes_portals_map_second_clue_02",
				"pes_portals_map_second_clue_03",
				"pes_portals_map_second_clue_04"
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
				4.1353960037231,
				3.9464166164398,
				2.7651875019074,
				4.601083278656
			},
			localization_strings = {
				"pes_portals_map_second_clue_01",
				"pes_portals_map_second_clue_02",
				"pes_portals_map_second_clue_03",
				"pes_portals_map_second_clue_04"
			},
			randomize_indexes = {}
		},
		pes_portals_secret_entrance_gate_opens = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_secret_entrance_gate_opens_01",
				"pes_portals_secret_entrance_gate_opens_02",
				"pes_portals_secret_entrance_gate_opens_03",
				"pes_portals_secret_entrance_gate_opens_04"
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
				1.583166718483,
				2.7942500114441,
				4.7796459197998,
				3.3185000419617
			},
			localization_strings = {
				"pes_portals_secret_entrance_gate_opens_01",
				"pes_portals_secret_entrance_gate_opens_02",
				"pes_portals_secret_entrance_gate_opens_03",
				"pes_portals_secret_entrance_gate_opens_04"
			},
			randomize_indexes = {}
		},
		pes_portals_temple_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_temple_event_01",
				"pes_portals_temple_event_02",
				"pes_portals_temple_event_03",
				"pes_portals_temple_event_04"
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
				1.2543749809265,
				1.5116457939148,
				1.2841458320618,
				2.0676457881927
			},
			localization_strings = {
				"pes_portals_temple_event_01",
				"pes_portals_temple_event_02",
				"pes_portals_temple_event_03",
				"pes_portals_temple_event_04"
			},
			randomize_indexes = {}
		},
		pes_portals_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_waystone_01",
				"pes_portals_waystone_02",
				"pes_portals_waystone_03",
				"pes_portals_waystone_04"
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
				2.7353541851044,
				3.4910209178925,
				3.6686041355133,
				4.264187335968
			},
			localization_strings = {
				"pes_portals_waystone_01",
				"pes_portals_waystone_02",
				"pes_portals_waystone_03",
				"pes_portals_waystone_04"
			},
			randomize_indexes = {}
		},
		["pes_portals_trail_found "] = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_trail_found_01",
				"pes_portals_trail_found_02",
				"pes_portals_trail_found_03",
				"pes_portals_trail_found_04"
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
				1.7084791660309,
				5.9158749580383,
				3.1068124771118,
				2.4146459102631
			},
			localization_strings = {
				"pes_portals_trail_found_01",
				"pes_portals_trail_found_02",
				"pes_portals_trail_found_03",
				"pes_portals_trail_found_04"
			},
			randomize_indexes = {}
		},
		pes_portals_portal_interact_three = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_portal_interact_three_01",
				"pes_portals_portal_interact_three_02",
				"pes_portals_portal_interact_three_03",
				"pes_portals_portal_interact_three_04"
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
				2.0226666927338,
				3.3077082633972,
				2.8097083568573,
				2.8186249732971
			},
			localization_strings = {
				"pes_portals_portal_interact_three_01",
				"pes_portals_portal_interact_three_02",
				"pes_portals_portal_interact_three_03",
				"pes_portals_portal_interact_three_04"
			},
			randomize_indexes = {}
		},
		pes_portals_help_search = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_help_search_01",
				"pes_portals_help_search_02",
				"pes_portals_help_search_03",
				"pes_portals_help_search_04"
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
				1.8278958797455,
				1.5694999694824,
				3.0624165534973,
				4.2185206413269
			},
			localization_strings = {
				"pes_portals_help_search_01",
				"pes_portals_help_search_02",
				"pes_portals_help_search_03",
				"pes_portals_help_search_04"
			},
			randomize_indexes = {}
		},
		pes_portals_raid_trace = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_raid_trace_01",
				"pes_portals_raid_trace_02",
				"pes_portals_raid_trace_03",
				"pes_portals_raid_trace_04"
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
				2.0231666564941,
				3.0630624294281,
				3.5234167575836,
				5.0485625267029
			},
			localization_strings = {
				"pes_portals_raid_trace_01",
				"pes_portals_raid_trace_02",
				"pes_portals_raid_trace_03",
				"pes_portals_raid_trace_04"
			},
			randomize_indexes = {}
		},
		pes_portals_get_to_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_get_to_temple_01",
				"pes_portals_get_to_temple_02",
				"pes_portals_get_to_temple_03",
				"pes_portals_get_to_temple_04"
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
				3.5826458930969,
				3.2547500133514,
				4.2058334350586,
				2.7102084159851
			},
			localization_strings = {
				"pes_portals_get_to_temple_01",
				"pes_portals_get_to_temple_02",
				"pes_portals_get_to_temple_03",
				"pes_portals_get_to_temple_04"
			},
			randomize_indexes = {}
		},
		pes_portals_crypt_event_hole = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_crypt_event_hole_01",
				"pes_portals_crypt_event_hole_02",
				"pes_portals_crypt_event_hole_03",
				"pes_portals_crypt_event_hole_04"
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
				1.5861041545868,
				1.2460625171661,
				1.228875041008,
				2.0278959274292
			},
			localization_strings = {
				"pes_portals_crypt_event_hole_01",
				"pes_portals_crypt_event_hole_02",
				"pes_portals_crypt_event_hole_03",
				"pes_portals_crypt_event_hole_04"
			},
			randomize_indexes = {}
		},
		pes_portals_kidnapped_traces = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_kidnapped_traces_01",
				"pes_portals_kidnapped_traces_02",
				"pes_portals_kidnapped_traces_03",
				"pes_portals_kidnapped_traces_04"
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
				3.6063125133514,
				3.1078958511352,
				5.2538747787476,
				6.0233750343323
			},
			localization_strings = {
				"pes_portals_kidnapped_traces_01",
				"pes_portals_kidnapped_traces_02",
				"pes_portals_kidnapped_traces_03",
				"pes_portals_kidnapped_traces_04"
			},
			randomize_indexes = {}
		},
		pes_portals_event_missing_gargoyle_heads = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_event_missing_gargoyle_heads_01",
				"pes_portals_event_missing_gargoyle_heads_02",
				"pes_portals_event_missing_gargoyle_heads_03",
				"pes_portals_event_missing_gargoyle_heads_04"
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
				2.6597707271576,
				1.8550208806992,
				6.775333404541,
				2.3813540935516
			},
			localization_strings = {
				"pes_portals_event_missing_gargoyle_heads_01",
				"pes_portals_event_missing_gargoyle_heads_02",
				"pes_portals_event_missing_gargoyle_heads_03",
				"pes_portals_event_missing_gargoyle_heads_04"
			},
			randomize_indexes = {}
		},
		pes_portals_find_survivors = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_find_survivors_01",
				"pes_portals_find_survivors_02",
				"pes_portals_find_survivors_03",
				"pes_portals_find_survivors_04"
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
				1.1026250123978,
				1.1799792051315,
				2.369916677475,
				1.1166249513626
			},
			localization_strings = {
				"pes_portals_find_survivors_01",
				"pes_portals_find_survivors_02",
				"pes_portals_find_survivors_03",
				"pes_portals_find_survivors_04"
			},
			randomize_indexes = {}
		},
		pes_portals_stairs = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_stairs_01",
				"pes_portals_stairs_02",
				"pes_portals_stairs_03",
				"pes_portals_stairs_04"
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
				5.0141458511353,
				4.519166469574,
				5.2022085189819,
				1.946624994278
			},
			localization_strings = {
				"pes_portals_stairs_01",
				"pes_portals_stairs_02",
				"pes_portals_stairs_03",
				"pes_portals_stairs_04"
			},
			randomize_indexes = {}
		},
		pes_portals_crypt_event_blood = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_crypt_event_blood_01",
				"pes_portals_crypt_event_blood_02",
				"pes_portals_crypt_event_blood_03",
				"pes_portals_crypt_event_blood_04"
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
				2.3939790725708,
				2.8158957958221,
				1.8687916994095,
				4.0618543624878
			},
			localization_strings = {
				"pes_portals_crypt_event_blood_01",
				"pes_portals_crypt_event_blood_02",
				"pes_portals_crypt_event_blood_03",
				"pes_portals_crypt_event_blood_04"
			},
			randomize_indexes = {}
		},
		pes_portals_crypt_event_entering_crypt = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_crypt_event_entering_crypt_01",
				"pes_portals_crypt_event_entering_crypt_02",
				"pes_portals_crypt_event_entering_crypt_03",
				"pes_portals_crypt_event_entering_crypt_04"
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
				2.5039167404175,
				2.1358957290649,
				2.2382917404175,
				3.1650624275208
			},
			localization_strings = {
				"pes_portals_crypt_event_entering_crypt_01",
				"pes_portals_crypt_event_entering_crypt_02",
				"pes_portals_crypt_event_entering_crypt_03",
				"pes_portals_crypt_event_entering_crypt_04"
			},
			randomize_indexes = {}
		},
		pes_portals_get_out = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_get_out_01",
				"pes_portals_get_out_02",
				"pes_portals_get_out_03",
				"pes_portals_get_out_04"
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
				2.321624994278,
				1.8895208835602,
				1.5863332748413,
				3.4001042842865
			},
			localization_strings = {
				"pes_portals_get_out_01",
				"pes_portals_get_out_02",
				"pes_portals_get_out_03",
				"pes_portals_get_out_04"
			},
			randomize_indexes = {}
		},
		pes_portals_the_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_the_temple_01",
				"pes_portals_the_temple_02",
				"pes_portals_the_temple_03",
				"pes_portals_the_temple_04"
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
				1.2401875257492,
				1.2502083778381,
				1.0421249866486,
				1.8466249704361
			},
			localization_strings = {
				"pes_portals_the_temple_01",
				"pes_portals_the_temple_02",
				"pes_portals_the_temple_03",
				"pes_portals_the_temple_04"
			},
			randomize_indexes = {}
		},
		pes_portals_intro_line_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_portals_intro_line_c_01",
				[2.0] = "pes_portals_intro_line_c_02"
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
				[1.0] = 4.9582290649414,
				[2.0] = 4.9979581832886
			},
			localization_strings = {
				[1.0] = "pes_portals_intro_line_c_01",
				[2.0] = "pes_portals_intro_line_c_02"
			},
			randomize_indexes = {}
		},
		pes_portals_enter_village = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_enter_village_01",
				"pes_portals_enter_village_02",
				"pes_portals_enter_village_03",
				"pes_portals_enter_village_04"
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
				1.8130208253861,
				2.8776249885559,
				5.0993123054504,
				2.5949165821075
			},
			localization_strings = {
				"pes_portals_enter_village_01",
				"pes_portals_enter_village_02",
				"pes_portals_enter_village_03",
				"pes_portals_enter_village_04"
			},
			randomize_indexes = {}
		},
		pes_portals_the_map = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_the_map_01",
				"pes_portals_the_map_02",
				"pes_portals_the_map_03",
				"pes_portals_the_map_04"
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
				1.0474791526794,
				2.3488125801086,
				4.2508335113525,
				2.8848125934601
			},
			localization_strings = {
				"pes_portals_the_map_01",
				"pes_portals_the_map_02",
				"pes_portals_the_map_03",
				"pes_portals_the_map_04"
			},
			randomize_indexes = {}
		},
		pes_portals_village_raided = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_village_raided_01",
				"pes_portals_village_raided_02",
				"pes_portals_village_raided_03",
				"pes_portals_village_raided_04"
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
				2.4010000228882,
				2.6698958873749,
				2.1918542385101,
				5.0015416145325
			},
			localization_strings = {
				"pes_portals_village_raided_01",
				"pes_portals_village_raided_02",
				"pes_portals_village_raided_03",
				"pes_portals_village_raided_04"
			},
			randomize_indexes = {}
		},
		pes_portals_portal_interact_one = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_portal_interact_one_01",
				"pes_portals_portal_interact_one_02",
				"pes_portals_portal_interact_one_03",
				"pes_portals_portal_interact_one_04"
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
				1.8357917070389,
				1.7487083673477,
				0.94720834493637,
				1.2812708616257
			},
			localization_strings = {
				"pes_portals_portal_interact_one_01",
				"pes_portals_portal_interact_one_02",
				"pes_portals_portal_interact_one_03",
				"pes_portals_portal_interact_one_04"
			},
			randomize_indexes = {}
		},
		pes_portals_intro_line_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_portals_intro_line_a_01",
				[2.0] = "pes_portals_intro_line_a_02"
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
				[1.0] = 2.3200623989105,
				[2.0] = 3.8559792041779
			},
			localization_strings = {
				[1.0] = "pes_portals_intro_line_a_01",
				[2.0] = "pes_portals_intro_line_a_02"
			},
			randomize_indexes = {}
		},
		pes_portals_temple_bell_tower = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_temple_bell_tower_01",
				"pes_portals_temple_bell_tower_02",
				"pes_portals_temple_bell_tower_03",
				"pes_portals_temple_bell_tower_04"
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
				1.1938749551773,
				1.5760416984558,
				1.8139375448227,
				1.7616250514984
			},
			localization_strings = {
				"pes_portals_temple_bell_tower_01",
				"pes_portals_temple_bell_tower_02",
				"pes_portals_temple_bell_tower_03",
				"pes_portals_temple_bell_tower_04"
			},
			randomize_indexes = {}
		},
		pes_portals_map_first_clue = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_map_first_clue_01",
				"pes_portals_map_first_clue_02",
				"pes_portals_map_first_clue_03",
				"pes_portals_map_first_clue_04"
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
				2.3164167404175,
				2.7548959255219,
				2.7600417137146,
				4.1272706985474
			},
			localization_strings = {
				"pes_portals_map_first_clue_01",
				"pes_portals_map_first_clue_02",
				"pes_portals_map_first_clue_03",
				"pes_portals_map_first_clue_04"
			},
			randomize_indexes = {}
		},
		pes_portals_crypt_exit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_crypt_exit_01",
				"pes_portals_crypt_exit_02",
				"pes_portals_crypt_exit_03",
				"pes_portals_crypt_exit_04"
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
				4.5378332138061,
				2.3399167060852,
				4.7101039886475,
				3.9469375610352
			},
			localization_strings = {
				"pes_portals_crypt_exit_01",
				"pes_portals_crypt_exit_02",
				"pes_portals_crypt_exit_03",
				"pes_portals_crypt_exit_04"
			},
			randomize_indexes = {}
		},
		pes_portals_objective_recap = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_objective_recap_01",
				"pes_portals_objective_recap_02",
				"pes_portals_objective_recap_03",
				"pes_portals_objective_recap_04"
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
				3.2065417766571,
				3.6052083969116,
				3.4822707176209,
				4.3544583320618
			},
			localization_strings = {
				"pes_portals_objective_recap_01",
				"pes_portals_objective_recap_02",
				"pes_portals_objective_recap_03",
				"pes_portals_objective_recap_04"
			},
			randomize_indexes = {}
		},
		pes_portals_intro_line_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_portals_intro_line_b_01",
				[2.0] = "pes_portals_intro_line_b_02"
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
				[1.0] = 2.8004999160767,
				[2.0] = 1.7994999885559
			},
			localization_strings = {
				[1.0] = "pes_portals_intro_line_b_01",
				[2.0] = "pes_portals_intro_line_b_02"
			},
			randomize_indexes = {}
		},
		pes_portals_memory_path = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_memory_path_01",
				"pes_portals_memory_path_02",
				"pes_portals_memory_path_03",
				"pes_portals_memory_path_04"
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
				2.3348333835602,
				2.0351667404175,
				3.3875207901001,
				1.3869792222977
			},
			localization_strings = {
				"pes_portals_memory_path_01",
				"pes_portals_memory_path_02",
				"pes_portals_memory_path_03",
				"pes_portals_memory_path_04"
			},
			randomize_indexes = {}
		},
		pes_portals_everyone_gone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_everyone_gone_01",
				"pes_portals_everyone_gone_02",
				"pes_portals_everyone_gone_03",
				"pes_portals_everyone_gone_04"
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
				4.3850002288818,
				3.3027708530426,
				4.0303335189819,
				1.8933124542236
			},
			localization_strings = {
				"pes_portals_everyone_gone_01",
				"pes_portals_everyone_gone_02",
				"pes_portals_everyone_gone_03",
				"pes_portals_everyone_gone_04"
			},
			randomize_indexes = {}
		},
		pes_portals_follow_trail = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_portals",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_follow_trail_01",
				"pes_portals_follow_trail_02",
				"pes_portals_follow_trail_03",
				"pes_portals_follow_trail_04"
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
				1.3613333702087,
				1.4367500543594,
				1.8642708063126,
				3.4308333396912
			},
			localization_strings = {
				"pes_portals_follow_trail_01",
				"pes_portals_follow_trail_02",
				"pes_portals_follow_trail_03",
				"pes_portals_follow_trail_04"
			},
			randomize_indexes = {}
		}
	})
end
