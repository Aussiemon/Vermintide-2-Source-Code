return function ()
	define_rule({
		response = "pwe_overcharge_explode",
		name = "pwe_overcharge_explode",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"overcharge_explode"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_overcharge_warning",
		response = "pwe_overcharge_warning",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"overcharge_high"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_overcharge_warning",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_overcharge_warning",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwe_st_activate_ability",
		name = "pwe_st_activate_ability",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_thornsister"
			}
		}
	})
	add_dialogues({
		pwe_overcharge_explode = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "wood_elf_woods",
			sound_events_n = 6,
			category = "player_alerts_overcharge_explode",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pwe_overcharge_explode_01",
				"pwe_overcharge_explode_03",
				"pwe_overcharge_explode_04",
				"pwe_overcharge_explode_05",
				"pwe_overcharge_explode_06",
				"pwe_overcharge_explode_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_overcharge_explode_01",
				"pwe_overcharge_explode_03",
				"pwe_overcharge_explode_04",
				"pwe_overcharge_explode_05",
				"pwe_overcharge_explode_06",
				"pwe_overcharge_explode_07"
			},
			sound_events_duration = {
				3.0994999408722,
				2.6880834102631,
				2.0361459255219,
				2.2689166069031,
				3.5851249694824,
				2.9406459331513
			}
		},
		pwe_overcharge_warning = {
			intended_player_profile = "wood_elf",
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "wood_elf_woods",
			sound_events_n = 11,
			category = "player_alerts_overcharge_warning",
			dialogue_animations_n = 11,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pwe_overcharge_warning_01",
				"pwe_overcharge_warning_02",
				"pwe_overcharge_warning_03",
				"pwe_overcharge_warning_04",
				"pwe_overcharge_warning_05",
				"pwe_overcharge_warning_06",
				"pwe_overcharge_warning_07",
				"pwe_overcharge_warning_08",
				"pwe_overcharge_warning_09",
				"pwe_overcharge_warning_10",
				"pwe_overcharge_warning_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_overcharge_warning_01",
				"pwe_overcharge_warning_02",
				"pwe_overcharge_warning_03",
				"pwe_overcharge_warning_04",
				"pwe_overcharge_warning_05",
				"pwe_overcharge_warning_06",
				"pwe_overcharge_warning_07",
				"pwe_overcharge_warning_08",
				"pwe_overcharge_warning_09",
				"pwe_overcharge_warning_10",
				"pwe_overcharge_warning_11"
			},
			sound_events_duration = {
				3.462729215622,
				2.6421875953674,
				2.8875417709351,
				2.4380624294281,
				2.2206041812897,
				2.1811873912811,
				2.1404790878296,
				2.2596249580383,
				3.3894374370575,
				3.0748958587647,
				5.0133543014526
			}
		},
		pwe_st_activate_ability = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "wood_elf_woods",
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
				"pwe_st_activate_ability_01",
				"pwe_st_activate_ability_02",
				"pwe_st_activate_ability_03",
				"pwe_st_activate_ability_04",
				"pwe_st_activate_ability_05",
				"pwe_st_activate_ability_06",
				"pwe_st_activate_ability_07",
				"pwe_st_activate_ability_08",
				"pwe_st_activate_ability_09",
				"pwe_st_activate_ability_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_st_activate_ability_01",
				"pwe_st_activate_ability_02",
				"pwe_st_activate_ability_03",
				"pwe_st_activate_ability_04",
				"pwe_st_activate_ability_05",
				"pwe_st_activate_ability_06",
				"pwe_st_activate_ability_07",
				"pwe_st_activate_ability_08",
				"pwe_st_activate_ability_09",
				"pwe_st_activate_ability_10"
			},
			sound_events_duration = {
				3.2428123950958,
				2.003666639328,
				2.5174374580383,
				2.3368124961853,
				1.4690624475479,
				2.9097707271576,
				2.7823333740234,
				1.9291458129883,
				2.1959373950958,
				1.8790625333786
			}
		}
	})
end
