return function ()
	define_rule({
		response = "ewl_opening_line",
		name = "ewl_opening_line",
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
				"ewl_opening_line"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_warlord"
			}
		}
	})
	define_rule({
		name = "ewl_gameplay_banter",
		response = "ewl_gameplay_banter",
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
				"ewl_gameplay_banter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_warlord"
			},
			{
				"user_memory",
				"time_since_ewl_gameplay_banter",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ewl_gameplay_banter",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewl_gameplay_summoning_skaven",
		response = "ewl_gameplay_summoning_skaven",
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
				"ewl_gameplay_summoning_skaven"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_warlord"
			},
			{
				"user_memory",
				"time_since_ewl_gameplay_summoning_skaven",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ewl_gameplay_summoning_skaven",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		ewl_gameplay_summoning_skaven = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "skaven_warlord_skaven_stronghold_level",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"ewl_gameplay_summoning_skaven_01",
				"ewl_gameplay_summoning_skaven_02",
				"ewl_gameplay_summoning_skaven_03",
				"ewl_gameplay_summoning_skaven_04",
				"ewl_gameplay_summoning_skaven_05",
				"ewl_gameplay_summoning_skaven_06",
				"ewl_gameplay_summoning_skaven_07",
				"ewl_gameplay_summoning_skaven_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ewl_gameplay_summoning_skaven_01",
				"ewl_gameplay_summoning_skaven_02",
				"ewl_gameplay_summoning_skaven_03",
				"ewl_gameplay_summoning_skaven_04",
				"ewl_gameplay_summoning_skaven_05",
				"ewl_gameplay_summoning_skaven_06",
				"ewl_gameplay_summoning_skaven_07",
				"ewl_gameplay_summoning_skaven_08"
			},
			randomize_indexes = {}
		},
		ewl_opening_line = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "skaven_warlord_skaven_stronghold_level",
			sound_distance = 50,
			category = "champion_opening",
			dialogue_animations_n = 4,
			sound_events = {
				"ewl_level_skaven_stronghold_taunt_reply_04",
				"ewl_level_skaven_stronghold_taunt_reply_01",
				"ewl_level_skaven_stronghold_taunt_reply_02",
				"ewl_level_skaven_stronghold_taunt_reply_03"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ewl_level_skaven_stronghold_taunt_reply_04",
				"ewl_level_skaven_stronghold_taunt_reply_01",
				"ewl_level_skaven_stronghold_taunt_reply_02",
				"ewl_level_skaven_stronghold_taunt_reply_03"
			},
			randomize_indexes = {}
		},
		ewl_gameplay_banter = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "skaven_warlord_skaven_stronghold_level",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"ewl_gameplay_banter_08",
				"ewl_gameplay_banter_01",
				"ewl_gameplay_banter_02",
				"ewl_gameplay_banter_03",
				"ewl_gameplay_banter_04",
				"ewl_gameplay_banter_05",
				"ewl_gameplay_banter_06",
				"ewl_gameplay_banter_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ewl_gameplay_banter_08",
				"ewl_gameplay_banter_01",
				"ewl_gameplay_banter_02",
				"ewl_gameplay_banter_03",
				"ewl_gameplay_banter_04",
				"ewl_gameplay_banter_05",
				"ewl_gameplay_banter_06",
				"ewl_gameplay_banter_07"
			},
			randomize_indexes = {}
		}
	})

	return 
end
