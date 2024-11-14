-- chunkname: @dialogues/generated/dwarf_ranger_ground_zero.lua

return function ()
	define_rule({
		name = "ebh_level_ground_zero_lord_banter",
		probability = 1,
		response = "ebh_level_ground_zero_lord_banter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_taunt",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer",
			},
		},
	})
	define_rule({
		name = "ebh_level_ground_zero_lord_insect_spell",
		probability = 1,
		response = "ebh_level_ground_zero_lord_insect_spell",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_insect_spell",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer",
			},
		},
	})
	define_rule({
		name = "ebh_level_ground_zero_lord_intro",
		probability = 1,
		response = "ebh_level_ground_zero_lord_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_intro",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer",
			},
		},
	})
	define_rule({
		name = "ebh_level_ground_zero_lord_retaliation_missile",
		probability = 1,
		response = "ebh_level_ground_zero_lord_retaliation_missile",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_retaliation_missile",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer",
			},
		},
	})
	define_rule({
		name = "ebh_level_ground_zero_lord_spawn_enemies",
		probability = 1,
		response = "ebh_level_ground_zero_lord_spawn_enemies",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_summon",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer",
			},
		},
	})
	define_rule({
		name = "pdr_ground_zero_intro_a",
		probability = 1,
		response = "pdr_ground_zero_intro_a",
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
				"ground_zero_intro_a",
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
				"ground_zero_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_ground_zero_intro_b",
		probability = 1,
		response = "pdr_ground_zero_intro_b",
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
				"ground_zero_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_ground_zero_intro_c",
		probability = 1,
		response = "pdr_ground_zero_intro_c",
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
				"ground_zero_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_boss_near",
		probability = 1,
		response = "pdr_level_ground_zero_boss_near",
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
				"ground_zero_boss_near",
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
				"level_ground_zero_boss_near",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_boss_near",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_boss_spotted",
		probability = 1,
		response = "pdr_level_ground_zero_boss_spotted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ebh_level_ground_zero_lord_intro",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMEDIFF,
				OP.GT,
				10,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_boss_taunt_reply",
		probability = 1,
		response = "pdr_level_ground_zero_boss_taunt_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ebh_level_ground_zero_lord_banter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_canal_crossing",
		probability = 1,
		response = "pdr_level_ground_zero_canal_crossing",
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
				"ground_zero_canal_crossing",
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
				"level_ground_zero_canal_crossing",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canal_crossing",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_canals",
		probability = 1,
		response = "pdr_level_ground_zero_canals",
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
				"ground_zero_canals",
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
				"level_ground_zero_canals",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canals",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_complete",
		probability = 1,
		response = "pdr_level_ground_zero_complete",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp",
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
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMEDIFF,
				OP.GT,
				10,
			},
		},
		on_done = {
			{
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_corruption_everywhere",
		probability = 1,
		response = "pdr_level_ground_zero_corruption_everywhere",
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
				"ground_zero_corruption_everywhere",
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
				"level_ground_zero_corruption_everywhere",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_corruption_everywhere",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_crumbling",
		probability = 1,
		response = "pdr_level_ground_zero_crumbling",
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
				"ground_zero_crumbling",
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
				"level_ground_zero_crumbling",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_crumbling",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_landslide",
		probability = 1,
		response = "pdr_level_ground_zero_landslide",
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
				"ground_zero_landslide",
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
				"level_ground_zero_landslide",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_landslide",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_looking_for_elevator",
		probability = 1,
		response = "pdr_level_ground_zero_looking_for_elevator",
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
				"ground_zero_looking_for_elevator",
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
				"level_ground_zero_looking_for_elevator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_looking_for_elevator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_precarious",
		probability = 1,
		response = "pdr_level_ground_zero_precarious",
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
				"ground_zero_precarious",
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
				"level_ground_zero_precarious",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_precarious",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_smell",
		probability = 1,
		response = "pdr_level_ground_zero_smell",
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
				"ground_zero_smell",
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
				"level_ground_zero_smell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_smell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_the_hole",
		probability = 1,
		response = "pdr_level_ground_zero_the_hole",
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
				"ground_zero_the_hole",
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
				"level_ground_zero_the_hole",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_the_hole",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_the_hole_second_view",
		probability = 1,
		response = "pdr_level_ground_zero_the_hole_second_view",
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
				"ground_zero_the_hole_second_view",
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
				"level_ground_zero_the_hole_second_view",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_the_hole_second_view",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_ground_zero_welcoming_committee",
		probability = 1,
		response = "pdr_level_ground_zero_welcoming_committee",
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
				"ground_zero_welcoming_committee",
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
				"level_ground_zero_welcoming_committee",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_welcoming_committee",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		ebh_level_ground_zero_lord_banter = {
			category = "boss_talk",
			database = "dwarf_ranger_ground_zero",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_distance = 50,
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
				"ebh_level_ground_zero_lord_banter_02",
				"ebh_level_ground_zero_lord_banter_03",
				"ebh_level_ground_zero_lord_banter_04",
				"ebh_level_ground_zero_lord_banter_05",
			},
			randomize_indexes = {},
			sound_events = {
				"ebh_level_ground_zero_lord_banter_02",
				"ebh_level_ground_zero_lord_banter_03",
				"ebh_level_ground_zero_lord_banter_04",
				"ebh_level_ground_zero_lord_banter_05",
			},
			sound_events_duration = {
				8.340916633606,
				10.945666313171,
				10.867562294006,
				4.8926248550415,
			},
		},
		ebh_level_ground_zero_lord_insect_spell = {
			category = "boss_talk",
			database = "dwarf_ranger_ground_zero",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_distance = 50,
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
				"ebh_level_ground_zero_lord_insect_spell_01",
				"ebh_level_ground_zero_lord_insect_spell_02",
				"ebh_level_ground_zero_lord_insect_spell_03",
				"ebh_level_ground_zero_lord_insect_spell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"ebh_level_ground_zero_lord_insect_spell_01",
				"ebh_level_ground_zero_lord_insect_spell_02",
				"ebh_level_ground_zero_lord_insect_spell_03",
				"ebh_level_ground_zero_lord_insect_spell_04",
			},
			sound_events_duration = {
				3.4226040840149,
				3.0002708435059,
				3.7621250152588,
				5.1398539543152,
			},
		},
		ebh_level_ground_zero_lord_intro = {
			category = "boss_talk",
			database = "dwarf_ranger_ground_zero",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_distance = 50,
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
				[1] = "ebh_level_ground_zero_lord_intro_01",
				[2] = "ebh_level_ground_zero_lord_intro_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "ebh_level_ground_zero_lord_intro_01",
				[2] = "ebh_level_ground_zero_lord_intro_02",
			},
			sound_events_duration = {
				[1] = 19.150812149048,
				[2] = 17.64560508728,
			},
		},
		ebh_level_ground_zero_lord_retaliation_missile = {
			category = "boss_talk",
			database = "dwarf_ranger_ground_zero",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_distance = 50,
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
				"ebh_level_ground_zero_lord_retaliation_missile_01",
				"ebh_level_ground_zero_lord_retaliation_missile_02",
				"ebh_level_ground_zero_lord_retaliation_missile_03",
				"ebh_level_ground_zero_lord_retaliation_missile_04",
			},
			randomize_indexes = {},
			sound_events = {
				"ebh_level_ground_zero_lord_retaliation_missile_01",
				"ebh_level_ground_zero_lord_retaliation_missile_02",
				"ebh_level_ground_zero_lord_retaliation_missile_03",
				"ebh_level_ground_zero_lord_retaliation_missile_04",
			},
			sound_events_duration = {
				5.7061457633972,
				3.861249923706,
				5.7626042366028,
				4.9964165687561,
			},
		},
		ebh_level_ground_zero_lord_spawn_enemies = {
			category = "boss_talk",
			database = "dwarf_ranger_ground_zero",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_distance = 50,
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
				"ebh_level_ground_zero_lord_spawn_enemies_01",
				"ebh_level_ground_zero_lord_spawn_enemies_02",
				"ebh_level_ground_zero_lord_spawn_enemies_03",
				"ebh_level_ground_zero_lord_spawn_enemies_04",
			},
			randomize_indexes = {},
			sound_events = {
				"ebh_level_ground_zero_lord_spawn_enemies_01",
				"ebh_level_ground_zero_lord_spawn_enemies_02",
				"ebh_level_ground_zero_lord_spawn_enemies_03",
				"ebh_level_ground_zero_lord_spawn_enemies_04",
			},
			sound_events_duration = {
				4.180645942688,
				13.026000022888,
				8.7754373550415,
				3.8321459293366,
			},
		},
		pdr_ground_zero_intro_a = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				[1] = "pdr_ground_zero_intro_a_01",
				[2] = "pdr_ground_zero_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_ground_zero_intro_a_01",
				[2] = "pdr_ground_zero_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.5831875801086,
				[2] = 5.8600625991821,
			},
		},
		pdr_ground_zero_intro_b = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				[1] = "pdr_ground_zero_intro_b_01",
				[2] = "pdr_ground_zero_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_ground_zero_intro_b_01",
				[2] = "pdr_ground_zero_intro_b_02",
			},
			sound_events_duration = {
				[1] = 3.7427499294281,
				[2] = 5.2160210609436,
			},
		},
		pdr_ground_zero_intro_c = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				[1] = "pdr_ground_zero_intro_c_01",
				[2] = "pdr_ground_zero_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_ground_zero_intro_c_01",
				[2] = "pdr_ground_zero_intro_c_02",
			},
			sound_events_duration = {
				[1] = 6.5770626068115,
				[2] = 10.54829120636,
			},
		},
		pdr_level_ground_zero_boss_near = {
			category = "cut_scene",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_boss_near_01",
				"pdr_level_ground_zero_boss_near_02",
				"pdr_level_ground_zero_boss_near_03",
				"pdr_level_ground_zero_boss_near_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_boss_near_01",
				"pdr_level_ground_zero_boss_near_02",
				"pdr_level_ground_zero_boss_near_03",
				"pdr_level_ground_zero_boss_near_04",
			},
			sound_events_duration = {
				5.1434373855591,
				4.8993539810181,
				3.5315208435059,
				5.2607498168945,
			},
		},
		pdr_level_ground_zero_boss_spotted = {
			category = "player_alerts_boss",
			database = "dwarf_ranger_ground_zero",
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
				[1] = "pdr_level_ground_zero_boss_spotted_03",
				[2] = "pdr_level_ground_zero_boss_spotted_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_ground_zero_boss_spotted_03",
				[2] = "pdr_level_ground_zero_boss_spotted_04",
			},
			sound_events_duration = {
				[1] = 4.927791595459,
				[2] = 7.1275415420532,
			},
		},
		pdr_level_ground_zero_boss_taunt_reply = {
			category = "player_alerts_boss",
			database = "dwarf_ranger_ground_zero",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pdr_level_ground_zero_boss_taunt_reply_01",
				"pdr_level_ground_zero_boss_taunt_reply_02",
				"pdr_level_ground_zero_boss_taunt_reply_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_boss_taunt_reply_01",
				"pdr_level_ground_zero_boss_taunt_reply_02",
				"pdr_level_ground_zero_boss_taunt_reply_03",
			},
			sound_events_duration = {
				1.6952083110809,
				7.0825624465942,
				8.596583366394,
			},
		},
		pdr_level_ground_zero_canal_crossing = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_canal_crossing_01",
				"pdr_level_ground_zero_canal_crossing_02",
				"pdr_level_ground_zero_canal_crossing_03",
				"pdr_level_ground_zero_canal_crossing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_canal_crossing_01",
				"pdr_level_ground_zero_canal_crossing_02",
				"pdr_level_ground_zero_canal_crossing_03",
				"pdr_level_ground_zero_canal_crossing_04",
			},
			sound_events_duration = {
				3.5679166316986,
				4.7077293395996,
				4.5354166030884,
				7.0530414581299,
			},
		},
		pdr_level_ground_zero_canals = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_canals_01",
				"pdr_level_ground_zero_canals_02",
				"pdr_level_ground_zero_canals_03",
				"pdr_level_ground_zero_canals_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_canals_01",
				"pdr_level_ground_zero_canals_02",
				"pdr_level_ground_zero_canals_03",
				"pdr_level_ground_zero_canals_04",
			},
			sound_events_duration = {
				4.1667289733887,
				4.6100831031799,
				3.9645416736603,
				3.8008542060852,
			},
		},
		pdr_level_ground_zero_complete = {
			category = "player_alerts_boss",
			database = "dwarf_ranger_ground_zero",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pdr_level_ground_zero_complete_01",
				"pdr_level_ground_zero_complete_02",
				"pdr_level_ground_zero_complete_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_complete_01",
				"pdr_level_ground_zero_complete_02",
				"pdr_level_ground_zero_complete_03",
			},
			sound_events_duration = {
				4.2249999046326,
				2.9873542785645,
				1.6727499961853,
			},
		},
		pdr_level_ground_zero_corruption_everywhere = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_corruption_everywhere_01",
				"pdr_level_ground_zero_corruption_everywhere_02",
				"pdr_level_ground_zero_corruption_everywhere_03",
				"pdr_level_ground_zero_corruption_everywhere_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_corruption_everywhere_01",
				"pdr_level_ground_zero_corruption_everywhere_02",
				"pdr_level_ground_zero_corruption_everywhere_03",
				"pdr_level_ground_zero_corruption_everywhere_04",
			},
			sound_events_duration = {
				4.1829376220703,
				4.500020980835,
				3.9161458015442,
				2.8967916965485,
			},
		},
		pdr_level_ground_zero_crumbling = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_crumbling_01",
				"pdr_level_ground_zero_crumbling_02",
				"pdr_level_ground_zero_crumbling_03",
				"pdr_level_ground_zero_crumbling_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_crumbling_01",
				"pdr_level_ground_zero_crumbling_02",
				"pdr_level_ground_zero_crumbling_03",
				"pdr_level_ground_zero_crumbling_04",
			},
			sound_events_duration = {
				3.0456874370575,
				2.3270416259766,
				2.5764582157135,
				4.5998749732971,
			},
		},
		pdr_level_ground_zero_landslide = {
			category = "cut_scene",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_landslide_01",
				"pdr_level_ground_zero_landslide_02",
				"pdr_level_ground_zero_landslide_03",
				"pdr_level_ground_zero_landslide_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_landslide_01",
				"pdr_level_ground_zero_landslide_02",
				"pdr_level_ground_zero_landslide_03",
				"pdr_level_ground_zero_landslide_04",
			},
			sound_events_duration = {
				2.1670000553131,
				4.6198539733887,
				1.7452708482742,
				4.1464581489563,
			},
		},
		pdr_level_ground_zero_looking_for_elevator = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_looking_for_elevator_01",
				"pdr_level_ground_zero_looking_for_elevator_02",
				"pdr_level_ground_zero_looking_for_elevator_03",
				"pdr_level_ground_zero_looking_for_elevator_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_looking_for_elevator_01",
				"pdr_level_ground_zero_looking_for_elevator_02",
				"pdr_level_ground_zero_looking_for_elevator_03",
				"pdr_level_ground_zero_looking_for_elevator_04",
			},
			sound_events_duration = {
				4.6757497787476,
				2.7618124485016,
				3.0985624790192,
				4.6270208358765,
			},
		},
		pdr_level_ground_zero_precarious = {
			category = "story_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_precarious_01",
				"pdr_level_ground_zero_precarious_02",
				"pdr_level_ground_zero_precarious_03",
				"pdr_level_ground_zero_precarious_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_precarious_01",
				"pdr_level_ground_zero_precarious_02",
				"pdr_level_ground_zero_precarious_03",
				"pdr_level_ground_zero_precarious_04",
			},
			sound_events_duration = {
				2.6556458473206,
				1.610270857811,
				2.3396666049957,
				3.0833125114441,
			},
		},
		pdr_level_ground_zero_smell = {
			category = "level_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_smell_01",
				"pdr_level_ground_zero_smell_02",
				"pdr_level_ground_zero_smell_03",
				"pdr_level_ground_zero_smell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_smell_01",
				"pdr_level_ground_zero_smell_02",
				"pdr_level_ground_zero_smell_03",
				"pdr_level_ground_zero_smell_04",
			},
			sound_events_duration = {
				3.4332292079926,
				1.9591457843781,
				7.6341457366943,
				3.321270942688,
			},
		},
		pdr_level_ground_zero_the_hole = {
			category = "story_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_the_hole_01",
				"pdr_level_ground_zero_the_hole_02",
				"pdr_level_ground_zero_the_hole_03",
				"pdr_level_ground_zero_the_hole_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_the_hole_01",
				"pdr_level_ground_zero_the_hole_02",
				"pdr_level_ground_zero_the_hole_03",
				"pdr_level_ground_zero_the_hole_04",
			},
			sound_events_duration = {
				4.2102293968201,
				3.8172917366028,
				4.2842707633972,
				5.1893539428711,
			},
		},
		pdr_level_ground_zero_the_hole_second_view = {
			category = "story_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_the_hole_second_view_01",
				"pdr_level_ground_zero_the_hole_second_view_02",
				"pdr_level_ground_zero_the_hole_second_view_03",
				"pdr_level_ground_zero_the_hole_second_view_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_the_hole_second_view_01",
				"pdr_level_ground_zero_the_hole_second_view_02",
				"pdr_level_ground_zero_the_hole_second_view_03",
				"pdr_level_ground_zero_the_hole_second_view_04",
			},
			sound_events_duration = {
				4.1652498245239,
				4.5418124198914,
				5.9802293777466,
				5.4425206184387,
			},
		},
		pdr_level_ground_zero_welcoming_committee = {
			category = "story_talk",
			database = "dwarf_ranger_ground_zero",
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
				"pdr_level_ground_zero_welcoming_committee_01",
				"pdr_level_ground_zero_welcoming_committee_02",
				"pdr_level_ground_zero_welcoming_committee_03",
				"pdr_level_ground_zero_welcoming_committee_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_ground_zero_welcoming_committee_01",
				"pdr_level_ground_zero_welcoming_committee_02",
				"pdr_level_ground_zero_welcoming_committee_03",
				"pdr_level_ground_zero_welcoming_committee_04",
			},
			sound_events_duration = {
				6.5436458587647,
				3.8663125038147,
				2.8951041698456,
				5.0999999046326,
			},
		},
	})
end
