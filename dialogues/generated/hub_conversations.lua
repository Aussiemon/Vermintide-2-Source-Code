return function ()
	define_rule({
		response = "nik_greeting",
		name = "nik_greeting",
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
				"nik_greeting"
			}
		}
	})
	define_rule({
		response = "nik_map_intro",
		name = "nik_map_intro",
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
				"nik_map_intro"
			}
		}
	})
	define_rule({
		response = "nik_inventory_reminder",
		name = "nik_inventory_reminder",
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
				"nik_inventory_reminder"
			}
		}
	})
	define_rule({
		response = "nik_intro_forge",
		name = "nik_intro_forge",
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
				"nik_intro_forge"
			}
		}
	})
	define_rule({
		response = "nik_intro_forge_reminder",
		name = "nik_intro_forge_reminder",
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
				"nik_intro_forge_reminder"
			}
		}
	})
	define_rule({
		response = "nik_altar",
		name = "nik_altar",
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
				"nik_altar"
			}
		}
	})
	define_rule({
		response = "nik_forge",
		name = "nik_forge",
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
				"nik_forge"
			}
		}
	})
	define_rule({
		response = "nik_hub_welcome",
		name = "nik_hub_welcome",
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
				"nik_hub_welcome"
			}
		}
	})
	define_rule({
		response = "nik_hub_the_plan",
		name = "nik_hub_the_plan",
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
				"nik_hub_the_plan"
			},
			{
				"global_context",
				"completed_times_military",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "nik_hub_long_waiting_01",
		name = "nik_hub_long_waiting_01",
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
				"nik_hub_long_waiting"
			}
		}
	})
	define_rule({
		response = "nik_greeting_first_time",
		name = "nik_greeting_first_time",
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
				"nik_greeting_first_time"
			}
		}
	})
	define_rule({
		response = "nik_hub_backstory_interaction",
		name = "nik_hub_backstory_interaction",
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
				"nik_backstory_interacting"
			}
		}
	})
	define_rule({
		response = "nik_greeting_sunny",
		name = "nik_greeting_sunny",
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
				"nik_greeting_sunny"
			}
		}
	})
	define_rule({
		response = "nik_greeting_rainy",
		name = "nik_greeting_rainy",
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
				"nik_greeting_rainy"
			}
		}
	})
	define_rule({
		response = "nik_greeting_night",
		name = "nik_greeting_night",
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
				"nik_greeting_night"
			}
		}
	})
	define_rule({
		response = "nik_greeting_evening",
		name = "nik_greeting_evening",
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
				"nik_greeting_evening"
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_bardin",
		name = "nik_callout_unready_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_bardin"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_kerillian",
		name = "nik_callout_unready_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_kerillian"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_kruber",
		name = "nik_callout_unready_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_kruber"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_kruber_mercenary",
		name = "nik_callout_unready_kruber_mercenary",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_kruber"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"global_context",
				"es_mercenary",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_saltzpyre",
		name = "nik_callout_unready_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_saltzpyre"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_sienna",
		name = "nik_callout_unready_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_sienna"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_one_01",
		response = "nik_keep_idle_banter_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_one_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_one_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_two_01",
		response = "nik_keep_idle_banter_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_two_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_two_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_three",
		response = "nik_keep_idle_banter_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_three_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_four_01",
		response = "nik_keep_idle_banter_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_keep_idle_banter_four"
			},
			{
				"user_memory",
				"keep_idle_painter",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_painter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_four_02",
		response = "nik_keep_idle_banter_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_four_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_four_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_four_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_debrief_helmgart_military_01",
		name = "nfl_debrief_helmgart_military_01",
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
				"nfl_debrief_helmgart_military_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"military"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_catacombs_01",
		name = "nfl_debrief_catacombs_01",
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
				"nfl_debrief_catacombs_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"catacombs"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_mines_01",
		name = "nfl_debrief_mines_01",
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
				"nfl_debrief_mines_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"mines"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_ground_zero_01",
		name = "nfl_debrief_ground_zero_01",
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
				"nfl_debrief_ground_zero_01"
			},
			{
				"global_context",
				"level_name",
				OP.EQ,
				"ground_zero"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_elven_ruins_01",
		name = "nfl_debrief_elven_ruins_01",
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
				"nfl_debrief_elven_ruins_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"elven_ruins"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_bell_01",
		name = "nfl_debrief_bell_01",
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
				"nfl_debrief_bell_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"bell"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_fort_01",
		name = "nfl_debrief_fort_01",
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
				"nfl_debrief_fort_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"fort"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_skaven_stronghold_01",
		name = "nfl_debrief_skaven_stronghold_01",
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
				"nfl_debrief_skaven_stronghold_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"skaven_stronghold"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_farmland_01",
		name = "nfl_debrief_farmland_01",
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
				"nfl_debrief_farmland_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"farmlands"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_ussingen_01",
		name = "nfl_debrief_ussingen_01",
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
				"nfl_debrief_ussingen_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"ussingen"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_nurgle_01",
		name = "nfl_debrief_nurgle_01",
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
				"nfl_debrief_nurgle_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"nurgle"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_war_camp_01",
		name = "nfl_debrief_war_camp_01",
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
				"nfl_debrief_war_camp_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"warcamp"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_skittergate_01",
		name = "nfl_debrief_skittergate_01",
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
				"nfl_debrief_skittergate_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"skittergate"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_magnus_tower",
		name = "nfl_debrief_magnus_tower",
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
				"nfl_debrief_magnus_tower"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"magnus"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_cemetery",
		name = "nfl_debrief_cemetery",
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
				"nfl_debrief_cemetery"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"cemetery"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_forest_ambush",
		name = "nfl_debrief_forest_ambush",
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
				"nfl_debrief_forest_ambush"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"forest_ambush"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_plaza",
		name = "nfl_debrief_plaza",
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
				"nfl_debrief_plaza"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"plaza"
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_one_01",
		response = "npp_keep_idle_banter_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_keep_idle_banter_one"
			},
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_two_01",
		response = "npp_keep_idle_banter_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_keep_idle_banter_two"
			},
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_three_01",
		response = "npp_keep_idle_banter_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_keep_idle_banter_three"
			},
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_four",
		response = "npp_keep_idle_banter_four",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_keep_idle_banter_four_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"catrinne"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		nik_keep_idle_banter_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1288957595825
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_four_02"
			}
		},
		nfl_debrief_helmgart_military_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_helmgart_military_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 53.744770050049
			},
			localization_strings = {
				[1.0] = "nfl_debrief_helmgart_military_01"
			}
		},
		nik_keep_idle_banter_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 9.2859163284302
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_two_01"
			}
		},
		nik_greeting = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_greeting"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "nik_greeting"
			}
		},
		nfl_debrief_bell_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_bell_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 72.382247924805
			},
			localization_strings = {
				[1.0] = "nfl_debrief_bell_01"
			}
		},
		nik_altar = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 6,
			sound_events = {
				"nik_altar_01",
				"nik_altar_02",
				"nik_altar_03",
				"nik_altar_04",
				"nik_altar_05",
				"nik_altar_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				17.289375305176,
				7.5209999084473,
				2.1196250915527,
				5.9983334541321,
				4.2588124275208,
				4.9398331642151
			},
			localization_strings = {
				"nik_altar_01",
				"nik_altar_02",
				"nik_altar_03",
				"nik_altar_04",
				"nik_altar_05",
				"nik_altar_06"
			},
			randomize_indexes = {}
		},
		nik_greeting_night = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_hub_greeting_night_27",
				"nik_hub_greeting_night_28",
				"nik_hub_greeting_night_29"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.1783747673035,
				5.6291251182556,
				6.9817290306091
			},
			localization_strings = {
				"nik_hub_greeting_night_27",
				"nik_hub_greeting_night_28",
				"nik_hub_greeting_night_29"
			},
			randomize_indexes = {}
		},
		nik_keep_idle_banter_four_01 = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 5,
			sound_events = {
				"nik_keep_idle_banter_four_01",
				"nik_keep_idle_painter_01",
				"nik_keep_idle_painter_02",
				"nik_keep_idle_painter_03",
				"nik_keep_idle_painter_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				6.5802707672119,
				12.038042068481,
				9.8183126449585,
				9.7268333435059,
				7.1901459693909
			},
			localization_strings = {
				"nik_keep_idle_banter_four_01",
				"nik_keep_idle_painter_01",
				"nik_keep_idle_painter_02",
				"nik_keep_idle_painter_03",
				"nik_keep_idle_painter_04"
			},
			randomize_indexes = {}
		},
		nik_hub_welcome = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_welcome_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 38.688293457031
			},
			localization_strings = {
				[1.0] = "nik_hub_welcome_01"
			}
		},
		nfl_debrief_elven_ruins_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_elven_ruins_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 82.643623352051
			},
			localization_strings = {
				[1.0] = "nfl_debrief_elven_ruins_01"
			}
		},
		nik_callout_unready_kerillian = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_kerillian_01",
				"nik_callout_unready_kerillian_02",
				"nik_callout_unready_kerillian_03",
				"nik_callout_unready_kerillian_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				8.9162912368774,
				8.5915212631226,
				6.625937461853,
				7.4648122787476
			},
			localization_strings = {
				"nik_callout_unready_kerillian_01",
				"nik_callout_unready_kerillian_02",
				"nik_callout_unready_kerillian_03",
				"nik_callout_unready_kerillian_04"
			},
			randomize_indexes = {}
		},
		nik_callout_unready_sienna = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_callout_unready_sienna_03",
				[2.0] = "nik_callout_unready_sienna_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 9.9128541946411,
				[2.0] = 9.4418754577637
			},
			localization_strings = {
				[1.0] = "nik_callout_unready_sienna_03",
				[2.0] = "nik_callout_unready_sienna_04"
			},
			randomize_indexes = {}
		},
		nfl_debrief_fort_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_fort_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 57.82689666748
			},
			localization_strings = {
				[1.0] = "nfl_debrief_fort_01"
			}
		},
		nik_keep_idle_banter_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1756875514984
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_one_01"
			}
		},
		nik_inventory_reminder = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_inventory_reminder_01",
				"nik_inventory_reminder_02",
				"nik_inventory_reminder_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.1738543510437,
				2.6304376125336,
				2.4656040668488
			},
			localization_strings = {
				"nik_inventory_reminder_01",
				"nik_inventory_reminder_02",
				"nik_inventory_reminder_03"
			},
			randomize_indexes = {}
		},
		nik_greeting_rainy = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_hub_greeting_rainy_24",
				"nik_hub_greeting_rainy_25",
				"nik_hub_greeting_rainy_26"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4394583702087,
				6.7035417556763,
				5.4216456413269
			},
			localization_strings = {
				"nik_hub_greeting_rainy_24",
				"nik_hub_greeting_rainy_25",
				"nik_hub_greeting_rainy_26"
			},
			randomize_indexes = {}
		},
		nik_callout_unready_saltzpyre = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_saltzpyre_01",
				"nik_callout_unready_saltzpyre_02",
				"nik_callout_unready_saltzpyre_03",
				"nik_callout_unready_saltzpyre_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				9.6598749160767,
				7.1360416412353,
				8.4755210876465,
				3.8926665782928
			},
			localization_strings = {
				"nik_callout_unready_saltzpyre_01",
				"nik_callout_unready_saltzpyre_02",
				"nik_callout_unready_saltzpyre_03",
				"nik_callout_unready_saltzpyre_04"
			},
			randomize_indexes = {}
		},
		nik_intro_forge = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_intro_forge_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 12.386166572571
			},
			localization_strings = {
				[1.0] = "nik_intro_forge_01"
			}
		},
		nfl_debrief_ussingen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_ussingen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 47.259853363037
			},
			localization_strings = {
				[1.0] = "nfl_debrief_ussingen_01"
			}
		},
		nik_keep_idle_banter_three = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_three_01",
				[2.0] = "nik_keep_idle_banter_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1247916221619,
				[2.0] = 4.086416721344
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_three_01",
				[2.0] = "nik_keep_idle_banter_three_02"
			},
			randomize_indexes = {}
		},
		npp_keep_idle_banter_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.7869377136231
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_three_01"
			}
		},
		npp_keep_idle_banter_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3284997940064
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_two_01"
			}
		},
		npp_keep_idle_banter_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7451872825623
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_one_01"
			}
		},
		nfl_debrief_plaza = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		nfl_debrief_farmland_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_farmland_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 52.099769592285
			},
			localization_strings = {
				[1.0] = "nfl_debrief_farmland_01"
			}
		},
		nfl_debrief_forest_ambush = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		nfl_debrief_cemetery = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		nik_hub_long_waiting_01 = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"nik_hub_greeting_08",
				"nik_hub_greeting_19",
				"nik_hub_idle_01",
				"nik_hub_idle_02",
				"nik_hub_idle_05"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4725000858307,
				3.34410405159,
				1.7756458520889,
				3.0182292461395,
				3.4308958053589
			},
			localization_strings = {
				"nik_hub_greeting_08",
				"nik_hub_greeting_19",
				"nik_hub_idle_01",
				"nik_hub_idle_02",
				"nik_hub_idle_05"
			},
			randomize_indexes = {}
		},
		nfl_debrief_magnus_tower = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		nfl_debrief_skittergate_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_skittergate_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 17.341541290283
			},
			localization_strings = {
				[1.0] = "nfl_debrief_skittergate_01"
			}
		},
		nfl_debrief_war_camp_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_war_camp_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 24.666458129883
			},
			localization_strings = {
				[1.0] = "nfl_debrief_war_camp_01"
			}
		},
		nfl_debrief_nurgle_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_nurgle_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 37.438373565674
			},
			localization_strings = {
				[1.0] = "nfl_debrief_nurgle_01"
			}
		},
		nfl_debrief_skaven_stronghold_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_skaven_stronghold_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 49.58247756958
			},
			localization_strings = {
				[1.0] = "nfl_debrief_skaven_stronghold_01"
			}
		},
		nfl_debrief_ground_zero_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_ground_zero_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 36.859519958496
			},
			localization_strings = {
				[1.0] = "nfl_debrief_ground_zero_01"
			}
		},
		nfl_debrief_mines_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_mines_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 61.894248962402
			},
			localization_strings = {
				[1.0] = "nfl_debrief_mines_01"
			}
		},
		nik_map_intro = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_map_intro_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "nik_map_intro_01"
			}
		},
		nik_greeting_sunny = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 6,
			sound_events = {
				"nik_hub_greeting_14",
				"nik_hub_greeting_sunny_23",
				"nik_hub_greeting_sunny_22",
				"nik_hub_greeting_sunny_25",
				"nik_hub_greeting_sunny_21",
				"nik_hub_greeting_sunny_24"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.323979139328,
				1.5245000123978,
				4.8956665992737,
				3.4472498893738,
				2.7051458358765,
				3.112104177475
			},
			localization_strings = {
				"nik_hub_greeting_14",
				"nik_hub_greeting_sunny_23",
				"nik_hub_greeting_sunny_22",
				"nik_hub_greeting_sunny_25",
				"nik_hub_greeting_sunny_21",
				"nik_hub_greeting_sunny_24"
			},
			randomize_indexes = {}
		},
		nik_hub_the_plan = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_the_plan_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 49.661895751953
			},
			localization_strings = {
				[1.0] = "nik_hub_the_plan_01"
			}
		},
		nfl_debrief_catacombs_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_catacombs_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 61.535915374756
			},
			localization_strings = {
				[1.0] = "nfl_debrief_catacombs_01"
			}
		},
		nik_intro_forge_reminder = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_intro_forge_reminder_01",
				[2.0] = "nik_intro_forge_reminder_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1456458568573,
				[2.0] = 2.2395417690277
			},
			localization_strings = {
				[1.0] = "nik_intro_forge_reminder_01",
				[2.0] = "nik_intro_forge_reminder_02"
			},
			randomize_indexes = {}
		},
		nik_callout_unready_bardin = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_bardin_01",
				"nik_callout_unready_bardin_02",
				"nik_callout_unready_bardin_03",
				"nik_callout_unready_bardin_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				7.2825832366943,
				8.7650833129883,
				10.294437408447,
				10.031645774841
			},
			localization_strings = {
				"nik_callout_unready_bardin_01",
				"nik_callout_unready_bardin_02",
				"nik_callout_unready_bardin_03",
				"nik_callout_unready_bardin_04"
			},
			randomize_indexes = {}
		},
		npp_keep_idle_banter_four = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.0226459503174
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_four_01"
			}
		},
		nik_forge = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_forge_01",
				"nik_forge_02",
				"nik_forge_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.8668332099915,
				7.7072291374206,
				3.7555415630341
			},
			localization_strings = {
				"nik_forge_01",
				"nik_forge_02",
				"nik_forge_03"
			},
			randomize_indexes = {}
		},
		nik_callout_unready_kruber_mercenary = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_02",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				10.048958778381,
				7.5940833091736,
				6.3275418281555,
				7.7065415382385
			},
			localization_strings = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_02",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			randomize_indexes = {}
		},
		nik_greeting_evening = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_hub_greeting_evening_30",
				"nik_hub_greeting_evening_31",
				"nik_hub_greeting_evening_32"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.4648542404175,
				3.3333749771118,
				1.0735000371933
			},
			localization_strings = {
				"nik_hub_greeting_evening_30",
				"nik_hub_greeting_evening_31",
				"nik_hub_greeting_evening_32"
			},
			randomize_indexes = {}
		},
		nik_callout_unready_kruber = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				10.048958778381,
				6.3275418281555,
				7.7065415382385
			},
			localization_strings = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			randomize_indexes = {}
		},
		nik_greeting_first_time = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_welcome_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 38.688293457031
			},
			localization_strings = {
				[1.0] = "nik_hub_welcome_01"
			}
		},
		nik_hub_backstory_interaction = {
			sound_events_n = 31,
			face_animations_n = 31,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 31,
			sound_events = {
				"nik_hub_backstory_03",
				"nik_hub_backstory_04",
				"nik_hub_backstory_05",
				"nik_hub_backstory_06",
				"nik_hub_backstory_07",
				"nik_hub_backstory_08",
				"nik_hub_backstory_09",
				"nik_hub_backstory_10",
				"nik_keep_idle_01",
				"nik_keep_idle_02",
				"nik_keep_idle_03",
				"nik_keep_idle_04",
				"nik_keep_idle_05",
				"nik_keep_idle_06",
				"nik_keep_idle_07",
				"nik_keep_idle_08",
				"nik_keep_idle_09",
				"nik_keep_idle_10",
				"nik_keep_idle_11",
				"nik_keep_idle_12",
				"nik_keep_idle_13",
				"nik_keep_idle_14",
				"nik_keep_idle_17",
				"nik_keep_idle_18",
				"nik_keep_idle_19",
				"nik_keep_idle_20",
				"nik_keep_idle_21",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_keep_idle_24",
				"nik_keep_idle_25"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				14.694707870483,
				9.4800834655762,
				11.330812454224,
				5.8075623512268,
				4.6288747787476,
				8.1448335647583,
				12.64354133606,
				6.6951217651367,
				4.719229221344,
				9.9170837402344,
				4.587375164032,
				3.7447292804718,
				6.4479374885559,
				5.4015002250671,
				7.9590625762939,
				8.8776664733887,
				6.3288960456848,
				6.4083333015442,
				6.2114582061768,
				6.561999797821,
				4.4263124465942,
				16.537937164307,
				4.5551252365112,
				6.1234169006348,
				8.3766670227051,
				9.9232292175293,
				5.2719373703003,
				10.569812774658,
				15.338541984558,
				5.0747709274292,
				23.178459167481
			},
			localization_strings = {
				"nik_hub_backstory_03",
				"nik_hub_backstory_04",
				"nik_hub_backstory_05",
				"nik_hub_backstory_06",
				"nik_hub_backstory_07",
				"nik_hub_backstory_08",
				"nik_hub_backstory_09",
				"nik_hub_backstory_10",
				"nik_keep_idle_01",
				"nik_keep_idle_02",
				"nik_keep_idle_03",
				"nik_keep_idle_04",
				"nik_keep_idle_05",
				"nik_keep_idle_06",
				"nik_keep_idle_07",
				"nik_keep_idle_08",
				"nik_keep_idle_09",
				"nik_keep_idle_10",
				"nik_keep_idle_11",
				"nik_keep_idle_12",
				"nik_keep_idle_13",
				"nik_keep_idle_14",
				"nik_keep_idle_17",
				"nik_keep_idle_18",
				"nik_keep_idle_19",
				"nik_keep_idle_20",
				"nik_keep_idle_21",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_keep_idle_24",
				"nik_keep_idle_25"
			},
			randomize_indexes = {}
		}
	})
end
