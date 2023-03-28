return function ()
	define_rule({
		name = "pdr_level_helmgart_military_empty_town",
		response = "pdr_level_helmgart_military_empty_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_empty_town"
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
				"time_since_helmgart_military_empty_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_empty_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_fort_help",
		response = "pdr_level_helmgart_military_fort_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_fort_help"
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
				"time_since_helmgart_military_fort_help",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_help",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_fort_entrance",
		response = "pdr_level_helmgart_military_fort_entrance",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_fort_entrance"
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
				"time_since_helmgart_military_fort_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_fort_massacre",
		response = "pdr_level_helmgart_military_fort_massacre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_fort_massacre"
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
				"time_since_helmgart_military_fort_massacre",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_massacre",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_fort_elevator",
		response = "pdr_level_helmgart_military_fort_elevator",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_fort_elevator"
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
				"time_since_helmgart_military_fort_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_armoury",
		response = "pdr_level_helmgart_military_armoury",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_armoury"
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
				"time_since_helmgart_military_armoury",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_armoury",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_portcullis",
		response = "pdr_level_helmgart_military_portcullis",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_portcullis"
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
				"time_since_helmgart_military_portcullis",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_portcullis",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_courtyard_event",
		response = "pdr_level_helmgart_military_courtyard_event",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_courtyard_event"
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
				"time_since_helmgart_military_courtyard_event",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_courtyard_event",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_axebite_pass_vista",
		response = "pdr_level_helmgart_military_axebite_pass_vista",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_axebite_pass_vista"
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
				"time_since_helmgart_military_axebite_pass_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_axebite_pass_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_helmgart_vista",
		response = "pdr_level_helmgart_military_helmgart_vista",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_helmgart_vista"
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
				"time_since_helmgart_military_helmgart_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_helmgart_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_locked_portcullis",
		response = "pdr_level_helmgart_military_locked_portcullis",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_locked_portcullis"
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
				"time_since_helmgart_military_locked_portcullis",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_locked_portcullis",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_turn_cannon",
		response = "pdr_level_helmgart_military_turn_cannon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_turn_cannon"
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
				"time_since_helmgart_military_turn_cannon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_turn_cannon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_fire_cannon",
		response = "pdr_level_helmgart_military_fire_cannon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_fire_cannon"
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
				"time_since_helmgart_military_fire_cannon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fire_cannon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_oops",
		response = "pdr_level_helmgart_military_oops",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_oops"
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
				"time_since_helmgart_military_oops",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_oops",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_temple_ahead",
		response = "pdr_level_helmgart_military_temple_ahead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_temple_ahead"
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
				"time_since_helmgart_military_temple_ahead",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_temple_ahead",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_pilgrim_path",
		response = "pdr_level_helmgart_military_pilgrim_path",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_pilgrim_path"
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
				"time_since_helmgart_military_pilgrim_path",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_pilgrim_path",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_arriving_temple",
		response = "pdr_level_helmgart_military_arriving_temple",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_arriving_temple"
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
				"time_since_helmgart_military_arriving_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_prepare",
		response = "pdr_level_helmgart_military_prepare",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_prepare"
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
				"time_since_helmgart_military_prepare",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_prepare",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_ring_bell",
		response = "pdr_level_helmgart_military_ring_bell",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_ring_bell"
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
				"time_since_helmgart_military_ring_bell",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_ring_bell",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_they_are_coming",
		response = "pdr_level_helmgart_military_they_are_coming",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_they_are_coming"
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
				"time_since_helmgart_military_they_are_coming",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_they_are_coming",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_halfway_through_horde",
		response = "pdr_level_helmgart_military_halfway_through_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_halfway_through_horde"
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
				"time_since_helmgart_military_halfway_through_horde",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_halfway_through_horde",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_spooky_temple",
		response = "pdr_level_helmgart_military_spooky_temple",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_spooky_temple"
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
				"time_since_helmgart_military_spooky_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_spooky_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_door_opens",
		response = "pdr_level_helmgart_military_door_opens",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_door_opens"
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
				"time_since_helmgart_military_door_opens",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_door_opens",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_time_to_leave",
		response = "pdr_level_helmgart_military_time_to_leave",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_time_to_leave"
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
				"time_since_helmgart_military_time_to_leave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_time_to_leave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_helmgart_military_spotting_portal",
		response = "pdr_level_helmgart_military_spotting_portal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_spotting_portal"
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
				"time_since_helmgart_military_spotting_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_spotting_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_helmgart_military_a",
		response = "pdr_helmgart_military_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"helmgart_military_a"
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
				"helmgart_military_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_helmgart_military_b",
		response = "pdr_helmgart_military_b",
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
				"helmgart_military_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"helmgart_military_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_helmgart_military_c",
		response = "pdr_helmgart_military_c",
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
				"helmgart_military_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"helmgart_military_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_level_helmgart_military_halfway_through_horde = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_halfway_through_horde_01",
				"pdr_level_helmgart_military_halfway_through_horde_02",
				"pdr_level_helmgart_military_halfway_through_horde_03",
				"pdr_level_helmgart_military_halfway_through_horde_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.6504166126251,
				2.2209792137146,
				3.2572290897369,
				4.0632290840149
			},
			localization_strings = {
				"pdr_level_helmgart_military_halfway_through_horde_01",
				"pdr_level_helmgart_military_halfway_through_horde_02",
				"pdr_level_helmgart_military_halfway_through_horde_03",
				"pdr_level_helmgart_military_halfway_through_horde_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_fort_massacre = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_fort_massacre_01",
				"pdr_level_helmgart_military_fort_massacre_02",
				"pdr_level_helmgart_military_fort_massacre_03",
				"pdr_level_helmgart_military_fort_massacre_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.4055416584015,
				3.1494791507721,
				5.068874835968,
				3.807874917984
			},
			localization_strings = {
				"pdr_level_helmgart_military_fort_massacre_01",
				"pdr_level_helmgart_military_fort_massacre_02",
				"pdr_level_helmgart_military_fort_massacre_03",
				"pdr_level_helmgart_military_fort_massacre_04"
			},
			randomize_indexes = {}
		},
		pdr_helmgart_military_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_helmgart_military_intro_c_01",
				[2.0] = "pdr_helmgart_military_intro_c_02"
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
				[1.0] = 2.8516042232513,
				[2.0] = 3.3132500648499
			},
			localization_strings = {
				[1.0] = "pdr_helmgart_military_intro_c_01",
				[2.0] = "pdr_helmgart_military_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_helmgart_military_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_helmgart_military_intro_b_01",
				[2.0] = "pdr_helmgart_military_intro_b_02"
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
				[1.0] = 3.3209166526794,
				[2.0] = 5.7253127098083
			},
			localization_strings = {
				[1.0] = "pdr_helmgart_military_intro_b_01",
				[2.0] = "pdr_helmgart_military_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_oops = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_oops_01",
				"pdr_level_helmgart_military_oops_02",
				"pdr_level_helmgart_military_oops_03",
				"pdr_level_helmgart_military_oops_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.783499956131,
				3.8408124446869,
				3.8138749599457,
				3.4762291908264
			},
			localization_strings = {
				"pdr_level_helmgart_military_oops_01",
				"pdr_level_helmgart_military_oops_02",
				"pdr_level_helmgart_military_oops_03",
				"pdr_level_helmgart_military_oops_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_turn_cannon = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_turn_cannon_01",
				"pdr_level_helmgart_military_turn_cannon_02",
				"pdr_level_helmgart_military_turn_cannon_03",
				"pdr_level_helmgart_military_turn_cannon_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.8270831108093,
				4.0190415382385,
				4.0926876068115,
				4.4005417823792
			},
			localization_strings = {
				"pdr_level_helmgart_military_turn_cannon_01",
				"pdr_level_helmgart_military_turn_cannon_02",
				"pdr_level_helmgart_military_turn_cannon_03",
				"pdr_level_helmgart_military_turn_cannon_04"
			},
			randomize_indexes = {}
		},
		pdr_helmgart_military_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_helmgart_military_intro_a_01",
				[2.0] = "pdr_helmgart_military_intro_a_02"
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
				[1.0] = 4.3597083091736,
				[2.0] = 3.6905417442322
			},
			localization_strings = {
				[1.0] = "pdr_helmgart_military_intro_a_01",
				[2.0] = "pdr_helmgart_military_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_ring_bell = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_ring_bell_01",
				"pdr_level_helmgart_military_ring_bell_02",
				"pdr_level_helmgart_military_ring_bell_03",
				"pdr_level_helmgart_military_ring_bell_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.1650416851044,
				2.6662499904633,
				3.4975416660309,
				2.9554374217987
			},
			localization_strings = {
				"pdr_level_helmgart_military_ring_bell_01",
				"pdr_level_helmgart_military_ring_bell_02",
				"pdr_level_helmgart_military_ring_bell_03",
				"pdr_level_helmgart_military_ring_bell_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_spooky_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_spooky_temple_01",
				"pdr_level_helmgart_military_spooky_temple_02",
				"pdr_level_helmgart_military_spooky_temple_03",
				"pdr_level_helmgart_military_spooky_temple_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.5793541669846,
				1.4987708330154,
				2.2700834274292,
				2.0015416145325
			},
			localization_strings = {
				"pdr_level_helmgart_military_spooky_temple_01",
				"pdr_level_helmgart_military_spooky_temple_02",
				"pdr_level_helmgart_military_spooky_temple_03",
				"pdr_level_helmgart_military_spooky_temple_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_fort_help = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_fort_help_01",
				"pdr_level_helmgart_military_fort_help_02",
				"pdr_level_helmgart_military_fort_help_03",
				"pdr_level_helmgart_military_fort_help_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.1632289886475,
				3.55433344841,
				3.6725625991821,
				4.8908333778381
			},
			localization_strings = {
				"pdr_level_helmgart_military_fort_help_01",
				"pdr_level_helmgart_military_fort_help_02",
				"pdr_level_helmgart_military_fort_help_03",
				"pdr_level_helmgart_military_fort_help_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_they_are_coming = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_they_are_coming_01",
				"pdr_level_helmgart_military_they_are_coming_02",
				"pdr_level_helmgart_military_they_are_coming_03",
				"pdr_level_helmgart_military_they_are_coming_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.2921042442322,
				4.230103969574,
				4.7291874885559,
				4.3141875267029
			},
			localization_strings = {
				"pdr_level_helmgart_military_they_are_coming_01",
				"pdr_level_helmgart_military_they_are_coming_02",
				"pdr_level_helmgart_military_they_are_coming_03",
				"pdr_level_helmgart_military_they_are_coming_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_armoury = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_armoury_01",
				"pdr_level_helmgart_military_armoury_02",
				"pdr_level_helmgart_military_armoury_03",
				"pdr_level_helmgart_military_armoury_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.7424790859222,
				1.6998332738876,
				2.2062292098999,
				3.2492084503174
			},
			localization_strings = {
				"pdr_level_helmgart_military_armoury_01",
				"pdr_level_helmgart_military_armoury_02",
				"pdr_level_helmgart_military_armoury_03",
				"pdr_level_helmgart_military_armoury_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_axebite_pass_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_axebite_pass_vista_01",
				"pdr_level_helmgart_military_axebite_pass_vista_02",
				"pdr_level_helmgart_military_axebite_pass_vista_03",
				"pdr_level_helmgart_military_axebite_pass_vista_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				5.0850210189819,
				8.2408542633057,
				11.097062110901,
				4.9246668815613
			},
			localization_strings = {
				"pdr_level_helmgart_military_axebite_pass_vista_01",
				"pdr_level_helmgart_military_axebite_pass_vista_02",
				"pdr_level_helmgart_military_axebite_pass_vista_03",
				"pdr_level_helmgart_military_axebite_pass_vista_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_fort_elevator = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_fort_elevator_01",
				"pdr_level_helmgart_military_fort_elevator_02",
				"pdr_level_helmgart_military_fort_elevator_03",
				"pdr_level_helmgart_military_fort_elevator_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.9000833034515,
				2.8421459197998,
				3.7151458263397,
				2.7948334217072
			},
			localization_strings = {
				"pdr_level_helmgart_military_fort_elevator_01",
				"pdr_level_helmgart_military_fort_elevator_02",
				"pdr_level_helmgart_military_fort_elevator_03",
				"pdr_level_helmgart_military_fort_elevator_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_pilgrim_path = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_pilgrim_path_01",
				"pdr_level_helmgart_military_pilgrim_path_02",
				"pdr_level_helmgart_military_pilgrim_path_03",
				"pdr_level_helmgart_military_pilgrim_path_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.8602707386017,
				2.7398333549499,
				2.212833404541,
				1.4346874952316
			},
			localization_strings = {
				"pdr_level_helmgart_military_pilgrim_path_01",
				"pdr_level_helmgart_military_pilgrim_path_02",
				"pdr_level_helmgart_military_pilgrim_path_03",
				"pdr_level_helmgart_military_pilgrim_path_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_door_opens = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_door_opens_01a",
				"pdr_level_helmgart_military_door_opens_02a",
				"pdr_level_helmgart_military_door_opens_03a",
				"pdr_level_helmgart_military_door_opens_04a"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.473708152771,
				4.4499998092651,
				4.6188960075378,
				4.0772500038147
			},
			localization_strings = {
				"pdr_level_helmgart_military_door_opens_01a",
				"pdr_level_helmgart_military_door_opens_02a",
				"pdr_level_helmgart_military_door_opens_03a",
				"pdr_level_helmgart_military_door_opens_04a"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_prepare = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_prepare_01",
				"pdr_level_helmgart_military_prepare_02",
				"pdr_level_helmgart_military_prepare_03",
				"pdr_level_helmgart_military_prepare_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.1219792366028,
				2.09375,
				4.6138334274292,
				3.98472905159
			},
			localization_strings = {
				"pdr_level_helmgart_military_prepare_01",
				"pdr_level_helmgart_military_prepare_02",
				"pdr_level_helmgart_military_prepare_03",
				"pdr_level_helmgart_military_prepare_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_courtyard_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_courtyard_event_01",
				"pdr_level_helmgart_military_courtyard_event_02",
				"pdr_level_helmgart_military_courtyard_event_03",
				"pdr_level_helmgart_military_courtyard_event_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.7634792327881,
				5.0606250762939,
				2.527583360672,
				4.9257707595825
			},
			localization_strings = {
				"pdr_level_helmgart_military_courtyard_event_01",
				"pdr_level_helmgart_military_courtyard_event_02",
				"pdr_level_helmgart_military_courtyard_event_03",
				"pdr_level_helmgart_military_courtyard_event_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_locked_portcullis = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_locked_portcullis_01",
				"pdr_level_helmgart_military_locked_portcullis_02",
				"pdr_level_helmgart_military_locked_portcullis_03",
				"pdr_level_helmgart_military_locked_portcullis_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.3161873817444,
				1.9416667222977,
				5.2151875495911,
				2.7068750858307
			},
			localization_strings = {
				"pdr_level_helmgart_military_locked_portcullis_01",
				"pdr_level_helmgart_military_locked_portcullis_02",
				"pdr_level_helmgart_military_locked_portcullis_03",
				"pdr_level_helmgart_military_locked_portcullis_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_arriving_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_arriving_temple_01",
				"pdr_level_helmgart_military_arriving_temple_02",
				"pdr_level_helmgart_military_arriving_temple_03",
				"pdr_level_helmgart_military_arriving_temple_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.8265209197998,
				4.1285209655762,
				3.6482501029968,
				4.7797918319702
			},
			localization_strings = {
				"pdr_level_helmgart_military_arriving_temple_01",
				"pdr_level_helmgart_military_arriving_temple_02",
				"pdr_level_helmgart_military_arriving_temple_03",
				"pdr_level_helmgart_military_arriving_temple_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_spotting_portal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_spotting_portal_01",
				"pdr_level_helmgart_military_spotting_portal_02",
				"pdr_level_helmgart_military_spotting_portal_03",
				"pdr_level_helmgart_military_spotting_portal_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.3512709140778,
				1.7602291107178,
				3.8215415477753,
				2.1849374771118
			},
			localization_strings = {
				"pdr_level_helmgart_military_spotting_portal_01",
				"pdr_level_helmgart_military_spotting_portal_02",
				"pdr_level_helmgart_military_spotting_portal_03",
				"pdr_level_helmgart_military_spotting_portal_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_portcullis = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_portcullis_01",
				"pdr_level_helmgart_military_portcullis_02",
				"pdr_level_helmgart_military_portcullis_03",
				"pdr_level_helmgart_military_portcullis_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.2545416355133,
				3.6763958930969,
				4.2153749465942,
				3.487104177475
			},
			localization_strings = {
				"pdr_level_helmgart_military_portcullis_01",
				"pdr_level_helmgart_military_portcullis_02",
				"pdr_level_helmgart_military_portcullis_03",
				"pdr_level_helmgart_military_portcullis_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_fort_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_fort_entrance_01",
				"pdr_level_helmgart_military_fort_entrance_02",
				"pdr_level_helmgart_military_fort_entrance_03",
				"pdr_level_helmgart_military_fort_entrance_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.9667499065399,
				4.8744583129883,
				2.5120208263397,
				3.7325208187103
			},
			localization_strings = {
				"pdr_level_helmgart_military_fort_entrance_01",
				"pdr_level_helmgart_military_fort_entrance_02",
				"pdr_level_helmgart_military_fort_entrance_03",
				"pdr_level_helmgart_military_fort_entrance_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_temple_ahead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_temple_ahead_01",
				"pdr_level_helmgart_military_temple_ahead_02",
				"pdr_level_helmgart_military_temple_ahead_03",
				"pdr_level_helmgart_military_temple_ahead_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.4290208816528,
				2.6212708950043,
				2.5990624427795,
				1.7772083282471
			},
			localization_strings = {
				"pdr_level_helmgart_military_temple_ahead_01",
				"pdr_level_helmgart_military_temple_ahead_02",
				"pdr_level_helmgart_military_temple_ahead_03",
				"pdr_level_helmgart_military_temple_ahead_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_fire_cannon = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_fire_cannon_01",
				"pdr_level_helmgart_military_fire_cannon_02",
				"pdr_level_helmgart_military_fire_cannon_03",
				"pdr_level_helmgart_military_fire_cannon_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.6996665000916,
				2.2576875686645,
				2.8654375076294,
				3.758645772934
			},
			localization_strings = {
				"pdr_level_helmgart_military_fire_cannon_01",
				"pdr_level_helmgart_military_fire_cannon_02",
				"pdr_level_helmgart_military_fire_cannon_03",
				"pdr_level_helmgart_military_fire_cannon_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_time_to_leave = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_time_to_leave_01",
				"pdr_level_helmgart_military_time_to_leave_02",
				"pdr_level_helmgart_military_time_to_leave_03",
				"pdr_level_helmgart_military_time_to_leave_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				5.5093126296997,
				5.0837917327881,
				6.683021068573,
				3.0792291164398
			},
			localization_strings = {
				"pdr_level_helmgart_military_time_to_leave_01",
				"pdr_level_helmgart_military_time_to_leave_02",
				"pdr_level_helmgart_military_time_to_leave_03",
				"pdr_level_helmgart_military_time_to_leave_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_empty_town = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_empty_town_01",
				"pdr_level_helmgart_military_empty_town_02",
				"pdr_level_helmgart_military_empty_town_03",
				"pdr_level_helmgart_military_empty_town_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.7899582386017,
				4.7538747787476,
				5.3006458282471,
				3.3939790725708
			},
			localization_strings = {
				"pdr_level_helmgart_military_empty_town_01",
				"pdr_level_helmgart_military_empty_town_02",
				"pdr_level_helmgart_military_empty_town_03",
				"pdr_level_helmgart_military_empty_town_04"
			},
			randomize_indexes = {}
		},
		pdr_level_helmgart_military_helmgart_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_helmgart_military_helmgart_vista_01",
				"pdr_level_helmgart_military_helmgart_vista_02",
				"pdr_level_helmgart_military_helmgart_vista_03",
				"pdr_level_helmgart_military_helmgart_vista_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				5.886125087738,
				5.4511876106262,
				8.4974794387817,
				3.7999582290649
			},
			localization_strings = {
				"pdr_level_helmgart_military_helmgart_vista_01",
				"pdr_level_helmgart_military_helmgart_vista_02",
				"pdr_level_helmgart_military_helmgart_vista_03",
				"pdr_level_helmgart_military_helmgart_vista_04"
			},
			randomize_indexes = {}
		}
	})
end
