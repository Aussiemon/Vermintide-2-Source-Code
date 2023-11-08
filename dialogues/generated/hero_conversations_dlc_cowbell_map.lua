return function ()
	define_rule({
		response = "nfl_shadow_curse_loading_screen",
		name = "nfl_shadow_curse_loading_screen",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"deus_map_tutorial"
			},
			{
				"global_context",
				"map_has_belakor",
				OP.EQ,
				1
			},
			{
				"global_context",
				"times_map_visited",
				OP.EQ,
				1
			}
		}
	})
	add_dialogues({
		nfl_shadow_curse_loading_screen = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_map",
			sound_events_n = 4,
			category = "special_occasion",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nfl_shadow_curse_loading_screen_01",
				"nfl_shadow_curse_loading_screen_02",
				"nfl_shadow_curse_loading_screen_03",
				"nfl_shadow_curse_loading_screen_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_loading_screen_01",
				"nfl_shadow_curse_loading_screen_02",
				"nfl_shadow_curse_loading_screen_03",
				"nfl_shadow_curse_loading_screen_04"
			},
			sound_events_duration = {
				13.906979560852,
				15.323979377747,
				15.418978691101,
				12.731979370117
			}
		}
	})
end
