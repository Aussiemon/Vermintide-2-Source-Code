return function ()
	define_rule({
		response = "pwh_wp_activate_ability",
		name = "pwh_wp_activate_ability",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_priest"
			}
		}
	})
	define_rule({
		response = "pwh_wp_activate_fury",
		name = "pwh_wp_activate_fury",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_fury"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_priest"
			}
		}
	})
	add_dialogues({
		pwh_wp_activate_ability = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "witch_hunter_bless",
			sound_events_n = 10,
			category = "activate_ability",
			dialogue_animations_n = 10,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pwh_wp_activate_ability_01",
				"pwh_wp_activate_ability_02",
				"pwh_wp_activate_ability_03",
				"pwh_wp_activate_ability_04",
				"pwh_wp_activate_ability_05",
				"pwh_wp_activate_ability_06",
				"pwh_wp_activate_ability_07",
				"pwh_wp_activate_ability_08",
				"pwh_wp_activate_ability_09",
				"pwh_wp_activate_ability_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wp_activate_ability_01",
				"pwh_wp_activate_ability_02",
				"pwh_wp_activate_ability_03",
				"pwh_wp_activate_ability_04",
				"pwh_wp_activate_ability_05",
				"pwh_wp_activate_ability_06",
				"pwh_wp_activate_ability_07",
				"pwh_wp_activate_ability_08",
				"pwh_wp_activate_ability_09",
				"pwh_wp_activate_ability_10"
			},
			sound_events_duration = {
				1.5986666679382,
				2.4749584197998,
				2.7484166622162,
				1.4522500038147,
				1.9037708044052,
				2.0467083454132,
				2.0018334388733,
				1.7102916240692,
				2.5258541107178,
				3.718291759491
			}
		},
		pwh_wp_activate_fury = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "witch_hunter_bless",
			sound_events_n = 15,
			category = "activate_ability",
			dialogue_animations_n = 15,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
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
				"pwh_wp_casting_bark_01",
				"pwh_wp_casting_bark_03",
				"pwh_wp_casting_bark_05",
				"pwh_wp_casting_bark_07",
				"pwh_wp_casting_bark_09",
				"pwh_wp_casting_bark_11",
				"pwh_wp_casting_bark_13",
				"pwh_wp_casting_bark_15",
				"pwh_wp_casting_bark_17",
				"pwh_wp_casting_bark_19",
				"pwh_wp_casting_bark_21",
				"pwh_wp_casting_bark_23",
				"pwh_wp_casting_bark_25",
				"pwh_wp_casting_bark_27",
				"pwh_wp_casting_bark_29"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wp_casting_bark_01",
				"pwh_wp_casting_bark_03",
				"pwh_wp_casting_bark_05",
				"pwh_wp_casting_bark_07",
				"pwh_wp_casting_bark_09",
				"pwh_wp_casting_bark_11",
				"pwh_wp_casting_bark_13",
				"pwh_wp_casting_bark_15",
				"pwh_wp_casting_bark_17",
				"pwh_wp_casting_bark_19",
				"pwh_wp_casting_bark_21",
				"pwh_wp_casting_bark_23",
				"pwh_wp_casting_bark_25",
				"pwh_wp_casting_bark_27",
				"pwh_wp_casting_bark_29"
			},
			sound_events_duration = {
				1.324874997139,
				1.2806041240692,
				1.4821457862854,
				1.8888750076294,
				1.2638750076294,
				1.4991250038147,
				1.5382500290871,
				1.5799896121025,
				1.5892916917801,
				1.7198958396912,
				1.8441041707993,
				1.0914270579815,
				1.8515207767487,
				1.5521458387375,
				1.4707499742508
			}
		}
	})
end
