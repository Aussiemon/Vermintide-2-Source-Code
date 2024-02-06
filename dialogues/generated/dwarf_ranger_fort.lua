-- chunkname: @dialogues/generated/dwarf_ranger_fort.lua

return function ()
	define_rule({
		name = "pdr_fort_intro_a",
		response = "pdr_fort_intro_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_fort_intro_b",
		response = "pdr_fort_intro_b",
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
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"fort_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"fort_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_fort_intro_c",
		response = "pdr_fort_intro_c",
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
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"fort_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"fort_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_level_fort_cannonballs",
		response = "pdr_level_fort_cannonballs",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_cannons_silenced",
		response = "pdr_level_fort_cannons_silenced",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_carriage",
		response = "pdr_level_fort_carriage",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_cross_here",
		response = "pdr_level_fort_cross_here",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_final_fire",
		response = "pdr_level_fort_fire_cannon_final_fire",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_final_hit",
		response = "pdr_level_fort_fire_cannon_final_hit",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_first",
		response = "pdr_level_fort_fire_cannon_first",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_first_hit",
		response = "pdr_level_fort_fire_cannon_first_hit",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_fuse_is_lit",
		response = "pdr_level_fort_fire_cannon_fuse_is_lit",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_second",
		response = "pdr_level_fort_fire_cannon_second",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_fire_cannon_second_hit",
		response = "pdr_level_fort_fire_cannon_second_hit",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_gate_fallen",
		response = "pdr_level_fort_gate_fallen",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_getting_closer",
		response = "pdr_level_fort_getting_closer",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_plague_claw_shelling",
		response = "pdr_level_fort_plague_claw_shelling",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_plague_claw_shelling_move",
		response = "pdr_level_fort_plague_claw_shelling_move",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_river",
		response = "pdr_level_fort_river",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_road",
		response = "pdr_level_fort_road",
		criterias = {},
	})
	define_rule({
		name = "pdr_level_fort_skaven_everywhere",
		response = "pdr_level_fort_skaven_everywhere",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_under_attack",
		response = "pdr_level_fort_under_attack",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_level_fort_use_cannons",
		response = "pdr_level_fort_use_cannons",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		pdr_fort_intro_a = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_fort_intro_a_01",
				[2] = "pdr_fort_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_fort_intro_a_01",
				[2] = "pdr_fort_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.6482081413269,
				[2] = 3.816166639328,
			},
		},
		pdr_fort_intro_b = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_fort_intro_b_01",
				[2] = "pdr_fort_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_fort_intro_b_01",
				[2] = "pdr_fort_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.4252290725708,
				[2] = 1.7625416517258,
			},
		},
		pdr_fort_intro_c = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_fort_intro_c_01",
				[2] = "pdr_fort_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_fort_intro_c_01",
				[2] = "pdr_fort_intro_c_02",
			},
			sound_events_duration = {
				[1] = 5.4843335151672,
				[2] = 3.5754165649414,
			},
		},
		pdr_level_fort_cannonballs = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_cannonballs_01",
				[2] = "pdr_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_cannonballs_01",
				[2] = "pdr_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 2.6036667823791,
				[2] = 3.5911250114441,
			},
		},
		pdr_level_fort_cannons_silenced = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				"pdr_level_fort_cannons_silenced_01",
				"pdr_level_fort_cannons_silenced_02",
				"pdr_level_fort_cannons_silenced_03",
				"pdr_level_fort_cannons_silenced_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_fort_cannons_silenced_01",
				"pdr_level_fort_cannons_silenced_02",
				"pdr_level_fort_cannons_silenced_03",
				"pdr_level_fort_cannons_silenced_04",
			},
			sound_events_duration = {
				4.7833957672119,
				4.3523960113525,
				7.5406250953674,
				4.7842082977295,
			},
		},
		pdr_level_fort_carriage = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_carriage_01",
				[2] = "pdr_level_fort_carriage_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_carriage_01",
				[2] = "pdr_level_fort_carriage_02",
			},
			sound_events_duration = {
				[1] = 5.1656875610352,
				[2] = 1.5920000076294,
			},
		},
		pdr_level_fort_cross_here = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_cross_here_01",
				[2] = "pdr_level_fort_cross_here_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_cross_here_01",
				[2] = "pdr_level_fort_cross_here_02",
			},
			sound_events_duration = {
				[1] = 2.0488123893738,
				[2] = 4.3117289543152,
			},
		},
		pdr_level_fort_fire_cannon_final_fire = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_final_fire_01",
				[2] = "pdr_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_final_fire_01",
				[2] = "pdr_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 4.3071041107178,
				[2] = 3.9170207977295,
			},
		},
		pdr_level_fort_fire_cannon_final_hit = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_final_hit_01",
				[2] = "pdr_level_fort_fire_cannon_final_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_final_hit_01",
				[2] = "pdr_level_fort_fire_cannon_final_hit_02",
			},
			sound_events_duration = {
				[1] = 4.422833442688,
				[2] = 4.6810417175293,
			},
		},
		pdr_level_fort_fire_cannon_first = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_first_01",
				[2] = "pdr_level_fort_fire_cannon_first_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_first_01",
				[2] = "pdr_level_fort_fire_cannon_first_02",
			},
			sound_events_duration = {
				[1] = 6.6326456069946,
				[2] = 4.3408126831055,
			},
		},
		pdr_level_fort_fire_cannon_first_hit = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_first_hit_01",
				[2] = "pdr_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_first_hit_01",
				[2] = "pdr_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 4.9608335494995,
				[2] = 6.5361876487732,
			},
		},
		pdr_level_fort_fire_cannon_fuse_is_lit = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pdr_level_fort_fire_cannon_fuse_is_lit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_fuse_is_lit_01",
				[2] = "pdr_level_fort_fire_cannon_fuse_is_lit_02",
			},
			sound_events_duration = {
				[1] = 1.7607916593552,
				[2] = 2.3094999790192,
			},
		},
		pdr_level_fort_fire_cannon_second = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_second_01",
				[2] = "pdr_level_fort_fire_cannon_second_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_second_01",
				[2] = "pdr_level_fort_fire_cannon_second_02",
			},
			sound_events_duration = {
				[1] = 4.9989790916443,
				[2] = 6.5906457901001,
			},
		},
		pdr_level_fort_fire_cannon_second_hit = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_fire_cannon_second_hit_01",
				[2] = "pdr_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_second_hit_01",
				[2] = "pdr_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 6.4185833930969,
				[2] = 9.1484794616699,
			},
		},
		pdr_level_fort_gate_fallen = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_gate_fallen_01",
				[2] = "pdr_level_fort_gate_fallen_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_gate_fallen_01",
				[2] = "pdr_level_fort_gate_fallen_02",
			},
			sound_events_duration = {
				[1] = 4.1578540802002,
				[2] = 2.8982291221619,
			},
		},
		pdr_level_fort_getting_closer = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_getting_closer_01",
				[2] = "pdr_level_fort_getting_closer_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_getting_closer_01",
				[2] = "pdr_level_fort_getting_closer_02",
			},
			sound_events_duration = {
				[1] = 3.533979177475,
				[2] = 4.6098127365112,
			},
		},
		pdr_level_fort_plague_claw_shelling = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_plague_claw_shelling_alert_01",
				[2] = "pdr_level_fort_plague_claw_shelling_alert_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_plague_claw_shelling_alert_01",
				[2] = "pdr_level_fort_plague_claw_shelling_alert_02",
			},
			sound_events_duration = {
				[1] = 4.3344583511353,
				[2] = 5.2028331756592,
			},
		},
		pdr_level_fort_plague_claw_shelling_move = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_plague_claw_shelling_move_01",
				[2] = "pdr_level_fort_plague_claw_shelling_move_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_plague_claw_shelling_move_01",
				[2] = "pdr_level_fort_plague_claw_shelling_move_02",
			},
			sound_events_duration = {
				[1] = 2.6545832157135,
				[2] = 2.830958366394,
			},
		},
		pdr_level_fort_river = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_river_01",
				[2] = "pdr_level_fort_river_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_river_01",
				[2] = "pdr_level_fort_river_02",
			},
			sound_events_duration = {
				[1] = 8.2281665802002,
				[2] = 2.829916715622,
			},
		},
		pdr_level_fort_road = {
			category = "default",
			database = "dwarf_ranger_fort",
			dialogue_animations_n = 0,
			face_animations_n = 0,
			sound_events_n = 0,
			dialogue_animations = {},
			face_animations = {},
			localization_strings = {},
			sound_events = {},
			sound_events_duration = {},
		},
		pdr_level_fort_skaven_everywhere = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_skaven_everywhere_01",
				[2] = "pdr_level_fort_skaven_everywhere_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_skaven_everywhere_01",
				[2] = "pdr_level_fort_skaven_everywhere_02",
			},
			sound_events_duration = {
				[1] = 8.6992502212524,
				[2] = 5.1227498054504,
			},
		},
		pdr_level_fort_under_attack = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_under_attack_01",
				[2] = "pdr_level_fort_under_attack_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_under_attack_01",
				[2] = "pdr_level_fort_under_attack_02",
			},
			sound_events_duration = {
				[1] = 5.0784792900085,
				[2] = 5.9916667938232,
			},
		},
		pdr_level_fort_use_cannons = {
			category = "level_talk",
			database = "dwarf_ranger_fort",
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
				[1] = "pdr_level_fort_use_cannons_01",
				[2] = "pdr_level_fort_use_cannons_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_use_cannons_01",
				[2] = "pdr_level_fort_use_cannons_02",
			},
			sound_events_duration = {
				[1] = 5.7153334617615,
				[2] = 7.9000625610352,
			},
		},
	})
end
