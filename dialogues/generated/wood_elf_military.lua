return function ()
	define_rule({
		name = "pwe_level_helmgart_military_empty_town",
		response = "pwe_level_helmgart_military_empty_town",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_fort_help",
		response = "pwe_level_helmgart_military_fort_help",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_fort_entrance",
		response = "pwe_level_helmgart_military_fort_entrance",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_fort_massacre",
		response = "pwe_level_helmgart_military_fort_massacre",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_fort_elevator",
		response = "pwe_level_helmgart_military_fort_elevator",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_armoury",
		response = "pwe_level_helmgart_military_armoury",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_portcullis",
		response = "pwe_level_helmgart_military_portcullis",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_courtyard_event",
		response = "pwe_level_helmgart_military_courtyard_event",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_axebite_pass_vista",
		response = "pwe_level_helmgart_military_axebite_pass_vista",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_helmgart_vista",
		response = "pwe_level_helmgart_military_helmgart_vista",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_locked_portcullis",
		response = "pwe_level_helmgart_military_locked_portcullis",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_turn_cannon",
		response = "pwe_level_helmgart_military_turn_cannon",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_fire_cannon",
		response = "pwe_level_helmgart_military_fire_cannon",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_oops",
		response = "pwe_level_helmgart_military_oops",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_temple_ahead",
		response = "pwe_level_helmgart_military_temple_ahead",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_pilgrim_path",
		response = "pwe_level_helmgart_military_pilgrim_path",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_helmgart_military_arriving_temple",
		response = "pwe_level_helmgart_military_arriving_temple",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_prepare",
		response = "pwe_level_helmgart_military_prepare",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_ring_bell",
		response = "pwe_level_helmgart_military_ring_bell",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_they_are_coming",
		response = "pwe_level_helmgart_military_they_are_coming",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_halfway_through_horde",
		response = "pwe_level_helmgart_military_halfway_through_horde",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_spooky_temple",
		response = "pwe_level_helmgart_military_spooky_temple",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_door_opens",
		response = "pwe_level_helmgart_military_door_opens",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_time_to_leave",
		response = "pwe_level_helmgart_military_time_to_leave",
		criterias = {
			{
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
		name = "pwe_level_helmgart_military_spotting_portal",
		response = "pwe_level_helmgart_military_spotting_portal",
		criterias = {
			{
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_helmgart_military_a",
		response = "pwe_helmgart_military_a",
		criterias = {
			{
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
		name = "pwe_helmgart_military_b",
		response = "pwe_helmgart_military_b",
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
				"wood_elf"
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
		name = "pwe_helmgart_military_c",
		response = "pwe_helmgart_military_c",
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
				"helmgart_military_c"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		pwe_level_helmgart_military_fort_help = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_fort_help_01",
				"pwe_level_helmgart_military_fort_help_02",
				"pwe_level_helmgart_military_fort_help_03",
				"pwe_level_helmgart_military_fort_help_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_fort_help_01",
				"pwe_level_helmgart_military_fort_help_02",
				"pwe_level_helmgart_military_fort_help_03",
				"pwe_level_helmgart_military_fort_help_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.6597499847412,
				3.6886875629425,
				4.0427918434143,
				4.2850623130798
			}
		},
		pwe_level_helmgart_military_fire_cannon = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_fire_cannon_01",
				"pwe_level_helmgart_military_fire_cannon_02",
				"pwe_level_helmgart_military_fire_cannon_03",
				"pwe_level_helmgart_military_fire_cannon_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_fire_cannon_01",
				"pwe_level_helmgart_military_fire_cannon_02",
				"pwe_level_helmgart_military_fire_cannon_03",
				"pwe_level_helmgart_military_fire_cannon_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.4308958053589,
				3.0527708530426,
				1.5434166193008,
				4.2070627212524
			}
		},
		pwe_level_helmgart_military_they_are_coming = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_they_are_coming_01",
				"pwe_level_helmgart_military_they_are_coming_02",
				"pwe_level_helmgart_military_they_are_coming_03",
				"pwe_level_helmgart_military_they_are_coming_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_they_are_coming_01",
				"pwe_level_helmgart_military_they_are_coming_02",
				"pwe_level_helmgart_military_they_are_coming_03",
				"pwe_level_helmgart_military_they_are_coming_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7464791536331,
				2.1730208396912,
				3.3851249217987,
				3.5206875801086
			}
		},
		pwe_level_helmgart_military_locked_portcullis = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_locked_portcullis_01",
				"pwe_level_helmgart_military_locked_portcullis_02",
				"pwe_level_helmgart_military_locked_portcullis_03",
				"pwe_level_helmgart_military_locked_portcullis_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_locked_portcullis_01",
				"pwe_level_helmgart_military_locked_portcullis_02",
				"pwe_level_helmgart_military_locked_portcullis_03",
				"pwe_level_helmgart_military_locked_portcullis_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.0090000629425,
				1.5492500066757,
				2.3741042613983,
				3.8501250743866
			}
		},
		pwe_level_helmgart_military_axebite_pass_vista = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_axebite_pass_vista_01",
				"pwe_level_helmgart_military_axebite_pass_vista_02",
				"pwe_level_helmgart_military_axebite_pass_vista_03",
				"pwe_level_helmgart_military_axebite_pass_vista_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_axebite_pass_vista_01",
				"pwe_level_helmgart_military_axebite_pass_vista_02",
				"pwe_level_helmgart_military_axebite_pass_vista_03",
				"pwe_level_helmgart_military_axebite_pass_vista_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.4503960609436,
				5.0432710647583,
				9.1000003814697,
				7.5337710380554
			}
		},
		pwe_level_helmgart_military_spotting_portal = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_spotting_portal_01",
				"pwe_level_helmgart_military_spotting_portal_02",
				"pwe_level_helmgart_military_spotting_portal_03",
				"pwe_level_helmgart_military_spotting_portal_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_spotting_portal_01",
				"pwe_level_helmgart_military_spotting_portal_02",
				"pwe_level_helmgart_military_spotting_portal_03",
				"pwe_level_helmgart_military_spotting_portal_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.7794375419617,
				3.0397083759308,
				4.1134376525879,
				2.7204167842865
			}
		},
		pwe_level_helmgart_military_spooky_temple = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_spooky_temple_01",
				"pwe_level_helmgart_military_spooky_temple_02",
				"pwe_level_helmgart_military_spooky_temple_03",
				"pwe_level_helmgart_military_spooky_temple_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_spooky_temple_01",
				"pwe_level_helmgart_military_spooky_temple_02",
				"pwe_level_helmgart_military_spooky_temple_03",
				"pwe_level_helmgart_military_spooky_temple_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1276457309723,
				2.9454166889191,
				3.6935207843781,
				2.6070625782013
			}
		},
		pwe_level_helmgart_military_halfway_through_horde = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_halfway_through_horde_01",
				"pwe_level_helmgart_military_halfway_through_horde_02",
				"pwe_level_helmgart_military_halfway_through_horde_03",
				"pwe_level_helmgart_military_halfway_through_horde_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_halfway_through_horde_01",
				"pwe_level_helmgart_military_halfway_through_horde_02",
				"pwe_level_helmgart_military_halfway_through_horde_03",
				"pwe_level_helmgart_military_halfway_through_horde_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7365208864212,
				3.5887084007263,
				3.5839791297913,
				4.0229997634888
			}
		},
		pwe_level_helmgart_military_empty_town = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_empty_town_01",
				"pwe_level_helmgart_military_empty_town_02",
				"pwe_level_helmgart_military_empty_town_03",
				"pwe_level_helmgart_military_empty_town_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_empty_town_01",
				"pwe_level_helmgart_military_empty_town_02",
				"pwe_level_helmgart_military_empty_town_03",
				"pwe_level_helmgart_military_empty_town_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8010001182556,
				4.3311877250671,
				2.7167499065399,
				5.5278539657593
			}
		},
		pwe_level_helmgart_military_oops = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_oops_01",
				"pwe_level_helmgart_military_oops_02",
				"pwe_level_helmgart_military_oops_03",
				"pwe_level_helmgart_military_oops_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_oops_01",
				"pwe_level_helmgart_military_oops_02",
				"pwe_level_helmgart_military_oops_03",
				"pwe_level_helmgart_military_oops_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.7677707672119,
				5.3242502212524,
				3.0059790611267,
				7.1480627059936
			}
		},
		pwe_helmgart_military_b = {
			face_animations_n = 2,
			database = "wood_elf_military",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_helmgart_military_intro_b_01",
				[2.0] = "pwe_helmgart_military_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwe_helmgart_military_intro_b_01",
				[2.0] = "pwe_helmgart_military_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.4080414772034,
				[2.0] = 5.1513543128967
			}
		},
		pwe_level_helmgart_military_door_opens = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_door_opens_01",
				"pwe_level_helmgart_military_door_opens_02",
				"pwe_level_helmgart_military_door_opens_03",
				"pwe_level_helmgart_military_door_opens_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_door_opens_01",
				"pwe_level_helmgart_military_door_opens_02",
				"pwe_level_helmgart_military_door_opens_03",
				"pwe_level_helmgart_military_door_opens_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.5517499446869,
				3.049124956131,
				2.5999999046326,
				2.7028748989105
			}
		},
		pwe_helmgart_military_a = {
			face_animations_n = 2,
			database = "wood_elf_military",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_helmgart_military_intro_a_01",
				[2.0] = "pwe_helmgart_military_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwe_helmgart_military_intro_a_01",
				[2.0] = "pwe_helmgart_military_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.6165623664856,
				[2.0] = 4.5051875114441
			}
		},
		pwe_level_helmgart_military_time_to_leave = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_time_to_leave_01",
				"pwe_level_helmgart_military_time_to_leave_02",
				"pwe_level_helmgart_military_time_to_leave_03",
				"pwe_level_helmgart_military_time_to_leave_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_time_to_leave_01",
				"pwe_level_helmgart_military_time_to_leave_02",
				"pwe_level_helmgart_military_time_to_leave_03",
				"pwe_level_helmgart_military_time_to_leave_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.3039999008179,
				3.1058542728424,
				3.5761041641235,
				2.7454166412353
			}
		},
		pwe_level_helmgart_military_helmgart_vista = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_helmgart_vista_01",
				"pwe_level_helmgart_military_helmgart_vista_02",
				"pwe_level_helmgart_military_helmgart_vista_03",
				"pwe_level_helmgart_military_helmgart_vista_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_helmgart_vista_01",
				"pwe_level_helmgart_military_helmgart_vista_02",
				"pwe_level_helmgart_military_helmgart_vista_03",
				"pwe_level_helmgart_military_helmgart_vista_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.044145822525,
				3.5854375362396,
				2.9101042747498,
				6.2515830993652
			}
		},
		pwe_level_helmgart_military_arriving_temple = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_arriving_temple_01",
				"pwe_level_helmgart_military_arriving_temple_02",
				"pwe_level_helmgart_military_arriving_temple_03",
				"pwe_level_helmgart_military_arriving_temple_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_arriving_temple_01",
				"pwe_level_helmgart_military_arriving_temple_02",
				"pwe_level_helmgart_military_arriving_temple_03",
				"pwe_level_helmgart_military_arriving_temple_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1327707767487,
				4.0078125,
				5.9201664924622,
				3.6722707748413
			}
		},
		pwe_level_helmgart_military_fort_elevator = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_fort_elevator_01",
				"pwe_level_helmgart_military_fort_elevator_02",
				"pwe_level_helmgart_military_fort_elevator_03",
				"pwe_level_helmgart_military_fort_elevator_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_fort_elevator_01",
				"pwe_level_helmgart_military_fort_elevator_02",
				"pwe_level_helmgart_military_fort_elevator_03",
				"pwe_level_helmgart_military_fort_elevator_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.920458316803,
				3.3783333301544,
				5.2942914962769,
				2.4809582233429
			}
		},
		pwe_helmgart_military_c = {
			face_animations_n = 2,
			database = "wood_elf_military",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_helmgart_military_intro_c_01",
				[2.0] = "pwe_helmgart_military_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwe_helmgart_military_intro_c_01",
				[2.0] = "pwe_helmgart_military_intro_c_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.5551458597183,
				[2.0] = 2.9821457862854
			}
		},
		pwe_level_helmgart_military_ring_bell = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_ring_bell_01",
				"pwe_level_helmgart_military_ring_bell_02",
				"pwe_level_helmgart_military_ring_bell_03",
				"pwe_level_helmgart_military_ring_bell_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_ring_bell_01",
				"pwe_level_helmgart_military_ring_bell_02",
				"pwe_level_helmgart_military_ring_bell_03",
				"pwe_level_helmgart_military_ring_bell_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1982500553131,
				3.9574999809265,
				2.3229374885559,
				4.949812412262
			}
		},
		pwe_level_helmgart_military_prepare = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_prepare_01",
				"pwe_level_helmgart_military_prepare_02",
				"pwe_level_helmgart_military_prepare_03",
				"pwe_level_helmgart_military_prepare_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_prepare_01",
				"pwe_level_helmgart_military_prepare_02",
				"pwe_level_helmgart_military_prepare_03",
				"pwe_level_helmgart_military_prepare_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.1190209388733,
				4.8469166755676,
				2.4853541851044,
				1.8043124675751
			}
		},
		pwe_level_helmgart_military_pilgrim_path = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_pilgrim_path_01",
				"pwe_level_helmgart_military_pilgrim_path_02",
				"pwe_level_helmgart_military_pilgrim_path_03",
				"pwe_level_helmgart_military_pilgrim_path_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_pilgrim_path_01",
				"pwe_level_helmgart_military_pilgrim_path_02",
				"pwe_level_helmgart_military_pilgrim_path_03",
				"pwe_level_helmgart_military_pilgrim_path_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.75,
				2.8546042442322,
				1.8569166660309,
				3.3513958454132
			}
		},
		pwe_level_helmgart_military_fort_massacre = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_fort_massacre_01",
				"pwe_level_helmgart_military_fort_massacre_02",
				"pwe_level_helmgart_military_fort_massacre_03",
				"pwe_level_helmgart_military_fort_massacre_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_fort_massacre_01",
				"pwe_level_helmgart_military_fort_massacre_02",
				"pwe_level_helmgart_military_fort_massacre_03",
				"pwe_level_helmgart_military_fort_massacre_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.3127501010895,
				4.1511874198914,
				1.8237291574478,
				3.4890208244324
			}
		},
		pwe_level_helmgart_military_courtyard_event = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_courtyard_event_01",
				"pwe_level_helmgart_military_courtyard_event_02",
				"pwe_level_helmgart_military_courtyard_event_03",
				"pwe_level_helmgart_military_courtyard_event_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_courtyard_event_01",
				"pwe_level_helmgart_military_courtyard_event_02",
				"pwe_level_helmgart_military_courtyard_event_03",
				"pwe_level_helmgart_military_courtyard_event_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.8313958644867,
				2.447104215622,
				3.7882499694824,
				2.6161875724792
			}
		},
		pwe_level_helmgart_military_fort_entrance = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_fort_entrance_01",
				"pwe_level_helmgart_military_fort_entrance_02",
				"pwe_level_helmgart_military_fort_entrance_03",
				"pwe_level_helmgart_military_fort_entrance_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_fort_entrance_01",
				"pwe_level_helmgart_military_fort_entrance_02",
				"pwe_level_helmgart_military_fort_entrance_03",
				"pwe_level_helmgart_military_fort_entrance_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.1314167976379,
				5.5574793815613,
				3.5786874294281,
				2.6111249923706
			}
		},
		pwe_level_helmgart_military_armoury = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_armoury_01",
				"pwe_level_helmgart_military_armoury_02",
				"pwe_level_helmgart_military_armoury_03",
				"pwe_level_helmgart_military_armoury_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_armoury_01",
				"pwe_level_helmgart_military_armoury_02",
				"pwe_level_helmgart_military_armoury_03",
				"pwe_level_helmgart_military_armoury_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.0885832309723,
				2.5215208530426,
				2.15625,
				2.1229584217072
			}
		},
		pwe_level_helmgart_military_turn_cannon = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_turn_cannon_01",
				"pwe_level_helmgart_military_turn_cannon_02",
				"pwe_level_helmgart_military_turn_cannon_03",
				"pwe_level_helmgart_military_turn_cannon_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_turn_cannon_01",
				"pwe_level_helmgart_military_turn_cannon_02",
				"pwe_level_helmgart_military_turn_cannon_03",
				"pwe_level_helmgart_military_turn_cannon_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				6.7195625305176,
				4.6693539619446,
				4.9003748893738,
				4.9588751792908
			}
		},
		pwe_level_helmgart_military_temple_ahead = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_temple_ahead_01",
				"pwe_level_helmgart_military_temple_ahead_02",
				"pwe_level_helmgart_military_temple_ahead_03",
				"pwe_level_helmgart_military_temple_ahead_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_temple_ahead_01",
				"pwe_level_helmgart_military_temple_ahead_02",
				"pwe_level_helmgart_military_temple_ahead_03",
				"pwe_level_helmgart_military_temple_ahead_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.3574374914169,
				4.6707501411438,
				3.5006248950958,
				3.5723958015442
			}
		},
		pwe_level_helmgart_military_portcullis = {
			face_animations_n = 4,
			database = "wood_elf_military",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_level_helmgart_military_portcullis_01",
				"pwe_level_helmgart_military_portcullis_02",
				"pwe_level_helmgart_military_portcullis_03",
				"pwe_level_helmgart_military_portcullis_04"
			},
			sound_events = {
				"pwe_level_helmgart_military_portcullis_01",
				"pwe_level_helmgart_military_portcullis_02",
				"pwe_level_helmgart_military_portcullis_03",
				"pwe_level_helmgart_military_portcullis_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.4766664505005,
				4.6113543510437,
				5,
				4.331437587738
			}
		}
	})
end
