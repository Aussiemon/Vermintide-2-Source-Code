-- chunkname: @dialogues/generated/witch_hunter_mines.lua

return function ()
	define_rule({
		name = "pwh_level_mine_bell_ringing",
		response = "pwh_level_mine_bell_ringing",
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
		name = "pwh_level_mine_big_troll_cave",
		response = "pwh_level_mine_big_troll_cave",
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
		name = "pwh_level_mine_bridge",
		response = "pwh_level_mine_bridge",
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
		name = "pwh_level_mine_darkness",
		response = "pwh_level_mine_darkness",
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
		name = "pwh_level_mine_find_explosives",
		response = "pwh_level_mine_find_explosives",
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
		name = "pwh_level_mine_follow_tracks",
		response = "pwh_level_mine_follow_tracks",
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
		name = "pwh_level_mine_found_cart_troll_cave",
		response = "pwh_level_mine_found_cart_troll_cave",
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
		name = "pwh_level_mine_gloat",
		response = "pwh_level_mine_gloat",
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
		name = "pwh_level_mine_impressive_cave",
		response = "pwh_level_mine_impressive_cave",
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
		name = "pwh_level_mine_lost_cart",
		response = "pwh_level_mine_lost_cart",
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
		name = "pwh_level_mine_mine_cart",
		response = "pwh_level_mine_mine_cart",
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
		name = "pwh_level_mine_mine_cart_drops_away",
		response = "pwh_level_mine_mine_cart_drops_away",
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
		name = "pwh_level_mine_mine_cart_push_upwards",
		response = "pwh_level_mine_mine_cart_push_upwards",
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
		name = "pwh_level_mine_mine_cart_remind",
		response = "pwh_level_mine_mine_cart_remind",
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
		name = "pwh_level_mine_mine_cart_roll_down_back",
		response = "pwh_level_mine_mine_cart_roll_down_back",
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
		name = "pwh_level_mine_mine_cart_roll_down_forward",
		response = "pwh_level_mine_mine_cart_roll_down_forward",
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
		name = "pwh_level_mine_portal",
		response = "pwh_level_mine_portal",
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
		name = "pwh_level_mine_troll_doors",
		response = "pwh_level_mine_troll_doors",
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
		name = "pwh_level_mine_troll_food_storage",
		response = "pwh_level_mine_troll_food_storage",
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
		name = "pwh_level_mine_warren",
		response = "pwh_level_mine_warren",
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
		name = "pwh_mine_intro_a",
		response = "pwh_mine_intro_a",
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
		name = "pwh_mine_intro_b",
		response = "pwh_mine_intro_b",
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
				"witch_hunter",
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
		name = "pwh_mine_intro_c",
		response = "pwh_mine_intro_c",
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
				"witch_hunter",
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
		pwh_level_mine_bell_ringing = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_bell_ringing_01",
				"pwh_level_mine_bell_ringing_02",
				"pwh_level_mine_bell_ringing_03",
				"pwh_level_mine_bell_ringing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_bell_ringing_01",
				"pwh_level_mine_bell_ringing_02",
				"pwh_level_mine_bell_ringing_03",
				"pwh_level_mine_bell_ringing_04",
			},
			sound_events_duration = {
				5.0017914772034,
				3.6483125686645,
				3.8800001144409,
				5.1608543395996,
			},
		},
		pwh_level_mine_big_troll_cave = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_big_troll_cave_01",
				"pwh_level_mine_big_troll_cave_02",
				"pwh_level_mine_big_troll_cave_03",
				"pwh_level_mine_big_troll_cave_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_big_troll_cave_01",
				"pwh_level_mine_big_troll_cave_02",
				"pwh_level_mine_big_troll_cave_03",
				"pwh_level_mine_big_troll_cave_04",
			},
			sound_events_duration = {
				3.4344582557678,
				4.845166683197,
				5.1881456375122,
				4.4914793968201,
			},
		},
		pwh_level_mine_bridge = {
			category = "cut_scene",
			database = "witch_hunter_mines",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_objective_correct_path_bridge_02",
				[2] = "pwh_objective_correct_path_bridge_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_correct_path_bridge_02",
				[2] = "pwh_objective_correct_path_bridge_03",
			},
			sound_events_duration = {
				[1] = 1.5383750200272,
				[2] = 1.0283750295639,
			},
		},
		pwh_level_mine_darkness = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_darkness_01",
				"pwh_level_mine_darkness_02",
				"pwh_level_mine_darkness_03",
				"pwh_level_mine_darkness_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_darkness_01",
				"pwh_level_mine_darkness_02",
				"pwh_level_mine_darkness_03",
				"pwh_level_mine_darkness_04",
			},
			sound_events_duration = {
				3.643458366394,
				3.6918957233429,
				3.8566665649414,
				4.9946455955505,
			},
		},
		pwh_level_mine_find_explosives = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_find_explosives_01",
				"pwh_level_mine_find_explosives_02",
				"pwh_level_mine_find_explosives_03",
				"pwh_level_mine_find_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_find_explosives_01",
				"pwh_level_mine_find_explosives_02",
				"pwh_level_mine_find_explosives_03",
				"pwh_level_mine_find_explosives_04",
			},
			sound_events_duration = {
				2.6773750782013,
				4.0110416412353,
				3.2082290649414,
				3.9823334217072,
			},
		},
		pwh_level_mine_follow_tracks = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_follow_tracks_01",
				"pwh_level_mine_follow_tracks_02",
				"pwh_level_mine_follow_tracks_03",
				"pwh_level_mine_follow_tracks_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_follow_tracks_01",
				"pwh_level_mine_follow_tracks_02",
				"pwh_level_mine_follow_tracks_03",
				"pwh_level_mine_follow_tracks_04",
			},
			sound_events_duration = {
				1.6720000505447,
				1.842812538147,
				2.4112083911896,
				2.2355625629425,
			},
		},
		pwh_level_mine_found_cart_troll_cave = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_found_cart_troll_cave_01",
				"pwh_level_mine_found_cart_troll_cave_02",
				"pwh_level_mine_found_cart_troll_cave_03",
				"pwh_level_mine_found_cart_troll_cave_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_found_cart_troll_cave_01",
				"pwh_level_mine_found_cart_troll_cave_02",
				"pwh_level_mine_found_cart_troll_cave_03",
				"pwh_level_mine_found_cart_troll_cave_04",
			},
			sound_events_duration = {
				5.3189167976379,
				3.9840416908264,
				4.8575625419617,
				6.3225207328796,
			},
		},
		pwh_level_mine_gloat = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_gloat_01",
				"pwh_level_mine_gloat_02",
				"pwh_level_mine_gloat_03",
				"pwh_level_mine_gloat_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_gloat_01",
				"pwh_level_mine_gloat_02",
				"pwh_level_mine_gloat_03",
				"pwh_level_mine_gloat_04",
			},
			sound_events_duration = {
				6.9560208320618,
				5.6396040916443,
				6.2737498283386,
				4.5703125,
			},
		},
		pwh_level_mine_impressive_cave = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_impressive_cave_01",
				"pwh_level_mine_impressive_cave_02",
				"pwh_level_mine_impressive_cave_03",
				"pwh_level_mine_impressive_cave_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_impressive_cave_01",
				"pwh_level_mine_impressive_cave_02",
				"pwh_level_mine_impressive_cave_03",
				"pwh_level_mine_impressive_cave_04",
			},
			sound_events_duration = {
				5.9051251411438,
				2.7176458835602,
				5.2836456298828,
				6.6374998092651,
			},
		},
		pwh_level_mine_lost_cart = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_lost_cart_01",
				"pwh_level_mine_lost_cart_02",
				"pwh_level_mine_lost_cart_03",
				"pwh_level_mine_lost_cart_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_lost_cart_01",
				"pwh_level_mine_lost_cart_02",
				"pwh_level_mine_lost_cart_03",
				"pwh_level_mine_lost_cart_04",
			},
			sound_events_duration = {
				2.3424999713898,
				2.6243124008179,
				2.7221875190735,
				3.3135623931885,
			},
		},
		pwh_level_mine_mine_cart = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_mine_cart_01",
				"pwh_level_mine_mine_cart_02",
				"pwh_level_mine_mine_cart_03",
				"pwh_level_mine_mine_cart_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_mine_cart_01",
				"pwh_level_mine_mine_cart_02",
				"pwh_level_mine_mine_cart_03",
				"pwh_level_mine_mine_cart_04",
			},
			sound_events_duration = {
				1.760125041008,
				1.9448125362396,
				3.1325416564941,
				2.1661875247955,
			},
		},
		pwh_level_mine_mine_cart_drops_away = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_mine_cart_drops_away_01",
				"pwh_level_mine_mine_cart_drops_away_02",
				"pwh_level_mine_mine_cart_drops_away_03",
				"pwh_level_mine_mine_cart_drops_away_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_mine_cart_drops_away_01",
				"pwh_level_mine_mine_cart_drops_away_02",
				"pwh_level_mine_mine_cart_drops_away_03",
				"pwh_level_mine_mine_cart_drops_away_04",
			},
			sound_events_duration = {
				1.6132500171661,
				1.52108335495,
				1.8100416660309,
				4.4359169006348,
			},
		},
		pwh_level_mine_mine_cart_push_upwards = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_mine_cart_push_upwards_01",
				"pwh_level_mine_mine_cart_push_upwards_02",
				"pwh_level_mine_mine_cart_push_upwards_03",
				"pwh_level_mine_mine_cart_push_upwards_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_mine_cart_push_upwards_01",
				"pwh_level_mine_mine_cart_push_upwards_02",
				"pwh_level_mine_mine_cart_push_upwards_03",
				"pwh_level_mine_mine_cart_push_upwards_04",
			},
			sound_events_duration = {
				3.863874912262,
				3.9635832309723,
				3.3836250305176,
				2.9507291316986,
			},
		},
		pwh_level_mine_mine_cart_remind = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_mine_cart_remind_01",
				"pwh_level_mine_mine_cart_remind_02",
				"pwh_level_mine_mine_cart_remind_03",
				"pwh_level_mine_mine_cart_remind_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_mine_cart_remind_01",
				"pwh_level_mine_mine_cart_remind_02",
				"pwh_level_mine_mine_cart_remind_03",
				"pwh_level_mine_mine_cart_remind_04",
			},
			sound_events_duration = {
				1.9503124952316,
				2.1462500095367,
				3.0578334331513,
				2.4515833854675,
			},
		},
		pwh_level_mine_mine_cart_roll_down_back = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_mine_cart_roll_down_back_01",
				"pwh_level_mine_mine_cart_roll_down_back_02",
				"pwh_level_mine_mine_cart_roll_down_back_03",
				"pwh_level_mine_mine_cart_roll_down_back_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_mine_cart_roll_down_back_01",
				"pwh_level_mine_mine_cart_roll_down_back_02",
				"pwh_level_mine_mine_cart_roll_down_back_03",
				"pwh_level_mine_mine_cart_roll_down_back_04",
			},
			sound_events_duration = {
				1.9835624694824,
				3.2907292842865,
				2.2974166870117,
				1.3384791612625,
			},
		},
		pwh_level_mine_mine_cart_roll_down_forward = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_mine_cart_roll_down_forward_01",
				"pwh_level_mine_mine_cart_roll_down_forward_02",
				"pwh_level_mine_mine_cart_roll_down_forward_03",
				"pwh_level_mine_mine_cart_roll_down_forward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_mine_cart_roll_down_forward_01",
				"pwh_level_mine_mine_cart_roll_down_forward_02",
				"pwh_level_mine_mine_cart_roll_down_forward_03",
				"pwh_level_mine_mine_cart_roll_down_forward_04",
			},
			sound_events_duration = {
				3.5852708816528,
				3.0401875972748,
				2.3135833740234,
				2.7436249256134,
			},
		},
		pwh_level_mine_portal = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_portal_01",
				"pwh_level_mine_portal_02",
				"pwh_level_mine_portal_03",
				"pwh_level_mine_portal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_portal_01",
				"pwh_level_mine_portal_02",
				"pwh_level_mine_portal_03",
				"pwh_level_mine_portal_04",
			},
			sound_events_duration = {
				5.2781667709351,
				3.4387290477753,
				5.5873956680298,
				4.7879166603088,
			},
		},
		pwh_level_mine_troll_doors = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_troll_doors_01",
				"pwh_level_mine_troll_doors_02",
				"pwh_level_mine_troll_doors_03",
				"pwh_level_mine_troll_doors_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_troll_doors_01",
				"pwh_level_mine_troll_doors_02",
				"pwh_level_mine_troll_doors_03",
				"pwh_level_mine_troll_doors_04",
			},
			sound_events_duration = {
				4.9458541870117,
				5.1966042518616,
				4.2873959541321,
				2.6281666755676,
			},
		},
		pwh_level_mine_troll_food_storage = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				[1] = "pwh_level_mine_troll_food_storage_01",
				[2] = "pwh_level_mine_troll_food_storage_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_mine_troll_food_storage_01",
				[2] = "pwh_level_mine_troll_food_storage_02",
			},
			sound_events_duration = {
				[1] = 2.2711458206177,
				[2] = 6.2870416641235,
			},
		},
		pwh_level_mine_warren = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				"pwh_level_mine_warren_01",
				"pwh_level_mine_warren_02",
				"pwh_level_mine_warren_03",
				"pwh_level_mine_warren_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_mine_warren_01",
				"pwh_level_mine_warren_02",
				"pwh_level_mine_warren_03",
				"pwh_level_mine_warren_04",
			},
			sound_events_duration = {
				4.5329375267029,
				2.767499923706,
				3.4670832157135,
				5.0370001792908,
			},
		},
		pwh_mine_intro_a = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				[1] = "pwh_mine_intro_a_01",
				[2] = "pwh_mine_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_mine_intro_a_01",
				[2] = "pwh_mine_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.1932291984558,
				[2] = 2.5104792118073,
			},
		},
		pwh_mine_intro_b = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				[1] = "pwh_mine_intro_b_01",
				[2] = "pwh_mine_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_mine_intro_b_01",
				[2] = "pwh_mine_intro_b_02",
			},
			sound_events_duration = {
				[1] = 6.0136251449585,
				[2] = 6.1169166564941,
			},
		},
		pwh_mine_intro_c = {
			category = "level_talk",
			database = "witch_hunter_mines",
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
				[1] = "pwh_mine_intro_c_01",
				[2] = "pwh_mine_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_mine_intro_c_01",
				[2] = "pwh_mine_intro_c_02",
			},
			sound_events_duration = {
				[1] = 6.7366042137146,
				[2] = 6.4781665802002,
			},
		},
	})
end
