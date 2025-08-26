-- chunkname: @dialogues/generated/wood_elf_fort.lua

return function ()
	define_rule({
		name = "pwe_fort_intro_a",
		probability = 1,
		response = "pwe_fort_intro_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_fort_intro_b",
		probability = 1,
		response = "pwe_fort_intro_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_fort_intro_c",
		probability = 1,
		response = "pwe_fort_intro_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_fort_cannonballs",
		probability = 1,
		response = "pwe_level_fort_cannonballs",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_cannons_silenced",
		probability = 1,
		response = "pwe_level_fort_cannons_silenced",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_final",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_final",
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
				"level_fort_fire_cannon_final",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_fort_fire_cannon_final",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_fort_fire_cannon_final_fire",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_final_fire",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_final_hit",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_final_hit",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_first",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_first",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_first_hit",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_first_hit",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_fuse_is_lit",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_fuse_is_lit",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_second",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_second",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_fire_cannon_second_hit",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_second_hit",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_gate_fallen",
		probability = 1,
		response = "pwe_level_fort_gate_fallen",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_plague_claw_shelling_move",
		probability = 1,
		response = "pwe_level_fort_plague_claw_shelling_move",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_skaven_everywhere",
		probability = 1,
		response = "pwe_level_fort_skaven_everywhere",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_skaven_run",
		probability = 1,
		response = "pwe_level_fort_skaven_run",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_level_fort_use_cannons",
		probability = 1,
		response = "pwe_level_fort_use_cannons",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		pwe_fort_intro_a = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_fort_intro_a_01",
				[2] = "pwe_fort_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_fort_intro_a_01",
				[2] = "pwe_fort_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.4749164581299,
				[2] = 5.157187461853,
			},
		},
		pwe_fort_intro_b = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_fort_intro_b_01",
				[2] = "pwe_fort_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_fort_intro_b_01",
				[2] = "pwe_fort_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.5131454467773,
				[2] = 5.8558540344238,
			},
		},
		pwe_fort_intro_c = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_fort_intro_c_01",
				[2] = "pwe_fort_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_fort_intro_c_01",
				[2] = "pwe_fort_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.8120646476746,
				[2] = 2.7456042766571,
			},
		},
		pwe_level_fort_cannonballs = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_cannonballs_01",
				[2] = "pwe_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_cannonballs_01",
				[2] = "pwe_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 2.3011040687561,
				[2] = 3.2113125324249,
			},
		},
		pwe_level_fort_cannons_silenced = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_cannons_silenced_01",
				[2] = "pwe_level_fort_cannons_silenced_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_cannons_silenced_01",
				[2] = "pwe_level_fort_cannons_silenced_02",
			},
			sound_events_duration = {
				[1] = 4.6853957176208,
				[2] = 3.9510624408722,
			},
		},
		pwe_level_fort_fire_cannon_final = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_final_fire_01",
				[2] = "pwe_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_final_fire_01",
				[2] = "pwe_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 2.3011667728424,
				[2] = 1.971083343029,
			},
		},
		pwe_level_fort_fire_cannon_final_fire = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_final_fire_01",
				[2] = "pwe_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_final_fire_01",
				[2] = "pwe_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 2.3011667728424,
				[2] = 1.971083343029,
			},
		},
		pwe_level_fort_fire_cannon_final_hit = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_final_hit_01",
				[2] = "pwe_level_fort_fire_cannon_final_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_final_hit_01",
				[2] = "pwe_level_fort_fire_cannon_final_hit_02",
			},
			sound_events_duration = {
				[1] = 2.6930832862854,
				[2] = 3.722895860672,
			},
		},
		pwe_level_fort_fire_cannon_first = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_first_01",
				[2] = "pwe_level_fort_fire_cannon_first_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_first_01",
				[2] = "pwe_level_fort_fire_cannon_first_02",
			},
			sound_events_duration = {
				[1] = 2.5234582424164,
				[2] = 4.0536665916443,
			},
		},
		pwe_level_fort_fire_cannon_first_hit = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_first_hit_01",
				[2] = "pwe_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_first_hit_01",
				[2] = "pwe_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 3.6615207195282,
				[2] = 3.0288333892822,
			},
		},
		pwe_level_fort_fire_cannon_fuse_is_lit = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pwe_level_fort_fire_cannon_fuse_is_lit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pwe_level_fort_fire_cannon_fuse_is_lit_02",
			},
			sound_events_duration = {
				[1] = 2.0257499217987,
				[2] = 2.8356873989105,
			},
		},
		pwe_level_fort_fire_cannon_second = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_second_01",
				[2] = "pwe_level_fort_fire_cannon_second_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_second_01",
				[2] = "pwe_level_fort_fire_cannon_second_02",
			},
			sound_events_duration = {
				[1] = 3.0047082901001,
				[2] = 4.8736872673035,
			},
		},
		pwe_level_fort_fire_cannon_second_hit = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_fire_cannon_second_hit_01",
				[2] = "pwe_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_second_hit_01",
				[2] = "pwe_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 2.1298542022705,
				[2] = 3.5463540554047,
			},
		},
		pwe_level_fort_gate_fallen = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_gate_fallen_01",
				[2] = "pwe_level_fort_gate_fallen_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_gate_fallen_01",
				[2] = "pwe_level_fort_gate_fallen_02",
			},
			sound_events_duration = {
				[1] = 3.0133125782013,
				[2] = 4.3699164390564,
			},
		},
		pwe_level_fort_plague_claw_shelling_move = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pwe_level_fort_plague_claw_shelling_move_01",
				"pwe_level_fort_plague_claw_shelling_move_02",
				"pwe_level_fort_plague_claw_shelling_move_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_fort_plague_claw_shelling_move_01",
				"pwe_level_fort_plague_claw_shelling_move_02",
				"pwe_level_fort_plague_claw_shelling_move_03",
			},
			sound_events_duration = {
				3.9244167804718,
				3.5269999504089,
				3.3503124713898,
			},
		},
		pwe_level_fort_skaven_everywhere = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				[1] = "pwe_level_fort_skaven_everywhere_01",
				[2] = "pwe_level_fort_skaven_everywhere_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_skaven_everywhere_01",
				[2] = "pwe_level_fort_skaven_everywhere_02",
			},
			sound_events_duration = {
				[1] = 3.1068959236145,
				[2] = 3.6465833187103,
			},
		},
		pwe_level_fort_skaven_run = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pwe_level_fort_skaven_run_01",
				"pwe_level_fort_skaven_run_02",
				"pwe_level_fort_skaven_run_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_fort_skaven_run_01",
				"pwe_level_fort_skaven_run_02",
				"pwe_level_fort_skaven_run_03",
			},
			sound_events_duration = {
				4.0656042098999,
				4.4996666908264,
				4.1993541717529,
			},
		},
		pwe_level_fort_use_cannons = {
			category = "level_talk",
			database = "wood_elf_fort",
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
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pwe_level_fort_use_cannons_01",
				"pwe_level_fort_use_cannons_02",
				"pwe_level_fort_use_cannons_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_fort_use_cannons_01",
				"pwe_level_fort_use_cannons_02",
				"pwe_level_fort_use_cannons_03",
			},
			sound_events_duration = {
				3.8050832748413,
				3.2387499809265,
				5.5285415649414,
			},
		},
	})
end
