-- chunkname: @dialogues/generated/empire_soldier_mines.lua

return function ()
	define_rule({
		name = "pes_level_mine_bell_ringing",
		response = "pes_level_mine_bell_ringing",
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
				"level_mine_bell_ringing",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_bell_ringing",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_bell_ringing",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_big_troll_cave",
		response = "pes_level_mine_big_troll_cave",
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
				"level_mine_big_troll_cave",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_bridge",
		response = "pes_level_mine_bridge",
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
				"level_mine_bridge",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_darkness",
		response = "pes_level_mine_darkness",
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
				"level_mine_darkness",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_darkness",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_darkness",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_find_explosives",
		response = "pes_level_mine_find_explosives",
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
				"level_mine_find_explosives",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_find_explosives",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_find_explosives",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_follow_tracks",
		response = "pes_level_mine_follow_tracks",
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
				"level_mine_follow_tracks",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_follow_tracks",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_follow_tracks",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_found_cart_troll_cave",
		response = "pes_level_mine_found_cart_troll_cave",
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
				"level_mine_found_cart_troll_cave",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_found_cart_troll_cave",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_found_cart_troll_cave",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_gloat",
		response = "pes_level_mine_gloat",
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
				"level_mine_gloat",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_gloat",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_gloat",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_impressive_cave",
		response = "pes_level_mine_impressive_cave",
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
				"level_mine_impressive_cave",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_impressive_cave",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_impressive_cave",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_ladder",
		response = "pes_level_mine_ladder",
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
				"level_mine_ladder",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_ladder",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_ladder",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_lost_cart",
		response = "pes_level_mine_lost_cart",
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
				"level_mine_lost_cart",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_lost_cart",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_lost_cart",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_mine_cart",
		response = "pes_level_mine_mine_cart",
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
				"level_mine_mine_cart",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_mine_cart",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_mine_cart_drops_away",
		response = "pes_level_mine_mine_cart_drops_away",
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
				"level_mine_mine_cart_drops_away",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_mine_cart_drops_away",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_drops_away",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_mine_cart_push_upwards",
		response = "pes_level_mine_mine_cart_push_upwards",
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
				"level_mine_mine_cart_push_upwards",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_mine_cart_push_upwards",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_push_upwards",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_mine_cart_remind",
		response = "pes_level_mine_mine_cart_remind",
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
				"level_mine_mine_cart_remind",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_mine_cart_remind",
				OP.TIMEDIFF,
				OP.GT,
				30,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_remind",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_mine_cart_roll_down_back",
		response = "pes_level_mine_mine_cart_roll_down_back",
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
				"level_mine_mine_cart_roll_down_back",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_mine_cart_roll_down_back",
				OP.TIMEDIFF,
				OP.GT,
				30,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_roll_down_back",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_mine_cart_roll_down_forward",
		response = "pes_level_mine_mine_cart_roll_down_forward",
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
				"level_mine_mine_cart_roll_down_forward",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_mine_cart_roll_down_forward",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_roll_down_forward",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_portal",
		response = "pes_level_mine_portal",
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
				"level_mine_portal",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_portal",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_portal",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_troll_doors",
		response = "pes_level_mine_troll_doors",
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
				"level_mine_troll_doors",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_troll_doors",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_troll_doors",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_troll_food_storage",
		response = "pes_level_mine_troll_food_storage",
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
				"level_mine_troll_food_storage",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_troll_food_storage",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_troll_food_storage",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_mine_warren",
		response = "pes_level_mine_warren",
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
				"level_mine_warren",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_mine_warren",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_warren",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_mine_intro_a",
		response = "pes_mine_intro_a",
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
				"mine_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"mine_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"mine_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_mine_intro_b",
		response = "pes_mine_intro_b",
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
				"mine_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"mine_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"mine_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_mine_intro_c",
		response = "pes_mine_intro_c",
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
				"mine_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"mine_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"mine_intro_c",
				OP.TIMESET,
			},
		},
	})
	add_dialogues({
		pes_level_mine_bell_ringing = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_bell_ringing_01",
				"pes_level_mine_bell_ringing_02",
				"pes_level_mine_bell_ringing_03",
				"pes_level_mine_bell_ringing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_bell_ringing_01",
				"pes_level_mine_bell_ringing_02",
				"pes_level_mine_bell_ringing_03",
				"pes_level_mine_bell_ringing_04",
			},
			sound_events_duration = {
				2.471937417984,
				1.9916042089462,
				3.1292707920074,
				2.1738958358765,
			},
		},
		pes_level_mine_big_troll_cave = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_big_troll_cave_01",
				"pes_level_mine_big_troll_cave_02",
				"pes_level_mine_big_troll_cave_03",
				"pes_level_mine_big_troll_cave_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_big_troll_cave_01",
				"pes_level_mine_big_troll_cave_02",
				"pes_level_mine_big_troll_cave_03",
				"pes_level_mine_big_troll_cave_04",
			},
			sound_events_duration = {
				2.4600417613983,
				4.2458333969116,
				4.9382290840149,
				4.097291469574,
			},
		},
		pes_level_mine_bridge = {
			category = "cut_scene",
			database = "empire_soldier_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_objective_correct_path_bridge_01",
			},
			sound_events = {
				[1] = "pes_objective_correct_path_bridge_01",
			},
			sound_events_duration = {
				[1] = 1.284083366394,
			},
		},
		pes_level_mine_darkness = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_darkness_01",
				"pes_level_mine_darkness_02",
				"pes_level_mine_darkness_03",
				"pes_level_mine_darkness_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_darkness_01",
				"pes_level_mine_darkness_02",
				"pes_level_mine_darkness_03",
				"pes_level_mine_darkness_04",
			},
			sound_events_duration = {
				1.495854139328,
				1.9927083253861,
				3.4976251125336,
				2.6646873950958,
			},
		},
		pes_level_mine_find_explosives = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_find_explosives_01",
				"pes_level_mine_find_explosives_02",
				"pes_level_mine_find_explosives_03",
				"pes_level_mine_find_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_find_explosives_01",
				"pes_level_mine_find_explosives_02",
				"pes_level_mine_find_explosives_03",
				"pes_level_mine_find_explosives_04",
			},
			sound_events_duration = {
				3.9713749885559,
				2.0944166183472,
				5.4389791488647,
				3.1799790859222,
			},
		},
		pes_level_mine_follow_tracks = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_level_mine_follow_tracks_01",
				"pes_level_mine_follow_tracks_02",
				"pes_level_mine_follow_tracks_03",
				"pes_level_mine_follow_tracks_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_follow_tracks_01",
				"pes_level_mine_follow_tracks_02",
				"pes_level_mine_follow_tracks_03",
				"pes_level_mine_follow_tracks_04",
			},
			sound_events_duration = {
				1.92287504673,
				3.5612916946411,
				1.7020000219345,
				2.5825624465942,
			},
		},
		pes_level_mine_found_cart_troll_cave = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_found_cart_troll_cave_01",
				"pes_level_mine_found_cart_troll_cave_02",
				"pes_level_mine_found_cart_troll_cave_03",
				"pes_level_mine_found_cart_troll_cave_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_found_cart_troll_cave_01",
				"pes_level_mine_found_cart_troll_cave_02",
				"pes_level_mine_found_cart_troll_cave_03",
				"pes_level_mine_found_cart_troll_cave_04",
			},
			sound_events_duration = {
				2.5077290534973,
				1.9612708091736,
				1.9077500104904,
				3.9149582386017,
			},
		},
		pes_level_mine_gloat = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_gloat_01",
				"pes_level_mine_gloat_02",
				"pes_level_mine_gloat_03",
				"pes_level_mine_gloat_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_gloat_01",
				"pes_level_mine_gloat_02",
				"pes_level_mine_gloat_03",
				"pes_level_mine_gloat_04",
			},
			sound_events_duration = {
				4.1270833015442,
				3.4503540992737,
				4.8000001907349,
				4.5910210609436,
			},
		},
		pes_level_mine_impressive_cave = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_impressive_cave_01",
				"pes_level_mine_impressive_cave_02",
				"pes_level_mine_impressive_cave_03",
				"pes_level_mine_impressive_cave_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_impressive_cave_01",
				"pes_level_mine_impressive_cave_02",
				"pes_level_mine_impressive_cave_03",
				"pes_level_mine_impressive_cave_04",
			},
			sound_events_duration = {
				4.6160001754761,
				1.6484792232513,
				3.408979177475,
				4.9293541908264,
			},
		},
		pes_level_mine_ladder = {
			category = "level_talk",
			database = "empire_soldier_mines",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_level_mine_ladder_01",
				"pes_level_mine_ladder_02",
				"pes_level_mine_ladder_03",
				"pes_level_mine_ladder_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_ladder_01",
				"pes_level_mine_ladder_02",
				"pes_level_mine_ladder_03",
				"pes_level_mine_ladder_04",
			},
			sound_events_duration = {
				3.3205416202545,
				2.5504374504089,
				2.8904583454132,
				3.5309791564941,
			},
		},
		pes_level_mine_lost_cart = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_lost_cart_01",
				"pes_level_mine_lost_cart_02",
				"pes_level_mine_lost_cart_03",
				"pes_level_mine_lost_cart_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_lost_cart_01",
				"pes_level_mine_lost_cart_02",
				"pes_level_mine_lost_cart_03",
				"pes_level_mine_lost_cart_04",
			},
			sound_events_duration = {
				1.9616041183472,
				3.1810624599457,
				2.6015417575836,
				1.9211457967758,
			},
		},
		pes_level_mine_mine_cart = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_level_mine_mine_cart_01",
				"pes_level_mine_mine_cart_02",
				"pes_level_mine_mine_cart_03",
				"pes_level_mine_mine_cart_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_mine_cart_01",
				"pes_level_mine_mine_cart_02",
				"pes_level_mine_mine_cart_03",
				"pes_level_mine_mine_cart_04",
			},
			sound_events_duration = {
				3.006979227066,
				2.4996666908264,
				1.9237500429153,
				2.748229265213,
			},
		},
		pes_level_mine_mine_cart_drops_away = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_mine_cart_drops_away_01",
				"pes_level_mine_mine_cart_drops_away_02",
				"pes_level_mine_mine_cart_drops_away_03",
				"pes_level_mine_mine_cart_drops_away_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_mine_cart_drops_away_01",
				"pes_level_mine_mine_cart_drops_away_02",
				"pes_level_mine_mine_cart_drops_away_03",
				"pes_level_mine_mine_cart_drops_away_04",
			},
			sound_events_duration = {
				2.8674166202545,
				2.1380832195282,
				2.1757082939148,
				3.9229791164398,
			},
		},
		pes_level_mine_mine_cart_push_upwards = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_mine_cart_push_upwards_01",
				"pes_level_mine_mine_cart_push_upwards_02",
				"pes_level_mine_mine_cart_push_upwards_03",
				"pes_level_mine_mine_cart_push_upwards_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_mine_cart_push_upwards_01",
				"pes_level_mine_mine_cart_push_upwards_02",
				"pes_level_mine_mine_cart_push_upwards_03",
				"pes_level_mine_mine_cart_push_upwards_04",
			},
			sound_events_duration = {
				1.2148125171661,
				1.9862500429153,
				2.6417083740234,
				2.7369375228882,
			},
		},
		pes_level_mine_mine_cart_remind = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pes_level_mine_mine_cart_remind_01",
				"pes_level_mine_mine_cart_remind_02",
				"pes_level_mine_mine_cart_remind_03",
				"pes_level_mine_mine_cart_remind_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_mine_cart_remind_01",
				"pes_level_mine_mine_cart_remind_02",
				"pes_level_mine_mine_cart_remind_03",
				"pes_level_mine_mine_cart_remind_04",
			},
			sound_events_duration = {
				2.1169791221619,
				2.2845416069031,
				1.9014583826065,
				1.9552083015442,
			},
		},
		pes_level_mine_mine_cart_roll_down_back = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_mine_cart_roll_down_back_01",
				"pes_level_mine_mine_cart_roll_down_back_02",
				"pes_level_mine_mine_cart_roll_down_back_03",
				"pes_level_mine_mine_cart_roll_down_back_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_mine_cart_roll_down_back_01",
				"pes_level_mine_mine_cart_roll_down_back_02",
				"pes_level_mine_mine_cart_roll_down_back_03",
				"pes_level_mine_mine_cart_roll_down_back_04",
			},
			sound_events_duration = {
				1.8589999675751,
				1.6283333301544,
				2.8487915992737,
				3.6047084331513,
			},
		},
		pes_level_mine_mine_cart_roll_down_forward = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_mine_cart_roll_down_forward_01",
				"pes_level_mine_mine_cart_roll_down_forward_02",
				"pes_level_mine_mine_cart_roll_down_forward_03",
				"pes_level_mine_mine_cart_roll_down_forward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_mine_cart_roll_down_forward_01",
				"pes_level_mine_mine_cart_roll_down_forward_02",
				"pes_level_mine_mine_cart_roll_down_forward_03",
				"pes_level_mine_mine_cart_roll_down_forward_04",
			},
			sound_events_duration = {
				2.6936666965485,
				2.2580416202545,
				1.871270775795,
				1.7323333024979,
			},
		},
		pes_level_mine_portal = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_portal_01",
				"pes_level_mine_portal_02",
				"pes_level_mine_portal_03",
				"pes_level_mine_portal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_portal_01",
				"pes_level_mine_portal_02",
				"pes_level_mine_portal_03",
				"pes_level_mine_portal_04",
			},
			sound_events_duration = {
				4.994562625885,
				2.8563125133514,
				6.7375626564026,
				2.2355625629425,
			},
		},
		pes_level_mine_troll_doors = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_troll_doors_01",
				"pes_level_mine_troll_doors_02",
				"pes_level_mine_troll_doors_03",
				"pes_level_mine_troll_doors_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_troll_doors_01",
				"pes_level_mine_troll_doors_02",
				"pes_level_mine_troll_doors_03",
				"pes_level_mine_troll_doors_04",
			},
			sound_events_duration = {
				3.5583958625794,
				2.3433542251587,
				3.8194999694824,
				2.8017499446869,
			},
		},
		pes_level_mine_troll_food_storage = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_troll_food_storage_01",
				"pes_level_mine_troll_food_storage_02",
				"pes_level_mine_troll_food_storage_03",
				"pes_level_mine_troll_food_storage_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_troll_food_storage_01",
				"pes_level_mine_troll_food_storage_02",
				"pes_level_mine_troll_food_storage_03",
				"pes_level_mine_troll_food_storage_04",
			},
			sound_events_duration = {
				4.7207708358765,
				4.2430624961853,
				4.4986667633057,
				5.3734169006348,
			},
		},
		pes_level_mine_warren = {
			category = "level_talk",
			database = "empire_soldier_mines",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_mine_warren_01",
				"pes_level_mine_warren_02",
				"pes_level_mine_warren_03",
				"pes_level_mine_warren_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_mine_warren_01",
				"pes_level_mine_warren_02",
				"pes_level_mine_warren_03",
				"pes_level_mine_warren_04",
			},
			sound_events_duration = {
				4.4744582176208,
				3.6230833530426,
				2.7099375724792,
				4.7203750610352,
			},
		},
		pes_mine_intro_a = {
			category = "level_talk",
			database = "empire_soldier_mines",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_mine_intro_a_01",
				[2] = "pes_mine_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_mine_intro_a_01",
				[2] = "pes_mine_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.3048124313355,
				[2] = 3.969708442688,
			},
		},
		pes_mine_intro_b = {
			category = "level_talk",
			database = "empire_soldier_mines",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_mine_intro_b_01",
				[2] = "pes_mine_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_mine_intro_b_01",
				[2] = "pes_mine_intro_b_02",
			},
			sound_events_duration = {
				[1] = 2.9109582901001,
				[2] = 3.631854057312,
			},
		},
		pes_mine_intro_c = {
			category = "level_talk",
			database = "empire_soldier_mines",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_mine_intro_c_01",
				[2] = "pes_mine_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_mine_intro_c_01",
				[2] = "pes_mine_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.548791885376,
				[2] = 7.6277289390564,
			},
		},
	})
end
