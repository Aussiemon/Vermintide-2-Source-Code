return function ()
	define_rule({
		name = "pwe_level_catacombs_healing_ward",
		response = "pwe_level_catacombs_healing_ward",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_apothercary_room",
		response = "pwe_level_catacombs_apothercary_room",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_confinement_cells",
		response = "pwe_level_catacombs_confinement_cells",
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
		name = "pwe_level_catacombs_tunnel_entrance",
		response = "pwe_level_catacombs_tunnel_entrance",
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
		name = "pwe_level_catacombs_sewers",
		response = "pwe_level_catacombs_sewers",
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
		name = "pwe_level_catacombs_switch_instructions",
		response = "pwe_level_catacombs_switch_instructions",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_whoa_wrong_switch",
		response = "pwe_level_catacombs_whoa_wrong_switch",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_correct_switch",
		response = "pwe_level_catacombs_correct_switch",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_way_is_clear",
		response = "pwe_level_catacombs_way_is_clear",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_sewers_nurglefication_light",
		response = "pwe_level_catacombs_sewers_nurglefication_light",
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
		name = "pwe_level_catacombs_sewers_nurglefication_heavy",
		response = "pwe_level_catacombs_sewers_nurglefication_heavy",
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
		name = "pwe_level_catacombs_jump_into_intestine_hole",
		response = "pwe_level_catacombs_jump_into_intestine_hole",
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
		name = "pwe_level_catacombs_mausoleum_entrance",
		response = "pwe_level_catacombs_mausoleum_entrance",
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
		name = "pwe_level_catacombs_nurgle_water",
		response = "pwe_level_catacombs_nurgle_water",
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
		name = "pwe_level_catacombs_hear_chanting",
		response = "pwe_level_catacombs_hear_chanting",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_spot_ritual",
		response = "pwe_level_catacombs_spot_ritual",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_shield_of_flies",
		response = "pwe_level_catacombs_shield_of_flies",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_ritual_disrupted_ritual",
		response = "pwe_level_catacombs_ritual_disrupted_ritual",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_ritual_exit_through_portal",
		response = "pwe_level_catacombs_ritual_exit_through_portal",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_sabotage_ritual",
		response = "pwe_level_catacombs_sabotage_ritual",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_one_sorcerer_dead",
		response = "pwe_level_catacombs_one_sorcerer_dead",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_two_sorcerer_dead",
		response = "pwe_level_catacombs_two_sorcerer_dead",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_cultist_door",
		response = "pwe_level_catacombs_cultist_door",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_catacombs_slime_trail",
		response = "pwe_level_catacombs_slime_trail",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_catacombs_intro_a",
		response = "pwe_catacombs_intro_a",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_catacombs_intro_b",
		response = "pwe_catacombs_intro_b",
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
				"wood_elf"
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
		name = "pwe_catacombs_intro_c",
		response = "pwe_catacombs_intro_c",
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
				"wood_elf"
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
		pwe_level_catacombs_sewers_nurglefication_heavy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_sewers_nurglefication_heavy_01",
				"pwe_level_catacombs_sewers_nurglefication_heavy_02",
				"pwe_level_catacombs_sewers_nurglefication_heavy_03",
				"pwe_level_catacombs_sewers_nurglefication_heavy_04"
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
				6.0590834617615,
				2.1865208148956,
				6.7826251983643,
				5.8869581222534
			},
			localization_strings = {
				"pwe_level_catacombs_sewers_nurglefication_heavy_01",
				"pwe_level_catacombs_sewers_nurglefication_heavy_02",
				"pwe_level_catacombs_sewers_nurglefication_heavy_03",
				"pwe_level_catacombs_sewers_nurglefication_heavy_04"
			},
			randomize_indexes = {}
		},
		pwe_catacombs_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_catacombs_intro_c_01",
				[2.0] = "pwe_catacombs_intro_c_02"
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
				[1.0] = 4.4868750572205,
				[2.0] = 5.5628542900085
			},
			localization_strings = {
				[1.0] = "pwe_catacombs_intro_c_01",
				[2.0] = "pwe_catacombs_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_nurgle_water = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_nurgle_water_01",
				"pwe_level_catacombs_nurgle_water_02",
				"pwe_level_catacombs_nurgle_water_03",
				"pwe_level_catacombs_nurgle_water_04"
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
				2.6371250152588,
				3.3706874847412,
				5.1727709770203,
				3.5268125534058
			},
			localization_strings = {
				"pwe_level_catacombs_nurgle_water_01",
				"pwe_level_catacombs_nurgle_water_02",
				"pwe_level_catacombs_nurgle_water_03",
				"pwe_level_catacombs_nurgle_water_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_way_is_clear = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_way_is_clear_01",
				"pwe_level_catacombs_way_is_clear_02",
				"pwe_level_catacombs_way_is_clear_03",
				"pwe_level_catacombs_way_is_clear_04"
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
				2.3703334331513,
				2.6285834312439,
				3.6518957614899,
				2.5363540649414
			},
			localization_strings = {
				"pwe_level_catacombs_way_is_clear_01",
				"pwe_level_catacombs_way_is_clear_02",
				"pwe_level_catacombs_way_is_clear_03",
				"pwe_level_catacombs_way_is_clear_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_hear_chanting = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_hear_chanting_01",
				"pwe_level_catacombs_hear_chanting_02",
				"pwe_level_catacombs_hear_chanting_03",
				"pwe_level_catacombs_hear_chanting_04"
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
				4.6151876449585,
				5.431583404541,
				4.4946875572205,
				5.5602498054504
			},
			localization_strings = {
				"pwe_level_catacombs_hear_chanting_01",
				"pwe_level_catacombs_hear_chanting_02",
				"pwe_level_catacombs_hear_chanting_03",
				"pwe_level_catacombs_hear_chanting_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_one_sorcerer_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_one_sorcerer_dead_01",
				"pwe_level_catacombs_one_sorcerer_dead_02",
				"pwe_level_catacombs_one_sorcerer_dead_03",
				"pwe_level_catacombs_one_sorcerer_dead_04"
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
				5.1470623016357,
				3.0353751182556,
				4.2307710647583,
				4.1309375762939
			},
			localization_strings = {
				"pwe_level_catacombs_one_sorcerer_dead_01",
				"pwe_level_catacombs_one_sorcerer_dead_02",
				"pwe_level_catacombs_one_sorcerer_dead_03",
				"pwe_level_catacombs_one_sorcerer_dead_04"
			},
			randomize_indexes = {}
		},
		pwe_catacombs_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_catacombs_intro_b_01",
				[2.0] = "pwe_catacombs_intro_b_02"
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
				[1.0] = 5.7747292518616,
				[2.0] = 2.8511667251587
			},
			localization_strings = {
				[1.0] = "pwe_catacombs_intro_b_01",
				[2.0] = "pwe_catacombs_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_tunnel_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_tunnel_entrance_01",
				"pwe_level_catacombs_tunnel_entrance_02",
				"pwe_level_catacombs_tunnel_entrance_03",
				"pwe_level_catacombs_tunnel_entrance_04"
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
				4.6077919006348,
				6.3214583396912,
				5.1646876335144,
				2.9533333778381
			},
			localization_strings = {
				"pwe_level_catacombs_tunnel_entrance_01",
				"pwe_level_catacombs_tunnel_entrance_02",
				"pwe_level_catacombs_tunnel_entrance_03",
				"pwe_level_catacombs_tunnel_entrance_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_jump_into_intestine_hole = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_jump_into_intestine_hole_01",
				"pwe_level_catacombs_jump_into_intestine_hole_02",
				"pwe_level_catacombs_jump_into_intestine_hole_03",
				"pwe_level_catacombs_jump_into_intestine_hole_04"
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
				3.8474583625794,
				3.4752917289734,
				4.8614997863769,
				4.5884790420532
			},
			localization_strings = {
				"pwe_level_catacombs_jump_into_intestine_hole_01",
				"pwe_level_catacombs_jump_into_intestine_hole_02",
				"pwe_level_catacombs_jump_into_intestine_hole_03",
				"pwe_level_catacombs_jump_into_intestine_hole_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_two_sorcerer_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_two_sorcerer_dead_01",
				"pwe_level_catacombs_two_sorcerer_dead_02",
				"pwe_level_catacombs_two_sorcerer_dead_03",
				"pwe_level_catacombs_two_sorcerer_dead_04"
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
				2.8650417327881,
				2.2475416660309,
				2.3750624656677,
				3.0828125476837
			},
			localization_strings = {
				"pwe_level_catacombs_two_sorcerer_dead_01",
				"pwe_level_catacombs_two_sorcerer_dead_02",
				"pwe_level_catacombs_two_sorcerer_dead_03",
				"pwe_level_catacombs_two_sorcerer_dead_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_cultist_door = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_cultist_door_01",
				"pwe_level_catacombs_cultist_door_02",
				"pwe_level_catacombs_cultist_door_03",
				"pwe_level_catacombs_cultist_door_04"
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
				3.8548958301544,
				2.8846666812897,
				3.1665415763855,
				2.77308344841
			},
			localization_strings = {
				"pwe_level_catacombs_cultist_door_01",
				"pwe_level_catacombs_cultist_door_02",
				"pwe_level_catacombs_cultist_door_03",
				"pwe_level_catacombs_cultist_door_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_correct_switch = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_correct_switch_01",
				"pwe_level_catacombs_correct_switch_02",
				"pwe_level_catacombs_correct_switch_03",
				"pwe_level_catacombs_correct_switch_04"
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
				2.8537082672119,
				4.2388124465942,
				4.1119790077209,
				4.8818125724792
			},
			localization_strings = {
				"pwe_level_catacombs_correct_switch_01",
				"pwe_level_catacombs_correct_switch_02",
				"pwe_level_catacombs_correct_switch_03",
				"pwe_level_catacombs_correct_switch_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_slime_trail = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_slime_trail_01",
				"pwe_level_catacombs_slime_trail_02",
				"pwe_level_catacombs_slime_trail_03",
				"pwe_level_catacombs_slime_trail_04"
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
				4.6738543510437,
				4.4672083854675,
				4.7257709503174,
				5.0291876792908
			},
			localization_strings = {
				"pwe_level_catacombs_slime_trail_01",
				"pwe_level_catacombs_slime_trail_02",
				"pwe_level_catacombs_slime_trail_03",
				"pwe_level_catacombs_slime_trail_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_mausoleum_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_mausoleum_entrance_01",
				"pwe_level_catacombs_mausoleum_entrance_02",
				"pwe_level_catacombs_mausoleum_entrance_03",
				"pwe_level_catacombs_mausoleum_entrance_04"
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
				3.9545834064484,
				4.2483124732971,
				7.7503957748413,
				2.4857499599457
			},
			localization_strings = {
				"pwe_level_catacombs_mausoleum_entrance_01",
				"pwe_level_catacombs_mausoleum_entrance_02",
				"pwe_level_catacombs_mausoleum_entrance_03",
				"pwe_level_catacombs_mausoleum_entrance_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_sabotage_ritual = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_sabotage_ritual_01",
				"pwe_level_catacombs_sabotage_ritual_02",
				"pwe_level_catacombs_sabotage_ritual_03",
				"pwe_level_catacombs_sabotage_ritual_04"
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
				3.3121042251587,
				6.2287707328796,
				4.095187664032,
				3.2999999523163
			},
			localization_strings = {
				"pwe_level_catacombs_sabotage_ritual_01",
				"pwe_level_catacombs_sabotage_ritual_02",
				"pwe_level_catacombs_sabotage_ritual_03",
				"pwe_level_catacombs_sabotage_ritual_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_healing_ward = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_healing_ward_01",
				"pwe_level_catacombs_healing_ward_02",
				"pwe_level_catacombs_healing_ward_03",
				"pwe_level_catacombs_healing_ward_04"
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
				3.4115207195282,
				3.8818333148956,
				4.3331251144409,
				3.1372709274292
			},
			localization_strings = {
				"pwe_level_catacombs_healing_ward_01",
				"pwe_level_catacombs_healing_ward_02",
				"pwe_level_catacombs_healing_ward_03",
				"pwe_level_catacombs_healing_ward_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_ritual_exit_through_portal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_ritual_exit_through_portal_01",
				"pwe_level_catacombs_ritual_exit_through_portal_02",
				"pwe_level_catacombs_ritual_exit_through_portal_03",
				"pwe_level_catacombs_ritual_exit_through_portal_04"
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
				2.370374917984,
				3.6225624084473,
				3.6851875782013,
				2.6250417232513
			},
			localization_strings = {
				"pwe_level_catacombs_ritual_exit_through_portal_01",
				"pwe_level_catacombs_ritual_exit_through_portal_02",
				"pwe_level_catacombs_ritual_exit_through_portal_03",
				"pwe_level_catacombs_ritual_exit_through_portal_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_switch_instructions = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_switch_instructions_01",
				"pwe_level_catacombs_switch_instructions_02",
				"pwe_level_catacombs_switch_instructions_03",
				"pwe_level_catacombs_switch_instructions_04"
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
				1.8454166650772,
				2.0218334197998,
				2.7487916946411,
				1.8325417041779
			},
			localization_strings = {
				"pwe_level_catacombs_switch_instructions_01",
				"pwe_level_catacombs_switch_instructions_02",
				"pwe_level_catacombs_switch_instructions_03",
				"pwe_level_catacombs_switch_instructions_04"
			},
			randomize_indexes = {}
		},
		pwe_catacombs_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_catacombs_intro_a_01",
				[2.0] = "pwe_catacombs_intro_a_02"
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
				[1.0] = 5.0777916908264,
				[2.0] = 3.7834167480469
			},
			localization_strings = {
				[1.0] = "pwe_catacombs_intro_a_01",
				[2.0] = "pwe_catacombs_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_sewers = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_sewers_01",
				"pwe_level_catacombs_sewers_02",
				"pwe_level_catacombs_sewers_03",
				"pwe_level_catacombs_sewers_04"
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
				3.4801666736603,
				4.9911456108093,
				5.6271042823792,
				5.6808543205261
			},
			localization_strings = {
				"pwe_level_catacombs_sewers_01",
				"pwe_level_catacombs_sewers_02",
				"pwe_level_catacombs_sewers_03",
				"pwe_level_catacombs_sewers_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_confinement_cells = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_confinement_cells_01",
				"pwe_level_catacombs_confinement_cells_02",
				"pwe_level_catacombs_confinement_cells_03",
				"pwe_level_catacombs_confinement_cells_04"
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
				5.4199376106262,
				4.5808334350586,
				4.5164585113525,
				3.5770208835602
			},
			localization_strings = {
				"pwe_level_catacombs_confinement_cells_01",
				"pwe_level_catacombs_confinement_cells_02",
				"pwe_level_catacombs_confinement_cells_03",
				"pwe_level_catacombs_confinement_cells_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_sewers_nurglefication_light = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_sewers_nurglefication_light_01",
				"pwe_level_catacombs_sewers_nurglefication_light_02",
				"pwe_level_catacombs_sewers_nurglefication_light_03",
				"pwe_level_catacombs_sewers_nurglefication_light_04"
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
				4.8038125038147,
				6.1690001487732,
				4.6833543777466,
				6.4481248855591
			},
			localization_strings = {
				"pwe_level_catacombs_sewers_nurglefication_light_01",
				"pwe_level_catacombs_sewers_nurglefication_light_02",
				"pwe_level_catacombs_sewers_nurglefication_light_03",
				"pwe_level_catacombs_sewers_nurglefication_light_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_shield_of_flies = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_shield_of_flies_01",
				"pwe_level_catacombs_shield_of_flies_02",
				"pwe_level_catacombs_shield_of_flies_03",
				"pwe_level_catacombs_shield_of_flies_04"
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
				2.4871459007263,
				2.0485417842865,
				1.5760833024979,
				2.909437417984
			},
			localization_strings = {
				"pwe_level_catacombs_shield_of_flies_01",
				"pwe_level_catacombs_shield_of_flies_02",
				"pwe_level_catacombs_shield_of_flies_03",
				"pwe_level_catacombs_shield_of_flies_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_whoa_wrong_switch = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_whoa_wrong_switch_01",
				"pwe_level_catacombs_whoa_wrong_switch_02",
				"pwe_level_catacombs_whoa_wrong_switch_03",
				"pwe_level_catacombs_whoa_wrong_switch_04"
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
				2.2728958129883,
				2.6906042098999,
				2.6174166202545,
				6.4111251831055
			},
			localization_strings = {
				"pwe_level_catacombs_whoa_wrong_switch_01",
				"pwe_level_catacombs_whoa_wrong_switch_02",
				"pwe_level_catacombs_whoa_wrong_switch_03",
				"pwe_level_catacombs_whoa_wrong_switch_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_spot_ritual = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_spot_ritual_01",
				"pwe_level_catacombs_spot_ritual_02",
				"pwe_level_catacombs_spot_ritual_03",
				"pwe_level_catacombs_spot_ritual_04"
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
				4.0257081985474,
				4.1114168167114,
				4.7112498283386,
				4.2641668319702
			},
			localization_strings = {
				"pwe_level_catacombs_spot_ritual_01",
				"pwe_level_catacombs_spot_ritual_02",
				"pwe_level_catacombs_spot_ritual_03",
				"pwe_level_catacombs_spot_ritual_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_apothercary_room = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_apothercary_room_01",
				"pwe_level_catacombs_apothercary_room_02",
				"pwe_level_catacombs_apothercary_room_03",
				"pwe_level_catacombs_apothercary_room_04"
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
				3.028416633606,
				3.8178124427795,
				4.8492708206177,
				3.6100208759308
			},
			localization_strings = {
				"pwe_level_catacombs_apothercary_room_01",
				"pwe_level_catacombs_apothercary_room_02",
				"pwe_level_catacombs_apothercary_room_03",
				"pwe_level_catacombs_apothercary_room_04"
			},
			randomize_indexes = {}
		},
		pwe_level_catacombs_ritual_disrupted_ritual = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_catacombs",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_catacombs_ritual_disrupted_ritual_01",
				"pwe_level_catacombs_ritual_disrupted_ritual_02",
				"pwe_level_catacombs_ritual_disrupted_ritual_03",
				"pwe_level_catacombs_ritual_disrupted_ritual_04"
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
				2.8913333415985,
				4.5901460647583,
				4.1966876983643,
				3.1539165973663
			},
			localization_strings = {
				"pwe_level_catacombs_ritual_disrupted_ritual_01",
				"pwe_level_catacombs_ritual_disrupted_ritual_02",
				"pwe_level_catacombs_ritual_disrupted_ritual_03",
				"pwe_level_catacombs_ritual_disrupted_ritual_04"
			},
			randomize_indexes = {}
		}
	})
end
