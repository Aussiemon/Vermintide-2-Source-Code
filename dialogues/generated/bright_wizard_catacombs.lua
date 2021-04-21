return function ()
	define_rule({
		name = "pbw_level_catacombs_healing_ward",
		response = "pbw_level_catacombs_healing_ward",
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
				"catacombs_healing_ward"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_healing_ward",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_healing_ward",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_apothercary_room",
		response = "pbw_level_catacombs_apothercary_room",
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
				"catacombs_apothercary_room"
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
				"faction_memory",
				"time_since_catacombs_apothercary_room",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_apothercary_room",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_confinement_cells",
		response = "pbw_level_catacombs_confinement_cells",
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
				"catacombs_confinement_cells"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_confinement_cells",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_confinement_cells",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_tunnel_entrance",
		response = "pbw_level_catacombs_tunnel_entrance",
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
				"catacombs_tunnel_entrance"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_tunnel_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_tunnel_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_sewers",
		response = "pbw_level_catacombs_sewers",
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
				"catacombs_sewers"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_sewers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_sewers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_switch_instructions",
		response = "pbw_level_catacombs_switch_instructions",
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
				"catacombs_switch_instructions"
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
				"faction_memory",
				"time_since_catacombs_switch_instructions",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_switch_instructions",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_whoa_wrong_switch",
		response = "pbw_level_catacombs_whoa_wrong_switch",
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
				"catacombs_whoa_wrong_switch"
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
				"faction_memory",
				"time_since_catacombs_whoa_wrong_switch",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_whoa_wrong_switch",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_correct_switch",
		response = "pbw_level_catacombs_correct_switch",
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
				"catacombs_correct_switch"
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
				"faction_memory",
				"time_since_catacombs_whoa_wrong_switch",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_whoa_wrong_switch",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_way_is_clear",
		response = "pbw_level_catacombs_way_is_clear",
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
				"catacombs_way_is_clear"
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
				"faction_memory",
				"time_since_catacombs_way_is_clear",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_way_is_clear",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_sewers_nurglefication_light",
		response = "pbw_level_catacombs_sewers_nurglefication_light",
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
				"catacombs_sewers_nurglefication_light"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_sewers_nurglefication_light",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_sewers_nurglefication_light",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_sewers_nurglefication_heavy",
		response = "pbw_level_catacombs_sewers_nurglefication_heavy",
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
				"catacombs_sewers_nurglefication_heavy"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_sewers_nurglefication_heavy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_sewers_nurglefication_heavy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_hear_chanting",
		response = "pbw_level_catacombs_hear_chanting",
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
				"catacombs_hear_chanting"
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
				"faction_memory",
				"time_since_catacombs_hear_chanting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_hear_chanting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_spot_ritual",
		response = "pbw_level_catacombs_spot_ritual",
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
				"catacombs_spot_ritual"
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
				"faction_memory",
				"time_since_catacombs_spot_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_spot_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_shield_of_flies",
		response = "pbw_level_catacombs_shield_of_flies",
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
				"catacombs_shield_of_flies"
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
				"faction_memory",
				"time_since_catacombs_shield_of_flies",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_shield_of_flies",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_ritual_disrupted_ritual",
		response = "pbw_level_catacombs_ritual_disrupted_ritual",
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
				"catacombs_ritual_disrupted_ritual"
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
				"faction_memory",
				"time_since_catacombs_ritual_disrupted_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_ritual_disrupted_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_ritual_exit_through_portal",
		response = "pbw_level_catacombs_ritual_exit_through_portal",
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
				"catacombs_ritual_exit_through_portal"
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
				"faction_memory",
				"time_since_catacombs_ritual_exit_through_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_ritual_exit_through_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_sabotage_ritual",
		response = "pbw_level_catacombs_sabotage_ritual",
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
				"catacombs_sabotage_ritual"
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
				"faction_memory",
				"time_since_catacombs_sabotage_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_sabotage_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_one_sorcerer_dead",
		response = "pbw_level_catacombs_one_sorcerer_dead",
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
				"catacombs_one_sorcerer_dead"
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
				"faction_memory",
				"time_since_catacombs_one_sorcerer_dead",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_one_sorcerer_dead",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_two_sorcerer_dead",
		response = "pbw_level_catacombs_two_sorcerer_dead",
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
				"catacombs_two_sorcerer_dead"
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
				"faction_memory",
				"time_since_catacombs_two_sorcerer_dead",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_two_sorcerer_dead",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_cultist_door",
		response = "pbw_level_catacombs_cultist_door",
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
				"catacombs_cultist_door"
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
				"faction_memory",
				"time_since_catacombs_cultist_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_cultist_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_catacombs_slime_trail",
		response = "pbw_level_catacombs_slime_trail",
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
				"catacombs_slime_trail"
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
				"faction_memory",
				"time_since_catacombs_slime_trail",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_slime_trail",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_catacombs_intro_a",
		response = "pbw_catacombs_intro_a",
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
				"catacombs_intro_a"
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
				"faction_memory",
				"catacombs_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"catacombs_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_catacombs_intro_b",
		response = "pbw_catacombs_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"catacombs_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"catacombs_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"catacombs_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_catacombs_intro_c",
		response = "pbw_catacombs_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"catacombs_intro_c"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"catacombs_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"catacombs_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pbw_level_catacombs_spot_ritual = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_spot_ritual_01",
				"pbw_level_catacombs_spot_ritual_02",
				"pbw_level_catacombs_spot_ritual_03",
				"pbw_level_catacombs_spot_ritual_04"
			},
			sound_events = {
				"pbw_level_catacombs_spot_ritual_01",
				"pbw_level_catacombs_spot_ritual_02",
				"pbw_level_catacombs_spot_ritual_03",
				"pbw_level_catacombs_spot_ritual_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.3632917404175,
				3.7370834350586,
				4.7140626907349,
				4.0784373283386
			}
		},
		pbw_level_catacombs_cultist_door = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_cultist_door_01",
				"pbw_level_catacombs_cultist_door_02",
				"pbw_level_catacombs_cultist_door_03",
				"pbw_level_catacombs_cultist_door_04"
			},
			sound_events = {
				"pbw_level_catacombs_cultist_door_01",
				"pbw_level_catacombs_cultist_door_02",
				"pbw_level_catacombs_cultist_door_03",
				"pbw_level_catacombs_cultist_door_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.1072502136231,
				3.7162709236145,
				5.3028960227966,
				4.4879584312439
			}
		},
		pbw_level_catacombs_one_sorcerer_dead = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_one_sorcerer_dead_01",
				"pbw_level_catacombs_one_sorcerer_dead_02",
				"pbw_level_catacombs_one_sorcerer_dead_03",
				"pbw_level_catacombs_one_sorcerer_dead_04"
			},
			sound_events = {
				"pbw_level_catacombs_one_sorcerer_dead_01",
				"pbw_level_catacombs_one_sorcerer_dead_02",
				"pbw_level_catacombs_one_sorcerer_dead_03",
				"pbw_level_catacombs_one_sorcerer_dead_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		pbw_level_catacombs_sewers_nurglefication_heavy = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_sewers_nurglefication_heavy_01",
				"pbw_level_catacombs_sewers_nurglefication_heavy_02",
				"pbw_level_catacombs_sewers_nurglefication_heavy_03",
				"pbw_level_catacombs_sewers_nurglefication_heavy_04"
			},
			sound_events = {
				"pbw_level_catacombs_sewers_nurglefication_heavy_01",
				"pbw_level_catacombs_sewers_nurglefication_heavy_02",
				"pbw_level_catacombs_sewers_nurglefication_heavy_03",
				"pbw_level_catacombs_sewers_nurglefication_heavy_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.0753331184387,
				3.9148540496826,
				3.2716040611267,
				4.7737293243408
			}
		},
		pbw_level_catacombs_shield_of_flies = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_shield_of_flies_01",
				"pbw_level_catacombs_shield_of_flies_02",
				"pbw_level_catacombs_shield_of_flies_03",
				"pbw_level_catacombs_shield_of_flies_04"
			},
			sound_events = {
				"pbw_level_catacombs_shield_of_flies_01",
				"pbw_level_catacombs_shield_of_flies_02",
				"pbw_level_catacombs_shield_of_flies_03",
				"pbw_level_catacombs_shield_of_flies_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7046666145325,
				2.5967500209808,
				1.8263750076294,
				2.5480208396912
			}
		},
		pbw_catacombs_intro_c = {
			face_animations_n = 2,
			database = "bright_wizard_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pbw_catacombs_intro_c_01",
				[2.0] = "pbw_catacombs_intro_c_02"
			},
			sound_events = {
				[1.0] = "pbw_catacombs_intro_c_01",
				[2.0] = "pbw_catacombs_intro_c_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.4806666374206,
				[2.0] = 5.6849789619446
			}
		},
		pbw_catacombs_intro_b = {
			face_animations_n = 2,
			database = "bright_wizard_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pbw_catacombs_intro_b_01",
				[2.0] = "pbw_catacombs_intro_b_02"
			},
			sound_events = {
				[1.0] = "pbw_catacombs_intro_b_01",
				[2.0] = "pbw_catacombs_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.0933542251587,
				[2.0] = 2.9205000400543
			}
		},
		pbw_level_catacombs_ritual_disrupted_ritual = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_ritual_disrupted_ritual_01",
				"pbw_level_catacombs_ritual_disrupted_ritual_02",
				"pbw_level_catacombs_ritual_disrupted_ritual_03",
				"pbw_level_catacombs_ritual_disrupted_ritual_04"
			},
			sound_events = {
				"pbw_level_catacombs_ritual_disrupted_ritual_01",
				"pbw_level_catacombs_ritual_disrupted_ritual_02",
				"pbw_level_catacombs_ritual_disrupted_ritual_03",
				"pbw_level_catacombs_ritual_disrupted_ritual_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8147082328796,
				2.6141457557678,
				3.394770860672,
				5.1760416030884
			}
		},
		pbw_level_catacombs_slime_trail = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_slime_trail_01",
				"pbw_level_catacombs_slime_trail_02",
				"pbw_level_catacombs_slime_trail_03",
				"pbw_level_catacombs_slime_trail_04"
			},
			sound_events = {
				"pbw_level_catacombs_slime_trail_01",
				"pbw_level_catacombs_slime_trail_02",
				"pbw_level_catacombs_slime_trail_03",
				"pbw_level_catacombs_slime_trail_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.2747082710266,
				2.4895417690277,
				3.9552917480469,
				4.3050417900085
			}
		},
		pbw_level_catacombs_ritual_exit_through_portal = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_ritual_exit_through_portal_01",
				"pbw_level_catacombs_ritual_exit_through_portal_02",
				"pbw_level_catacombs_ritual_exit_through_portal_03",
				"pbw_level_catacombs_ritual_exit_through_portal_04"
			},
			sound_events = {
				"pbw_level_catacombs_ritual_exit_through_portal_01",
				"pbw_level_catacombs_ritual_exit_through_portal_02",
				"pbw_level_catacombs_ritual_exit_through_portal_03",
				"pbw_level_catacombs_ritual_exit_through_portal_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6773333549499,
				7.0768332481384,
				3.9621250629425,
				2.9882917404175
			}
		},
		pbw_catacombs_intro_a = {
			face_animations_n = 2,
			database = "bright_wizard_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pbw_catacombs_intro_a_01",
				[2.0] = "pbw_catacombs_intro_a_02"
			},
			sound_events = {
				[1.0] = "pbw_catacombs_intro_a_01",
				[2.0] = "pbw_catacombs_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.0045418739319,
				[2.0] = 2.1299583911896
			}
		},
		pbw_level_catacombs_whoa_wrong_switch = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_whoa_wrong_switch_01",
				"pbw_level_catacombs_whoa_wrong_switch_02",
				"pbw_level_catacombs_whoa_wrong_switch_03",
				"pbw_level_catacombs_whoa_wrong_switch_04"
			},
			sound_events = {
				"pbw_level_catacombs_whoa_wrong_switch_01",
				"pbw_level_catacombs_whoa_wrong_switch_02",
				"pbw_level_catacombs_whoa_wrong_switch_03",
				"pbw_level_catacombs_whoa_wrong_switch_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.5860416889191,
				1.9926249980927,
				2.5903542041779,
				3.4021666049957
			}
		},
		pbw_level_catacombs_confinement_cells = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_confinement_cells_01",
				"pbw_level_catacombs_confinement_cells_02",
				"pbw_level_catacombs_confinement_cells_03",
				"pbw_level_catacombs_confinement_cells_04"
			},
			sound_events = {
				"pbw_level_catacombs_confinement_cells_01",
				"pbw_level_catacombs_confinement_cells_02",
				"pbw_level_catacombs_confinement_cells_03",
				"pbw_level_catacombs_confinement_cells_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				6.1608333587647,
				5.7214999198914,
				3.8750834465027,
				5.9313540458679
			}
		},
		pbw_level_catacombs_switch_instructions = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_switch_instructions_01",
				"pbw_level_catacombs_switch_instructions_02",
				"pbw_level_catacombs_switch_instructions_03",
				"pbw_level_catacombs_switch_instructions_04"
			},
			sound_events = {
				"pbw_level_catacombs_switch_instructions_01",
				"pbw_level_catacombs_switch_instructions_02",
				"pbw_level_catacombs_switch_instructions_03",
				"pbw_level_catacombs_switch_instructions_04"
			},
			face_animations = {
				"face_happy",
				"face_contempt",
				"face_contempt",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.755083322525,
				2.1833958625794,
				3.1311042308807,
				3.2505416870117
			}
		},
		pbw_level_catacombs_way_is_clear = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_way_is_clear_01",
				"pbw_level_catacombs_way_is_clear_02",
				"pbw_level_catacombs_way_is_clear_03",
				"pbw_level_catacombs_way_is_clear_04"
			},
			sound_events = {
				"pbw_level_catacombs_way_is_clear_01",
				"pbw_level_catacombs_way_is_clear_02",
				"pbw_level_catacombs_way_is_clear_03",
				"pbw_level_catacombs_way_is_clear_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.0426666736603,
				3.4518959522247,
				2.587833404541,
				2.3434166908264
			}
		},
		pbw_level_catacombs_two_sorcerer_dead = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_two_sorcerer_dead_01",
				"pbw_level_catacombs_two_sorcerer_dead_02",
				"pbw_level_catacombs_two_sorcerer_dead_03",
				"pbw_level_catacombs_two_sorcerer_dead_04"
			},
			sound_events = {
				"pbw_level_catacombs_two_sorcerer_dead_01",
				"pbw_level_catacombs_two_sorcerer_dead_02",
				"pbw_level_catacombs_two_sorcerer_dead_03",
				"pbw_level_catacombs_two_sorcerer_dead_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.5953958034515,
				2.7422292232513,
				3.1336667537689,
				4.8009376525879
			}
		},
		pbw_level_catacombs_correct_switch = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_correct_switch_01",
				"pbw_level_catacombs_correct_switch_02",
				"pbw_level_catacombs_correct_switch_03",
				"pbw_level_catacombs_correct_switch_04"
			},
			sound_events = {
				"pbw_level_catacombs_correct_switch_01",
				"pbw_level_catacombs_correct_switch_02",
				"pbw_level_catacombs_correct_switch_03",
				"pbw_level_catacombs_correct_switch_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.9260001182556,
				1.4941874742508,
				3.3622708320618,
				3.2942917346954
			}
		},
		pbw_level_catacombs_hear_chanting = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_hear_chanting_01",
				"pbw_level_catacombs_hear_chanting_02",
				"pbw_level_catacombs_hear_chanting_03",
				"pbw_level_catacombs_hear_chanting_04"
			},
			sound_events = {
				"pbw_level_catacombs_hear_chanting_01",
				"pbw_level_catacombs_hear_chanting_02",
				"pbw_level_catacombs_hear_chanting_03",
				"pbw_level_catacombs_hear_chanting_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.3866250514984,
				4.8043751716614,
				3.4413125514984,
				6.6431665420532
			}
		},
		pbw_level_catacombs_sabotage_ritual = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_sabotage_ritual_01",
				"pbw_level_catacombs_sabotage_ritual_02",
				"pbw_level_catacombs_sabotage_ritual_03",
				"pbw_level_catacombs_sabotage_ritual_04"
			},
			sound_events = {
				"pbw_level_catacombs_sabotage_ritual_01",
				"pbw_level_catacombs_sabotage_ritual_02",
				"pbw_level_catacombs_sabotage_ritual_03",
				"pbw_level_catacombs_sabotage_ritual_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.5529165267944,
				5.4860000610352,
				5.1808543205261,
				4.1142706871033
			}
		},
		pbw_level_catacombs_healing_ward = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_healing_ward_01",
				"pbw_level_catacombs_healing_ward_02",
				"pbw_level_catacombs_healing_ward_03",
				"pbw_level_catacombs_healing_ward_04"
			},
			sound_events = {
				"pbw_level_catacombs_healing_ward_01",
				"pbw_level_catacombs_healing_ward_02",
				"pbw_level_catacombs_healing_ward_03",
				"pbw_level_catacombs_healing_ward_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.0852918624878,
				2.681937456131,
				5.7964792251587,
				3.4974582195282
			}
		},
		pbw_level_catacombs_sewers = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_sewers_01",
				"pbw_level_catacombs_sewers_02",
				"pbw_level_catacombs_sewers_03",
				"pbw_level_catacombs_sewers_04"
			},
			sound_events = {
				"pbw_level_catacombs_sewers_01",
				"pbw_level_catacombs_sewers_02",
				"pbw_level_catacombs_sewers_03",
				"pbw_level_catacombs_sewers_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.1518125534058,
				3.7946667671204,
				4.6415209770203,
				4.3126039505005
			}
		},
		pbw_level_catacombs_tunnel_entrance = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_tunnel_entrance_01",
				"pbw_level_catacombs_tunnel_entrance_02",
				"pbw_level_catacombs_tunnel_entrance_03",
				"pbw_level_catacombs_tunnel_entrance_04"
			},
			sound_events = {
				"pbw_level_catacombs_tunnel_entrance_01",
				"pbw_level_catacombs_tunnel_entrance_02",
				"pbw_level_catacombs_tunnel_entrance_03",
				"pbw_level_catacombs_tunnel_entrance_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.9423542022705,
				2.490312576294,
				2.8618125915527,
				2.7488958835602
			}
		},
		pbw_level_catacombs_apothercary_room = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_apothercary_room_01",
				"pbw_level_catacombs_apothercary_room_02",
				"pbw_level_catacombs_apothercary_room_03",
				"pbw_level_catacombs_apothercary_room_04"
			},
			sound_events = {
				"pbw_level_catacombs_apothercary_room_01",
				"pbw_level_catacombs_apothercary_room_02",
				"pbw_level_catacombs_apothercary_room_03",
				"pbw_level_catacombs_apothercary_room_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.4894375801086,
				3.4381666183472,
				2.3797082901001,
				3.788229227066
			}
		},
		pbw_level_catacombs_sewers_nurglefication_light = {
			face_animations_n = 4,
			database = "bright_wizard_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pbw_level_catacombs_sewers_nurglefication_light_01",
				"pbw_level_catacombs_sewers_nurglefication_light_02",
				"pbw_level_catacombs_sewers_nurglefication_light_03",
				"pbw_level_catacombs_sewers_nurglefication_light_04"
			},
			sound_events = {
				"pbw_level_catacombs_sewers_nurglefication_light_01",
				"pbw_level_catacombs_sewers_nurglefication_light_02",
				"pbw_level_catacombs_sewers_nurglefication_light_03",
				"pbw_level_catacombs_sewers_nurglefication_light_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.5635833740234,
				3.0258333683014,
				5.4288334846497,
				3.1970000267029
			}
		}
	})
end
