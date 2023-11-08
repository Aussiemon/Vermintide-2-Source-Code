return function ()
	define_rule({
		response = "pbw_nm_activate_ability",
		name = "pbw_nm_activate_ability",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer"
			}
		}
	})
	define_rule({
		name = "pbw_nm_command_attack",
		response = "pbw_nm_command_attack",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"minion_command_attack"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_command_defend",
				OP.TIMEDIFF,
				OP.GT,
				4
			},
			{
				"user_memory",
				"time_since_command_attack",
				OP.TIMEDIFF,
				OP.GT,
				12
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_command_attack",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_nm_command_defend",
		response = "pbw_nm_command_defend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"minion_command_defend"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_command_attack",
				OP.TIMEDIFF,
				OP.GT,
				4
			},
			{
				"user_memory",
				"time_since_command_defend",
				OP.TIMEDIFF,
				OP.GT,
				12
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_command_defend",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pbw_nm_activate_ability = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "bright_wizard_shovel",
			sound_events_n = 12,
			category = "activate_ability",
			dialogue_animations_n = 12,
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
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_nm_activate_ability_01",
				"pbw_nm_activate_ability_02",
				"pbw_nm_activate_ability_03",
				"pbw_nm_activate_ability_04",
				"pbw_nm_activate_ability_05",
				"pbw_nm_activate_ability_06",
				"pbw_nm_activate_ability_07",
				"pbw_nm_activate_ability_08",
				"pbw_nm_activate_ability_09",
				"pbw_nm_activate_ability_10",
				"pbw_nm_activate_ability_11",
				"pbw_nm_activate_ability_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_nm_activate_ability_01",
				"pbw_nm_activate_ability_02",
				"pbw_nm_activate_ability_03",
				"pbw_nm_activate_ability_04",
				"pbw_nm_activate_ability_05",
				"pbw_nm_activate_ability_06",
				"pbw_nm_activate_ability_07",
				"pbw_nm_activate_ability_08",
				"pbw_nm_activate_ability_09",
				"pbw_nm_activate_ability_10",
				"pbw_nm_activate_ability_11",
				"pbw_nm_activate_ability_12"
			},
			sound_events_duration = {
				1.9653124809265,
				2.0401041507721,
				1.9188749790192,
				1.9306458234787,
				1.8696875572205,
				1.7390625476837,
				3.0387291908264,
				2.320770740509,
				2.3945207595825,
				2.3321874141693,
				2.4752917289734,
				2.872750043869
			}
		},
		pbw_nm_command_attack = {
			intended_player_profile = "bright_wizard",
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_shovel",
			sound_events_n = 10,
			category = "default",
			dialogue_animations_n = 10,
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
				"face_neutral"
			},
			localization_strings = {
				"pbw_nm_minion_command_attack_01",
				"pbw_nm_minion_command_attack_02",
				"pbw_nm_minion_command_attack_03",
				"pbw_nm_minion_command_attack_04",
				"pbw_nm_minion_command_attack_05",
				"pbw_nm_minion_command_attack_06",
				"pbw_nm_minion_command_attack_07",
				"pbw_nm_minion_command_attack_08",
				"pbw_nm_minion_command_attack_09",
				"pbw_nm_minion_command_attack_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_nm_minion_command_attack_01",
				"pbw_nm_minion_command_attack_02",
				"pbw_nm_minion_command_attack_03",
				"pbw_nm_minion_command_attack_04",
				"pbw_nm_minion_command_attack_05",
				"pbw_nm_minion_command_attack_06",
				"pbw_nm_minion_command_attack_07",
				"pbw_nm_minion_command_attack_08",
				"pbw_nm_minion_command_attack_09",
				"pbw_nm_minion_command_attack_10"
			},
			sound_events_duration = {
				2.6472916603088,
				2.496687412262,
				2.4565625190735,
				1.8674166202545,
				2.1295833587647,
				2.9194374084473,
				2.2404582500458,
				2.0471458435059,
				2.4898540973663,
				3.014666557312
			}
		},
		pbw_nm_command_defend = {
			intended_player_profile = "bright_wizard",
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_shovel",
			sound_events_n = 10,
			category = "default",
			dialogue_animations_n = 10,
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
				"face_neutral"
			},
			localization_strings = {
				"pbw_nm_minion_command_defend_01",
				"pbw_nm_minion_command_defend_02",
				"pbw_nm_minion_command_defend_03",
				"pbw_nm_minion_command_defend_04",
				"pbw_nm_minion_command_defend_05",
				"pbw_nm_minion_command_defend_06",
				"pbw_nm_minion_command_defend_07",
				"pbw_nm_minion_command_defend_08",
				"pbw_nm_minion_command_defend_09",
				"pbw_nm_minion_command_defend_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_nm_minion_command_defend_01",
				"pbw_nm_minion_command_defend_02",
				"pbw_nm_minion_command_defend_03",
				"pbw_nm_minion_command_defend_04",
				"pbw_nm_minion_command_defend_05",
				"pbw_nm_minion_command_defend_06",
				"pbw_nm_minion_command_defend_07",
				"pbw_nm_minion_command_defend_08",
				"pbw_nm_minion_command_defend_09",
				"pbw_nm_minion_command_defend_10"
			},
			sound_events_duration = {
				2.3359792232513,
				1.3624374866486,
				2.2297084331513,
				0.93858331441879,
				1.4879167079925,
				0.99466669559479,
				1.784500002861,
				2.1355624198914,
				2.7974584102631,
				1.8271666765213
			}
		}
	})
end
