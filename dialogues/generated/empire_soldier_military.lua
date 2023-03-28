return function ()
	define_rule({
		name = "pes_level_helmgart_military_empty_town",
		response = "pes_level_helmgart_military_empty_town",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_fort_help",
		response = "pes_level_helmgart_military_fort_help",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_fort_entrance",
		response = "pes_level_helmgart_military_fort_entrance",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_fort_massacre",
		response = "pes_level_helmgart_military_fort_massacre",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_fort_elevator",
		response = "pes_level_helmgart_military_fort_elevator",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_armoury",
		response = "pes_level_helmgart_military_armoury",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_portcullis",
		response = "pes_level_helmgart_military_portcullis",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_courtyard_event",
		response = "pes_level_helmgart_military_courtyard_event",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_axebite_pass_vista",
		response = "pes_level_helmgart_military_axebite_pass_vista",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_helmgart_vista",
		response = "pes_level_helmgart_military_helmgart_vista",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_locked_portcullis",
		response = "pes_level_helmgart_military_locked_portcullis",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_turn_cannon",
		response = "pes_level_helmgart_military_turn_cannon",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_fire_cannon",
		response = "pes_level_helmgart_military_fire_cannon",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_oops",
		response = "pes_level_helmgart_military_oops",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_temple_ahead",
		response = "pes_level_helmgart_military_temple_ahead",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_pilgrim_path",
		response = "pes_level_helmgart_military_pilgrim_path",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_helmgart_military_arriving_temple",
		response = "pes_level_helmgart_military_arriving_temple",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_prepare",
		response = "pes_level_helmgart_military_prepare",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_ring_bell",
		response = "pes_level_helmgart_military_ring_bell",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_they_are_coming",
		response = "pes_level_helmgart_military_they_are_coming",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_halfway_through_horde",
		response = "pes_level_helmgart_military_halfway_through_horde",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_spooky_temple",
		response = "pes_level_helmgart_military_spooky_temple",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_door_opens",
		response = "pes_level_helmgart_military_door_opens",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_time_to_leave",
		response = "pes_level_helmgart_military_time_to_leave",
		criterias = {
			{
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
		name = "pes_level_helmgart_military_spotting_portal",
		response = "pes_level_helmgart_military_spotting_portal",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_helmgart_military_a",
		response = "pes_helmgart_military_a",
		criterias = {
			{
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
		name = "pes_helmgart_military_b",
		response = "pes_helmgart_military_b",
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
				"empire_soldier"
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
		name = "pes_helmgart_military_c",
		response = "pes_helmgart_military_c",
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
				"empire_soldier"
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
		pes_level_helmgart_military_halfway_through_horde = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_halfway_through_horde_01",
				"pes_level_helmgart_military_halfway_through_horde_02",
				"pes_level_helmgart_military_halfway_through_horde_03",
				"pes_level_helmgart_military_halfway_through_horde_04"
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
				1.5057708024979,
				1.2655416727066,
				1.2520416975021,
				1.5326042175293
			},
			localization_strings = {
				"pes_level_helmgart_military_halfway_through_horde_01",
				"pes_level_helmgart_military_halfway_through_horde_02",
				"pes_level_helmgart_military_halfway_through_horde_03",
				"pes_level_helmgart_military_halfway_through_horde_04"
			},
			randomize_indexes = {}
		},
		pes_helmgart_military_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_helmgart_military_intro_a_01",
				[2.0] = "pes_helmgart_military_intro_a_02"
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
				[1.0] = 2.6195416450501,
				[2.0] = 3.960104227066
			},
			localization_strings = {
				[1.0] = "pes_helmgart_military_intro_a_01",
				[2.0] = "pes_helmgart_military_intro_a_02"
			},
			randomize_indexes = {}
		},
		pes_helmgart_military_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_helmgart_military_intro_c_01",
				[2.0] = "pes_helmgart_military_intro_c_02"
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
				[1.0] = 1.9281250238419,
				[2.0] = 2.9882917404175
			},
			localization_strings = {
				[1.0] = "pes_helmgart_military_intro_c_01",
				[2.0] = "pes_helmgart_military_intro_c_02"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_fort_massacre = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_fort_massacre_01",
				"pes_level_helmgart_military_fort_massacre_02",
				"pes_level_helmgart_military_fort_massacre_03",
				"pes_level_helmgart_military_fort_massacre_04"
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
				4.0517501831055,
				2.9146249294281,
				3.0434582233429,
				5.2572813034058
			},
			localization_strings = {
				"pes_level_helmgart_military_fort_massacre_01",
				"pes_level_helmgart_military_fort_massacre_02",
				"pes_level_helmgart_military_fort_massacre_03",
				"pes_level_helmgart_military_fort_massacre_04"
			},
			randomize_indexes = {}
		},
		pes_helmgart_military_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_helmgart_military_intro_b_01",
				[2.0] = "pes_helmgart_military_intro_b_02"
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
				[1.0] = 6.4581665992737,
				[2.0] = 3.9500000476837
			},
			localization_strings = {
				[1.0] = "pes_helmgart_military_intro_b_01",
				[2.0] = "pes_helmgart_military_intro_b_02"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_spotting_portal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_spotting_portal_01",
				"pes_level_helmgart_military_spotting_portal_02",
				"pes_level_helmgart_military_spotting_portal_03",
				"pes_level_helmgart_military_spotting_portal_04"
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
				1.7534583806992,
				2.7433958053589,
				2.1429998874664,
				3.738041639328
			},
			localization_strings = {
				"pes_level_helmgart_military_spotting_portal_01",
				"pes_level_helmgart_military_spotting_portal_02",
				"pes_level_helmgart_military_spotting_portal_03",
				"pes_level_helmgart_military_spotting_portal_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_empty_town = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_empty_town_01",
				"pes_level_helmgart_military_empty_town_02",
				"pes_level_helmgart_military_empty_town_03",
				"pes_level_helmgart_military_empty_town_04"
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
				4.4623332023621,
				3.794041633606,
				3.3384375572205,
				2.7131667137146
			},
			localization_strings = {
				"pes_level_helmgart_military_empty_town_01",
				"pes_level_helmgart_military_empty_town_02",
				"pes_level_helmgart_military_empty_town_03",
				"pes_level_helmgart_military_empty_town_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_oops = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_oops_01",
				"pes_level_helmgart_military_oops_02",
				"pes_level_helmgart_military_oops_03",
				"pes_level_helmgart_military_oops_04"
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
				2.7393751144409,
				2.804406285286,
				2.5625624656677,
				2.5578334331513
			},
			localization_strings = {
				"pes_level_helmgart_military_oops_01",
				"pes_level_helmgart_military_oops_02",
				"pes_level_helmgart_military_oops_03",
				"pes_level_helmgart_military_oops_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_fort_help = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_fort_help_01",
				"pes_level_helmgart_military_fort_help_02",
				"pes_level_helmgart_military_fort_help_03",
				"pes_level_helmgart_military_fort_help_04"
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
				3.920562505722,
				3.0186667442322,
				3.1230416297913,
				4.2566041946411
			},
			localization_strings = {
				"pes_level_helmgart_military_fort_help_01",
				"pes_level_helmgart_military_fort_help_02",
				"pes_level_helmgart_military_fort_help_03",
				"pes_level_helmgart_military_fort_help_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_they_are_coming = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_they_are_coming_01",
				"pes_level_helmgart_military_they_are_coming_02",
				"pes_level_helmgart_military_they_are_coming_03",
				"pes_level_helmgart_military_they_are_coming_04"
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
				1.9290624856949,
				1.7779582738876,
				2.0611978769302,
				2.0568332672119
			},
			localization_strings = {
				"pes_level_helmgart_military_they_are_coming_01",
				"pes_level_helmgart_military_they_are_coming_02",
				"pes_level_helmgart_military_they_are_coming_03",
				"pes_level_helmgart_military_they_are_coming_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_armoury = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_armoury_01",
				"pes_level_helmgart_military_armoury_02",
				"pes_level_helmgart_military_armoury_03",
				"pes_level_helmgart_military_armoury_04"
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
				2.546875,
				2.5120208263397,
				3.0443959236145,
				3.0254583358765
			},
			localization_strings = {
				"pes_level_helmgart_military_armoury_01",
				"pes_level_helmgart_military_armoury_02",
				"pes_level_helmgart_military_armoury_03",
				"pes_level_helmgart_military_armoury_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_spooky_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_spooky_temple_01",
				"pes_level_helmgart_military_spooky_temple_02",
				"pes_level_helmgart_military_spooky_temple_03",
				"pes_level_helmgart_military_spooky_temple_04"
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
				1.2000000476837,
				2.295104265213,
				1.4128333330154,
				2.949697971344
			},
			localization_strings = {
				"pes_level_helmgart_military_spooky_temple_01",
				"pes_level_helmgart_military_spooky_temple_02",
				"pes_level_helmgart_military_spooky_temple_03",
				"pes_level_helmgart_military_spooky_temple_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_door_opens = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_door_opens_01a",
				"pes_level_helmgart_military_door_opens_02a",
				"pes_level_helmgart_military_door_opens_03a",
				"pes_level_helmgart_military_door_opens_04a"
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
				4.6726977825165,
				3.3093228340149,
				4.4453021287918,
				2.5504167079926
			},
			localization_strings = {
				"pes_level_helmgart_military_door_opens_01a",
				"pes_level_helmgart_military_door_opens_02a",
				"pes_level_helmgart_military_door_opens_03a",
				"pes_level_helmgart_military_door_opens_04a"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_axebite_pass_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_axebite_pass_vista_01",
				"pes_level_helmgart_military_axebite_pass_vista_02",
				"pes_level_helmgart_military_axebite_pass_vista_03",
				"pes_level_helmgart_military_axebite_pass_vista_04"
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
				4.7781248092651,
				7.0944790840149,
				5.0186877250671,
				5.3822917938232
			},
			localization_strings = {
				"pes_level_helmgart_military_axebite_pass_vista_01",
				"pes_level_helmgart_military_axebite_pass_vista_02",
				"pes_level_helmgart_military_axebite_pass_vista_03",
				"pes_level_helmgart_military_axebite_pass_vista_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_courtyard_event = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_courtyard_event_01",
				"pes_level_helmgart_military_courtyard_event_02",
				"pes_level_helmgart_military_courtyard_event_03",
				"pes_level_helmgart_military_courtyard_event_04"
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
				3.0221667289734,
				1.4870208501816,
				2.0821874141693,
				2.9092292785645
			},
			localization_strings = {
				"pes_level_helmgart_military_courtyard_event_01",
				"pes_level_helmgart_military_courtyard_event_02",
				"pes_level_helmgart_military_courtyard_event_03",
				"pes_level_helmgart_military_courtyard_event_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_prepare = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_prepare_01",
				"pes_level_helmgart_military_prepare_02",
				"pes_level_helmgart_military_prepare_03",
				"pes_level_helmgart_military_prepare_04"
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
				1.987520813942,
				3.4376249313355,
				2.6674165725708,
				1.0149999856949
			},
			localization_strings = {
				"pes_level_helmgart_military_prepare_01",
				"pes_level_helmgart_military_prepare_02",
				"pes_level_helmgart_military_prepare_03",
				"pes_level_helmgart_military_prepare_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_ring_bell = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_ring_bell_01",
				"pes_level_helmgart_military_ring_bell_02",
				"pes_level_helmgart_military_ring_bell_03",
				"pes_level_helmgart_military_ring_bell_04"
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
				3.0700623989105,
				1.3692708015442,
				3.3825833797455,
				1.7938541173935
			},
			localization_strings = {
				"pes_level_helmgart_military_ring_bell_01",
				"pes_level_helmgart_military_ring_bell_02",
				"pes_level_helmgart_military_ring_bell_03",
				"pes_level_helmgart_military_ring_bell_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_arriving_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_arriving_temple_01",
				"pes_level_helmgart_military_arriving_temple_02",
				"pes_level_helmgart_military_arriving_temple_03",
				"pes_level_helmgart_military_arriving_temple_04"
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
				3.6907708644867,
				2.019291639328,
				2.5340209007263,
				4.380437374115
			},
			localization_strings = {
				"pes_level_helmgart_military_arriving_temple_01",
				"pes_level_helmgart_military_arriving_temple_02",
				"pes_level_helmgart_military_arriving_temple_03",
				"pes_level_helmgart_military_arriving_temple_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_pilgrim_path = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_pilgrim_path_01",
				"pes_level_helmgart_military_pilgrim_path_02",
				"pes_level_helmgart_military_pilgrim_path_03",
				"pes_level_helmgart_military_pilgrim_path_04"
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
				2.6423542499542,
				1.8477292060852,
				2.5705416202545,
				2.5733542442322
			},
			localization_strings = {
				"pes_level_helmgart_military_pilgrim_path_01",
				"pes_level_helmgart_military_pilgrim_path_02",
				"pes_level_helmgart_military_pilgrim_path_03",
				"pes_level_helmgart_military_pilgrim_path_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_locked_portcullis = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_locked_portcullis_01",
				"pes_level_helmgart_military_locked_portcullis_02",
				"pes_level_helmgart_military_locked_portcullis_03",
				"pes_level_helmgart_military_locked_portcullis_04"
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
				1.7193332910538,
				1.316583275795,
				3.9468958377838,
				1.7653125524521
			},
			localization_strings = {
				"pes_level_helmgart_military_locked_portcullis_01",
				"pes_level_helmgart_military_locked_portcullis_02",
				"pes_level_helmgart_military_locked_portcullis_03",
				"pes_level_helmgart_military_locked_portcullis_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_helmgart_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_helmgart_vista_01",
				"pes_level_helmgart_military_helmgart_vista_02",
				"pes_level_helmgart_military_helmgart_vista_03",
				"pes_level_helmgart_military_helmgart_vista_04"
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
				3.6853957176209,
				3.3375625610352,
				5.8107709884644,
				3.3326876163483
			},
			localization_strings = {
				"pes_level_helmgart_military_helmgart_vista_01",
				"pes_level_helmgart_military_helmgart_vista_02",
				"pes_level_helmgart_military_helmgart_vista_03",
				"pes_level_helmgart_military_helmgart_vista_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_fort_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_fort_entrance_01",
				"pes_level_helmgart_military_fort_entrance_02",
				"pes_level_helmgart_military_fort_entrance_03",
				"pes_level_helmgart_military_fort_entrance_04"
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
				2.1697707176209,
				2.3151249885559,
				2.2312707901001,
				2.6413333415985
			},
			localization_strings = {
				"pes_level_helmgart_military_fort_entrance_01",
				"pes_level_helmgart_military_fort_entrance_02",
				"pes_level_helmgart_military_fort_entrance_03",
				"pes_level_helmgart_military_fort_entrance_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_portcullis = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_portcullis_01",
				"pes_level_helmgart_military_portcullis_02",
				"pes_level_helmgart_military_portcullis_03",
				"pes_level_helmgart_military_portcullis_04"
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
				2.7540624141693,
				1.4147917032242,
				1.4601666927338,
				2.5481667518616
			},
			localization_strings = {
				"pes_level_helmgart_military_portcullis_01",
				"pes_level_helmgart_military_portcullis_02",
				"pes_level_helmgart_military_portcullis_03",
				"pes_level_helmgart_military_portcullis_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_temple_ahead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_temple_ahead_01",
				"pes_level_helmgart_military_temple_ahead_02",
				"pes_level_helmgart_military_temple_ahead_03",
				"pes_level_helmgart_military_temple_ahead_04"
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
				2.8191249370575,
				1.5642708539963,
				2.4742708206177,
				1.9287291765213
			},
			localization_strings = {
				"pes_level_helmgart_military_temple_ahead_01",
				"pes_level_helmgart_military_temple_ahead_02",
				"pes_level_helmgart_military_temple_ahead_03",
				"pes_level_helmgart_military_temple_ahead_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_time_to_leave = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_time_to_leave_01",
				"pes_level_helmgart_military_time_to_leave_02",
				"pes_level_helmgart_military_time_to_leave_03",
				"pes_level_helmgart_military_time_to_leave_04"
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
				5.4650206565857,
				4.4015207290649,
				3.6196041107178,
				1.9530832767487
			},
			localization_strings = {
				"pes_level_helmgart_military_time_to_leave_01",
				"pes_level_helmgart_military_time_to_leave_02",
				"pes_level_helmgart_military_time_to_leave_03",
				"pes_level_helmgart_military_time_to_leave_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_turn_cannon = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_turn_cannon_01",
				"pes_level_helmgart_military_turn_cannon_02",
				"pes_level_helmgart_military_turn_cannon_03",
				"pes_level_helmgart_military_turn_cannon_04"
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
				2.5670626163483,
				2.4896667003632,
				2.8720624446869,
				3.5803959369659
			},
			localization_strings = {
				"pes_level_helmgart_military_turn_cannon_01",
				"pes_level_helmgart_military_turn_cannon_02",
				"pes_level_helmgart_military_turn_cannon_03",
				"pes_level_helmgart_military_turn_cannon_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_fort_elevator = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_fort_elevator_01",
				"pes_level_helmgart_military_fort_elevator_02",
				"pes_level_helmgart_military_fort_elevator_03",
				"pes_level_helmgart_military_fort_elevator_04"
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
				1.7029999494553,
				2.0194165706634,
				2.652937412262,
				2.5410625934601
			},
			localization_strings = {
				"pes_level_helmgart_military_fort_elevator_01",
				"pes_level_helmgart_military_fort_elevator_02",
				"pes_level_helmgart_military_fort_elevator_03",
				"pes_level_helmgart_military_fort_elevator_04"
			},
			randomize_indexes = {}
		},
		pes_level_helmgart_military_fire_cannon = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_military",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_helmgart_military_fire_cannon_01",
				"pes_level_helmgart_military_fire_cannon_02",
				"pes_level_helmgart_military_fire_cannon_03",
				"pes_level_helmgart_military_fire_cannon_04"
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
				2.4451251029968,
				2.2653748989105,
				2.016083240509,
				1.7268542051315
			},
			localization_strings = {
				"pes_level_helmgart_military_fire_cannon_01",
				"pes_level_helmgart_military_fire_cannon_02",
				"pes_level_helmgart_military_fire_cannon_03",
				"pes_level_helmgart_military_fire_cannon_04"
			},
			randomize_indexes = {}
		}
	})
end
