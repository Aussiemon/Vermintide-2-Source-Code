-- chunkname: @dialogues/generated/bright_wizard_fort.lua

return function ()
	define_rule({
		name = "pbw_fort_intro_a",
		probability = 1,
		response = "pbw_fort_intro_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_fort_intro_b",
		probability = 1,
		response = "pbw_fort_intro_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_fort_intro_c",
		probability = 1,
		response = "pbw_fort_intro_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_fort_cannonballs",
		probability = 1,
		response = "pbw_level_fort_cannonballs",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_final",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_final",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_final_hit",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_final_hit",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_first",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_first",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_first_hit",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_first_hit",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_fuse_is_lit",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_fuse_is_lit",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_second",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_second",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_fort_fire_cannon_second_hit",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_second_hit",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
	add_dialogues({
		pbw_fort_intro_a = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_fort_intro_a_01",
				[2] = "pbw_fort_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_fort_intro_a_01",
				[2] = "pbw_fort_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.1690833568573,
				[2] = 4.5353956222534,
			},
		},
		pbw_fort_intro_b = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_fort_intro_b_01",
				[2] = "pbw_fort_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_fort_intro_b_01",
				[2] = "pbw_fort_intro_b_02",
			},
			sound_events_duration = {
				[1] = 3.5425624847412,
				[2] = 2.4352083206177,
			},
		},
		pbw_fort_intro_c = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_fort_intro_c_01",
				[2] = "pbw_fort_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_fort_intro_c_01",
				[2] = "pbw_fort_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.263375043869,
				[2] = 2.9231667518616,
			},
		},
		pbw_level_fort_cannonballs = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_cannonballs_01",
				[2] = "pbw_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_cannonballs_01",
				[2] = "pbw_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 3.9113540649414,
				[2] = 3.4015834331513,
			},
		},
		pbw_level_fort_fire_cannon_final = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_final_fire_01",
				[2] = "pbw_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_final_fire_01",
				[2] = "pbw_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 4.1717081069946,
				[2] = 4.5877914428711,
			},
		},
		pbw_level_fort_fire_cannon_final_hit = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_final_fire_01",
				[2] = "pbw_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_final_fire_01",
				[2] = "pbw_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 4.1717081069946,
				[2] = 4.5877914428711,
			},
		},
		pbw_level_fort_fire_cannon_first = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_first_01",
				[2] = "pbw_level_fort_fire_cannon_first_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_first_01",
				[2] = "pbw_level_fort_fire_cannon_first_02",
			},
			sound_events_duration = {
				[1] = 2.9402916431427,
				[2] = 2.3709375858307,
			},
		},
		pbw_level_fort_fire_cannon_first_hit = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_first_hit_01",
				[2] = "pbw_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_first_hit_01",
				[2] = "pbw_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 3.5760416984558,
				[2] = 3.648895740509,
			},
		},
		pbw_level_fort_fire_cannon_fuse_is_lit = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pbw_level_fort_fire_cannon_fuse_is_lit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pbw_level_fort_fire_cannon_fuse_is_lit_02",
			},
			sound_events_duration = {
				[1] = 1.0521249771118,
				[2] = 1.0781667232513,
			},
		},
		pbw_level_fort_fire_cannon_second = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_second_01",
				[2] = "pbw_level_fort_fire_cannon_second_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_second_01",
				[2] = "pbw_level_fort_fire_cannon_second_02",
			},
			sound_events_duration = {
				[1] = 3.1053125858307,
				[2] = 3.8245208263397,
			},
		},
		pbw_level_fort_fire_cannon_second_hit = {
			category = "level_talk",
			database = "bright_wizard_fort",
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
				[1] = "pbw_level_fort_fire_cannon_second_hit_01",
				[2] = "pbw_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_second_hit_01",
				[2] = "pbw_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 4.202166557312,
				[2] = 7.2180833816528,
			},
		},
	})
end
