return function ()
	define_rule({
		name = "pes_level_catacombs_healing_ward",
		response = "pes_level_catacombs_healing_ward",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_apothercary_room",
		response = "pes_level_catacombs_apothercary_room",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_confinement_cells",
		response = "pes_level_catacombs_confinement_cells",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_sewers",
		response = "pes_level_catacombs_sewers",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_switch_instructions",
		response = "pes_level_catacombs_switch_instructions",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_whoa_wrong_switch",
		response = "pes_level_catacombs_whoa_wrong_switch",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_correct_switch",
		response = "pes_level_catacombs_correct_switch",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_way_is_clear",
		response = "pes_level_catacombs_way_is_clear",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_sewers_nurglefication_light",
		response = "pes_level_catacombs_sewers_nurglefication_light",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_sewers_nurglefication_heavy",
		response = "pes_level_catacombs_sewers_nurglefication_heavy",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_jump_into_intestine_hole",
		response = "pes_level_catacombs_jump_into_intestine_hole",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_mausoleum_entrance",
		response = "pes_level_catacombs_mausoleum_entrance",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_nurgle_water",
		response = "pes_level_catacombs_nurgle_water",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_hear_chanting",
		response = "pes_level_catacombs_hear_chanting",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_spot_ritual",
		response = "pes_level_catacombs_spot_ritual",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_ritual_disrupted_ritual",
		response = "pes_level_catacombs_ritual_disrupted_ritual",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_ritual_exit_through_portal",
		response = "pes_level_catacombs_ritual_exit_through_portal",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_sabotage_ritual",
		response = "pes_level_catacombs_sabotage_ritual",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_one_sorcerer_dead",
		response = "pes_level_catacombs_one_sorcerer_dead",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_two_sorcerer_dead",
		response = "pes_level_catacombs_two_sorcerer_dead",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_cultist_door",
		response = "pes_level_catacombs_cultist_door",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_catacombs_slime_trail",
		response = "pes_level_catacombs_slime_trail",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_catacombs_intro_a",
		response = "pes_catacombs_intro_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_catacombs_intro_b",
		response = "pes_catacombs_intro_b",
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
				"empire_soldier"
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
		name = "pes_catacombs_intro_c",
		response = "pes_catacombs_intro_c",
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
				"empire_soldier"
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
		pes_level_catacombs_mausoleum_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_mausoleum_entrance_01",
				"pes_level_catacombs_mausoleum_entrance_02",
				"pes_level_catacombs_mausoleum_entrance_03",
				"pes_level_catacombs_mausoleum_entrance_04"
			},
			dialogue_animations = {
				"dialogue_shout",
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
				3.5159375667572,
				3.8536667823791,
				2.7899374961853,
				3.9005625247955
			},
			localization_strings = {
				"pes_level_catacombs_mausoleum_entrance_01",
				"pes_level_catacombs_mausoleum_entrance_02",
				"pes_level_catacombs_mausoleum_entrance_03",
				"pes_level_catacombs_mausoleum_entrance_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_switch_instructions = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_switch_instructions_01",
				"pes_level_catacombs_switch_instructions_02",
				"pes_level_catacombs_switch_instructions_03",
				"pes_level_catacombs_switch_instructions_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_contempt",
				"face_contempt",
				"face_neutral"
			},
			sound_events_duration = {
				2.9294791221619,
				2.2333750724792,
				1.9984999895096,
				3.5574791431427
			},
			localization_strings = {
				"pes_level_catacombs_switch_instructions_01",
				"pes_level_catacombs_switch_instructions_02",
				"pes_level_catacombs_switch_instructions_03",
				"pes_level_catacombs_switch_instructions_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_spot_ritual = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_spot_ritual_01",
				"pes_level_catacombs_spot_ritual_02",
				"pes_level_catacombs_spot_ritual_03",
				"pes_level_catacombs_spot_ritual_04"
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
				1.3058333396912,
				2.5131249427795,
				2.6692917346954,
				3.6512498855591
			},
			localization_strings = {
				"pes_level_catacombs_spot_ritual_01",
				"pes_level_catacombs_spot_ritual_02",
				"pes_level_catacombs_spot_ritual_03",
				"pes_level_catacombs_spot_ritual_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_healing_ward = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_healing_ward_01",
				"pes_level_catacombs_healing_ward_02",
				"pes_level_catacombs_healing_ward_03",
				"pes_level_catacombs_healing_ward_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.9525208473206,
				3.1441874504089,
				2.4224998950958,
				2.0440626144409
			},
			localization_strings = {
				"pes_level_catacombs_healing_ward_01",
				"pes_level_catacombs_healing_ward_02",
				"pes_level_catacombs_healing_ward_03",
				"pes_level_catacombs_healing_ward_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_sewers_nurglefication_light = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_sewers_nurglefication_light_01",
				"pes_level_catacombs_sewers_nurglefication_light_02",
				"pes_level_catacombs_sewers_nurglefication_light_03",
				"pes_level_catacombs_sewers_nurglefication_light_04"
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
				3.7312500476837,
				3.6766042709351,
				3.634229183197,
				5.4353957176208
			},
			localization_strings = {
				"pes_level_catacombs_sewers_nurglefication_light_01",
				"pes_level_catacombs_sewers_nurglefication_light_02",
				"pes_level_catacombs_sewers_nurglefication_light_03",
				"pes_level_catacombs_sewers_nurglefication_light_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_ritual_disrupted_ritual = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_ritual_disrupted_ritual_01",
				"pes_level_catacombs_ritual_disrupted_ritual_02",
				"pes_level_catacombs_ritual_disrupted_ritual_03",
				"pes_level_catacombs_ritual_disrupted_ritual_04"
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
				0.86764585971832,
				1.8726667165756,
				2.3579165935516,
				2.4378333091736
			},
			localization_strings = {
				"pes_level_catacombs_ritual_disrupted_ritual_01",
				"pes_level_catacombs_ritual_disrupted_ritual_02",
				"pes_level_catacombs_ritual_disrupted_ritual_03",
				"pes_level_catacombs_ritual_disrupted_ritual_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_nurgle_water = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_nurgle_water_01",
				"pes_level_catacombs_nurgle_water_02",
				"pes_level_catacombs_nurgle_water_03",
				"pes_level_catacombs_nurgle_water_04"
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
				2.947562456131,
				2.3215625286102,
				3.0126249790192,
				4.374499797821
			},
			localization_strings = {
				"pes_level_catacombs_nurgle_water_01",
				"pes_level_catacombs_nurgle_water_02",
				"pes_level_catacombs_nurgle_water_03",
				"pes_level_catacombs_nurgle_water_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_correct_switch = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_correct_switch_01",
				"pes_level_catacombs_correct_switch_02",
				"pes_level_catacombs_correct_switch_03",
				"pes_level_catacombs_correct_switch_04"
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
				2.1221458911896,
				2.5607500076294,
				1.996270775795,
				3.5527291297913
			},
			localization_strings = {
				"pes_level_catacombs_correct_switch_01",
				"pes_level_catacombs_correct_switch_02",
				"pes_level_catacombs_correct_switch_03",
				"pes_level_catacombs_correct_switch_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_confinement_cells = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_confinement_cells_01",
				"pes_level_catacombs_confinement_cells_02",
				"pes_level_catacombs_confinement_cells_03",
				"pes_level_catacombs_confinement_cells_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.1204373836517,
				3.3368332386017,
				2.9240207672119,
				3.2964792251587
			},
			localization_strings = {
				"pes_level_catacombs_confinement_cells_01",
				"pes_level_catacombs_confinement_cells_02",
				"pes_level_catacombs_confinement_cells_03",
				"pes_level_catacombs_confinement_cells_04"
			},
			randomize_indexes = {}
		},
		pes_catacombs_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_catacombs_intro_c_01",
				[2.0] = "pes_catacombs_intro_c_02"
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
				[1.0] = 1.8798542022705,
				[2.0] = 3.2321875095367
			},
			localization_strings = {
				[1.0] = "pes_catacombs_intro_c_01",
				[2.0] = "pes_catacombs_intro_c_02"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_ritual_exit_through_portal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_ritual_exit_through_portal_01",
				"pes_level_catacombs_ritual_exit_through_portal_02",
				"pes_level_catacombs_ritual_exit_through_portal_03",
				"pes_level_catacombs_ritual_exit_through_portal_04"
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
				3.0393750667572,
				1.1031458377838,
				2.7058959007263,
				3.7530832290649
			},
			localization_strings = {
				"pes_level_catacombs_ritual_exit_through_portal_01",
				"pes_level_catacombs_ritual_exit_through_portal_02",
				"pes_level_catacombs_ritual_exit_through_portal_03",
				"pes_level_catacombs_ritual_exit_through_portal_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_sewers_nurglefication_heavy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_sewers_nurglefication_heavy_01",
				"pes_level_catacombs_sewers_nurglefication_heavy_02",
				"pes_level_catacombs_sewers_nurglefication_heavy_03",
				"pes_level_catacombs_sewers_nurglefication_heavy_04"
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
				5.6138124465942,
				5.5597915649414,
				4.47891664505,
				4.2625832557678
			},
			localization_strings = {
				"pes_level_catacombs_sewers_nurglefication_heavy_01",
				"pes_level_catacombs_sewers_nurglefication_heavy_02",
				"pes_level_catacombs_sewers_nurglefication_heavy_03",
				"pes_level_catacombs_sewers_nurglefication_heavy_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_jump_into_intestine_hole = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_jump_into_intestine_hole_01",
				"pes_level_catacombs_jump_into_intestine_hole_02",
				"pes_level_catacombs_jump_into_intestine_hole_03",
				"pes_level_catacombs_jump_into_intestine_hole_04"
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
				5.9116458892822,
				4.9782710075378,
				3.9168334007263,
				2.3461458683014
			},
			localization_strings = {
				"pes_level_catacombs_jump_into_intestine_hole_01",
				"pes_level_catacombs_jump_into_intestine_hole_02",
				"pes_level_catacombs_jump_into_intestine_hole_03",
				"pes_level_catacombs_jump_into_intestine_hole_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_sewers = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_sewers_01",
				"pes_level_catacombs_sewers_02",
				"pes_level_catacombs_sewers_03",
				"pes_level_catacombs_sewers_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				5.6850833892822,
				4.5586252212524,
				4.8475832939148,
				2.8292708396912
			},
			localization_strings = {
				"pes_level_catacombs_sewers_01",
				"pes_level_catacombs_sewers_02",
				"pes_level_catacombs_sewers_03",
				"pes_level_catacombs_sewers_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_one_sorcerer_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_one_sorcerer_dead_01",
				"pes_level_catacombs_one_sorcerer_dead_02",
				"pes_level_catacombs_one_sorcerer_dead_03",
				"pes_level_catacombs_one_sorcerer_dead_04"
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
				3.5041666030884,
				3.8010001182556,
				4.9617290496826,
				2.8433125019074
			},
			localization_strings = {
				"pes_level_catacombs_one_sorcerer_dead_01",
				"pes_level_catacombs_one_sorcerer_dead_02",
				"pes_level_catacombs_one_sorcerer_dead_03",
				"pes_level_catacombs_one_sorcerer_dead_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_cultist_door = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_cultist_door_01",
				"pes_level_catacombs_cultist_door_02",
				"pes_level_catacombs_cultist_door_03",
				"pes_level_catacombs_cultist_door_04"
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
				3.3284165859222,
				2.601104259491,
				2.0619375705719,
				1.6844791173935
			},
			localization_strings = {
				"pes_level_catacombs_cultist_door_01",
				"pes_level_catacombs_cultist_door_02",
				"pes_level_catacombs_cultist_door_03",
				"pes_level_catacombs_cultist_door_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_slime_trail = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_slime_trail_01",
				"pes_level_catacombs_slime_trail_02",
				"pes_level_catacombs_slime_trail_03",
				"pes_level_catacombs_slime_trail_04"
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
				4.0817708969116,
				3.3615832328796,
				2.0671458244324,
				2.1222915649414
			},
			localization_strings = {
				"pes_level_catacombs_slime_trail_01",
				"pes_level_catacombs_slime_trail_02",
				"pes_level_catacombs_slime_trail_03",
				"pes_level_catacombs_slime_trail_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_hear_chanting = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_hear_chanting_01",
				"pes_level_catacombs_hear_chanting_02",
				"pes_level_catacombs_hear_chanting_03",
				"pes_level_catacombs_hear_chanting_04"
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
				2.9375834465027,
				2.5219166278839,
				4.305145740509,
				2.3561458587647
			},
			localization_strings = {
				"pes_level_catacombs_hear_chanting_01",
				"pes_level_catacombs_hear_chanting_02",
				"pes_level_catacombs_hear_chanting_03",
				"pes_level_catacombs_hear_chanting_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_two_sorcerer_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_two_sorcerer_dead_01",
				"pes_level_catacombs_two_sorcerer_dead_02",
				"pes_level_catacombs_two_sorcerer_dead_03",
				"pes_level_catacombs_two_sorcerer_dead_04"
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
				1.9347916841507,
				3.9619584083557,
				2.1992082595825,
				4.8529376983643
			},
			localization_strings = {
				"pes_level_catacombs_two_sorcerer_dead_01",
				"pes_level_catacombs_two_sorcerer_dead_02",
				"pes_level_catacombs_two_sorcerer_dead_03",
				"pes_level_catacombs_two_sorcerer_dead_04"
			},
			randomize_indexes = {}
		},
		pes_catacombs_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_catacombs_intro_a_01",
				[2.0] = "pes_catacombs_intro_a_02"
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
				[1.0] = 3.4507708549499,
				[2.0] = 4.3256669044495
			},
			localization_strings = {
				[1.0] = "pes_catacombs_intro_a_01",
				[2.0] = "pes_catacombs_intro_a_02"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_sabotage_ritual = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_sabotage_ritual_01",
				"pes_level_catacombs_sabotage_ritual_02",
				"pes_level_catacombs_sabotage_ritual_03",
				"pes_level_catacombs_sabotage_ritual_04"
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
				3.9338126182556,
				4.092333316803,
				5.2430210113525,
				3.2695832252502
			},
			localization_strings = {
				"pes_level_catacombs_sabotage_ritual_01",
				"pes_level_catacombs_sabotage_ritual_02",
				"pes_level_catacombs_sabotage_ritual_03",
				"pes_level_catacombs_sabotage_ritual_04"
			},
			randomize_indexes = {}
		},
		pes_catacombs_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_catacombs_intro_b_01",
				[2.0] = "pes_catacombs_intro_b_02"
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
				[1.0] = 2.5238332748413,
				[2.0] = 2.6032917499542
			},
			localization_strings = {
				[1.0] = "pes_catacombs_intro_b_01",
				[2.0] = "pes_catacombs_intro_b_02"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_apothercary_room = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_apothercary_room_01",
				"pes_level_catacombs_apothercary_room_02",
				"pes_level_catacombs_apothercary_room_03",
				"pes_level_catacombs_apothercary_room_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.2629165649414,
				2.235208272934,
				3.3191874027252,
				2.4773333072662
			},
			localization_strings = {
				"pes_level_catacombs_apothercary_room_01",
				"pes_level_catacombs_apothercary_room_02",
				"pes_level_catacombs_apothercary_room_03",
				"pes_level_catacombs_apothercary_room_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_way_is_clear = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_way_is_clear_01",
				"pes_level_catacombs_way_is_clear_02",
				"pes_level_catacombs_way_is_clear_03",
				"pes_level_catacombs_way_is_clear_04"
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
				2.1013958454132,
				1.3999999761581,
				2.1642291545868,
				1.5562083721161
			},
			localization_strings = {
				"pes_level_catacombs_way_is_clear_01",
				"pes_level_catacombs_way_is_clear_02",
				"pes_level_catacombs_way_is_clear_03",
				"pes_level_catacombs_way_is_clear_04"
			},
			randomize_indexes = {}
		},
		pes_level_catacombs_whoa_wrong_switch = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_catacombs_whoa_wrong_switch_01",
				"pes_level_catacombs_whoa_wrong_switch_02",
				"pes_level_catacombs_whoa_wrong_switch_03",
				"pes_level_catacombs_whoa_wrong_switch_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
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
				2.1084792613983,
				2.0731041431427,
				1.3982499837875,
				2.9395415782928
			},
			localization_strings = {
				"pes_level_catacombs_whoa_wrong_switch_01",
				"pes_level_catacombs_whoa_wrong_switch_02",
				"pes_level_catacombs_whoa_wrong_switch_03",
				"pes_level_catacombs_whoa_wrong_switch_04"
			},
			randomize_indexes = {}
		}
	})
end
