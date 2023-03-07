return function ()
	define_rule({
		name = "pdr_level_crawl_intro_a",
		response = "pdr_level_crawl_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_crawl_intro_a"
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
				"level_crawl_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_crawl_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_crawl_intro_b",
		response = "pdr_level_crawl_intro_b",
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
				"level_crawl_intro_a"
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
				"level_crawl_intro_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_crawl_intro_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_crawl_intro_c",
		response = "pdr_level_crawl_intro_c",
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
				"level_crawl_intro_b"
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
				"level_crawl_intro_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_crawl_intro_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_head_for_first_pub",
		response = "pdr_crawl_head_for_first_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_head_for_first_pub"
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
				"crawl_head_for_first_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_head_for_first_pub",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_spot_first_pub",
		response = "pdr_crawl_spot_first_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_first_pub"
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
				"crawl_spot_first_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_first_pub",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_spot_first_pub_closer",
		response = "pdr_crawl_spot_first_pub_closer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_first_pub_closer"
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
				"crawl_spot_first_pub_closer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_first_pub_closer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_old_path_blocked",
		response = "pdr_crawl_old_path_blocked",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_old_path_blocked"
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
				"crawl_old_path_blocked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_old_path_blocked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_shortcut",
		response = "pdr_crawl_shortcut",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_shortcut"
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
				"crawl_shortcut",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_shortcut",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_pub_brazers",
		response = "pdr_crawl_pub_brazers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_brazers"
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
				"crawl_pub_brazers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_brazers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_pub_door",
		response = "pdr_crawl_pub_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_door"
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
				"crawl_pub_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_pub_destroyed",
		response = "pdr_crawl_pub_destroyed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_destroyed"
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
				"crawl_pub_destroyed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_destroyed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_pub_horde_end",
		response = "pdr_crawl_pub_horde_end",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_horde_end"
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
				"crawl_pub_horde_end",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_head_for_second_pub",
		response = "pdr_crawl_head_for_second_pub",
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
				"crawl_pub_horde_end"
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
				"crawl_head_for_second_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_head_for_second_pub",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_tunnel_passage",
		response = "pdr_crawl_tunnel_passage",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_tunnel_passage"
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
				"crawl_tunnel_passage",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_tunnel_passage",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_mid_level_banter",
		response = "pdr_crawl_mid_level_banter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_mid_level_banter"
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
				"crawl_mid_level_banter",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_mid_level_banter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_pub_district_sign",
		response = "pdr_crawl_pub_district_sign",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_district_sign"
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
				"crawl_pub_district_sign",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_district_sign",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_spot_second_pub",
		response = "pdr_crawl_spot_second_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_second_pub"
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
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_have_a_drink",
		response = "pdr_crawl_have_a_drink",
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
				"crawl_spot_second_pub"
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
				"crawl_have_a_drink",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_have_a_drink",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_cheers",
		response = "pdr_crawl_cheers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_cheers"
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
				"crawl_cheers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_cheers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_heard_us",
		response = "pdr_crawl_heard_us",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_heard_us"
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
				"crawl_heard_us",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_heard_us",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.NUMSET,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_head_for_third_pub",
		response = "pdr_crawl_head_for_third_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_head_for_third_pub"
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
				"crawl_head_for_third_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_head_for_third_pub",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.NUMSET,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_slaughter",
		response = "pdr_crawl_slaughter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_slaughter"
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
				"crawl_slaughter",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_slaughter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_spot_third_pub",
		response = "pdr_crawl_spot_third_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_third_pub"
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
				"crawl_spot_third_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_get_into_third_pub",
		response = "pdr_crawl_get_into_third_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_get_into_third_pub"
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
				"crawl_get_into_third_pub",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_get_into_third_pub",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_end_event_keep_quiet",
		response = "pdr_crawl_end_event_keep_quiet",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_keep_quiet"
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
				"crawl_end_event_keep_quiet",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_keep_quiet",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_end_event_find_good_beer",
		response = "pdr_crawl_end_event_find_good_beer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_find_good_beer"
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
				"crawl_end_event_find_good_beer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_find_good_beer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_loud_crash_interact",
		response = "pdr_crawl_loud_crash_interact",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_loud_crash_interact"
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
				"crawl_loud_crash_interact",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_loud_crash_interact",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_loud_crash_reply",
		response = "pdr_crawl_loud_crash_reply",
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
				"crawl_loud_crash_interact"
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
				"crawl_loud_crash_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_loud_crash_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_loud_crash_end_reply",
		response = "pdr_crawl_loud_crash_end_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_loud_crash_end_reply"
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
				"crawl_loud_crash_end_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_loud_crash_end_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_upstairs",
		response = "pdr_crawl_upstairs",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_upstairs"
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
				"crawl_upstairs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_upstairs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_get_out_soon",
		response = "pdr_crawl_get_out_soon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_get_out_soon"
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
				"crawl_get_out_soon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_get_out_soon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_end_event_way_open",
		response = "pdr_crawl_end_event_way_open",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_way_open"
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
				"crawl_end_event_way_open",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_way_open",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_end_event_keep_running",
		response = "pdr_crawl_end_event_keep_running",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_keep_running"
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
				"crawl_end_event_keep_running",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_keep_running",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_end_event_tunnel",
		response = "pdr_crawl_end_event_tunnel",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_tunnel"
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
				"crawl_end_event_tunnel",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_tunnel",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_end_event_waystone",
		response = "pdr_crawl_end_event_waystone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_waystone"
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
				"crawl_end_event_waystone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_waystone",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crawl_pub_destroyed_reaction",
		response = "pdr_crawl_pub_destroyed_reaction",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_destroyed_reaction"
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
				"crawl_pub_destroyed_reaction",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_destroyed_reaction",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pdr_crawl_loud_crash_interact = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_crawl_loud_crash_interact_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.2360833883286
			},
			localization_strings = {
				[1.0] = "pdr_crawl_loud_crash_interact_01"
			}
		},
		pdr_crawl_get_out_soon = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_get_out_soon_01",
				[2.0] = "pdr_crawl_get_out_soon_03"
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
				[1.0] = 2.7012708187103,
				[2.0] = 4.2747292518616
			},
			localization_strings = {
				[1.0] = "pdr_crawl_get_out_soon_01",
				[2.0] = "pdr_crawl_get_out_soon_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_pub_door = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_pub_door_01",
				[2.0] = "pdr_crawl_pub_door_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 2.9721250534058,
				[2.0] = 6.9009790420532
			},
			localization_strings = {
				[1.0] = "pdr_crawl_pub_door_01",
				[2.0] = "pdr_crawl_pub_door_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_loud_crash_end_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_crawl_loud_crash_end_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9789583683014
			},
			localization_strings = {
				[1.0] = "pdr_crawl_loud_crash_end_reply_01"
			}
		},
		pdr_level_crawl_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_crawl_intro_a_01",
				[2.0] = "pdr_level_crawl_intro_a_02"
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
				[1.0] = 4.3706250190735,
				[2.0] = 4.5522294044495
			},
			localization_strings = {
				[1.0] = "pdr_level_crawl_intro_a_01",
				[2.0] = "pdr_level_crawl_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_spot_second_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_spot_second_pub_01",
				[2.0] = "pdr_crawl_spot_second_pub_04"
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
				[1.0] = 3.9793124198914,
				[2.0] = 5.0759792327881
			},
			localization_strings = {
				[1.0] = "pdr_crawl_spot_second_pub_01",
				[2.0] = "pdr_crawl_spot_second_pub_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_upstairs = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_upstairs_01",
				[2.0] = "pdr_crawl_upstairs_02"
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
				[1.0] = 2.9110832214356,
				[2.0] = 2.5364792346954
			},
			localization_strings = {
				[1.0] = "pdr_crawl_upstairs_01",
				[2.0] = "pdr_crawl_upstairs_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_end_event_way_open = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_end_event_way_open_03",
				[2.0] = "pdr_crawl_end_event_way_open_04"
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
				[1.0] = 2.8242917060852,
				[2.0] = 3.5048749446869
			},
			localization_strings = {
				[1.0] = "pdr_crawl_end_event_way_open_03",
				[2.0] = "pdr_crawl_end_event_way_open_04"
			},
			randomize_indexes = {}
		},
		pdr_level_crawl_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_crawl_intro_c_01",
				[2.0] = "pdr_level_crawl_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.3840417861939,
				[2.0] = 4.236750125885
			},
			localization_strings = {
				[1.0] = "pdr_level_crawl_intro_c_01",
				[2.0] = "pdr_level_crawl_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_shortcut = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_shortcut_01",
				[2.0] = "pdr_crawl_shortcut_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 2.6580834388733,
				[2.0] = 2.4305000305176
			},
			localization_strings = {
				[1.0] = "pdr_crawl_shortcut_01",
				[2.0] = "pdr_crawl_shortcut_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_tunnel_passage = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_tunnel_passage_03",
				[2.0] = "pdr_crawl_tunnel_passage_04"
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
				[1.0] = 2.9857709407806,
				[2.0] = 4.3460001945496
			},
			localization_strings = {
				[1.0] = "pdr_crawl_tunnel_passage_03",
				[2.0] = "pdr_crawl_tunnel_passage_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_mid_level_banter = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_mid_level_banter_03",
				[2.0] = "pdr_crawl_mid_level_banter_04"
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
				[1.0] = 10.84831237793,
				[2.0] = 11.144166946411
			},
			localization_strings = {
				[1.0] = "pdr_crawl_mid_level_banter_03",
				[2.0] = "pdr_crawl_mid_level_banter_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_old_path_blocked = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_old_path_blocked_01",
				[2.0] = "pdr_crawl_old_path_blocked_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 3.116729259491,
				[2.0] = 4.0610208511353
			},
			localization_strings = {
				[1.0] = "pdr_crawl_old_path_blocked_01",
				[2.0] = "pdr_crawl_old_path_blocked_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_loud_crash_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_crawl_loud_crash_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2066457271576
			},
			localization_strings = {
				[1.0] = "pdr_crawl_loud_crash_reply_01"
			}
		},
		pdr_crawl_end_event_keep_quiet = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_end_event_keep_quiet_01",
				[2.0] = "pdr_crawl_end_event_keep_quiet_02"
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
				[1.0] = 3.8099374771118,
				[2.0] = 4.9949374198914
			},
			localization_strings = {
				[1.0] = "pdr_crawl_end_event_keep_quiet_01",
				[2.0] = "pdr_crawl_end_event_keep_quiet_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_have_a_drink = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_have_a_drink_01",
				[2.0] = "pdr_crawl_have_a_drink_03"
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
				[1.0] = 2.5981042385101,
				[2.0] = 4.2748126983643
			},
			localization_strings = {
				[1.0] = "pdr_crawl_have_a_drink_01",
				[2.0] = "pdr_crawl_have_a_drink_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_pub_destroyed = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_crawl_pub_destroyed_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 6.7291040420532
			},
			localization_strings = {
				[1.0] = "pdr_crawl_pub_destroyed_03"
			}
		},
		pdr_crawl_spot_first_pub_closer = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_spot_first_pub_closer_02",
				[2.0] = "pdr_crawl_spot_first_pub_closer_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.5879168510437,
				[2.0] = 8.25306224823
			},
			localization_strings = {
				[1.0] = "pdr_crawl_spot_first_pub_closer_02",
				[2.0] = "pdr_crawl_spot_first_pub_closer_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_pub_destroyed_reaction = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_curse_01",
				"pdr_curse_02",
				"pdr_curse_03",
				"pdr_curse_04",
				"pdr_curse_05",
				"pdr_curse_06",
				"pdr_curse_07",
				"pdr_curse_08"
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
			sound_events_duration = {
				1.2289375066757,
				3.2648749351502,
				1.3074791431427,
				1.2764999866486,
				1.8557916879654,
				0.83985418081284,
				1.3999999761581,
				0.99960416555405
			},
			localization_strings = {
				"pdr_curse_01",
				"pdr_curse_02",
				"pdr_curse_03",
				"pdr_curse_04",
				"pdr_curse_05",
				"pdr_curse_06",
				"pdr_curse_07",
				"pdr_curse_08"
			},
			randomize_indexes = {}
		},
		pdr_crawl_pub_brazers = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_pub_brazers_01",
				[2.0] = "pdr_crawl_pub_brazers_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 3.8596665859222,
				[2.0] = 3.8733332157135
			},
			localization_strings = {
				[1.0] = "pdr_crawl_pub_brazers_01",
				[2.0] = "pdr_crawl_pub_brazers_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_end_event_waystone = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_end_event_waystone_03",
				[2.0] = "pdr_crawl_end_event_waystone_04"
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
				[1.0] = 2.9866874217987,
				[2.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_crawl_end_event_waystone_03",
				[2.0] = "pdr_crawl_end_event_waystone_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_slaughter = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_slaughter_03",
				[2.0] = "pdr_crawl_slaughter_04"
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
				[1.0] = 6.3197498321533,
				[2.0] = 4.1354165077209
			},
			localization_strings = {
				[1.0] = "pdr_crawl_slaughter_03",
				[2.0] = "pdr_crawl_slaughter_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_pub_district_sign = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_pub_district_sign_01",
				[2.0] = "pdr_crawl_pub_district_sign_03"
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
				[1.0] = 4.7955832481384,
				[2.0] = 6.9937500953674
			},
			localization_strings = {
				[1.0] = "pdr_crawl_pub_district_sign_01",
				[2.0] = "pdr_crawl_pub_district_sign_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_get_into_third_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_get_into_third_pub_02",
				[2.0] = "pdr_crawl_get_into_third_pub_03"
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
				[1.0] = 4.191771030426,
				[2.0] = 3.0338332653046
			},
			localization_strings = {
				[1.0] = "pdr_crawl_get_into_third_pub_02",
				[2.0] = "pdr_crawl_get_into_third_pub_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_heard_us = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_heard_us_02",
				[2.0] = "pdr_crawl_heard_us_03"
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
				[1.0] = 3.7999999523163,
				[2.0] = 1.9313958883286
			},
			localization_strings = {
				[1.0] = "pdr_crawl_heard_us_02",
				[2.0] = "pdr_crawl_heard_us_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_pub_horde_end = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_pub_horde_end_01",
				[2.0] = "pdr_crawl_pub_horde_end_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 6.0810832977295,
				[2.0] = 3.616729259491
			},
			localization_strings = {
				[1.0] = "pdr_crawl_pub_horde_end_01",
				[2.0] = "pdr_crawl_pub_horde_end_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_end_event_tunnel = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_end_event_tunnel_03",
				[2.0] = "pdr_crawl_end_event_tunnel_04"
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
				[1.0] = 6.938458442688,
				[2.0] = 3.3756458759308
			},
			localization_strings = {
				[1.0] = "pdr_crawl_end_event_tunnel_03",
				[2.0] = "pdr_crawl_end_event_tunnel_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_end_event_keep_running = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_end_event_keep_running_02",
				[2.0] = "pdr_crawl_end_event_keep_running_04"
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
				[1.0] = 1.5036041736603,
				[2.0] = 1.3830208778381
			},
			localization_strings = {
				[1.0] = "pdr_crawl_end_event_keep_running_02",
				[2.0] = "pdr_crawl_end_event_keep_running_04"
			},
			randomize_indexes = {}
		},
		pdr_level_crawl_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_crawl_intro_b_01",
				[2.0] = "pdr_level_crawl_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2758541107178,
				[2.0] = 2.3998959064484
			},
			localization_strings = {
				[1.0] = "pdr_level_crawl_intro_b_01",
				[2.0] = "pdr_level_crawl_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_head_for_second_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_head_for_second_pub_01",
				[2.0] = "pdr_crawl_head_for_second_pub_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 3.7137498855591,
				[2.0] = 5.5003542900085
			},
			localization_strings = {
				[1.0] = "pdr_crawl_head_for_second_pub_01",
				[2.0] = "pdr_crawl_head_for_second_pub_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_cheers = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crawl_cheers_01",
				"pdr_crawl_cheers_02",
				"pdr_crawl_cheers_03",
				"pdr_crawl_cheers_04"
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
				3.5999999046326,
				2.235333442688,
				2.1879374980927,
				8.1012287139893
			},
			localization_strings = {
				"pdr_crawl_cheers_01",
				"pdr_crawl_cheers_02",
				"pdr_crawl_cheers_03",
				"pdr_crawl_cheers_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_end_event_find_good_beer = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_end_event_find_good_beer_01",
				[2.0] = "pdr_crawl_end_event_find_good_beer_03"
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
				[1.0] = 5.220645904541,
				[2.0] = 4.4336252212524
			},
			localization_strings = {
				[1.0] = "pdr_crawl_end_event_find_good_beer_01",
				[2.0] = "pdr_crawl_end_event_find_good_beer_03"
			},
			randomize_indexes = {}
		},
		pdr_crawl_spot_third_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_spot_third_pub_01",
				[2.0] = "pdr_crawl_spot_third_pub_04"
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
				[1.0] = 3.5724999904633,
				[2.0] = 4.2188124656677
			},
			localization_strings = {
				[1.0] = "pdr_crawl_spot_third_pub_01",
				[2.0] = "pdr_crawl_spot_third_pub_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_head_for_third_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_head_for_third_pub_02",
				[2.0] = "pdr_crawl_head_for_third_pub_04"
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
				[1.0] = 3.75,
				[2.0] = 5.7602915763855
			},
			localization_strings = {
				[1.0] = "pdr_crawl_head_for_third_pub_02",
				[2.0] = "pdr_crawl_head_for_third_pub_04"
			},
			randomize_indexes = {}
		},
		pdr_crawl_head_for_first_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_head_for_first_pub_01",
				[2.0] = "pdr_crawl_head_for_first_pub_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 12.849541664124,
				[2.0] = 8.5335416793823
			},
			localization_strings = {
				[1.0] = "pdr_crawl_head_for_first_pub_01",
				[2.0] = "pdr_crawl_head_for_first_pub_02"
			},
			randomize_indexes = {}
		},
		pdr_crawl_spot_first_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crawl_spot_first_pub_02",
				[2.0] = "pdr_crawl_spot_first_pub_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 5.8658332824707,
				[2.0] = 6.4515419006348
			},
			localization_strings = {
				[1.0] = "pdr_crawl_spot_first_pub_02",
				[2.0] = "pdr_crawl_spot_first_pub_03"
			},
			randomize_indexes = {}
		}
	})
end
