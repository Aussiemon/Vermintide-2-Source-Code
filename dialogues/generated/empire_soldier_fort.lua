-- chunkname: @dialogues/generated/empire_soldier_fort.lua

return function ()
	define_rule({
		name = "pes_level_fort_cannonballs",
		probability = 1,
		response = "pes_level_fort_cannonballs",
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
		name = "pes_level_fort_carriage",
		probability = 1,
		response = "pes_level_fort_carriage",
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
				"level_fort_carriage",
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
				"level_fort_carriage",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_carriage",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_final_fire",
		probability = 1,
		response = "pes_level_fort_fire_cannon_final_fire",
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
		name = "pes_level_fort_fire_cannon_final_hit",
		probability = 1,
		response = "pes_level_fort_fire_cannon_final_hit",
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
		name = "pes_level_fort_fire_cannon_first",
		probability = 1,
		response = "pes_level_fort_fire_cannon_first",
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
		name = "pes_level_fort_fire_cannon_first_hit",
		probability = 1,
		response = "pes_level_fort_fire_cannon_first_hit",
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
		name = "pes_level_fort_fire_cannon_fuse_is_lit",
		probability = 1,
		response = "pes_level_fort_fire_cannon_fuse_is_lit",
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
		name = "pes_level_fort_fire_cannon_second",
		probability = 1,
		response = "pes_level_fort_fire_cannon_second",
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
		name = "pes_level_fort_fire_cannon_second_hit",
		probability = 1,
		response = "pes_level_fort_fire_cannon_second_hit",
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
		name = "pes_level_fort_gate_fallen",
		probability = 1,
		response = "pes_level_fort_gate_fallen",
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
		name = "pes_level_fort_getting_closer",
		probability = 1,
		response = "pes_level_fort_getting_closer",
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
		name = "pes_level_fort_plague_claw_shelling",
		probability = 1,
		response = "pes_level_fort_plague_claw_shelling",
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
		name = "pes_level_fort_plague_claw_shelling_move",
		probability = 1,
		response = "pes_level_fort_plague_claw_shelling_move",
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
		name = "pes_level_fort_river",
		probability = 1,
		response = "pes_level_fort_river",
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
		name = "pes_level_fort_skaven_everywhere",
		probability = 1,
		response = "pes_level_fort_skaven_everywhere",
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
		name = "pes_level_fort_skaven_run",
		probability = 1,
		response = "pes_level_fort_skaven_run",
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
		name = "pes_level_fort_under_attack",
		probability = 1,
		response = "pes_level_fort_under_attack",
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
		name = "pes_level_fort_use_cannons",
		probability = 1,
		response = "pes_level_fort_use_cannons",
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
		pes_level_fort_cannonballs = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_cannonballs_01",
				[2] = "pes_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_cannonballs_01",
				[2] = "pes_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 1.9230833053589,
				[2] = 3.3242499828339,
			},
		},
		pes_level_fort_carriage = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_carriage_01",
				[2] = "pes_level_fort_carriage_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_carriage_01",
				[2] = "pes_level_fort_carriage_02",
			},
			sound_events_duration = {
				[1] = 1.9505208730698,
				[2] = 1.7348333597183,
			},
		},
		pes_level_fort_fire_cannon_final_fire = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_final_fire_01",
				[2] = "pes_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_final_fire_01",
				[2] = "pes_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 5.5894584655762,
				[2] = 5.2293853759766,
			},
		},
		pes_level_fort_fire_cannon_final_hit = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_final_hit_01",
				[2] = "pes_level_fort_fire_cannon_final_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_final_hit_01",
				[2] = "pes_level_fort_fire_cannon_final_hit_02",
			},
			sound_events_duration = {
				[1] = 7.2017292976379,
				[2] = 4.9733748435974,
			},
		},
		pes_level_fort_fire_cannon_first = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_first_01",
				[2] = "pes_level_fort_fire_cannon_first_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_first_01",
				[2] = "pes_level_fort_fire_cannon_first_02",
			},
			sound_events_duration = {
				[1] = 4.4217081069946,
				[2] = 5.1840834617615,
			},
		},
		pes_level_fort_fire_cannon_first_hit = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_first_hit_01",
				[2] = "pes_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_first_hit_01",
				[2] = "pes_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 4.1897916793823,
				[2] = 5.9237289428711,
			},
		},
		pes_level_fort_fire_cannon_fuse_is_lit = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pes_level_fort_fire_cannon_fuse_is_lit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pes_level_fort_fire_cannon_fuse_is_lit_02",
			},
			sound_events_duration = {
				[1] = 1.1457916498184,
				[2] = 0.93262499570847,
			},
		},
		pes_level_fort_fire_cannon_second = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_second_01",
				[2] = "pes_level_fort_fire_cannon_second_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_second_01",
				[2] = "pes_level_fort_fire_cannon_second_02",
			},
			sound_events_duration = {
				[1] = 4.6045832633972,
				[2] = 6.8185625076294,
			},
		},
		pes_level_fort_fire_cannon_second_hit = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_fire_cannon_second_hit_01",
				[2] = "pes_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_second_hit_01",
				[2] = "pes_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 3.8996665477753,
				[2] = 5.3803334236145,
			},
		},
		pes_level_fort_gate_fallen = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_gate_fallen_01",
				[2] = "pes_level_fort_gate_fallen_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_gate_fallen_01",
				[2] = "pes_level_fort_gate_fallen_02",
			},
			sound_events_duration = {
				[1] = 2.0174270868301,
				[2] = 2.7997915744781,
			},
		},
		pes_level_fort_getting_closer = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_getting_closer_01",
				[2] = "pes_level_fort_getting_closer_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_getting_closer_01",
				[2] = "pes_level_fort_getting_closer_02",
			},
			sound_events_duration = {
				[1] = 4.007312297821,
				[2] = 2.1470832824707,
			},
		},
		pes_level_fort_plague_claw_shelling = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_plague_claw_shelling_alert_01",
				[2] = "pes_level_fort_plague_claw_shelling_alert_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_plague_claw_shelling_alert_01",
				[2] = "pes_level_fort_plague_claw_shelling_alert_02",
			},
			sound_events_duration = {
				[1] = 2.2067708969116,
				[2] = 3.977520942688,
			},
		},
		pes_level_fort_plague_claw_shelling_move = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_plague_claw_shelling_move_01",
				[2] = "pes_level_fort_plague_claw_shelling_move_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_plague_claw_shelling_move_01",
				[2] = "pes_level_fort_plague_claw_shelling_move_02",
			},
			sound_events_duration = {
				[1] = 1.8506457805634,
				[2] = 3.012312412262,
			},
		},
		pes_level_fort_river = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_river_01",
				[2] = "pes_level_fort_river_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_river_01",
				[2] = "pes_level_fort_river_02",
			},
			sound_events_duration = {
				[1] = 2.7193541526794,
				[2] = 2.2867708206177,
			},
		},
		pes_level_fort_skaven_everywhere = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_skaven_everywhere_01",
				[2] = "pes_level_fort_skaven_everywhere_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_skaven_everywhere_01",
				[2] = "pes_level_fort_skaven_everywhere_02",
			},
			sound_events_duration = {
				[1] = 3.5371458530426,
				[2] = 3.1582915782928,
			},
		},
		pes_level_fort_skaven_run = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_skaven_run_01",
				[2] = "pes_level_fort_skaven_run_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_skaven_run_01",
				[2] = "pes_level_fort_skaven_run_02",
			},
			sound_events_duration = {
				[1] = 6.260645866394,
				[2] = 6.4361248016357,
			},
		},
		pes_level_fort_under_attack = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_under_attack_01",
				[2] = "pes_level_fort_under_attack_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_under_attack_01",
				[2] = "pes_level_fort_under_attack_02",
			},
			sound_events_duration = {
				[1] = 4.9742918014526,
				[2] = 4.160041809082,
			},
		},
		pes_level_fort_use_cannons = {
			category = "level_talk",
			database = "empire_soldier_fort",
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
				[1] = "pes_level_fort_use_cannons_01",
				[2] = "pes_level_fort_use_cannons_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_use_cannons_01",
				[2] = "pes_level_fort_use_cannons_02",
			},
			sound_events_duration = {
				[1] = 4.7686247825623,
				[2] = 6.8180418014526,
			},
		},
	})
end
