return function ()
	define_rule({
		name = "pwe_level_crawl_intro_a",
		response = "pwe_level_crawl_intro_a",
		criterias = {
			{
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
		name = "pwe_level_crawl_intro_b",
		response = "pwe_level_crawl_intro_b",
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
		name = "pwe_level_crawl_intro_c",
		response = "pwe_level_crawl_intro_c",
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
		name = "pwe_crawl_head_for_first_pub",
		response = "pwe_crawl_head_for_first_pub",
		criterias = {
			{
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
		name = "pwe_crawl_spot_first_pub",
		response = "pwe_crawl_spot_first_pub",
		criterias = {
			{
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
		name = "pwe_crawl_spot_first_pub_closer",
		response = "pwe_crawl_spot_first_pub_closer",
		criterias = {
			{
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
		name = "pwe_crawl_old_path_blocked",
		response = "pwe_crawl_old_path_blocked",
		criterias = {
			{
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
		name = "pwe_crawl_shortcut",
		response = "pwe_crawl_shortcut",
		criterias = {
			{
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
		name = "pwe_crawl_pub_brazers",
		response = "pwe_crawl_pub_brazers",
		criterias = {
			{
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
		name = "pwe_crawl_pub_door",
		response = "pwe_crawl_pub_door",
		criterias = {
			{
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
		name = "pwe_crawl_pub_destroyed",
		response = "pwe_crawl_pub_destroyed",
		criterias = {
			{
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
		name = "pwe_crawl_pub_horde_end",
		response = "pwe_crawl_pub_horde_end",
		criterias = {
			{
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
		name = "pwe_crawl_head_for_second_pub",
		response = "pwe_crawl_head_for_second_pub",
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
		name = "pwe_crawl_tunnel_passage",
		response = "pwe_crawl_tunnel_passage",
		criterias = {
			{
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
		name = "pwe_crawl_mid_level_banter",
		response = "pwe_crawl_mid_level_banter",
		criterias = {
			{
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
		name = "pwe_crawl_pub_district_sign",
		response = "pwe_crawl_pub_district_sign",
		criterias = {
			{
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
		name = "pwe_crawl_spot_second_pub",
		response = "pwe_crawl_spot_second_pub",
		criterias = {
			{
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
		name = "pwe_crawl_have_a_drink",
		response = "pwe_crawl_have_a_drink",
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
		name = "pwe_crawl_cheers",
		response = "pwe_crawl_cheers",
		criterias = {
			{
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
		name = "pwe_crawl_heard_us",
		response = "pwe_crawl_heard_us",
		criterias = {
			{
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
		name = "pwe_crawl_head_for_third_pub",
		response = "pwe_crawl_head_for_third_pub",
		criterias = {
			{
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
		name = "pwe_crawl_slaughter",
		response = "pwe_crawl_slaughter",
		criterias = {
			{
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
		name = "pwe_crawl_spot_third_pub",
		response = "pwe_crawl_spot_third_pub",
		criterias = {
			{
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
		name = "pwe_crawl_get_into_third_pub",
		response = "pwe_crawl_get_into_third_pub",
		criterias = {
			{
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
		name = "pwe_crawl_end_event_keep_quiet",
		response = "pwe_crawl_end_event_keep_quiet",
		criterias = {
			{
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
		name = "pwe_crawl_end_event_find_good_beer",
		response = "pwe_crawl_end_event_find_good_beer",
		criterias = {
			{
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
		name = "pwe_crawl_loud_crash_interact",
		response = "pwe_crawl_loud_crash_interact",
		criterias = {
			{
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
		name = "pwe_crawl_loud_crash_reply",
		response = "pwe_crawl_loud_crash_reply",
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
		name = "pwe_crawl_loud_crash_end_reply",
		response = "pwe_crawl_loud_crash_end_reply",
		criterias = {
			{
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
		name = "pwe_crawl_upstairs",
		response = "pwe_crawl_upstairs",
		criterias = {
			{
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
		name = "pwe_crawl_get_out_soon",
		response = "pwe_crawl_get_out_soon",
		criterias = {
			{
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
		name = "pwe_crawl_end_event_way_open",
		response = "pwe_crawl_end_event_way_open",
		criterias = {
			{
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
		name = "pwe_crawl_end_event_keep_running",
		response = "pwe_crawl_end_event_keep_running",
		criterias = {
			{
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
		name = "pwe_crawl_end_event_tunnel",
		response = "pwe_crawl_end_event_tunnel",
		criterias = {
			{
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
		name = "pwe_crawl_end_event_waystone",
		response = "pwe_crawl_end_event_waystone",
		criterias = {
			{
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
		name = "pwe_crawl_pub_destroyed_reaction",
		response = "pwe_crawl_pub_destroyed_reaction",
		criterias = {
			{
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
		pwe_crawl_spot_second_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_spot_second_pub_02",
				[2.0] = "pwe_crawl_spot_second_pub_04"
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
				[1.0] = 3.922812461853,
				[2.0] = 6.4446873664856
			},
			localization_strings = {
				[1.0] = "pwe_crawl_spot_second_pub_02",
				[2.0] = "pwe_crawl_spot_second_pub_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_end_event_keep_running = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_end_event_keep_running_01",
				[2.0] = "pwe_crawl_end_event_keep_running_02"
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
				[1.0] = 4.426854133606,
				[2.0] = 1.7595416307449
			},
			localization_strings = {
				[1.0] = "pwe_crawl_end_event_keep_running_01",
				[2.0] = "pwe_crawl_end_event_keep_running_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_get_out_soon = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_get_out_soon_02",
				[2.0] = "pwe_crawl_get_out_soon_03"
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
				[1.0] = 6.8691873550415,
				[2.0] = 4.8682708740234
			},
			localization_strings = {
				[1.0] = "pwe_crawl_get_out_soon_02",
				[2.0] = "pwe_crawl_get_out_soon_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_heard_us = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_heard_us_01",
				[2.0] = "pwe_crawl_heard_us_04"
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
				[1.0] = 5.9844374656677,
				[2.0] = 5.977041721344
			},
			localization_strings = {
				[1.0] = "pwe_crawl_heard_us_01",
				[2.0] = "pwe_crawl_heard_us_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_slaughter = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_slaughter_03",
				[2.0] = "pwe_crawl_slaughter_04"
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
				[1.0] = 9.9881038665772,
				[2.0] = 9.1139163970947
			},
			localization_strings = {
				[1.0] = "pwe_crawl_slaughter_03",
				[2.0] = "pwe_crawl_slaughter_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_pub_destroyed_reaction = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_curse_01",
				"pwe_curse_02",
				"pwe_curse_03",
				"pwe_curse_04",
				"pwe_curse_05",
				"pwe_curse_06",
				"pwe_curse_07",
				"pwe_curse_08"
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
				1.3087291717529,
				1.665895819664,
				1.6733541488648,
				1.2655208110809,
				1.5897916555405,
				2.0403957366943,
				1.4692916870117,
				2.978437423706
			},
			localization_strings = {
				"pwe_curse_01",
				"pwe_curse_02",
				"pwe_curse_03",
				"pwe_curse_04",
				"pwe_curse_05",
				"pwe_curse_06",
				"pwe_curse_07",
				"pwe_curse_08"
			},
			randomize_indexes = {}
		},
		pwe_crawl_head_for_second_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_head_for_second_pub_02",
				[2.0] = "pwe_crawl_head_for_second_pub_04"
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
				[1.0] = 7.506875038147,
				[2.0] = 4.8642706871033
			},
			localization_strings = {
				[1.0] = "pwe_crawl_head_for_second_pub_02",
				[2.0] = "pwe_crawl_head_for_second_pub_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_mid_level_banter = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_mid_level_banter_02",
				[2.0] = "pwe_crawl_mid_level_banter_03"
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
				[1.0] = 7.075270652771,
				[2.0] = 6.294020652771
			},
			localization_strings = {
				[1.0] = "pwe_crawl_mid_level_banter_02",
				[2.0] = "pwe_crawl_mid_level_banter_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_spot_third_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_spot_third_pub_02",
				[2.0] = "pwe_crawl_spot_third_pub_04"
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
				[1.0] = 5.7594585418701,
				[2.0] = 10.490124702454
			},
			localization_strings = {
				[1.0] = "pwe_crawl_spot_third_pub_02",
				[2.0] = "pwe_crawl_spot_third_pub_04"
			},
			randomize_indexes = {}
		},
		pwe_level_crawl_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_crawl_intro_a_01",
				[2.0] = "pwe_level_crawl_intro_a_02"
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
				[1.0] = 6.1224164962769,
				[2.0] = 5.4543123245239
			},
			localization_strings = {
				[1.0] = "pwe_level_crawl_intro_a_01",
				[2.0] = "pwe_level_crawl_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_end_event_way_open = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_end_event_way_open_02",
				[2.0] = "pwe_crawl_end_event_way_open_04"
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
				[1.0] = 2.4595832824707,
				[2.0] = 3.9914166927338
			},
			localization_strings = {
				[1.0] = "pwe_crawl_end_event_way_open_02",
				[2.0] = "pwe_crawl_end_event_way_open_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_upstairs = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_upstairs_02",
				[2.0] = "pwe_crawl_upstairs_04"
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
				[1.0] = 4.1864376068115,
				[2.0] = 2.9220833778381
			},
			localization_strings = {
				[1.0] = "pwe_crawl_upstairs_02",
				[2.0] = "pwe_crawl_upstairs_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_end_event_waystone = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_end_event_waystone_02",
				[2.0] = "pwe_crawl_end_event_waystone_04"
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
				[1.0] = 4.6344375610352,
				[2.0] = 2.7301249504089
			},
			localization_strings = {
				[1.0] = "pwe_crawl_end_event_waystone_02",
				[2.0] = "pwe_crawl_end_event_waystone_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_end_event_find_good_beer = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_end_event_find_good_beer_01",
				[2.0] = "pwe_crawl_end_event_find_good_beer_03"
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
				[1.0] = 7.1907081604004,
				[2.0] = 6.3180623054504
			},
			localization_strings = {
				[1.0] = "pwe_crawl_end_event_find_good_beer_01",
				[2.0] = "pwe_crawl_end_event_find_good_beer_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_have_a_drink = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_have_a_drink_02",
				[2.0] = "pwe_crawl_have_a_drink_03"
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
				[1.0] = 6.0403332710266,
				[2.0] = 5.3740210533142
			},
			localization_strings = {
				[1.0] = "pwe_crawl_have_a_drink_02",
				[2.0] = "pwe_crawl_have_a_drink_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_tunnel_passage = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_tunnel_passage_02",
				[2.0] = "pwe_crawl_tunnel_passage_04"
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
				[1.0] = 5.501437664032,
				[2.0] = 6.523416519165
			},
			localization_strings = {
				[1.0] = "pwe_crawl_tunnel_passage_02",
				[2.0] = "pwe_crawl_tunnel_passage_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_end_event_tunnel = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_end_event_tunnel_01",
				[2.0] = "pwe_crawl_end_event_tunnel_02"
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
				[1.0] = 2.2212083339691,
				[2.0] = 2.9929375648499
			},
			localization_strings = {
				[1.0] = "pwe_crawl_end_event_tunnel_01",
				[2.0] = "pwe_crawl_end_event_tunnel_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_loud_crash_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_crawl_loud_crash_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.92041665315628
			},
			localization_strings = {
				[1.0] = "pwe_crawl_loud_crash_reply_01"
			}
		},
		pwe_level_crawl_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_crawl_intro_c_01",
				[2.0] = "pwe_level_crawl_intro_c_02"
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
				[1.0] = 3.3362083435059,
				[2.0] = 3.4726874828339
			},
			localization_strings = {
				[1.0] = "pwe_level_crawl_intro_c_01",
				[2.0] = "pwe_level_crawl_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_loud_crash_end_reply = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_loud_crash_end_reply_01",
				[2.0] = "pwe_crawl_loud_crash_end_reply_02"
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
				[1.0] = 3.7279167175293,
				[2.0] = 2.0599792003632
			},
			localization_strings = {
				[1.0] = "pwe_crawl_loud_crash_end_reply_01",
				[2.0] = "pwe_crawl_loud_crash_end_reply_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_loud_crash_interact = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_crawl_loud_crash_interact_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3098332881927
			},
			localization_strings = {
				[1.0] = "pwe_crawl_loud_crash_interact_01"
			}
		},
		pwe_crawl_pub_brazers = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_pub_brazers_01",
				[2.0] = "pwe_crawl_pub_brazers_03"
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
				[1.0] = 4.3729376792908,
				[2.0] = 8.2349376678467
			},
			localization_strings = {
				[1.0] = "pwe_crawl_pub_brazers_01",
				[2.0] = "pwe_crawl_pub_brazers_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_head_for_third_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_head_for_third_pub_01",
				[2.0] = "pwe_crawl_head_for_third_pub_02"
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
				[1.0] = 10.663125038147,
				[2.0] = 8.1171045303345
			},
			localization_strings = {
				[1.0] = "pwe_crawl_head_for_third_pub_01",
				[2.0] = "pwe_crawl_head_for_third_pub_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_pub_horde_end = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_pub_horde_end_02",
				[2.0] = "pwe_crawl_pub_horde_end_03"
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
				[1.0] = 6.1558332443237,
				[2.0] = 10.455333709717
			},
			localization_strings = {
				[1.0] = "pwe_crawl_pub_horde_end_02",
				[2.0] = "pwe_crawl_pub_horde_end_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_spot_first_pub_closer = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_spot_first_pub_closer_01",
				[2.0] = "pwe_crawl_spot_first_pub_closer_02"
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
				[1.0] = 3.7509791851044,
				[2.0] = 4.8838958740234
			},
			localization_strings = {
				[1.0] = "pwe_crawl_spot_first_pub_closer_01",
				[2.0] = "pwe_crawl_spot_first_pub_closer_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_pub_door = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_pub_door_03",
				[2.0] = "pwe_crawl_pub_door_04"
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
				[1.0] = 7.1212501525879,
				[2.0] = 7.6160626411438
			},
			localization_strings = {
				[1.0] = "pwe_crawl_pub_door_03",
				[2.0] = "pwe_crawl_pub_door_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_end_event_keep_quiet = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_end_event_keep_quiet_01",
				[2.0] = "pwe_crawl_end_event_keep_quiet_02"
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
				[1.0] = 5.0795207023621,
				[2.0] = 3.9390416145325
			},
			localization_strings = {
				[1.0] = "pwe_crawl_end_event_keep_quiet_01",
				[2.0] = "pwe_crawl_end_event_keep_quiet_02"
			},
			randomize_indexes = {}
		},
		pwe_level_crawl_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_crawl_intro_b_01",
				[2.0] = "pwe_level_crawl_intro_b_02"
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
				[1.0] = 6.1137084960938,
				[2.0] = 4.3472290039063
			},
			localization_strings = {
				[1.0] = "pwe_level_crawl_intro_b_01",
				[2.0] = "pwe_level_crawl_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_pub_destroyed = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_pub_destroyed_01",
				[2.0] = "pwe_crawl_pub_destroyed_02"
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
				[1.0] = 5,
				[2.0] = 2.967916727066
			},
			localization_strings = {
				[1.0] = "pwe_crawl_pub_destroyed_01",
				[2.0] = "pwe_crawl_pub_destroyed_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_shortcut = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_shortcut_01",
				[2.0] = "pwe_crawl_shortcut_02"
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
				[1.0] = 2.5655119419098,
				[2.0] = 5.085916519165
			},
			localization_strings = {
				[1.0] = "pwe_crawl_shortcut_01",
				[2.0] = "pwe_crawl_shortcut_02"
			},
			randomize_indexes = {}
		},
		pwe_crawl_pub_district_sign = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_pub_district_sign_01",
				[2.0] = "pwe_crawl_pub_district_sign_04"
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
				[1.0] = 3.7920207977295,
				[2.0] = 4.9984169006348
			},
			localization_strings = {
				[1.0] = "pwe_crawl_pub_district_sign_01",
				[2.0] = "pwe_crawl_pub_district_sign_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_old_path_blocked = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_old_path_blocked_01",
				[2.0] = "pwe_crawl_old_path_blocked_03"
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
				[1.0] = 5.3406872749329,
				[2.0] = 6.3958334922791
			},
			localization_strings = {
				[1.0] = "pwe_crawl_old_path_blocked_01",
				[2.0] = "pwe_crawl_old_path_blocked_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_spot_first_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_spot_first_pub_03",
				[2.0] = "pwe_crawl_spot_first_pub_04"
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
				[1.0] = 5.9969372749329,
				[2.0] = 7.5789165496826
			},
			localization_strings = {
				[1.0] = "pwe_crawl_spot_first_pub_03",
				[2.0] = "pwe_crawl_spot_first_pub_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_cheers = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_crawl_cheers_01",
				"pwe_crawl_cheers_02",
				"pwe_crawl_cheers_03",
				"pwe_crawl_cheers_04"
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
				5.1237707138061,
				4.8911666870117,
				6.05708360672,
				3.7000000476837
			},
			localization_strings = {
				"pwe_crawl_cheers_01",
				"pwe_crawl_cheers_02",
				"pwe_crawl_cheers_03",
				"pwe_crawl_cheers_04"
			},
			randomize_indexes = {}
		},
		pwe_crawl_get_into_third_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_get_into_third_pub_02",
				[2.0] = "pwe_crawl_get_into_third_pub_03"
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
				[1.0] = 3.9505207538605,
				[2.0] = 8.5954370498657
			},
			localization_strings = {
				[1.0] = "pwe_crawl_get_into_third_pub_02",
				[2.0] = "pwe_crawl_get_into_third_pub_03"
			},
			randomize_indexes = {}
		},
		pwe_crawl_head_for_first_pub = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_crawl",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_crawl_head_for_first_pub_01",
				[2.0] = "pwe_crawl_head_for_first_pub_04"
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
				[1.0] = 3.6601667404175,
				[2.0] = 3.4208333492279
			},
			localization_strings = {
				[1.0] = "pwe_crawl_head_for_first_pub_01",
				[2.0] = "pwe_crawl_head_for_first_pub_04"
			},
			randomize_indexes = {}
		}
	})
end
