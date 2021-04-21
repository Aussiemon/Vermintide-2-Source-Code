return function ()
	define_rule({
		name = "pwe_portals_intro_line_a",
		response = "pwe_portals_intro_line_a",
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
		name = "pwe_portals_intro_line_b",
		response = "pwe_portals_intro_line_b",
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
		name = "pwe_portals_intro_line_c",
		response = "pwe_portals_intro_line_c",
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
		name = "pwe_portals_enter_village",
		response = "pwe_portals_enter_village",
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
		name = "pwe_portals_find_survivors",
		response = "pwe_portals_find_survivors",
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
		name = "pwe_portals_everyone_gone",
		response = "pwe_portals_everyone_gone",
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
		name = "pwe_portals_raid_trace",
		response = "pwe_portals_raid_trace",
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
		name = "pwe_portals_kidnapped_traces",
		response = "pwe_portals_kidnapped_traces",
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
		name = "pwe_portals_get_to_temple",
		response = "pwe_portals_get_to_temple",
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
		name = "pwe_portals_temple_locked",
		response = "pwe_portals_temple_locked",
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
		name = "pwe_portals_temple_bell_tower",
		response = "pwe_portals_temple_bell_tower",
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
		name = "pwe_portals_find_map",
		response = "pwe_portals_find_map",
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
		name = "pwe_portals_help_search",
		response = "pwe_portals_help_search",
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
		name = "pwe_portals_the_map",
		response = "pwe_portals_the_map",
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
		name = "pwe_portals_temple_event",
		response = "pwe_portals_temple_event",
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
		name = "pwe_portals_follow_trail",
		response = "pwe_portals_follow_trail",
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
		name = "pwe_portals_objective_recap",
		response = "pwe_portals_objective_recap",
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
		name = "pwe_portals_pwe_castle_vista",
		response = "pwe_portals_pwe_castle_vista",
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
		name = "pwe_portals_memory_portals",
		response = "pwe_portals_memory_portals",
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
		name = "pwe_portals_portal_interact_one",
		response = "pwe_portals_portal_interact_one",
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
		name = "pwe_portals_portal_interact_two",
		response = "pwe_portals_portal_interact_two",
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
		name = "pwe_portals_portal_interact_three",
		response = "pwe_portals_portal_interact_three",
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
		name = "pwe_portals_portal_event",
		response = "pwe_portals_portal_event",
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
		name = "pwe_portals_castle_road",
		response = "pwe_portals_castle_road",
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
		name = "pwe_portals_castle_gate",
		response = "pwe_portals_castle_gate",
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
		name = "pwe_portals_map_first_clue",
		response = "pwe_portals_map_first_clue",
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
		name = "pwe_portals_map_second_clue",
		response = "pwe_portals_map_second_clue",
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
		name = "pwe_portals_secret_entrance_gate_opens",
		response = "pwe_portals_secret_entrance_gate_opens",
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
		name = "pwe_portals_crypt_event_entering_crypt",
		response = "pwe_portals_crypt_event_entering_crypt",
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
		name = "pwe_portals_crypt_event_blood",
		response = "pwe_portals_crypt_event_blood",
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
		name = "pwe_portals_crypt_event_hole",
		response = "pwe_portals_crypt_event_hole",
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
		name = "pwe_portals_stairs",
		response = "pwe_portals_stairs",
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
		name = "pwe_portals_crypt_exit",
		response = "pwe_portals_crypt_exit",
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
		name = "pwe_portals_waystone",
		response = "pwe_portals_waystone",
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
		name = "pwe_portals_event_missing_gargoyle_heads",
		response = "pwe_portals_event_missing_gargoyle_heads",
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
		pwe_portals_find_survivors = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_find_survivors_01",
				"pwe_portals_find_survivors_02",
				"pwe_portals_find_survivors_03",
				"pwe_portals_find_survivors_04"
			},
			sound_events = {
				"pwe_portals_find_survivors_01",
				"pwe_portals_find_survivors_02",
				"pwe_portals_find_survivors_03",
				"pwe_portals_find_survivors_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.0011041164398,
				2.2416458129883,
				1.5236666202545,
				1.3219374418259
			}
		},
		pwe_portals_crypt_event_entering_crypt = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_crypt_event_entering_crypt_01",
				"pwe_portals_crypt_event_entering_crypt_02",
				"pwe_portals_crypt_event_entering_crypt_03",
				"pwe_portals_crypt_event_entering_crypt_04"
			},
			sound_events = {
				"pwe_portals_crypt_event_entering_crypt_01",
				"pwe_portals_crypt_event_entering_crypt_02",
				"pwe_portals_crypt_event_entering_crypt_03",
				"pwe_portals_crypt_event_entering_crypt_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.3859167098999,
				2.5757915973663,
				4.7470002174377,
				3.1459999084473
			}
		},
		pwe_portals_secret_entrance_gate_opens = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_secret_entrance_gate_opens_01",
				"pwe_portals_secret_entrance_gate_opens_02",
				"pwe_portals_secret_entrance_gate_opens_03",
				"pwe_portals_secret_entrance_gate_opens_04"
			},
			sound_events = {
				"pwe_portals_secret_entrance_gate_opens_01",
				"pwe_portals_secret_entrance_gate_opens_02",
				"pwe_portals_secret_entrance_gate_opens_03",
				"pwe_portals_secret_entrance_gate_opens_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.2120416164398,
				0.90397918224335,
				3.2133333683014,
				2.7653334140778
			}
		},
		pwe_portals_temple_locked = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_temple_locked_01",
				"pwe_portals_temple_locked_02",
				"pwe_portals_temple_locked_03",
				"pwe_portals_temple_locked_04"
			},
			sound_events = {
				"pwe_portals_temple_locked_01",
				"pwe_portals_temple_locked_02",
				"pwe_portals_temple_locked_03",
				"pwe_portals_temple_locked_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.178750038147,
				2.2464582920074,
				2.9791457653046,
				2.4209792613983
			}
		},
		pwe_portals_objective_recap = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_objective_recap_01",
				"pwe_portals_objective_recap_02",
				"pwe_portals_objective_recap_03",
				"pwe_portals_objective_recap_04"
			},
			sound_events = {
				"pwe_portals_objective_recap_01",
				"pwe_portals_objective_recap_02",
				"pwe_portals_objective_recap_03",
				"pwe_portals_objective_recap_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4856457710266,
				2.7869582176209,
				5.2405834197998,
				4.4397501945496
			}
		},
		pwe_portals_intro_line_a = {
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_portals_intro_line_a_01",
				[2.0] = "pwe_portals_intro_line_a_02"
			},
			sound_events = {
				[1.0] = "pwe_portals_intro_line_a_01",
				[2.0] = "pwe_portals_intro_line_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.3453960418701,
				[2.0] = 4.1921248435974
			}
		},
		pwe_portals_temple_bell_tower = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_temple_bell_tower_01",
				"pwe_portals_temple_bell_tower_02",
				"pwe_portals_temple_bell_tower_03",
				"pwe_portals_temple_bell_tower_04"
			},
			sound_events = {
				"pwe_portals_temple_bell_tower_01",
				"pwe_portals_temple_bell_tower_02",
				"pwe_portals_temple_bell_tower_03",
				"pwe_portals_temple_bell_tower_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		pwe_portals_intro_line_b = {
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_portals_intro_line_b_01",
				[2.0] = "pwe_portals_intro_line_b_02"
			},
			sound_events = {
				[1.0] = "pwe_portals_intro_line_b_01",
				[2.0] = "pwe_portals_intro_line_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.5069582462311,
				[2.0] = 3.8089792728424
			}
		},
		pwe_portals_the_map = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_the_map_01",
				"pwe_portals_the_map_02",
				"pwe_portals_the_map_03",
				"pwe_portals_the_map_04"
			},
			sound_events = {
				"pwe_portals_the_map_01",
				"pwe_portals_the_map_02",
				"pwe_portals_the_map_03",
				"pwe_portals_the_map_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2032709121704,
				3.8303542137146,
				4.124499797821,
				2.2444999217987
			}
		},
		pwe_portals_event_missing_gargoyle_heads = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_event_missing_gargoyle_heads_01",
				"pwe_portals_event_missing_gargoyle_heads_02",
				"pwe_portals_event_missing_gargoyle_heads_03",
				"pwe_portals_event_missing_gargoyle_heads_04"
			},
			sound_events = {
				"pwe_portals_event_missing_gargoyle_heads_01",
				"pwe_portals_event_missing_gargoyle_heads_02",
				"pwe_portals_event_missing_gargoyle_heads_03",
				"pwe_portals_event_missing_gargoyle_heads_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.818895816803,
				3.2076876163483,
				2.5953750610352,
				2.1370625495911
			}
		},
		pwe_portals_crypt_event_blood = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_crypt_event_blood_01",
				"pwe_portals_crypt_event_blood_02",
				"pwe_portals_crypt_event_blood_03",
				"pwe_portals_crypt_event_blood_04"
			},
			sound_events = {
				"pwe_portals_crypt_event_blood_01",
				"pwe_portals_crypt_event_blood_02",
				"pwe_portals_crypt_event_blood_03",
				"pwe_portals_crypt_event_blood_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.4981249570847,
				3.1214792728424,
				2.8750834465027,
				2.4583749771118
			}
		},
		pwe_portals_raid_trace = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_raid_trace_01",
				"pwe_portals_raid_trace_02",
				"pwe_portals_raid_trace_03",
				"pwe_portals_raid_trace_04"
			},
			sound_events = {
				"pwe_portals_raid_trace_01",
				"pwe_portals_raid_trace_02",
				"pwe_portals_raid_trace_03",
				"pwe_portals_raid_trace_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.1723749637604,
				2.7034165859222,
				3.9037916660309,
				3.8678958415985
			}
		},
		pwe_portals_castle_gate = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_pwe_castle_gate_01",
				"pwe_portals_pwe_castle_gate_02",
				"pwe_portals_pwe_castle_gate_03",
				"pwe_portals_pwe_castle_gate_04"
			},
			sound_events = {
				"pwe_portals_pwe_castle_gate_01",
				"pwe_portals_pwe_castle_gate_02",
				"pwe_portals_pwe_castle_gate_03",
				"pwe_portals_pwe_castle_gate_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.7792916297913,
				2.1308124065399,
				3.5695416927338,
				5.0796041488647
			}
		},
		pwe_portals_stairs = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_stairs_01",
				"pwe_portals_stairs_02",
				"pwe_portals_stairs_03",
				"pwe_portals_stairs_04"
			},
			sound_events = {
				"pwe_portals_stairs_01",
				"pwe_portals_stairs_02",
				"pwe_portals_stairs_03",
				"pwe_portals_stairs_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9654166698456,
				2.784562587738,
				3.4744374752045,
				2.4764165878296
			}
		},
		pwe_portals_map_first_clue = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_map_first_clue_01",
				"pwe_portals_map_first_clue_02",
				"pwe_portals_map_first_clue_03",
				"pwe_portals_map_first_clue_04"
			},
			sound_events = {
				"pwe_portals_map_first_clue_01",
				"pwe_portals_map_first_clue_02",
				"pwe_portals_map_first_clue_03",
				"pwe_portals_map_first_clue_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.1314792633057,
				3.9909999370575,
				2.8707499504089,
				3.2762498855591
			}
		},
		pwe_portals_enter_village = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_enter_village_01",
				"pwe_portals_enter_village_02",
				"pwe_portals_enter_village_03",
				"pwe_portals_enter_village_04"
			},
			sound_events = {
				"pwe_portals_enter_village_01",
				"pwe_portals_enter_village_02",
				"pwe_portals_enter_village_03",
				"pwe_portals_enter_village_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1811249256134,
				2.654000043869,
				3.3401458263397,
				4.226062297821
			}
		},
		pwe_portals_castle_road = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_pwe_castle_road_01",
				"pwe_portals_pwe_castle_road_02",
				"pwe_portals_pwe_castle_road_03",
				"pwe_portals_pwe_castle_road_04"
			},
			sound_events = {
				"pwe_portals_pwe_castle_road_01",
				"pwe_portals_pwe_castle_road_02",
				"pwe_portals_pwe_castle_road_03",
				"pwe_portals_pwe_castle_road_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.0077707767487,
				5.6494793891907,
				5.732458114624,
				3.7306666374206
			}
		},
		pwe_portals_portal_interact_one = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_portal_interact_one_01",
				"pwe_portals_portal_interact_one_02",
				"pwe_portals_portal_interact_one_03",
				"pwe_portals_portal_interact_one_04"
			},
			sound_events = {
				"pwe_portals_portal_interact_one_01",
				"pwe_portals_portal_interact_one_02",
				"pwe_portals_portal_interact_one_03",
				"pwe_portals_portal_interact_one_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2222292423248,
				1.2027499675751,
				1.335520863533,
				3.5442082881927
			}
		},
		pwe_portals_everyone_gone = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_everyone_gone_01",
				"pwe_portals_everyone_gone_02",
				"pwe_portals_everyone_gone_03",
				"pwe_portals_everyone_gone_04"
			},
			sound_events = {
				"pwe_portals_everyone_gone_01",
				"pwe_portals_everyone_gone_02",
				"pwe_portals_everyone_gone_03",
				"pwe_portals_everyone_gone_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.9192500114441,
				2.5973541736603,
				1.8488124608993,
				3.0533957481384
			}
		},
		pwe_portals_kidnapped_traces = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_kidnapped_traces_01",
				"pwe_portals_kidnapped_traces_02",
				"pwe_portals_kidnapped_traces_03",
				"pwe_portals_kidnapped_traces_04"
			},
			sound_events = {
				"pwe_portals_kidnapped_traces_01",
				"pwe_portals_kidnapped_traces_02",
				"pwe_portals_kidnapped_traces_03",
				"pwe_portals_kidnapped_traces_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.9047083854675,
				2.6137917041779,
				3.9001250267029,
				5.6527915000916
			}
		},
		pwe_portals_pwe_castle_vista = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_pwe_castle_vista_01",
				"pwe_portals_pwe_castle_vista_02",
				"pwe_portals_pwe_castle_vista_03",
				"pwe_portals_pwe_castle_vista_04"
			},
			sound_events = {
				"pwe_portals_pwe_castle_vista_01",
				"pwe_portals_pwe_castle_vista_02",
				"pwe_portals_pwe_castle_vista_03",
				"pwe_portals_pwe_castle_vista_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.9330415725708,
				3.7340416908264,
				4.4295835494995,
				6.5653123855591
			}
		},
		pwe_portals_crypt_event_hole = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_crypt_event_hole_01",
				"pwe_portals_crypt_event_hole_02",
				"pwe_portals_crypt_event_hole_03",
				"pwe_portals_crypt_event_hole_04"
			},
			sound_events = {
				"pwe_portals_crypt_event_hole_01",
				"pwe_portals_crypt_event_hole_02",
				"pwe_portals_crypt_event_hole_03",
				"pwe_portals_crypt_event_hole_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.366729259491,
				1.9148750305176,
				1.1976457834244,
				1.8161875009537
			}
		},
		pwe_portals_waystone = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_waystone_01",
				"pwe_portals_waystone_02",
				"pwe_portals_waystone_03",
				"pwe_portals_waystone_04"
			},
			sound_events = {
				"pwe_portals_waystone_01",
				"pwe_portals_waystone_02",
				"pwe_portals_waystone_03",
				"pwe_portals_waystone_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1958541870117,
				3.2594792842865,
				3.4978332519531,
				2.6540832519531
			}
		},
		pwe_portals_crypt_exit = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_crypt_exit_01",
				"pwe_portals_crypt_exit_02",
				"pwe_portals_crypt_exit_03",
				"pwe_portals_crypt_exit_04"
			},
			sound_events = {
				"pwe_portals_crypt_exit_01",
				"pwe_portals_crypt_exit_02",
				"pwe_portals_crypt_exit_03",
				"pwe_portals_crypt_exit_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2631249427795,
				1.9362916946411,
				3.1805000305176,
				4.477041721344
			}
		},
		pwe_portals_portal_interact_three = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_portal_interact_three_01",
				"pwe_portals_portal_interact_three_02",
				"pwe_portals_portal_interact_three_03",
				"pwe_portals_portal_interact_three_04"
			},
			sound_events = {
				"pwe_portals_portal_interact_three_01",
				"pwe_portals_portal_interact_three_02",
				"pwe_portals_portal_interact_three_03",
				"pwe_portals_portal_interact_three_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.0245208740234,
				2.359375,
				1.8841458559036,
				3.6314375400543
			}
		},
		pwe_portals_memory_portals = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_memory_portals_01",
				"pwe_portals_memory_portals_02",
				"pwe_portals_memory_portals_03",
				"pwe_portals_memory_portals_04"
			},
			sound_events = {
				"pwe_portals_memory_portals_01",
				"pwe_portals_memory_portals_02",
				"pwe_portals_memory_portals_03",
				"pwe_portals_memory_portals_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.7457292079926,
				3.8787083625794,
				4.8826041221619,
				5.806604385376
			}
		},
		pwe_portals_temple_event = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_temple_event_01",
				"pwe_portals_temple_event_02",
				"pwe_portals_temple_event_03",
				"pwe_portals_temple_event_04"
			},
			sound_events = {
				"pwe_portals_temple_event_01",
				"pwe_portals_temple_event_02",
				"pwe_portals_temple_event_03",
				"pwe_portals_temple_event_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7472499608993,
				1.9402083158493,
				1.76327085495,
				2.2204375267029
			}
		},
		pwe_portals_get_to_temple = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_get_to_temple_01",
				"pwe_portals_get_to_temple_02",
				"pwe_portals_get_to_temple_03",
				"pwe_portals_get_to_temple_04"
			},
			sound_events = {
				"pwe_portals_get_to_temple_01",
				"pwe_portals_get_to_temple_02",
				"pwe_portals_get_to_temple_03",
				"pwe_portals_get_to_temple_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1558332443237,
				4.3503751754761,
				2.7902500629425,
				3.3365623950958
			}
		},
		pwe_portals_find_map = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_find_map_01",
				"pwe_portals_find_map_02",
				"pwe_portals_find_map_03",
				"pwe_portals_find_map_04"
			},
			sound_events = {
				"pwe_portals_find_map_01",
				"pwe_portals_find_map_02",
				"pwe_portals_find_map_03",
				"pwe_portals_find_map_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9181250333786,
				3.1300625801086,
				1.0488541126251,
				2.8461666107178
			}
		},
		pwe_portals_intro_line_c = {
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_portals_intro_line_c_01",
				[2.0] = "pwe_portals_intro_line_c_02"
			},
			sound_events = {
				[1.0] = "pwe_portals_intro_line_c_01",
				[2.0] = "pwe_portals_intro_line_c_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.1418540477753,
				[2.0] = 5.7314167022705
			}
		},
		pwe_portals_map_second_clue = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_map_second_clue_01",
				"pwe_portals_map_second_clue_02",
				"pwe_portals_map_second_clue_03",
				"pwe_portals_map_second_clue_04"
			},
			sound_events = {
				"pwe_portals_map_second_clue_01",
				"pwe_portals_map_second_clue_02",
				"pwe_portals_map_second_clue_03",
				"pwe_portals_map_second_clue_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8642082214356,
				5.1522917747498,
				3.9532916545868,
				2.9082291126251
			}
		},
		pwe_portals_follow_trail = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_follow_trail_01",
				"pwe_portals_follow_trail_02",
				"pwe_portals_follow_trail_03",
				"pwe_portals_follow_trail_04"
			},
			sound_events = {
				"pwe_portals_follow_trail_01",
				"pwe_portals_follow_trail_02",
				"pwe_portals_follow_trail_03",
				"pwe_portals_follow_trail_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.3091249465942,
				3.3275415897369,
				3.1911041736603,
				2.401750087738
			}
		},
		pwe_portals_portal_event = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_portal_event_01",
				"pwe_portals_portal_event_02",
				"pwe_portals_portal_event_03",
				"pwe_portals_portal_event_04"
			},
			sound_events = {
				"pwe_portals_portal_event_01",
				"pwe_portals_portal_event_02",
				"pwe_portals_portal_event_03",
				"pwe_portals_portal_event_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.5935416221619,
				1.5957916975021,
				1.8940416574478,
				2.032562494278
			}
		},
		pwe_portals_portal_interact_two = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_portal_interact_two_01",
				"pwe_portals_portal_interact_two_02",
				"pwe_portals_portal_interact_two_03",
				"pwe_portals_portal_interact_two_04"
			},
			sound_events = {
				"pwe_portals_portal_interact_two_01",
				"pwe_portals_portal_interact_two_02",
				"pwe_portals_portal_interact_two_03",
				"pwe_portals_portal_interact_two_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9884791374207,
				3.311666727066,
				2.7113125324249,
				1.6926250457764
			}
		},
		pwe_portals_help_search = {
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_portals",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_portals_help_search_01",
				"pwe_portals_help_search_02",
				"pwe_portals_help_search_03",
				"pwe_portals_help_search_04"
			},
			sound_events = {
				"pwe_portals_help_search_01",
				"pwe_portals_help_search_02",
				"pwe_portals_help_search_03",
				"pwe_portals_help_search_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6249375343323,
				1.8928124904633,
				3.0145416259766,
				3.7578332424164
			}
		}
	})
end
