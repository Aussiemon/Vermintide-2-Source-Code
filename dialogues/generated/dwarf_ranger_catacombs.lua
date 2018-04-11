return function ()
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
		name = "pdr_level_catacombs_mist",
		response = "pdr_level_catacombs_mist",
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
				"catacombs_mist"
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
				"time_since_catacombs_mist",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_catacombs_mist",
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
		name = "pdr_level_catacombs_shield_of_flies",
		response = "pdr_level_catacombs_shield_of_flies",
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
				10
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
				"catacombs_intro_c"
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
	add_dialogues({
		pdr_level_catacombs_mausoleum_entrance = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_mausoleum_entrance_01",
				"pdr_level_catacombs_mausoleum_entrance_02",
				"pdr_level_catacombs_mausoleum_entrance_03",
				"pdr_level_catacombs_mausoleum_entrance_04"
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
			localization_strings = {
				"pdr_level_catacombs_mausoleum_entrance_01",
				"pdr_level_catacombs_mausoleum_entrance_02",
				"pdr_level_catacombs_mausoleum_entrance_03",
				"pdr_level_catacombs_mausoleum_entrance_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_switch_instructions = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_switch_instructions_01",
				"pdr_level_catacombs_switch_instructions_02",
				"pdr_level_catacombs_switch_instructions_03",
				"pdr_level_catacombs_switch_instructions_04"
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
			localization_strings = {
				"pdr_level_catacombs_switch_instructions_01",
				"pdr_level_catacombs_switch_instructions_02",
				"pdr_level_catacombs_switch_instructions_03",
				"pdr_level_catacombs_switch_instructions_04"
			},
			randomize_indexes = {}
		},
		pdr_catacombs_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_catacombs_intro_b_01",
				[2.0] = "pdr_catacombs_intro_b_02"
			},
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
			randomize_indexes = {}
		},
		pdr_level_catacombs_healing_ward = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_healing_ward_01",
				"pdr_level_catacombs_healing_ward_02",
				"pdr_level_catacombs_healing_ward_03",
				"pdr_level_catacombs_healing_ward_04"
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
			localization_strings = {
				"pdr_level_catacombs_healing_ward_01",
				"pdr_level_catacombs_healing_ward_02",
				"pdr_level_catacombs_healing_ward_03",
				"pdr_level_catacombs_healing_ward_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_ritual_disrupted_ritual = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_ritual_disrupted_ritual_01",
				"pdr_level_catacombs_ritual_disrupted_ritual_02",
				"pdr_level_catacombs_ritual_disrupted_ritual_03",
				"pdr_level_catacombs_ritual_disrupted_ritual_04"
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
			localization_strings = {
				"pdr_level_catacombs_ritual_disrupted_ritual_01",
				"pdr_level_catacombs_ritual_disrupted_ritual_02",
				"pdr_level_catacombs_ritual_disrupted_ritual_03",
				"pdr_level_catacombs_ritual_disrupted_ritual_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_nurgle_water = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_nurgle_water_01",
				"pdr_level_catacombs_nurgle_water_02",
				"pdr_level_catacombs_nurgle_water_03",
				"pdr_level_catacombs_nurgle_water_04"
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
			localization_strings = {
				"pdr_level_catacombs_nurgle_water_01",
				"pdr_level_catacombs_nurgle_water_02",
				"pdr_level_catacombs_nurgle_water_03",
				"pdr_level_catacombs_nurgle_water_04"
			},
			randomize_indexes = {}
		},
		pdr_catacombs_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_catacombs_intro_c_01",
				[2.0] = "pdr_catacombs_intro_c_02"
			},
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
			randomize_indexes = {}
		},
		pdr_level_catacombs_spot_ritual = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_spot_ritual_01",
				"pdr_level_catacombs_spot_ritual_02",
				"pdr_level_catacombs_spot_ritual_03",
				"pdr_level_catacombs_spot_ritual_04"
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
			localization_strings = {
				"pdr_level_catacombs_spot_ritual_01",
				"pdr_level_catacombs_spot_ritual_02",
				"pdr_level_catacombs_spot_ritual_03",
				"pdr_level_catacombs_spot_ritual_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_confinement_cells = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_confinement_cells_01",
				"pdr_level_catacombs_confinement_cells_02",
				"pdr_level_catacombs_confinement_cells_03",
				"pdr_level_catacombs_confinement_cells_04"
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
			localization_strings = {
				"pdr_level_catacombs_confinement_cells_01",
				"pdr_level_catacombs_confinement_cells_02",
				"pdr_level_catacombs_confinement_cells_03",
				"pdr_level_catacombs_confinement_cells_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_mist = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_mist_01",
				"pdr_level_catacombs_mist_02",
				"pdr_level_catacombs_mist_03",
				"pdr_level_catacombs_mist_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pdr_level_catacombs_mist_01",
				"pdr_level_catacombs_mist_02",
				"pdr_level_catacombs_mist_03",
				"pdr_level_catacombs_mist_04"
			},
			randomize_indexes = {}
		},
		pdr_catacombs_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_catacombs_intro_a_01",
				[2.0] = "pdr_catacombs_intro_a_02"
			},
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
			randomize_indexes = {}
		},
		pdr_level_catacombs_correct_switch = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_correct_switch_01",
				"pdr_level_catacombs_correct_switch_02",
				"pdr_level_catacombs_correct_switch_03",
				"pdr_level_catacombs_correct_switch_04"
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
			localization_strings = {
				"pdr_level_catacombs_correct_switch_01",
				"pdr_level_catacombs_correct_switch_02",
				"pdr_level_catacombs_correct_switch_03",
				"pdr_level_catacombs_correct_switch_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_jump_into_intestine_hole = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_jump_into_intestine_hole_01",
				"pdr_level_catacombs_jump_into_intestine_hole_02",
				"pdr_level_catacombs_jump_into_intestine_hole_03",
				"pdr_level_catacombs_jump_into_intestine_hole_04"
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
			localization_strings = {
				"pdr_level_catacombs_jump_into_intestine_hole_01",
				"pdr_level_catacombs_jump_into_intestine_hole_02",
				"pdr_level_catacombs_jump_into_intestine_hole_03",
				"pdr_level_catacombs_jump_into_intestine_hole_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_slime_trail = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_slime_trail_01",
				"pdr_level_catacombs_slime_trail_02",
				"pdr_level_catacombs_slime_trail_03",
				"pdr_level_catacombs_slime_trail_04"
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
			localization_strings = {
				"pdr_level_catacombs_slime_trail_01",
				"pdr_level_catacombs_slime_trail_02",
				"pdr_level_catacombs_slime_trail_03",
				"pdr_level_catacombs_slime_trail_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_way_is_clear = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_way_is_clear_01",
				"pdr_level_catacombs_way_is_clear_02",
				"pdr_level_catacombs_way_is_clear_03",
				"pdr_level_catacombs_way_is_clear_04"
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
			localization_strings = {
				"pdr_level_catacombs_way_is_clear_01",
				"pdr_level_catacombs_way_is_clear_02",
				"pdr_level_catacombs_way_is_clear_03",
				"pdr_level_catacombs_way_is_clear_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_cultist_door = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_cultist_door_01",
				"pdr_level_catacombs_cultist_door_02",
				"pdr_level_catacombs_cultist_door_03",
				"pdr_level_catacombs_cultist_door_04"
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
			localization_strings = {
				"pdr_level_catacombs_cultist_door_01",
				"pdr_level_catacombs_cultist_door_02",
				"pdr_level_catacombs_cultist_door_03",
				"pdr_level_catacombs_cultist_door_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_one_sorcerer_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_one_sorcerer_dead_01",
				"pdr_level_catacombs_one_sorcerer_dead_02",
				"pdr_level_catacombs_one_sorcerer_dead_03",
				"pdr_level_catacombs_one_sorcerer_dead_04"
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
			localization_strings = {
				"pdr_level_catacombs_one_sorcerer_dead_01",
				"pdr_level_catacombs_one_sorcerer_dead_02",
				"pdr_level_catacombs_one_sorcerer_dead_03",
				"pdr_level_catacombs_one_sorcerer_dead_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_sewers_nurglefication_heavy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_sewers_nurglefication_heavy_01",
				"pdr_level_catacombs_sewers_nurglefication_heavy_02",
				"pdr_level_catacombs_sewers_nurglefication_heavy_03",
				"pdr_level_catacombs_sewers_nurglefication_heavy_04"
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
			localization_strings = {
				"pdr_level_catacombs_sewers_nurglefication_heavy_01",
				"pdr_level_catacombs_sewers_nurglefication_heavy_02",
				"pdr_level_catacombs_sewers_nurglefication_heavy_03",
				"pdr_level_catacombs_sewers_nurglefication_heavy_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_two_sorcerer_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_two_sorcerer_dead_01",
				"pdr_level_catacombs_two_sorcerer_dead_02",
				"pdr_level_catacombs_two_sorcerer_dead_03",
				"pdr_level_catacombs_two_sorcerer_dead_04"
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
			localization_strings = {
				"pdr_level_catacombs_two_sorcerer_dead_01",
				"pdr_level_catacombs_two_sorcerer_dead_02",
				"pdr_level_catacombs_two_sorcerer_dead_03",
				"pdr_level_catacombs_two_sorcerer_dead_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_sabotage_ritual = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_sabotage_ritual_01",
				"pdr_level_catacombs_sabotage_ritual_02",
				"pdr_level_catacombs_sabotage_ritual_03",
				"pdr_level_catacombs_sabotage_ritual_04"
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
			localization_strings = {
				"pdr_level_catacombs_sabotage_ritual_01",
				"pdr_level_catacombs_sabotage_ritual_02",
				"pdr_level_catacombs_sabotage_ritual_03",
				"pdr_level_catacombs_sabotage_ritual_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_ritual_exit_through_portal = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_ritual_exit_through_portal_01",
				"pdr_level_catacombs_ritual_exit_through_portal_02",
				"pdr_level_catacombs_ritual_exit_through_portal_03",
				"pdr_level_catacombs_ritual_exit_through_portal_04"
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
			localization_strings = {
				"pdr_level_catacombs_ritual_exit_through_portal_01",
				"pdr_level_catacombs_ritual_exit_through_portal_02",
				"pdr_level_catacombs_ritual_exit_through_portal_03",
				"pdr_level_catacombs_ritual_exit_through_portal_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_shield_of_flies = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_shield_of_flies_01",
				"pdr_level_catacombs_shield_of_flies_02",
				"pdr_level_catacombs_shield_of_flies_03",
				"pdr_level_catacombs_shield_of_flies_04"
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
			localization_strings = {
				"pdr_level_catacombs_shield_of_flies_01",
				"pdr_level_catacombs_shield_of_flies_02",
				"pdr_level_catacombs_shield_of_flies_03",
				"pdr_level_catacombs_shield_of_flies_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_tunnel_entrance = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_tunnel_entrance_01",
				"pdr_level_catacombs_tunnel_entrance_02",
				"pdr_level_catacombs_tunnel_entrance_03",
				"pdr_level_catacombs_tunnel_entrance_04"
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
			localization_strings = {
				"pdr_level_catacombs_tunnel_entrance_01",
				"pdr_level_catacombs_tunnel_entrance_02",
				"pdr_level_catacombs_tunnel_entrance_03",
				"pdr_level_catacombs_tunnel_entrance_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_hear_chanting = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_hear_chanting_01",
				"pdr_level_catacombs_hear_chanting_02",
				"pdr_level_catacombs_hear_chanting_03",
				"pdr_level_catacombs_hear_chanting_04"
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
			localization_strings = {
				"pdr_level_catacombs_hear_chanting_01",
				"pdr_level_catacombs_hear_chanting_02",
				"pdr_level_catacombs_hear_chanting_03",
				"pdr_level_catacombs_hear_chanting_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_apothercary_room = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_apothercary_room_01",
				"pdr_level_catacombs_apothercary_room_02",
				"pdr_level_catacombs_apothercary_room_03",
				"pdr_level_catacombs_apothercary_room_04"
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
			localization_strings = {
				"pdr_level_catacombs_apothercary_room_01",
				"pdr_level_catacombs_apothercary_room_02",
				"pdr_level_catacombs_apothercary_room_03",
				"pdr_level_catacombs_apothercary_room_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_whoa_wrong_switch = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_whoa_wrong_switch_01",
				"pdr_level_catacombs_whoa_wrong_switch_02",
				"pdr_level_catacombs_whoa_wrong_switch_03",
				"pdr_level_catacombs_whoa_wrong_switch_04"
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
			localization_strings = {
				"pdr_level_catacombs_whoa_wrong_switch_01",
				"pdr_level_catacombs_whoa_wrong_switch_02",
				"pdr_level_catacombs_whoa_wrong_switch_03",
				"pdr_level_catacombs_whoa_wrong_switch_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_sewers = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_sewers_01",
				"pdr_level_catacombs_sewers_02",
				"pdr_level_catacombs_sewers_03",
				"pdr_level_catacombs_sewers_04"
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
			localization_strings = {
				"pdr_level_catacombs_sewers_01",
				"pdr_level_catacombs_sewers_02",
				"pdr_level_catacombs_sewers_03",
				"pdr_level_catacombs_sewers_04"
			},
			randomize_indexes = {}
		},
		pdr_level_catacombs_sewers_nurglefication_light = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_catacombs",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_catacombs_sewers_nurglefication_light_01",
				"pdr_level_catacombs_sewers_nurglefication_light_02",
				"pdr_level_catacombs_sewers_nurglefication_light_03",
				"pdr_level_catacombs_sewers_nurglefication_light_04"
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
			localization_strings = {
				"pdr_level_catacombs_sewers_nurglefication_light_01",
				"pdr_level_catacombs_sewers_nurglefication_light_02",
				"pdr_level_catacombs_sewers_nurglefication_light_03",
				"pdr_level_catacombs_sewers_nurglefication_light_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
