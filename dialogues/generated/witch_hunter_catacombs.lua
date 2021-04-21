return function ()
	define_rule({
		name = "pwh_level_catacombs_healing_ward",
		response = "pwh_level_catacombs_healing_ward",
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
		name = "pwh_level_catacombs_apothercary_room",
		response = "pwh_level_catacombs_apothercary_room",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_confinement_cells",
		response = "pwh_level_catacombs_confinement_cells",
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
		name = "pwh_level_catacombs_tunnel_entrance",
		response = "pwh_level_catacombs_tunnel_entrance",
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
		name = "pwh_level_catacombs_sewers",
		response = "pwh_level_catacombs_sewers",
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
		name = "pwh_level_catacombs_switch_instructions",
		response = "pwh_level_catacombs_switch_instructions",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_whoa_wrong_switch",
		response = "pwh_level_catacombs_whoa_wrong_switch",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_correct_switch",
		response = "pwh_level_catacombs_correct_switch",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_way_is_clear",
		response = "pwh_level_catacombs_way_is_clear",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_sewers_nurglefication_light",
		response = "pwh_level_catacombs_sewers_nurglefication_light",
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
		name = "pwh_level_catacombs_sewers_nurglefication_heavy",
		response = "pwh_level_catacombs_sewers_nurglefication_heavy",
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
		name = "pwh_level_catacombs_jump_into_intestine_hole",
		response = "pwh_level_catacombs_jump_into_intestine_hole",
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
				"catacombs_jump_into_intestine_hole"
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
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_jump_into_intestine_hole",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_jump_into_intestine_hole",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_catacombs_mausoleum_entrance",
		response = "pwh_level_catacombs_mausoleum_entrance",
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
				"catacombs_mausoleum_entrance"
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
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_mausoleum_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_mausoleum_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_catacombs_nurgle_water",
		response = "pwh_level_catacombs_nurgle_water",
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
				"catacombs_nurgle_water"
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
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_catacombs_nurgle_water",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_nurgle_water",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_catacombs_hear_chanting",
		response = "pwh_level_catacombs_hear_chanting",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_spot_ritual",
		response = "pwh_level_catacombs_spot_ritual",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_ritual_disrupted_ritual",
		response = "pwh_level_catacombs_ritual_disrupted_ritual",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_ritual_exit_through_portal",
		response = "pwh_level_catacombs_ritual_exit_through_portal",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_sabotage_ritual",
		response = "pwh_level_catacombs_sabotage_ritual",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_one_sorcerer_dead",
		response = "pwh_level_catacombs_one_sorcerer_dead",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_two_sorcerer_dead",
		response = "pwh_level_catacombs_two_sorcerer_dead",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_cultist_door",
		response = "pwh_level_catacombs_cultist_door",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_catacombs_slime_trail",
		response = "pwh_level_catacombs_slime_trail",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_catacombs_intro_a",
		response = "pwh_catacombs_intro_a",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_catacombs_intro_b",
		response = "pwh_catacombs_intro_b",
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
				"witch_hunter"
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
		name = "pwh_catacombs_intro_c",
		response = "pwh_catacombs_intro_c",
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
				"witch_hunter"
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
		pwh_level_catacombs_sewers = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_sewers_01",
				"pwh_level_catacombs_sewers_02",
				"pwh_level_catacombs_sewers_03",
				"pwh_level_catacombs_sewers_04"
			},
			sound_events = {
				"pwh_level_catacombs_sewers_01",
				"pwh_level_catacombs_sewers_02",
				"pwh_level_catacombs_sewers_03",
				"pwh_level_catacombs_sewers_04"
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
				3.9014375209808,
				6.050666809082,
				7.2558751106262,
				5.6911458969116
			}
		},
		pwh_level_catacombs_switch_instructions = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_switch_instructions_01",
				"pwh_level_catacombs_switch_instructions_02",
				"pwh_level_catacombs_switch_instructions_03",
				"pwh_level_catacombs_switch_instructions_04"
			},
			sound_events = {
				"pwh_level_catacombs_switch_instructions_01",
				"pwh_level_catacombs_switch_instructions_02",
				"pwh_level_catacombs_switch_instructions_03",
				"pwh_level_catacombs_switch_instructions_04"
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
				4.0488958358765,
				4.0244374275208,
				4.2128124237061,
				4.1970210075378
			}
		},
		pwh_level_catacombs_confinement_cells = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_confinement_cells_01",
				"pwh_level_catacombs_confinement_cells_02",
				"pwh_level_catacombs_confinement_cells_03",
				"pwh_level_catacombs_confinement_cells_04"
			},
			sound_events = {
				"pwh_level_catacombs_confinement_cells_01",
				"pwh_level_catacombs_confinement_cells_02",
				"pwh_level_catacombs_confinement_cells_03",
				"pwh_level_catacombs_confinement_cells_04"
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
				3.5932500362396,
				1.9079583883286,
				6.2389793395996,
				7.3140416145325
			}
		},
		pwh_level_catacombs_hear_chanting = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_hear_chanting_01",
				"pwh_level_catacombs_hear_chanting_02",
				"pwh_level_catacombs_hear_chanting_03",
				"pwh_level_catacombs_hear_chanting_04"
			},
			sound_events = {
				"pwh_level_catacombs_hear_chanting_01",
				"pwh_level_catacombs_hear_chanting_02",
				"pwh_level_catacombs_hear_chanting_03",
				"pwh_level_catacombs_hear_chanting_04"
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
				3.279354095459,
				3.3944375514984,
				2.9879374504089,
				5.3401875495911
			}
		},
		pwh_level_catacombs_apothercary_room = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_apothercary_room_01",
				"pwh_level_catacombs_apothercary_room_02",
				"pwh_level_catacombs_apothercary_room_03",
				"pwh_level_catacombs_apothercary_room_04"
			},
			sound_events = {
				"pwh_level_catacombs_apothercary_room_01",
				"pwh_level_catacombs_apothercary_room_02",
				"pwh_level_catacombs_apothercary_room_03",
				"pwh_level_catacombs_apothercary_room_04"
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
				3.6369376182556,
				2.701812505722,
				2.6175000667572,
				3.8356873989105
			}
		},
		pwh_level_catacombs_tunnel_entrance = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_tunnel_entrance_01",
				"pwh_level_catacombs_tunnel_entrance_02",
				"pwh_level_catacombs_tunnel_entrance_03",
				"pwh_level_catacombs_tunnel_entrance_04"
			},
			sound_events = {
				"pwh_level_catacombs_tunnel_entrance_01",
				"pwh_level_catacombs_tunnel_entrance_02",
				"pwh_level_catacombs_tunnel_entrance_03",
				"pwh_level_catacombs_tunnel_entrance_04"
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
				2.8735208511352,
				3.4071667194366,
				3.4628748893738,
				4.334499835968
			}
		},
		pwh_catacombs_intro_c = {
			face_animations_n = 2,
			database = "witch_hunter_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_catacombs_intro_c_01",
				[2.0] = "pwh_catacombs_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwh_catacombs_intro_c_01",
				[2.0] = "pwh_catacombs_intro_c_02"
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
				[1.0] = 4.2496876716614,
				[2.0] = 3.7732083797455
			}
		},
		pwh_level_catacombs_correct_switch = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_correct_switch_01",
				"pwh_level_catacombs_correct_switch_02",
				"pwh_level_catacombs_correct_switch_03",
				"pwh_level_catacombs_correct_switch_04"
			},
			sound_events = {
				"pwh_level_catacombs_correct_switch_01",
				"pwh_level_catacombs_correct_switch_02",
				"pwh_level_catacombs_correct_switch_03",
				"pwh_level_catacombs_correct_switch_04"
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
				2.4469165802002,
				3.4261250495911,
				5.5742502212524,
				5.0235414505005
			}
		},
		pwh_catacombs_intro_b = {
			face_animations_n = 2,
			database = "witch_hunter_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_catacombs_intro_b_01",
				[2.0] = "pwh_catacombs_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwh_catacombs_intro_b_01",
				[2.0] = "pwh_catacombs_intro_b_02"
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
				[1.0] = 4.3556666374206,
				[2.0] = 3.0640625953674
			}
		},
		pwh_level_catacombs_sabotage_ritual = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_sabotage_ritual_01",
				"pwh_level_catacombs_sabotage_ritual_02",
				"pwh_level_catacombs_sabotage_ritual_03",
				"pwh_level_catacombs_sabotage_ritual_04"
			},
			sound_events = {
				"pwh_level_catacombs_sabotage_ritual_01",
				"pwh_level_catacombs_sabotage_ritual_02",
				"pwh_level_catacombs_sabotage_ritual_03",
				"pwh_level_catacombs_sabotage_ritual_04"
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
				3.1219582557678,
				3.9892499446869,
				4.3039164543152,
				3.258770942688
			}
		},
		pwh_level_catacombs_spot_ritual = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_spot_ritual_01",
				"pwh_level_catacombs_spot_ritual_02",
				"pwh_level_catacombs_spot_ritual_03",
				"pwh_level_catacombs_spot_ritual_04"
			},
			sound_events = {
				"pwh_level_catacombs_spot_ritual_01",
				"pwh_level_catacombs_spot_ritual_02",
				"pwh_level_catacombs_spot_ritual_03",
				"pwh_level_catacombs_spot_ritual_04"
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
				3.1248750686645,
				4.4786872863769,
				4.271999835968,
				6.4808959960938
			}
		},
		pwh_level_catacombs_nurgle_water = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_nurgle_water_01",
				"pwh_level_catacombs_nurgle_water_02",
				"pwh_level_catacombs_nurgle_water_03",
				"pwh_level_catacombs_nurgle_water_04"
			},
			sound_events = {
				"pwh_level_catacombs_nurgle_water_01",
				"pwh_level_catacombs_nurgle_water_02",
				"pwh_level_catacombs_nurgle_water_03",
				"pwh_level_catacombs_nurgle_water_04"
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
				6.3150835037231,
				6.1444582939148,
				4.0641875267029,
				3.9305624961853
			}
		},
		pwh_level_catacombs_cultist_door = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_cultist_door_01",
				"pwh_level_catacombs_cultist_door_02",
				"pwh_level_catacombs_cultist_door_03",
				"pwh_level_catacombs_cultist_door_04"
			},
			sound_events = {
				"pwh_level_catacombs_cultist_door_01",
				"pwh_level_catacombs_cultist_door_02",
				"pwh_level_catacombs_cultist_door_03",
				"pwh_level_catacombs_cultist_door_04"
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
				2.0727500915527,
				2.7336249351502,
				5.0114793777466,
				3.073499917984
			}
		},
		pwh_level_catacombs_mausoleum_entrance = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_mausoleum_entrance_01",
				"pwh_level_catacombs_mausoleum_entrance_02",
				"pwh_level_catacombs_mausoleum_entrance_03",
				"pwh_level_catacombs_mausoleum_entrance_04"
			},
			sound_events = {
				"pwh_level_catacombs_mausoleum_entrance_01",
				"pwh_level_catacombs_mausoleum_entrance_02",
				"pwh_level_catacombs_mausoleum_entrance_03",
				"pwh_level_catacombs_mausoleum_entrance_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.1902289390564,
				2.0585000514984,
				3.8687083721161,
				2.8816249370575
			}
		},
		pwh_catacombs_intro_a = {
			face_animations_n = 2,
			database = "witch_hunter_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_catacombs_intro_a_01",
				[2.0] = "pwh_catacombs_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwh_catacombs_intro_a_01",
				[2.0] = "pwh_catacombs_intro_a_02"
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
				[1.0] = 2.2850832939148,
				[2.0] = 3.3344376087189
			}
		},
		pwh_level_catacombs_slime_trail = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_slime_trail_01",
				"pwh_level_catacombs_slime_trail_02",
				"pwh_level_catacombs_slime_trail_03",
				"pwh_level_catacombs_slime_trail_04"
			},
			sound_events = {
				"pwh_level_catacombs_slime_trail_01",
				"pwh_level_catacombs_slime_trail_02",
				"pwh_level_catacombs_slime_trail_03",
				"pwh_level_catacombs_slime_trail_04"
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
				4.1852293014526,
				3.3943958282471,
				5.0370206832886,
				4.0227918624878
			}
		},
		pwh_level_catacombs_sewers_nurglefication_heavy = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_sewers_nurglefication_heavy_01",
				"pwh_level_catacombs_sewers_nurglefication_heavy_02",
				"pwh_level_catacombs_sewers_nurglefication_heavy_03",
				"pwh_level_catacombs_sewers_nurglefication_heavy_04"
			},
			sound_events = {
				"pwh_level_catacombs_sewers_nurglefication_heavy_01",
				"pwh_level_catacombs_sewers_nurglefication_heavy_02",
				"pwh_level_catacombs_sewers_nurglefication_heavy_03",
				"pwh_level_catacombs_sewers_nurglefication_heavy_04"
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
				7.0568752288818,
				6.3746666908264,
				3.2300000190735,
				4.9627499580383
			}
		},
		pwh_level_catacombs_one_sorcerer_dead = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_one_sorcerer_dead_01",
				"pwh_level_catacombs_one_sorcerer_dead_02",
				"pwh_level_catacombs_one_sorcerer_dead_03",
				"pwh_level_catacombs_one_sorcerer_dead_04"
			},
			sound_events = {
				"pwh_level_catacombs_one_sorcerer_dead_01",
				"pwh_level_catacombs_one_sorcerer_dead_02",
				"pwh_level_catacombs_one_sorcerer_dead_03",
				"pwh_level_catacombs_one_sorcerer_dead_04"
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
				4.3298540115356,
				3.919041633606,
				4.005437374115,
				4.8412499427795
			}
		},
		pwh_level_catacombs_two_sorcerer_dead = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_two_sorcerer_dead_01",
				"pwh_level_catacombs_two_sorcerer_dead_02",
				"pwh_level_catacombs_two_sorcerer_dead_03",
				"pwh_level_catacombs_two_sorcerer_dead_04"
			},
			sound_events = {
				"pwh_level_catacombs_two_sorcerer_dead_01",
				"pwh_level_catacombs_two_sorcerer_dead_02",
				"pwh_level_catacombs_two_sorcerer_dead_03",
				"pwh_level_catacombs_two_sorcerer_dead_04"
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
				4.0288333892822,
				4.3702917098999,
				4.6391668319702,
				4.510666847229
			}
		},
		pwh_level_catacombs_ritual_exit_through_portal = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_ritual_exit_through_portal_01",
				"pwh_level_catacombs_ritual_exit_through_portal_02",
				"pwh_level_catacombs_ritual_exit_through_portal_03",
				"pwh_level_catacombs_ritual_exit_through_portal_04"
			},
			sound_events = {
				"pwh_level_catacombs_ritual_exit_through_portal_01",
				"pwh_level_catacombs_ritual_exit_through_portal_02",
				"pwh_level_catacombs_ritual_exit_through_portal_03",
				"pwh_level_catacombs_ritual_exit_through_portal_04"
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
				3.3314790725708,
				2.870020866394,
				3.5299167633057,
				2.9479374885559
			}
		},
		pwh_level_catacombs_jump_into_intestine_hole = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_jump_into_intestine_hole_01",
				"pwh_level_catacombs_jump_into_intestine_hole_02",
				"pwh_level_catacombs_jump_into_intestine_hole_03",
				"pwh_level_catacombs_jump_into_intestine_hole_04"
			},
			sound_events = {
				"pwh_level_catacombs_jump_into_intestine_hole_01",
				"pwh_level_catacombs_jump_into_intestine_hole_02",
				"pwh_level_catacombs_jump_into_intestine_hole_03",
				"pwh_level_catacombs_jump_into_intestine_hole_04"
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
				4.0772290229797,
				3.6303334236145,
				5.1886043548584,
				3.225145816803
			}
		},
		pwh_level_catacombs_way_is_clear = {
			face_animations_n = 2,
			database = "witch_hunter_catacombs",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_catacombs_way_is_clear_01",
				[2.0] = "pwh_level_catacombs_way_is_clear_02"
			},
			sound_events = {
				[1.0] = "pwh_level_catacombs_way_is_clear_01",
				[2.0] = "pwh_level_catacombs_way_is_clear_02"
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
				[1.0] = 2.357479095459,
				[2.0] = 4.6437082290649
			}
		},
		pwh_level_catacombs_ritual_disrupted_ritual = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_ritual_disrupted_ritual_01",
				"pwh_level_catacombs_ritual_disrupted_ritual_02",
				"pwh_level_catacombs_ritual_disrupted_ritual_03",
				"pwh_level_catacombs_ritual_disrupted_ritual_04"
			},
			sound_events = {
				"pwh_level_catacombs_ritual_disrupted_ritual_01",
				"pwh_level_catacombs_ritual_disrupted_ritual_02",
				"pwh_level_catacombs_ritual_disrupted_ritual_03",
				"pwh_level_catacombs_ritual_disrupted_ritual_04"
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
				5.502375125885,
				5.6681456565857,
				6.86483335495,
				6.779354095459
			}
		},
		pwh_level_catacombs_whoa_wrong_switch = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_whoa_wrong_switch_01",
				"pwh_level_catacombs_whoa_wrong_switch_02",
				"pwh_level_catacombs_whoa_wrong_switch_03",
				"pwh_level_catacombs_whoa_wrong_switch_04"
			},
			sound_events = {
				"pwh_level_catacombs_whoa_wrong_switch_01",
				"pwh_level_catacombs_whoa_wrong_switch_02",
				"pwh_level_catacombs_whoa_wrong_switch_03",
				"pwh_level_catacombs_whoa_wrong_switch_04"
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
				1.6265000104904,
				2.7957084178925,
				3.2075417041779,
				2.7427499294281
			}
		},
		pwh_level_catacombs_sewers_nurglefication_light = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_sewers_nurglefication_light_01",
				"pwh_level_catacombs_sewers_nurglefication_light_02",
				"pwh_level_catacombs_sewers_nurglefication_light_03",
				"pwh_level_catacombs_sewers_nurglefication_light_04"
			},
			sound_events = {
				"pwh_level_catacombs_sewers_nurglefication_light_01",
				"pwh_level_catacombs_sewers_nurglefication_light_02",
				"pwh_level_catacombs_sewers_nurglefication_light_03",
				"pwh_level_catacombs_sewers_nurglefication_light_04"
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
				4.623104095459,
				2.8444583415985,
				1.2820208072662,
				4.0395832061768
			}
		},
		pwh_level_catacombs_healing_ward = {
			face_animations_n = 4,
			database = "witch_hunter_catacombs",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_catacombs_healing_ward_01",
				"pwh_level_catacombs_healing_ward_02",
				"pwh_level_catacombs_healing_ward_03",
				"pwh_level_catacombs_healing_ward_04"
			},
			sound_events = {
				"pwh_level_catacombs_healing_ward_01",
				"pwh_level_catacombs_healing_ward_02",
				"pwh_level_catacombs_healing_ward_03",
				"pwh_level_catacombs_healing_ward_04"
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
				3.9506874084473,
				4.7169585227966,
				2.886020898819,
				3.5498125553131
			}
		}
	})
end
