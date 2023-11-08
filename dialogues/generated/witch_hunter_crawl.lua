return function ()
	define_rule({
		name = "pwh_crawl_cheers",
		response = "pwh_crawl_cheers",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_end_event_find_good_beer",
		response = "pwh_crawl_end_event_find_good_beer",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_end_event_keep_quiet",
		response = "pwh_crawl_end_event_keep_quiet",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_end_event_keep_running",
		response = "pwh_crawl_end_event_keep_running",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_end_event_tunnel",
		response = "pwh_crawl_end_event_tunnel",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_end_event_way_open",
		response = "pwh_crawl_end_event_way_open",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_end_event_waystone",
		response = "pwh_crawl_end_event_waystone",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_get_into_third_pub",
		response = "pwh_crawl_get_into_third_pub",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_get_out_soon",
		response = "pwh_crawl_get_out_soon",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_have_a_drink",
		response = "pwh_crawl_have_a_drink",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_head_for_first_pub",
		response = "pwh_crawl_head_for_first_pub",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_head_for_second_pub",
		response = "pwh_crawl_head_for_second_pub",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_head_for_third_pub",
		response = "pwh_crawl_head_for_third_pub",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_heard_us",
		response = "pwh_crawl_heard_us",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_loud_crash_end_reply",
		response = "pwh_crawl_loud_crash_end_reply",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_loud_crash_interact",
		response = "pwh_crawl_loud_crash_interact",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_loud_crash_reply",
		response = "pwh_crawl_loud_crash_reply",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_mid_level_banter",
		response = "pwh_crawl_mid_level_banter",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_old_path_blocked",
		response = "pwh_crawl_old_path_blocked",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_pub_brazers",
		response = "pwh_crawl_pub_brazers",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_pub_destroyed",
		response = "pwh_crawl_pub_destroyed",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_pub_destroyed_reaction",
		response = "pwh_crawl_pub_destroyed_reaction",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
	define_rule({
		name = "pwh_crawl_pub_district_sign",
		response = "pwh_crawl_pub_district_sign",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_pub_door",
		response = "pwh_crawl_pub_door",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_pub_horde_end",
		response = "pwh_crawl_pub_horde_end",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_shortcut",
		response = "pwh_crawl_shortcut",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_slaughter",
		response = "pwh_crawl_slaughter",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_spot_first_pub",
		response = "pwh_crawl_spot_first_pub",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_spot_first_pub_closer",
		response = "pwh_crawl_spot_first_pub_closer",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_spot_second_pub",
		response = "pwh_crawl_spot_second_pub",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_spot_third_pub",
		response = "pwh_crawl_spot_third_pub",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_tunnel_passage",
		response = "pwh_crawl_tunnel_passage",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_crawl_upstairs",
		response = "pwh_crawl_upstairs",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_crawl_intro_a",
		response = "pwh_level_crawl_intro_a",
		criterias = {
			{
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_crawl_intro_b",
		response = "pwh_level_crawl_intro_b",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_crawl_intro_c",
		response = "pwh_level_crawl_intro_c",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
	add_dialogues({
		pwh_crawl_cheers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_crawl",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
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
				"pwh_crawl_cheers_01",
				"pwh_crawl_cheers_02",
				"pwh_crawl_cheers_03",
				"pwh_crawl_cheers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crawl_cheers_01",
				"pwh_crawl_cheers_02",
				"pwh_crawl_cheers_03",
				"pwh_crawl_cheers_04"
			},
			sound_events_duration = {
				1.5025207996368,
				7.4420833587647,
				3.1606667041779,
				6.2520833015442
			}
		},
		pwh_crawl_end_event_find_good_beer = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_end_event_find_good_beer_01",
				[2.0] = "pwh_crawl_end_event_find_good_beer_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_end_event_find_good_beer_01",
				[2.0] = "pwh_crawl_end_event_find_good_beer_02"
			},
			sound_events_duration = {
				[1.0] = 6.2309165000916,
				[2.0] = 6.3937916755676
			}
		},
		pwh_crawl_end_event_keep_quiet = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_end_event_keep_quiet_01",
				[2.0] = "pwh_crawl_end_event_keep_quiet_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_end_event_keep_quiet_01",
				[2.0] = "pwh_crawl_end_event_keep_quiet_02"
			},
			sound_events_duration = {
				[1.0] = 3.9405624866486,
				[2.0] = 5.3393750190735
			}
		},
		pwh_crawl_end_event_keep_running = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_end_event_keep_running_02",
				[2.0] = "pwh_crawl_end_event_keep_running_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_end_event_keep_running_02",
				[2.0] = "pwh_crawl_end_event_keep_running_03"
			},
			sound_events_duration = {
				[1.0] = 3.0299792289734,
				[2.0] = 1.0831458568573
			}
		},
		pwh_crawl_end_event_tunnel = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_crawl",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_crawl_end_event_tunnel_01",
				"pwh_crawl_end_event_tunnel_02",
				"pwh_crawl_end_event_tunnel_03",
				"pwh_crawl_end_event_tunnel_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crawl_end_event_tunnel_01",
				"pwh_crawl_end_event_tunnel_02",
				"pwh_crawl_end_event_tunnel_03",
				"pwh_crawl_end_event_tunnel_04"
			},
			sound_events_duration = {
				5.4763956069946,
				3.4567,
				5.687479019165,
				3.4567
			}
		},
		pwh_crawl_end_event_way_open = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_end_event_way_open_03",
				[2.0] = "pwh_crawl_end_event_way_open_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_end_event_way_open_03",
				[2.0] = "pwh_crawl_end_event_way_open_04"
			},
			sound_events_duration = {
				[1.0] = 2.2067084312439,
				[2.0] = 2.1821041107178
			}
		},
		pwh_crawl_end_event_waystone = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_end_event_waystone_03",
				[2.0] = "pwh_crawl_end_event_waystone_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_end_event_waystone_03",
				[2.0] = "pwh_crawl_end_event_waystone_04"
			},
			sound_events_duration = {
				[1.0] = 2.7134375572205,
				[2.0] = 3.5824167728424
			}
		},
		pwh_crawl_get_into_third_pub = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_get_into_third_pub_01",
				[2.0] = "pwh_crawl_get_into_third_pub_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_get_into_third_pub_01",
				[2.0] = "pwh_crawl_get_into_third_pub_02"
			},
			sound_events_duration = {
				[1.0] = 2.1490209102631,
				[2.0] = 2.1225833892822
			}
		},
		pwh_crawl_get_out_soon = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_get_out_soon_01",
				[2.0] = "pwh_crawl_get_out_soon_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_get_out_soon_01",
				[2.0] = "pwh_crawl_get_out_soon_03"
			},
			sound_events_duration = {
				[1.0] = 5.0922708511353,
				[2.0] = 2.7651040554047
			}
		},
		pwh_crawl_have_a_drink = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_have_a_drink_01",
				[2.0] = "pwh_crawl_have_a_drink_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_have_a_drink_01",
				[2.0] = "pwh_crawl_have_a_drink_03"
			},
			sound_events_duration = {
				[1.0] = 5.1990833282471,
				[2.0] = 4.401978969574
			}
		},
		pwh_crawl_head_for_first_pub = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_head_for_first_pub_02",
				[2.0] = "pwh_crawl_head_for_first_pub_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_head_for_first_pub_02",
				[2.0] = "pwh_crawl_head_for_first_pub_04"
			},
			sound_events_duration = {
				[1.0] = 6.2754793167114,
				[2.0] = 3.7672083377838
			}
		},
		pwh_crawl_head_for_second_pub = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_head_for_second_pub_02",
				[2.0] = "pwh_crawl_head_for_second_pub_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_head_for_second_pub_02",
				[2.0] = "pwh_crawl_head_for_second_pub_04"
			},
			sound_events_duration = {
				[1.0] = 12.119208335877,
				[2.0] = 7.5089373588562
			}
		},
		pwh_crawl_head_for_third_pub = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_head_for_third_pub_01",
				[2.0] = "pwh_crawl_head_for_third_pub_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_head_for_third_pub_01",
				[2.0] = "pwh_crawl_head_for_third_pub_04"
			},
			sound_events_duration = {
				[1.0] = 6.990749835968,
				[2.0] = 6.7427706718445
			}
		},
		pwh_crawl_heard_us = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_heard_us_03",
				[2.0] = "pwh_crawl_heard_us_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_heard_us_03",
				[2.0] = "pwh_crawl_heard_us_04"
			},
			sound_events_duration = {
				[1.0] = 7.8343334197998,
				[2.0] = 4.3022499084473
			}
		},
		pwh_crawl_loud_crash_end_reply = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_loud_crash_end_reply_01"
			},
			sound_events = {
				[1.0] = "pwh_crawl_loud_crash_end_reply_01"
			},
			sound_events_duration = {
				[1.0] = 3.6428959369659
			}
		},
		pwh_crawl_loud_crash_interact = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_loud_crash_interact_01"
			},
			sound_events = {
				[1.0] = "pwh_crawl_loud_crash_interact_01"
			},
			sound_events_duration = {
				[1.0] = 4.225145816803
			}
		},
		pwh_crawl_loud_crash_reply = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_loud_crash_reply_01",
				[2.0] = "pwh_crawl_loud_crash_reply_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_loud_crash_reply_01",
				[2.0] = "pwh_crawl_loud_crash_reply_02"
			},
			sound_events_duration = {
				[1.0] = 4.5249166488647,
				[2.0] = 7.3234376907349
			}
		},
		pwh_crawl_mid_level_banter = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_mid_level_banter_02",
				[2.0] = "pwh_crawl_mid_level_banter_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_mid_level_banter_02",
				[2.0] = "pwh_crawl_mid_level_banter_04"
			},
			sound_events_duration = {
				[1.0] = 4.4188957214356,
				[2.0] = 3.9903957843781
			}
		},
		pwh_crawl_old_path_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_old_path_blocked_01",
				[2.0] = "pwh_crawl_old_path_blocked_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_old_path_blocked_01",
				[2.0] = "pwh_crawl_old_path_blocked_03"
			},
			sound_events_duration = {
				[1.0] = 2.921416759491,
				[2.0] = 1.7000000476837
			}
		},
		pwh_crawl_pub_brazers = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_pub_brazers_01",
				[2.0] = "pwh_crawl_pub_brazers_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_pub_brazers_01",
				[2.0] = "pwh_crawl_pub_brazers_03"
			},
			sound_events_duration = {
				[1.0] = 5.9021043777466,
				[2.0] = 5.6956043243408
			}
		},
		pwh_crawl_pub_destroyed = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_pub_destroyed_02",
				[2.0] = "pwh_crawl_pub_destroyed_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_pub_destroyed_02",
				[2.0] = "pwh_crawl_pub_destroyed_04"
			},
			sound_events_duration = {
				[1.0] = 4.1852293014526,
				[2.0] = 3.2244167327881
			}
		},
		pwh_crawl_pub_destroyed_reaction = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "witch_hunter_crawl",
			sound_events_n = 9,
			category = "level_talk_must_play",
			dialogue_animations_n = 9,
			dialogue_animations = {
				"dialogue_shout",
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
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pwh_curse_11",
				"pwh_curse_12",
				"pwh_curse_01",
				"pwh_curse_02",
				"pwh_curse_03",
				"pwh_curse_04",
				"pwh_curse_06",
				"pwh_curse_07",
				"pwh_curse_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_curse_11",
				"pwh_curse_12",
				"pwh_curse_01",
				"pwh_curse_02",
				"pwh_curse_03",
				"pwh_curse_04",
				"pwh_curse_06",
				"pwh_curse_07",
				"pwh_curse_10"
			},
			sound_events_duration = {
				3.4376873970032,
				2.6176249980927,
				1.3804792165756,
				1.7233749628067,
				4.5214376449585,
				2.0933542251587,
				2.3764791488648,
				3.4099791049957,
				3.0420832633972
			}
		},
		pwh_crawl_pub_district_sign = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_pub_district_sign_01",
				[2.0] = "pwh_crawl_pub_district_sign_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_pub_district_sign_01",
				[2.0] = "pwh_crawl_pub_district_sign_03"
			},
			sound_events_duration = {
				[1.0] = 3.2044999599457,
				[2.0] = 6.9863748550415
			}
		},
		pwh_crawl_pub_door = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_pub_door_01",
				[2.0] = "pwh_crawl_pub_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_pub_door_01",
				[2.0] = "pwh_crawl_pub_door_04"
			},
			sound_events_duration = {
				[1.0] = 4.1078543663025,
				[2.0] = 4.2805833816528
			}
		},
		pwh_crawl_pub_horde_end = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_pub_horde_end_02",
				[2.0] = "pwh_crawl_pub_horde_end_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_pub_horde_end_02",
				[2.0] = "pwh_crawl_pub_horde_end_03"
			},
			sound_events_duration = {
				[1.0] = 6.2833333015442,
				[2.0] = 5.2207918167114
			}
		},
		pwh_crawl_shortcut = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_shortcut_01",
				[2.0] = "pwh_crawl_shortcut_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_shortcut_01",
				[2.0] = "pwh_crawl_shortcut_04"
			},
			sound_events_duration = {
				[1.0] = 5.8090624809265,
				[2.0] = 3.254604101181
			}
		},
		pwh_crawl_slaughter = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_slaughter_01",
				[2.0] = "pwh_crawl_slaughter_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_slaughter_01",
				[2.0] = "pwh_crawl_slaughter_03"
			},
			sound_events_duration = {
				[1.0] = 4.0881667137146,
				[2.0] = 4.3058958053589
			}
		},
		pwh_crawl_spot_first_pub = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_spot_first_pub_02",
				[2.0] = "pwh_crawl_spot_first_pub_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_spot_first_pub_02",
				[2.0] = "pwh_crawl_spot_first_pub_04"
			},
			sound_events_duration = {
				[1.0] = 6.3797082901001,
				[2.0] = 4.0360832214356
			}
		},
		pwh_crawl_spot_first_pub_closer = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_spot_first_pub_closer_03",
				[2.0] = "pwh_crawl_spot_first_pub_closer_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_spot_first_pub_closer_03",
				[2.0] = "pwh_crawl_spot_first_pub_closer_04"
			},
			sound_events_duration = {
				[1.0] = 10.417395591736,
				[2.0] = 7.5632290840149
			}
		},
		pwh_crawl_spot_second_pub = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_crawl",
			category = "cut_scene",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_spot_second_pub_02"
			},
			sound_events = {
				[1.0] = "pwh_crawl_spot_second_pub_02"
			},
			sound_events_duration = {
				[1.0] = 5.166437625885
			}
		},
		pwh_crawl_spot_third_pub = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_spot_third_pub_01",
				[2.0] = "pwh_crawl_spot_third_pub_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_spot_third_pub_01",
				[2.0] = "pwh_crawl_spot_third_pub_03"
			},
			sound_events_duration = {
				[1.0] = 11.19997882843,
				[2.0] = 9.4616870880127
			}
		},
		pwh_crawl_tunnel_passage = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_tunnel_passage_02",
				[2.0] = "pwh_crawl_tunnel_passage_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_tunnel_passage_02",
				[2.0] = "pwh_crawl_tunnel_passage_03"
			},
			sound_events_duration = {
				[1.0] = 4.0516247749329,
				[2.0] = 4.8061876296997
			}
		},
		pwh_crawl_upstairs = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crawl_upstairs_01",
				[2.0] = "pwh_crawl_upstairs_03"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_crawl_upstairs_01",
				[2.0] = "pwh_crawl_upstairs_03"
			},
			sound_events_duration = {
				[1.0] = 3.5250625610352,
				[2.0] = 7.1121668815613
			}
		},
		pwh_level_crawl_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_crawl_intro_a_01",
				[2.0] = "pwh_level_crawl_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_level_crawl_intro_a_01",
				[2.0] = "pwh_level_crawl_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.7928748130798,
				[2.0] = 5.5212082862854
			}
		},
		pwh_level_crawl_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_crawl_intro_b_01",
				[2.0] = "pwh_level_crawl_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_level_crawl_intro_b_01",
				[2.0] = "pwh_level_crawl_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.7618749141693,
				[2.0] = 3.7573957443237
			}
		},
		pwh_level_crawl_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_crawl",
			sound_events_n = 2,
			category = "cut_scene",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_level_crawl_intro_c_01",
				[2.0] = "pwh_level_crawl_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_level_crawl_intro_c_01",
				[2.0] = "pwh_level_crawl_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 6.5516247749329,
				[2.0] = 6.0593957901001
			}
		}
	})
end
