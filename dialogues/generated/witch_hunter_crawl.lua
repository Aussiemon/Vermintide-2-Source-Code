-- chunkname: @dialogues/generated/witch_hunter_crawl.lua

return function ()
	define_rule({
		name = "pwh_crawl_cheers",
		probability = 1,
		response = "pwh_crawl_cheers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_cheers",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_cheers",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_end_event_find_good_beer",
		probability = 1,
		response = "pwh_crawl_end_event_find_good_beer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_find_good_beer",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_end_event_find_good_beer",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_find_good_beer",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_end_event_keep_quiet",
		probability = 1,
		response = "pwh_crawl_end_event_keep_quiet",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_keep_quiet",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_end_event_keep_quiet",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_keep_quiet",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_end_event_keep_running",
		probability = 1,
		response = "pwh_crawl_end_event_keep_running",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_keep_running",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_end_event_keep_running",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_keep_running",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_end_event_tunnel",
		probability = 1,
		response = "pwh_crawl_end_event_tunnel",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_tunnel",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_end_event_tunnel",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_tunnel",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_end_event_way_open",
		probability = 1,
		response = "pwh_crawl_end_event_way_open",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_way_open",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_end_event_way_open",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_way_open",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_end_event_waystone",
		probability = 1,
		response = "pwh_crawl_end_event_waystone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_end_event_waystone",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_end_event_waystone",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_end_event_waystone",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_get_into_third_pub",
		probability = 1,
		response = "pwh_crawl_get_into_third_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_get_into_third_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_get_into_third_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_get_into_third_pub",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_get_out_soon",
		probability = 1,
		response = "pwh_crawl_get_out_soon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_get_out_soon",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_get_out_soon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_get_out_soon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_have_a_drink",
		probability = 1,
		response = "pwh_crawl_have_a_drink",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crawl_spot_second_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_have_a_drink",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_have_a_drink",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_head_for_first_pub",
		probability = 1,
		response = "pwh_crawl_head_for_first_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_head_for_first_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_head_for_first_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_head_for_first_pub",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_head_for_second_pub",
		probability = 1,
		response = "pwh_crawl_head_for_second_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crawl_pub_horde_end",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_head_for_second_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_head_for_second_pub",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_head_for_third_pub",
		probability = 1,
		response = "pwh_crawl_head_for_third_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_head_for_third_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_head_for_third_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_head_for_third_pub",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.NUMSET,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_heard_us",
		probability = 1,
		response = "pwh_crawl_heard_us",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_heard_us",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_heard_us",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_heard_us",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.NUMSET,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_loud_crash_end_reply",
		probability = 1,
		response = "pwh_crawl_loud_crash_end_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_loud_crash_end_reply",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_loud_crash_end_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_loud_crash_end_reply",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_loud_crash_interact",
		probability = 1,
		response = "pwh_crawl_loud_crash_interact",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_loud_crash_interact",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_loud_crash_interact",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_loud_crash_interact",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_loud_crash_reply",
		probability = 1,
		response = "pwh_crawl_loud_crash_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crawl_loud_crash_interact",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_loud_crash_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_loud_crash_reply",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_mid_level_banter",
		probability = 1,
		response = "pwh_crawl_mid_level_banter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_mid_level_banter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_mid_level_banter",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_mid_level_banter",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_old_path_blocked",
		probability = 1,
		response = "pwh_crawl_old_path_blocked",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_old_path_blocked",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_old_path_blocked",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_old_path_blocked",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_pub_brazers",
		probability = 1,
		response = "pwh_crawl_pub_brazers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_brazers",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_pub_brazers",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_brazers",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_pub_destroyed",
		probability = 1,
		response = "pwh_crawl_pub_destroyed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_destroyed",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_pub_destroyed",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_destroyed",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_pub_destroyed_reaction",
		probability = 1,
		response = "pwh_crawl_pub_destroyed_reaction",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_destroyed_reaction",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_pub_destroyed_reaction",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_destroyed_reaction",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_pub_district_sign",
		probability = 1,
		response = "pwh_crawl_pub_district_sign",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_district_sign",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_pub_district_sign",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_district_sign",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_pub_door",
		probability = 1,
		response = "pwh_crawl_pub_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_door",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_pub_door",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_door",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_pub_horde_end",
		probability = 1,
		response = "pwh_crawl_pub_horde_end",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_pub_horde_end",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_shortcut",
		probability = 1,
		response = "pwh_crawl_shortcut",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_shortcut",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_shortcut",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_shortcut",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_slaughter",
		probability = 1,
		response = "pwh_crawl_slaughter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_slaughter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_slaughter",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_slaughter",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_spot_first_pub",
		probability = 1,
		response = "pwh_crawl_spot_first_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_first_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_spot_first_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_first_pub",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_spot_first_pub_closer",
		probability = 1,
		response = "pwh_crawl_spot_first_pub_closer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_first_pub_closer",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_spot_first_pub_closer",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_first_pub_closer",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_spot_second_pub",
		probability = 1,
		response = "pwh_crawl_spot_second_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_second_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_spot_third_pub",
		probability = 1,
		response = "pwh_crawl_spot_third_pub",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_spot_third_pub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_tunnel_passage",
		probability = 1,
		response = "pwh_crawl_tunnel_passage",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_tunnel_passage",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_tunnel_passage",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_tunnel_passage",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crawl_upstairs",
		probability = 1,
		response = "pwh_crawl_upstairs",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crawl_upstairs",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"crawl_upstairs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_upstairs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_crawl_intro_a",
		probability = 1,
		response = "pwh_level_crawl_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_crawl_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"level_crawl_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_crawl_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_crawl_intro_b",
		probability = 1,
		response = "pwh_level_crawl_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_crawl_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"level_crawl_intro_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_crawl_intro_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_crawl_intro_c",
		probability = 1,
		response = "pwh_level_crawl_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_crawl_intro_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"level_crawl_intro_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_crawl_intro_c",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pwh_crawl_cheers = {
			category = "level_talk_must_play",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_crawl_cheers_01",
				"pwh_crawl_cheers_02",
				"pwh_crawl_cheers_03",
				"pwh_crawl_cheers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crawl_cheers_01",
				"pwh_crawl_cheers_02",
				"pwh_crawl_cheers_03",
				"pwh_crawl_cheers_04",
			},
			sound_events_duration = {
				1.5025207996368,
				7.4420833587647,
				3.1606667041779,
				6.2520833015442,
			},
		},
		pwh_crawl_end_event_find_good_beer = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_end_event_find_good_beer_01",
				[2] = "pwh_crawl_end_event_find_good_beer_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_end_event_find_good_beer_01",
				[2] = "pwh_crawl_end_event_find_good_beer_02",
			},
			sound_events_duration = {
				[1] = 6.2309165000916,
				[2] = 6.3937916755676,
			},
		},
		pwh_crawl_end_event_keep_quiet = {
			category = "level_talk_must_play",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_end_event_keep_quiet_01",
				[2] = "pwh_crawl_end_event_keep_quiet_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_end_event_keep_quiet_01",
				[2] = "pwh_crawl_end_event_keep_quiet_02",
			},
			sound_events_duration = {
				[1] = 3.9405624866486,
				[2] = 5.3393750190735,
			},
		},
		pwh_crawl_end_event_keep_running = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_end_event_keep_running_02",
				[2] = "pwh_crawl_end_event_keep_running_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_end_event_keep_running_02",
				[2] = "pwh_crawl_end_event_keep_running_03",
			},
			sound_events_duration = {
				[1] = 3.0299792289734,
				[2] = 1.0831458568573,
			},
		},
		pwh_crawl_end_event_tunnel = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_crawl_end_event_tunnel_01",
				"pwh_crawl_end_event_tunnel_02",
				"pwh_crawl_end_event_tunnel_03",
				"pwh_crawl_end_event_tunnel_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crawl_end_event_tunnel_01",
				"pwh_crawl_end_event_tunnel_02",
				"pwh_crawl_end_event_tunnel_03",
				"pwh_crawl_end_event_tunnel_04",
			},
			sound_events_duration = {
				5.4763956069946,
				3.4567,
				5.687479019165,
				3.4567,
			},
		},
		pwh_crawl_end_event_way_open = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_end_event_way_open_03",
				[2] = "pwh_crawl_end_event_way_open_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_end_event_way_open_03",
				[2] = "pwh_crawl_end_event_way_open_04",
			},
			sound_events_duration = {
				[1] = 2.2067084312439,
				[2] = 2.1821041107178,
			},
		},
		pwh_crawl_end_event_waystone = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_end_event_waystone_03",
				[2] = "pwh_crawl_end_event_waystone_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_end_event_waystone_03",
				[2] = "pwh_crawl_end_event_waystone_04",
			},
			sound_events_duration = {
				[1] = 2.7134375572205,
				[2] = 3.5824167728424,
			},
		},
		pwh_crawl_get_into_third_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_get_into_third_pub_01",
				[2] = "pwh_crawl_get_into_third_pub_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_get_into_third_pub_01",
				[2] = "pwh_crawl_get_into_third_pub_02",
			},
			sound_events_duration = {
				[1] = 2.1490209102631,
				[2] = 2.1225833892822,
			},
		},
		pwh_crawl_get_out_soon = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_get_out_soon_01",
				[2] = "pwh_crawl_get_out_soon_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_get_out_soon_01",
				[2] = "pwh_crawl_get_out_soon_03",
			},
			sound_events_duration = {
				[1] = 5.0922708511353,
				[2] = 2.7651040554047,
			},
		},
		pwh_crawl_have_a_drink = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_have_a_drink_01",
				[2] = "pwh_crawl_have_a_drink_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_have_a_drink_01",
				[2] = "pwh_crawl_have_a_drink_03",
			},
			sound_events_duration = {
				[1] = 5.1990833282471,
				[2] = 4.401978969574,
			},
		},
		pwh_crawl_head_for_first_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_head_for_first_pub_02",
				[2] = "pwh_crawl_head_for_first_pub_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_head_for_first_pub_02",
				[2] = "pwh_crawl_head_for_first_pub_04",
			},
			sound_events_duration = {
				[1] = 6.2754793167114,
				[2] = 3.7672083377838,
			},
		},
		pwh_crawl_head_for_second_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_head_for_second_pub_02",
				[2] = "pwh_crawl_head_for_second_pub_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_head_for_second_pub_02",
				[2] = "pwh_crawl_head_for_second_pub_04",
			},
			sound_events_duration = {
				[1] = 12.119208335877,
				[2] = 7.5089373588562,
			},
		},
		pwh_crawl_head_for_third_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_head_for_third_pub_01",
				[2] = "pwh_crawl_head_for_third_pub_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_head_for_third_pub_01",
				[2] = "pwh_crawl_head_for_third_pub_04",
			},
			sound_events_duration = {
				[1] = 6.990749835968,
				[2] = 6.7427706718445,
			},
		},
		pwh_crawl_heard_us = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_heard_us_03",
				[2] = "pwh_crawl_heard_us_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_heard_us_03",
				[2] = "pwh_crawl_heard_us_04",
			},
			sound_events_duration = {
				[1] = 7.8343334197998,
				[2] = 4.3022499084473,
			},
		},
		pwh_crawl_loud_crash_end_reply = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_loud_crash_end_reply_01",
			},
			sound_events = {
				[1] = "pwh_crawl_loud_crash_end_reply_01",
			},
			sound_events_duration = {
				[1] = 3.6428959369659,
			},
		},
		pwh_crawl_loud_crash_interact = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_loud_crash_interact_01",
			},
			sound_events = {
				[1] = "pwh_crawl_loud_crash_interact_01",
			},
			sound_events_duration = {
				[1] = 4.225145816803,
			},
		},
		pwh_crawl_loud_crash_reply = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_loud_crash_reply_01",
				[2] = "pwh_crawl_loud_crash_reply_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_loud_crash_reply_01",
				[2] = "pwh_crawl_loud_crash_reply_02",
			},
			sound_events_duration = {
				[1] = 4.5249166488647,
				[2] = 7.3234376907349,
			},
		},
		pwh_crawl_mid_level_banter = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_mid_level_banter_02",
				[2] = "pwh_crawl_mid_level_banter_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_mid_level_banter_02",
				[2] = "pwh_crawl_mid_level_banter_04",
			},
			sound_events_duration = {
				[1] = 4.4188957214356,
				[2] = 3.9903957843781,
			},
		},
		pwh_crawl_old_path_blocked = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_old_path_blocked_01",
				[2] = "pwh_crawl_old_path_blocked_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_old_path_blocked_01",
				[2] = "pwh_crawl_old_path_blocked_03",
			},
			sound_events_duration = {
				[1] = 2.921416759491,
				[2] = 1.7000000476837,
			},
		},
		pwh_crawl_pub_brazers = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_pub_brazers_01",
				[2] = "pwh_crawl_pub_brazers_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_pub_brazers_01",
				[2] = "pwh_crawl_pub_brazers_03",
			},
			sound_events_duration = {
				[1] = 5.9021043777466,
				[2] = 5.6956043243408,
			},
		},
		pwh_crawl_pub_destroyed = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_pub_destroyed_02",
				[2] = "pwh_crawl_pub_destroyed_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_pub_destroyed_02",
				[2] = "pwh_crawl_pub_destroyed_04",
			},
			sound_events_duration = {
				[1] = 4.1852293014526,
				[2] = 3.2244167327881,
			},
		},
		pwh_crawl_pub_destroyed_reaction = {
			category = "level_talk_must_play",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 9,
			face_animations_n = 9,
			randomize_indexes_n = 0,
			sound_events_n = 9,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
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
				"face_angry",
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
				"pwh_curse_10",
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
				"pwh_curse_10",
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
				3.0420832633972,
			},
		},
		pwh_crawl_pub_district_sign = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_pub_district_sign_01",
				[2] = "pwh_crawl_pub_district_sign_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_pub_district_sign_01",
				[2] = "pwh_crawl_pub_district_sign_03",
			},
			sound_events_duration = {
				[1] = 3.2044999599457,
				[2] = 6.9863748550415,
			},
		},
		pwh_crawl_pub_door = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_pub_door_01",
				[2] = "pwh_crawl_pub_door_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_pub_door_01",
				[2] = "pwh_crawl_pub_door_04",
			},
			sound_events_duration = {
				[1] = 4.1078543663025,
				[2] = 4.2805833816528,
			},
		},
		pwh_crawl_pub_horde_end = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_pub_horde_end_02",
				[2] = "pwh_crawl_pub_horde_end_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_pub_horde_end_02",
				[2] = "pwh_crawl_pub_horde_end_03",
			},
			sound_events_duration = {
				[1] = 6.2833333015442,
				[2] = 5.2207918167114,
			},
		},
		pwh_crawl_shortcut = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_shortcut_01",
				[2] = "pwh_crawl_shortcut_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_shortcut_01",
				[2] = "pwh_crawl_shortcut_04",
			},
			sound_events_duration = {
				[1] = 5.8090624809265,
				[2] = 3.254604101181,
			},
		},
		pwh_crawl_slaughter = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_slaughter_01",
				[2] = "pwh_crawl_slaughter_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_slaughter_01",
				[2] = "pwh_crawl_slaughter_03",
			},
			sound_events_duration = {
				[1] = 4.0881667137146,
				[2] = 4.3058958053589,
			},
		},
		pwh_crawl_spot_first_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_spot_first_pub_02",
				[2] = "pwh_crawl_spot_first_pub_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_spot_first_pub_02",
				[2] = "pwh_crawl_spot_first_pub_04",
			},
			sound_events_duration = {
				[1] = 6.3797082901001,
				[2] = 4.0360832214356,
			},
		},
		pwh_crawl_spot_first_pub_closer = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_crawl_spot_first_pub_closer_03",
				[2] = "pwh_crawl_spot_first_pub_closer_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_spot_first_pub_closer_03",
				[2] = "pwh_crawl_spot_first_pub_closer_04",
			},
			sound_events_duration = {
				[1] = 10.417395591736,
				[2] = 7.5632290840149,
			},
		},
		pwh_crawl_spot_second_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_spot_second_pub_02",
			},
			sound_events = {
				[1] = "pwh_crawl_spot_second_pub_02",
			},
			sound_events_duration = {
				[1] = 5.166437625885,
			},
		},
		pwh_crawl_spot_third_pub = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_spot_third_pub_01",
				[2] = "pwh_crawl_spot_third_pub_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_spot_third_pub_01",
				[2] = "pwh_crawl_spot_third_pub_03",
			},
			sound_events_duration = {
				[1] = 11.19997882843,
				[2] = 9.4616870880127,
			},
		},
		pwh_crawl_tunnel_passage = {
			category = "level_talk",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_tunnel_passage_02",
				[2] = "pwh_crawl_tunnel_passage_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_tunnel_passage_02",
				[2] = "pwh_crawl_tunnel_passage_03",
			},
			sound_events_duration = {
				[1] = 4.0516247749329,
				[2] = 4.8061876296997,
			},
		},
		pwh_crawl_upstairs = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_crawl_upstairs_01",
				[2] = "pwh_crawl_upstairs_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crawl_upstairs_01",
				[2] = "pwh_crawl_upstairs_03",
			},
			sound_events_duration = {
				[1] = 3.5250625610352,
				[2] = 7.1121668815613,
			},
		},
		pwh_level_crawl_intro_a = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_crawl_intro_a_01",
				[2] = "pwh_level_crawl_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_crawl_intro_a_01",
				[2] = "pwh_level_crawl_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.7928748130798,
				[2] = 5.5212082862854,
			},
		},
		pwh_level_crawl_intro_b = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_crawl_intro_b_01",
				[2] = "pwh_level_crawl_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_crawl_intro_b_01",
				[2] = "pwh_level_crawl_intro_b_02",
			},
			sound_events_duration = {
				[1] = 2.7618749141693,
				[2] = 3.7573957443237,
			},
		},
		pwh_level_crawl_intro_c = {
			category = "cut_scene",
			database = "witch_hunter_crawl",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_level_crawl_intro_c_01",
				[2] = "pwh_level_crawl_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_crawl_intro_c_01",
				[2] = "pwh_level_crawl_intro_c_02",
			},
			sound_events_duration = {
				[1] = 6.5516247749329,
				[2] = 6.0593957901001,
			},
		},
	})
end
