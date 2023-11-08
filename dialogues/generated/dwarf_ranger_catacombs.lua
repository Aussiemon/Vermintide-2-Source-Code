return function ()
	define_rule({
		name = "pdr_catacombs_intro_a",
		response = "pdr_catacombs_intro_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_catacombs_intro_b",
		response = "pdr_catacombs_intro_b",
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
				"dwarf_ranger"
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
		name = "pdr_catacombs_intro_c",
		response = "pdr_catacombs_intro_c",
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
				"catacombs_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
	define_rule({
		name = "pdr_level_catacombs_apothercary_room",
		response = "pdr_level_catacombs_apothercary_room",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_confinement_cells",
		response = "pdr_level_catacombs_confinement_cells",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_correct_switch",
		response = "pdr_level_catacombs_correct_switch",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_cultist_door",
		response = "pdr_level_catacombs_cultist_door",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_healing_ward",
		response = "pdr_level_catacombs_healing_ward",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_hear_chanting",
		response = "pdr_level_catacombs_hear_chanting",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_jump_into_intestine_hole",
		response = "pdr_level_catacombs_jump_into_intestine_hole",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_mausoleum_entrance",
		response = "pdr_level_catacombs_mausoleum_entrance",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_nurgle_water",
		response = "pdr_level_catacombs_nurgle_water",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_one_sorcerer_dead",
		response = "pdr_level_catacombs_one_sorcerer_dead",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_ritual_disrupted_ritual",
		response = "pdr_level_catacombs_ritual_disrupted_ritual",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_ritual_exit_through_portal",
		response = "pdr_level_catacombs_ritual_exit_through_portal",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_sabotage_ritual",
		response = "pdr_level_catacombs_sabotage_ritual",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_sewers",
		response = "pdr_level_catacombs_sewers",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_sewers_nurglefication_heavy",
		response = "pdr_level_catacombs_sewers_nurglefication_heavy",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_sewers_nurglefication_light",
		response = "pdr_level_catacombs_sewers_nurglefication_light",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_slime_trail",
		response = "pdr_level_catacombs_slime_trail",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_spot_ritual",
		response = "pdr_level_catacombs_spot_ritual",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_switch_instructions",
		response = "pdr_level_catacombs_switch_instructions",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_tunnel_entrance",
		response = "pdr_level_catacombs_tunnel_entrance",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_two_sorcerer_dead",
		response = "pdr_level_catacombs_two_sorcerer_dead",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_way_is_clear",
		response = "pdr_level_catacombs_way_is_clear",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_level_catacombs_whoa_wrong_switch",
		response = "pdr_level_catacombs_whoa_wrong_switch",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
	add_dialogues({
		pdr_catacombs_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_catacombs_intro_a_01",
				[2.0] = "pdr_catacombs_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_catacombs_intro_a_01",
				[2.0] = "pdr_catacombs_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.4358539581299,
				[2.0] = 2.8840832710266
			}
		},
		pdr_catacombs_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_catacombs_intro_b_01",
				[2.0] = "pdr_catacombs_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_catacombs_intro_b_01",
				[2.0] = "pdr_catacombs_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.5763540267944,
				[2.0] = 3.9463124275208
			}
		},
		pdr_catacombs_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_catacombs_intro_c_01",
				[2.0] = "pdr_catacombs_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_catacombs_intro_c_01",
				[2.0] = "pdr_catacombs_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.108916759491,
				[2.0] = 5.8371458053589
			}
		},
		pdr_level_catacombs_apothercary_room = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_apothercary_room_01",
				"pdr_level_catacombs_apothercary_room_02",
				"pdr_level_catacombs_apothercary_room_03",
				"pdr_level_catacombs_apothercary_room_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_apothercary_room_01",
				"pdr_level_catacombs_apothercary_room_02",
				"pdr_level_catacombs_apothercary_room_03",
				"pdr_level_catacombs_apothercary_room_04"
			},
			sound_events_duration = {
				3.8857917785645,
				3.9745833873749,
				3.0996041297913,
				2.9773333072662
			}
		},
		pdr_level_catacombs_confinement_cells = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_confinement_cells_01",
				"pdr_level_catacombs_confinement_cells_02",
				"pdr_level_catacombs_confinement_cells_03",
				"pdr_level_catacombs_confinement_cells_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_confinement_cells_01",
				"pdr_level_catacombs_confinement_cells_02",
				"pdr_level_catacombs_confinement_cells_03",
				"pdr_level_catacombs_confinement_cells_04"
			},
			sound_events_duration = {
				3.0964167118073,
				3.740312576294,
				4.3663539886475,
				3.8503959178925
			}
		},
		pdr_level_catacombs_correct_switch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_correct_switch_01",
				"pdr_level_catacombs_correct_switch_02",
				"pdr_level_catacombs_correct_switch_03",
				"pdr_level_catacombs_correct_switch_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_correct_switch_01",
				"pdr_level_catacombs_correct_switch_02",
				"pdr_level_catacombs_correct_switch_03",
				"pdr_level_catacombs_correct_switch_04"
			},
			sound_events_duration = {
				1.3099792003632,
				3.1745624542236,
				3.0605416297913,
				2.4900207519531
			}
		},
		pdr_level_catacombs_cultist_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_cultist_door_01",
				"pdr_level_catacombs_cultist_door_02",
				"pdr_level_catacombs_cultist_door_03",
				"pdr_level_catacombs_cultist_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_cultist_door_01",
				"pdr_level_catacombs_cultist_door_02",
				"pdr_level_catacombs_cultist_door_03",
				"pdr_level_catacombs_cultist_door_04"
			},
			sound_events_duration = {
				4.763708114624,
				2.7114791870117,
				5.5192708969116,
				3.4348542690277
			}
		},
		pdr_level_catacombs_healing_ward = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_healing_ward_01",
				"pdr_level_catacombs_healing_ward_02",
				"pdr_level_catacombs_healing_ward_03",
				"pdr_level_catacombs_healing_ward_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_healing_ward_01",
				"pdr_level_catacombs_healing_ward_02",
				"pdr_level_catacombs_healing_ward_03",
				"pdr_level_catacombs_healing_ward_04"
			},
			sound_events_duration = {
				3.5574791431427,
				3.7676250934601,
				2.6110208034515,
				2.4461874961853
			}
		},
		pdr_level_catacombs_hear_chanting = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_hear_chanting_01",
				"pdr_level_catacombs_hear_chanting_02",
				"pdr_level_catacombs_hear_chanting_03",
				"pdr_level_catacombs_hear_chanting_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_hear_chanting_01",
				"pdr_level_catacombs_hear_chanting_02",
				"pdr_level_catacombs_hear_chanting_03",
				"pdr_level_catacombs_hear_chanting_04"
			},
			sound_events_duration = {
				3.6514167785645,
				3.2743332386017,
				3.2664165496826,
				5.5400624275208
			}
		},
		pdr_level_catacombs_jump_into_intestine_hole = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_jump_into_intestine_hole_01",
				"pdr_level_catacombs_jump_into_intestine_hole_02",
				"pdr_level_catacombs_jump_into_intestine_hole_03",
				"pdr_level_catacombs_jump_into_intestine_hole_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_jump_into_intestine_hole_01",
				"pdr_level_catacombs_jump_into_intestine_hole_02",
				"pdr_level_catacombs_jump_into_intestine_hole_03",
				"pdr_level_catacombs_jump_into_intestine_hole_04"
			},
			sound_events_duration = {
				2.884604215622,
				2.3572707176209,
				4.3371248245239,
				4.9073543548584
			}
		},
		pdr_level_catacombs_mausoleum_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_mausoleum_entrance_01",
				"pdr_level_catacombs_mausoleum_entrance_02",
				"pdr_level_catacombs_mausoleum_entrance_03",
				"pdr_level_catacombs_mausoleum_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_mausoleum_entrance_01",
				"pdr_level_catacombs_mausoleum_entrance_02",
				"pdr_level_catacombs_mausoleum_entrance_03",
				"pdr_level_catacombs_mausoleum_entrance_04"
			},
			sound_events_duration = {
				3.6157290935516,
				3.0757291316986,
				2.5584375858307,
				4.136125087738
			}
		},
		pdr_level_catacombs_nurgle_water = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_nurgle_water_01",
				"pdr_level_catacombs_nurgle_water_02",
				"pdr_level_catacombs_nurgle_water_03",
				"pdr_level_catacombs_nurgle_water_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_nurgle_water_01",
				"pdr_level_catacombs_nurgle_water_02",
				"pdr_level_catacombs_nurgle_water_03",
				"pdr_level_catacombs_nurgle_water_04"
			},
			sound_events_duration = {
				3.1129584312439,
				4.6828541755676,
				3.232479095459,
				1.6336250305176
			}
		},
		pdr_level_catacombs_one_sorcerer_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_one_sorcerer_dead_01",
				"pdr_level_catacombs_one_sorcerer_dead_02",
				"pdr_level_catacombs_one_sorcerer_dead_03",
				"pdr_level_catacombs_one_sorcerer_dead_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_one_sorcerer_dead_01",
				"pdr_level_catacombs_one_sorcerer_dead_02",
				"pdr_level_catacombs_one_sorcerer_dead_03",
				"pdr_level_catacombs_one_sorcerer_dead_04"
			},
			sound_events_duration = {
				3.5695834159851,
				4.7256460189819,
				4.5392084121704,
				3.8034791946411
			}
		},
		pdr_level_catacombs_ritual_disrupted_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_ritual_disrupted_ritual_01",
				"pdr_level_catacombs_ritual_disrupted_ritual_02",
				"pdr_level_catacombs_ritual_disrupted_ritual_03",
				"pdr_level_catacombs_ritual_disrupted_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_ritual_disrupted_ritual_01",
				"pdr_level_catacombs_ritual_disrupted_ritual_02",
				"pdr_level_catacombs_ritual_disrupted_ritual_03",
				"pdr_level_catacombs_ritual_disrupted_ritual_04"
			},
			sound_events_duration = {
				3.6390624046326,
				5.1178126335144,
				5.156708240509,
				3.9286458492279
			}
		},
		pdr_level_catacombs_ritual_exit_through_portal = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_ritual_exit_through_portal_01",
				"pdr_level_catacombs_ritual_exit_through_portal_02",
				"pdr_level_catacombs_ritual_exit_through_portal_03",
				"pdr_level_catacombs_ritual_exit_through_portal_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_ritual_exit_through_portal_01",
				"pdr_level_catacombs_ritual_exit_through_portal_02",
				"pdr_level_catacombs_ritual_exit_through_portal_03",
				"pdr_level_catacombs_ritual_exit_through_portal_04"
			},
			sound_events_duration = {
				3.4681251049042,
				2.9592916965485,
				4.8239998817444,
				4.407187461853
			}
		},
		pdr_level_catacombs_sabotage_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_sabotage_ritual_01",
				"pdr_level_catacombs_sabotage_ritual_02",
				"pdr_level_catacombs_sabotage_ritual_03",
				"pdr_level_catacombs_sabotage_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_sabotage_ritual_01",
				"pdr_level_catacombs_sabotage_ritual_02",
				"pdr_level_catacombs_sabotage_ritual_03",
				"pdr_level_catacombs_sabotage_ritual_04"
			},
			sound_events_duration = {
				4.4022498130798,
				4.398916721344,
				4.2869167327881,
				4.3088126182556
			}
		},
		pdr_level_catacombs_sewers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_sewers_01",
				"pdr_level_catacombs_sewers_02",
				"pdr_level_catacombs_sewers_03",
				"pdr_level_catacombs_sewers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_sewers_01",
				"pdr_level_catacombs_sewers_02",
				"pdr_level_catacombs_sewers_03",
				"pdr_level_catacombs_sewers_04"
			},
			sound_events_duration = {
				4.951208114624,
				6.5392498970032,
				4.6495623588562,
				4.7013125419617
			}
		},
		pdr_level_catacombs_sewers_nurglefication_heavy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_sewers_nurglefication_heavy_01",
				"pdr_level_catacombs_sewers_nurglefication_heavy_02",
				"pdr_level_catacombs_sewers_nurglefication_heavy_03",
				"pdr_level_catacombs_sewers_nurglefication_heavy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_sewers_nurglefication_heavy_01",
				"pdr_level_catacombs_sewers_nurglefication_heavy_02",
				"pdr_level_catacombs_sewers_nurglefication_heavy_03",
				"pdr_level_catacombs_sewers_nurglefication_heavy_04"
			},
			sound_events_duration = {
				3.8743751049042,
				5.407208442688,
				5.8320832252502,
				6.915958404541
			}
		},
		pdr_level_catacombs_sewers_nurglefication_light = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_sewers_nurglefication_light_01",
				"pdr_level_catacombs_sewers_nurglefication_light_02",
				"pdr_level_catacombs_sewers_nurglefication_light_03",
				"pdr_level_catacombs_sewers_nurglefication_light_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_sewers_nurglefication_light_01",
				"pdr_level_catacombs_sewers_nurglefication_light_02",
				"pdr_level_catacombs_sewers_nurglefication_light_03",
				"pdr_level_catacombs_sewers_nurglefication_light_04"
			},
			sound_events_duration = {
				6.9877915382385,
				2.6074376106262,
				5.0794377326965,
				5.9867081642151
			}
		},
		pdr_level_catacombs_slime_trail = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_slime_trail_01",
				"pdr_level_catacombs_slime_trail_02",
				"pdr_level_catacombs_slime_trail_03",
				"pdr_level_catacombs_slime_trail_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_slime_trail_01",
				"pdr_level_catacombs_slime_trail_02",
				"pdr_level_catacombs_slime_trail_03",
				"pdr_level_catacombs_slime_trail_04"
			},
			sound_events_duration = {
				2.780291557312,
				4.3736248016357,
				5.076708316803,
				5.5408334732056
			}
		},
		pdr_level_catacombs_spot_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_spot_ritual_01",
				"pdr_level_catacombs_spot_ritual_02",
				"pdr_level_catacombs_spot_ritual_03",
				"pdr_level_catacombs_spot_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_spot_ritual_01",
				"pdr_level_catacombs_spot_ritual_02",
				"pdr_level_catacombs_spot_ritual_03",
				"pdr_level_catacombs_spot_ritual_04"
			},
			sound_events_duration = {
				4.364333152771,
				5.1935000419617,
				3.1996042728424,
				2.8247709274292
			}
		},
		pdr_level_catacombs_switch_instructions = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_switch_instructions_01",
				"pdr_level_catacombs_switch_instructions_02",
				"pdr_level_catacombs_switch_instructions_03",
				"pdr_level_catacombs_switch_instructions_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_switch_instructions_01",
				"pdr_level_catacombs_switch_instructions_02",
				"pdr_level_catacombs_switch_instructions_03",
				"pdr_level_catacombs_switch_instructions_04"
			},
			sound_events_duration = {
				2.7200417518616,
				3.1667292118073,
				2.1903958320618,
				2.3155000209808
			}
		},
		pdr_level_catacombs_tunnel_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_tunnel_entrance_01",
				"pdr_level_catacombs_tunnel_entrance_02",
				"pdr_level_catacombs_tunnel_entrance_03",
				"pdr_level_catacombs_tunnel_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_tunnel_entrance_01",
				"pdr_level_catacombs_tunnel_entrance_02",
				"pdr_level_catacombs_tunnel_entrance_03",
				"pdr_level_catacombs_tunnel_entrance_04"
			},
			sound_events_duration = {
				2.9363124370575,
				3.4766666889191,
				3.3490624427795,
				4.9508123397827
			}
		},
		pdr_level_catacombs_two_sorcerer_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_two_sorcerer_dead_01",
				"pdr_level_catacombs_two_sorcerer_dead_02",
				"pdr_level_catacombs_two_sorcerer_dead_03",
				"pdr_level_catacombs_two_sorcerer_dead_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_two_sorcerer_dead_01",
				"pdr_level_catacombs_two_sorcerer_dead_02",
				"pdr_level_catacombs_two_sorcerer_dead_03",
				"pdr_level_catacombs_two_sorcerer_dead_04"
			},
			sound_events_duration = {
				3.6859791278839,
				2.2890417575836,
				2.6655416488648,
				3.3294167518616
			}
		},
		pdr_level_catacombs_way_is_clear = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_way_is_clear_01",
				"pdr_level_catacombs_way_is_clear_02",
				"pdr_level_catacombs_way_is_clear_03",
				"pdr_level_catacombs_way_is_clear_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_way_is_clear_01",
				"pdr_level_catacombs_way_is_clear_02",
				"pdr_level_catacombs_way_is_clear_03",
				"pdr_level_catacombs_way_is_clear_04"
			},
			sound_events_duration = {
				1.4978333711624,
				2.0760416984558,
				2.1247916221619,
				2.8336250782013
			}
		},
		pdr_level_catacombs_whoa_wrong_switch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			localization_strings = {
				"pdr_level_catacombs_whoa_wrong_switch_01",
				"pdr_level_catacombs_whoa_wrong_switch_02",
				"pdr_level_catacombs_whoa_wrong_switch_03",
				"pdr_level_catacombs_whoa_wrong_switch_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_catacombs_whoa_wrong_switch_01",
				"pdr_level_catacombs_whoa_wrong_switch_02",
				"pdr_level_catacombs_whoa_wrong_switch_03",
				"pdr_level_catacombs_whoa_wrong_switch_04"
			},
			sound_events_duration = {
				1.2719583511352,
				1.9449167251587,
				3.1356875896454,
				2.1491041183472
			}
		}
	})
end
