return function ()
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
	add_dialogues({
		ewl_gameplay_banter = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "skaven_warlord_skaven_stronghold_level",
			sound_events_n = 8,
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 8,
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
			randomize_indexes = {},
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
			sound_events_duration = {
				5.2431292533875,
				2.8268253803253,
				4.9566440582275,
				4.4730277061462,
				2.1971049308777,
				3.1397504806519,
				3.5556688308716,
				4.8628797531128
			}
		},
		ewl_gameplay_summoning_skaven = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "skaven_warlord_skaven_stronghold_level",
			sound_events_n = 8,
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 8,
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
			randomize_indexes = {},
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
			sound_events_duration = {
				2.622700214386,
				2.8362584114075,
				3.8207256793976,
				4.6769843101502,
				3.5978684425354,
				3.4114513397217,
				4.5472564697266,
				4.0115194320679
			}
		},
		ewl_opening_line = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "skaven_warlord_skaven_stronghold_level",
			sound_events_n = 4,
			sound_distance = 50,
			category = "champion_opening",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"ewl_level_skaven_stronghold_taunt_reply_04",
				"ewl_level_skaven_stronghold_taunt_reply_01",
				"ewl_level_skaven_stronghold_taunt_reply_02",
				"ewl_level_skaven_stronghold_taunt_reply_03"
			},
			sound_events_duration = {
				5.3708844184875,
				6.1793651580811,
				6.5120182037353,
				6.8495693206787
			}
		}
	})
end
