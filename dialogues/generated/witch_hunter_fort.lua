-- chunkname: @dialogues/generated/witch_hunter_fort.lua

return function ()
	define_rule({
		name = "pwh_fort_intro_a",
		probability = 1,
		response = "pwh_fort_intro_a",
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
				"fort_intro_a",
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
				"fort_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"fort_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_fort_intro_b",
		probability = 1,
		response = "pwh_fort_intro_b",
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
				"fort_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_fort_intro_c",
		probability = 1,
		response = "pwh_fort_intro_c",
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
				"fort_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_cannonballs",
		probability = 1,
		response = "pwh_level_fort_cannonballs",
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
				"level_fort_cannonballs",
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
				"level_fort_cannonballs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_cannons_silenced",
		probability = 1,
		response = "pwh_level_fort_cannons_silenced",
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
				"level_fort_cannons_silenced",
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
				"level_fort_cannons_silenced",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannons_silenced",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_cross_here",
		probability = 1,
		response = "pwh_level_fort_cross_here",
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
				"level_fort_cross_here",
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
				"level_fort_cross_here",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cross_here",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_final_fire",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_final_fire",
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
				"level_fort_fire_cannon_final_fire",
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
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_final_hit",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_final_hit",
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
				"level_fort_fire_cannon_final_hit",
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
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_first",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_first",
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
				"level_fort_fire_cannon_first",
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
				"level_fort_fire_cannon_first",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_first_hit",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_fuse_is_lit",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_fuse_is_lit",
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
				"level_fort_fire_cannon_fuse_is_lit",
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
				"level_fort_fire_cannon_fuse_is_lit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_fuse_is_lit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_second",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_second",
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
				"level_fort_fire_cannon_second",
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
				"level_fort_fire_cannon_second",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_second_hit",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_gate_fallen",
		probability = 1,
		response = "pwh_level_fort_gate_fallen",
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
				"level_fort_gate_fallen",
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
				"level_fort_gate_fallen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_gate_fallen",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_getting_closer",
		probability = 1,
		response = "pwh_level_fort_getting_closer",
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
				"level_fort_getting_closer",
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
				"level_fort_getting_closer",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_getting_closer",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_plague_claw_shelling",
		probability = 1,
		response = "pwh_level_fort_plague_claw_shelling",
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
				"level_fort_plague_claw_shelling",
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
				"level_fort_plague_claw_shelling",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_plague_claw_shelling_move",
		probability = 1,
		response = "pwh_level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling_move",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_river",
		probability = 1,
		response = "pwh_level_fort_river",
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
				"level_fort_river",
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
				"level_fort_river",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_river",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_skaven_everywhere",
		probability = 1,
		response = "pwh_level_fort_skaven_everywhere",
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
				"level_fort_skaven_everywhere",
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
				"level_fort_skaven_everywhere",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_skaven_everywhere",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_skaven_run",
		probability = 1,
		response = "pwh_level_fort_skaven_run",
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
				"level_fort_skaven_run",
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
				"level_fort_skaven_run",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_skaven_run",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_under_attack",
		probability = 1,
		response = "pwh_level_fort_under_attack",
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
				"level_fort_under_attack",
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
				"level_fort_under_attack",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_under_attack",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_use_cannons",
		probability = 1,
		response = "pwh_level_fort_use_cannons",
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
				"level_fort_use_cannons",
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
				"level_fort_use_cannons",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_use_cannons",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pwh_fort_intro_a = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_fort_intro_a_01",
				[2] = "pwh_fort_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_fort_intro_a_01",
				[2] = "pwh_fort_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.0226664543152,
				[2] = 3.6728541851044,
			},
		},
		pwh_fort_intro_b = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_fort_intro_b_01",
				[2] = "pwh_fort_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_fort_intro_b_01",
				[2] = "pwh_fort_intro_b_02",
			},
			sound_events_duration = {
				[1] = 2.0164165496826,
				[2] = 3.9455208778381,
			},
		},
		pwh_fort_intro_c = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_fort_intro_c_01",
				[2] = "pwh_fort_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_fort_intro_c_01",
				[2] = "pwh_fort_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.2910416126251,
				[2] = 3.2151041030884,
			},
		},
		pwh_level_fort_cannonballs = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_cannonballs_01",
				[2] = "pwh_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_cannonballs_01",
				[2] = "pwh_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 2.9701249599457,
				[2] = 4.8348541259766,
			},
		},
		pwh_level_fort_cannons_silenced = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_cannons_silenced_01",
				[2] = "pwh_level_fort_cannons_silenced_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_cannons_silenced_01",
				[2] = "pwh_level_fort_cannons_silenced_02",
			},
			sound_events_duration = {
				[1] = 4.6929168701172,
				[2] = 2.6141457557678,
			},
		},
		pwh_level_fort_cross_here = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_cross_here_01",
				[2] = "pwh_level_fort_cross_here_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_cross_here_01",
				[2] = "pwh_level_fort_cross_here_02",
			},
			sound_events_duration = {
				[1] = 2.6317708492279,
				[2] = 3.9215834140778,
			},
		},
		pwh_level_fort_fire_cannon_final_fire = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_final_fire_01",
				[2] = "pwh_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_final_fire_01",
				[2] = "pwh_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 5.6393957138061,
				[2] = 5.3575415611267,
			},
		},
		pwh_level_fort_fire_cannon_final_hit = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_final_hit_01",
				[2] = "pwh_level_fort_fire_cannon_final_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_final_hit_01",
				[2] = "pwh_level_fort_fire_cannon_final_hit_02",
			},
			sound_events_duration = {
				[1] = 7.6265830993652,
				[2] = 5.8437914848328,
			},
		},
		pwh_level_fort_fire_cannon_first = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_first_01",
				[2] = "pwh_level_fort_fire_cannon_first_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_first_01",
				[2] = "pwh_level_fort_fire_cannon_first_02",
			},
			sound_events_duration = {
				[1] = 4.4580206871033,
				[2] = 5.0050001144409,
			},
		},
		pwh_level_fort_fire_cannon_first_hit = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_first_hit_01",
				[2] = "pwh_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_first_hit_01",
				[2] = "pwh_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 6.9782710075378,
				[2] = 4.97891664505,
			},
		},
		pwh_level_fort_fire_cannon_fuse_is_lit = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pwh_level_fort_fire_cannon_fuse_is_lit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pwh_level_fort_fire_cannon_fuse_is_lit_02",
			},
			sound_events_duration = {
				[1] = 3.0002083778381,
				[2] = 1.1738333702087,
			},
		},
		pwh_level_fort_fire_cannon_second = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_second_01",
				[2] = "pwh_level_fort_fire_cannon_second_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_second_01",
				[2] = "pwh_level_fort_fire_cannon_second_02",
			},
			sound_events_duration = {
				[1] = 2.6289374828339,
				[2] = 4.2535624504089,
			},
		},
		pwh_level_fort_fire_cannon_second_hit = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_fire_cannon_second_hit_01",
				[2] = "pwh_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_second_hit_01",
				[2] = "pwh_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 4.9750623703003,
				[2] = 4.7232084274292,
			},
		},
		pwh_level_fort_gate_fallen = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_gate_fallen_01",
				[2] = "pwh_level_fort_gate_fallen_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_gate_fallen_01",
				[2] = "pwh_level_fort_gate_fallen_02",
			},
			sound_events_duration = {
				[1] = 2.7230832576752,
				[2] = 3.4166457653046,
			},
		},
		pwh_level_fort_getting_closer = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_getting_closer_01",
				[2] = "pwh_level_fort_getting_closer_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_getting_closer_01",
				[2] = "pwh_level_fort_getting_closer_02",
			},
			sound_events_duration = {
				[1] = 3.8493750095367,
				[2] = 2.1060416698456,
			},
		},
		pwh_level_fort_plague_claw_shelling = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_plague_claw_shelling_alert_01",
				[2] = "pwh_level_fort_plague_claw_shelling_alert_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_plague_claw_shelling_alert_01",
				[2] = "pwh_level_fort_plague_claw_shelling_alert_02",
			},
			sound_events_duration = {
				[1] = 2.7327916622162,
				[2] = 4.760187625885,
			},
		},
		pwh_level_fort_plague_claw_shelling_move = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_plague_claw_shelling_move_01",
				[2] = "pwh_level_fort_plague_claw_shelling_move_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_plague_claw_shelling_move_01",
				[2] = "pwh_level_fort_plague_claw_shelling_move_02",
			},
			sound_events_duration = {
				[1] = 4.7643122673035,
				[2] = 4.915979385376,
			},
		},
		pwh_level_fort_river = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_river_01",
				[2] = "pwh_level_fort_river_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_river_01",
				[2] = "pwh_level_fort_river_02",
			},
			sound_events_duration = {
				[1] = 4.4788541793823,
				[2] = 3.4685626029968,
			},
		},
		pwh_level_fort_skaven_everywhere = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_skaven_everywhere_01",
				[2] = "pwh_level_fort_skaven_everywhere_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_skaven_everywhere_01",
				[2] = "pwh_level_fort_skaven_everywhere_02",
			},
			sound_events_duration = {
				[1] = 5.8615832328796,
				[2] = 7.0202498435974,
			},
		},
		pwh_level_fort_skaven_run = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_skaven_run_01",
				[2] = "pwh_level_fort_skaven_run_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_skaven_run_01",
				[2] = "pwh_level_fort_skaven_run_02",
			},
			sound_events_duration = {
				[1] = 4.6016664505005,
				[2] = 7.0480208396912,
			},
		},
		pwh_level_fort_under_attack = {
			category = "level_talk",
			database = "witch_hunter_fort",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_level_fort_under_attack_01",
				"pwh_level_fort_under_attack_02",
				"pwh_level_fort_under_attack_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_fort_under_attack_01",
				"pwh_level_fort_under_attack_02",
				"pwh_level_fort_under_attack_04",
			},
			sound_events_duration = {
				5.583104133606,
				4.9067707061768,
				3.4567,
			},
		},
		pwh_level_fort_use_cannons = {
			category = "level_talk",
			database = "witch_hunter_fort",
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
				[1] = "pwh_level_fort_use_cannons_01",
				[2] = "pwh_level_fort_use_cannons_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_use_cannons_01",
				[2] = "pwh_level_fort_use_cannons_02",
			},
			sound_events_duration = {
				[1] = 7.273937702179,
				[2] = 7.5773749351502,
			},
		},
	})
end
