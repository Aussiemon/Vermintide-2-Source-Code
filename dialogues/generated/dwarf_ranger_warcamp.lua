return function ()
	define_rule({
		name = "pdr_level_chaos_war_camp_ravine",
		response = "pdr_level_chaos_war_camp_ravine",
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
				"chaos_war_camp_ravine"
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
				"level_chaos_war_camp_ravine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_live_in_swamp",
		response = "pdr_level_chaos_war_camp_live_in_swamp",
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
				"chaos_war_camp_live_in_swamp"
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
				"level_chaos_war_camp_live_in_swamp",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_cabin",
		response = "pdr_level_chaos_war_camp_cabin",
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
				"chaos_war_camp_cabin"
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
				"level_chaos_war_camp_cabin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_which_way",
		response = "pdr_level_chaos_war_camp_which_way",
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
				"chaos_war_camp_which_way"
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
				"level_chaos_war_camp_which_way",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_ghost_town_state",
		response = "pdr_level_chaos_war_camp_ghost_town_state",
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
				"chaos_war_camp_ghost_town_state"
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
				"level_chaos_war_camp_ghost_town_state",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ghost_town_state",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_islands_01",
		response = "pdr_level_chaos_war_camp_islands_01",
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
				"chaos_war_camp_islands"
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
				"level_chaos_war_camp_islands",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_camp_view_01",
		response = "pdr_level_chaos_war_camp_camp_view_01",
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
				"chaos_war_camp_camp_view"
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
				"level_chaos_war_camp_camp_view",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_tree",
		response = "pdr_level_chaos_war_camp_tree",
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
				"chaos_war_camp_tree"
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
				"level_chaos_war_camp_tree",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_outer_gate_01",
		response = "pdr_level_chaos_war_camp_outer_gate_01",
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
				"chaos_war_camp_outer_gate"
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
				"level_chaos_war_camp_outer_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_battering_ram_01",
		response = "pdr_level_chaos_war_camp_battering_ram_01",
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
				"chaos_war_camp_battering_ram"
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
				"level_chaos_war_camp_battering_ram",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_battering_ram_use_01",
		response = "pdr_level_chaos_war_camp_battering_ram_use_01",
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
				"chaos_war_camp_battering_ram_use"
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
				"level_chaos_war_camp_battering_ram_use",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram_use",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_wall_01",
		response = "pdr_level_chaos_war_camp_wall_01",
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
				"chaos_war_camp_wall"
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
				"level_chaos_war_camp_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_surprise_01",
		response = "pdr_level_chaos_war_surprise_01",
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
				"chaos_war_surprise"
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
				"level_chaos_war_surprise",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_keep_fighting_01",
		response = "pdr_level_chaos_war_camp_keep_fighting_01",
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
				"chaos_war_camp_keep_fighting"
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
				"level_chaos_war_camp_keep_fighting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_keep_fighting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_arena_01",
		response = "pdr_level_chaos_war_camp_arena_01",
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
				"chaos_war_camp_arena"
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
				"level_chaos_war_camp_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_dead_champion_01",
		response = "pdr_level_chaos_war_camp_dead_champion_01",
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
				"chaos_war_camp_dead_champion"
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
				"level_chaos_war_camp_dead_champion",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_dead_champion",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_depart_01",
		response = "pdr_level_chaos_war_camp_depart_01",
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
				"chaos_war_camp_depart"
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
				"level_chaos_war_camp_depart",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_depart",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_success_01",
		response = "pdr_level_chaos_war_camp_success_01",
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
				"chaos_war_camp_success"
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
				"level_chaos_war_camp_success",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_success",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_portal_01",
		response = "pdr_level_chaos_war_camp_portal_01",
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
				"chaos_war_camp_portal"
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
				"level_chaos_war_camp_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_intro_a",
		response = "pdr_chaos_war_camp_intro_a",
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
				"chaos_war_camp_intro_a"
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
				"chaos_war_camp_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_intro_b",
		response = "pdr_chaos_war_camp_intro_b",
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
				"chaos_war_camp_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_intro_c",
		response = "pdr_chaos_war_camp_intro_c",
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
				"chaos_war_camp_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "ecc_chaos_war_camp_challenge",
		name = "ecc_chaos_war_camp_challenge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ecc_intro"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			}
		}
	})
	define_rule({
		response = "ecc_chaos_war_camp_ground_summon",
		name = "ecc_chaos_war_camp_ground_summon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ecc_summon"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			}
		}
	})
	define_rule({
		name = "ecc_chaos_war_camp_taunt_payback",
		response = "ecc_chaos_war_camp_taunt_payback",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ecc_taunt_payback"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			},
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "ecc_chaos_war_camp_throw_axe",
		name = "ecc_chaos_war_camp_throw_axe",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ecc_throw_axe"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			}
		}
	})
	define_rule({
		response = "ecc_chaos_war_camp_charge",
		name = "ecc_chaos_war_camp_charge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ecc_charge"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			}
		}
	})
	define_rule({
		response = "ecc_chaos_war_camp_ground_pound",
		name = "ecc_chaos_war_camp_ground_pound",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ecc_ground_pound"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_chaos_champion_throwing_axe",
		response = "pdr_gameplay_chaos_champion_throwing_axe",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_throw_axe"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"chaos_champion_throwing_axe",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_throwing_axe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_chaos_champion_charge_reply",
		response = "pdr_gameplay_chaos_champion_charge_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_charge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"chaos_champion_charge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_charge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_chaos_champion_summon_reply",
		response = "pdr_gameplay_chaos_champion_summon_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_ground_summon"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"chaos_champion_summon_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_summon_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_challenge_reply_slayer",
		response = "pdr_chaos_war_camp_challenge_reply_slayer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_challenge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_slayer"
			},
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_challenge_reply_ranger",
		response = "pdr_chaos_war_camp_challenge_reply_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_challenge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_ranger"
			},
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_challenge_reply_ironbreaker",
		response = "pdr_chaos_war_camp_challenge_reply_ironbreaker",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_challenge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_chaos_war_camp_taunt_payback_reply",
		response = "pdr_chaos_war_camp_taunt_payback_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_taunt_payback"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_chaos_war_camp_dead_champion",
		response = "pdr_level_chaos_war_camp_dead_champion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
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
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_gameplay_chaos_champion_summon_reply = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_gameplay_chaos_champion_summon_reply_01",
				"pdr_gameplay_chaos_champion_summon_reply_02",
				"pdr_gameplay_chaos_champion_summon_reply_03",
				"pdr_gameplay_chaos_champion_summon_reply_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.649395942688,
				5.7202291488647,
				5.2218332290649,
				4.949583530426
			},
			localization_strings = {
				"pdr_gameplay_chaos_champion_summon_reply_01",
				"pdr_gameplay_chaos_champion_summon_reply_02",
				"pdr_gameplay_chaos_champion_summon_reply_03",
				"pdr_gameplay_chaos_champion_summon_reply_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_chaos_champion_charge_reply = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_gameplay_chaos_champion_charge_reply_01",
				"pdr_gameplay_chaos_champion_charge_reply_02",
				"pdr_gameplay_chaos_champion_charge_reply_03",
				"pdr_gameplay_chaos_champion_charge_reply_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.2942500114441,
				2.4058332443237,
				3.4756667613983,
				4.0238122940064
			},
			localization_strings = {
				"pdr_gameplay_chaos_champion_charge_reply_01",
				"pdr_gameplay_chaos_champion_charge_reply_02",
				"pdr_gameplay_chaos_champion_charge_reply_03",
				"pdr_gameplay_chaos_champion_charge_reply_04"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_chaos_war_camp_intro_c_01",
				[2.0] = "pdr_chaos_war_camp_intro_c_02"
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
				[1.0] = 8.7922916412353,
				[2.0] = 2.5459582805634
			},
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_intro_c_01",
				[2.0] = "pdr_chaos_war_camp_intro_c_02"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_ground_summon = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"ecc_chaos_war_camp_ground_summon_01",
				"ecc_chaos_war_camp_ground_summon_02",
				"ecc_chaos_war_camp_ground_summon_03"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				4.8450903892517,
				2.9101133346558,
				6.0107569694519
			},
			localization_strings = {
				"ecc_chaos_war_camp_ground_summon_01",
				"ecc_chaos_war_camp_ground_summon_02",
				"ecc_chaos_war_camp_ground_summon_03"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_arena_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_arena_01",
				"pdr_level_chaos_war_camp_arena_02",
				"pdr_level_chaos_war_camp_arena_03",
				"pdr_level_chaos_war_camp_arena_04"
			},
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
			sound_events_duration = {
				4.2947292327881,
				4.7922706604004,
				5.8421249389648,
				1.624104142189
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_arena_01",
				"pdr_level_chaos_war_camp_arena_02",
				"pdr_level_chaos_war_camp_arena_03",
				"pdr_level_chaos_war_camp_arena_04"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_chaos_war_camp_intro_a_01",
				[2.0] = "pdr_chaos_war_camp_intro_a_02"
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
				[1.0] = 3.7628540992737,
				[2.0] = 3.2315833568573
			},
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_intro_a_01",
				[2.0] = "pdr_chaos_war_camp_intro_a_02"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_throw_axe = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			sound_distance = 40,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"ecc_chaos_war_camp_throw_axe_01",
				"ecc_chaos_war_camp_throw_axe_02",
				"ecc_chaos_war_camp_throw_axe_03",
				"ecc_chaos_war_camp_throw_axe_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.0501254796982,
				0.93938773870468,
				0.66599905490875,
				0.75691682100296
			},
			localization_strings = {
				"ecc_chaos_war_camp_throw_axe_01",
				"ecc_chaos_war_camp_throw_axe_02",
				"ecc_chaos_war_camp_throw_axe_03",
				"ecc_chaos_war_camp_throw_axe_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_keep_fighting_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_keep_fighting_01",
				"pdr_level_chaos_war_camp_keep_fighting_02",
				"pdr_level_chaos_war_camp_keep_fighting_03",
				"pdr_level_chaos_war_camp_keep_fighting_04"
			},
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
			sound_events_duration = {
				5.3370833396912,
				3.2905416488648,
				4.2092499732971,
				5.3897500038147
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_keep_fighting_01",
				"pdr_level_chaos_war_camp_keep_fighting_02",
				"pdr_level_chaos_war_camp_keep_fighting_03",
				"pdr_level_chaos_war_camp_keep_fighting_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_outer_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_outer_gate_01",
				"pdr_level_chaos_war_camp_outer_gate_02",
				"pdr_level_chaos_war_camp_outer_gate_03",
				"pdr_level_chaos_war_camp_outer_gate_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.2255625724792,
				2.8150832653046,
				2.639687538147,
				3.4623124599457
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_outer_gate_01",
				"pdr_level_chaos_war_camp_outer_gate_02",
				"pdr_level_chaos_war_camp_outer_gate_03",
				"pdr_level_chaos_war_camp_outer_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_tree = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_tree_01",
				"pdr_level_chaos_war_camp_tree_02",
				"pdr_level_chaos_war_camp_tree_03",
				"pdr_level_chaos_war_camp_tree_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.299708366394,
				3.6537499427795,
				6.382791519165,
				3.8817083835602
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_tree_01",
				"pdr_level_chaos_war_camp_tree_02",
				"pdr_level_chaos_war_camp_tree_03",
				"pdr_level_chaos_war_camp_tree_04"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_chaos_war_camp_intro_b_01",
				[2.0] = "pdr_chaos_war_camp_intro_b_02"
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
				[1.0] = 4.5562705993652,
				[2.0] = 5.1233124732971
			},
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_intro_b_01",
				[2.0] = "pdr_chaos_war_camp_intro_b_02"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_charge = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			sound_distance = 40,
			category = "boss_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "ecc_chaos_war_camp_charge_05",
				[2.0] = "ecc_chaos_war_camp_charge_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.0345234870911,
				[2.0] = 2.6689982414246
			},
			localization_strings = {
				[1.0] = "ecc_chaos_war_camp_charge_05",
				[2.0] = "ecc_chaos_war_camp_charge_06"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_challenge_reply_ironbreaker = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_b_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.6755623817444,
				[2.0] = 4.6228752136231
			},
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_b_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_dead_champion_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_dead_champion_01",
				"pdr_level_chaos_war_camp_dead_champion_02",
				"pdr_level_chaos_war_camp_dead_champion_03",
				"pdr_level_chaos_war_camp_dead_champion_04"
			},
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
			sound_events_duration = {
				4.1928749084473,
				4.1272916793823,
				5.3082914352417,
				3.6596667766571
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_dead_champion_01",
				"pdr_level_chaos_war_camp_dead_champion_02",
				"pdr_level_chaos_war_camp_dead_champion_03",
				"pdr_level_chaos_war_camp_dead_champion_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_portal_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_portal_01",
				"pdr_level_chaos_war_camp_portal_02",
				"pdr_level_chaos_war_camp_portal_03",
				"pdr_level_chaos_war_camp_portal_04"
			},
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
			sound_events_duration = {
				2.5208125114441,
				6.010187625885,
				2.6907916069031,
				1.7735832929611
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_portal_01",
				"pdr_level_chaos_war_camp_portal_02",
				"pdr_level_chaos_war_camp_portal_03",
				"pdr_level_chaos_war_camp_portal_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_battering_ram_use_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_battering_ram_use_01",
				"pdr_level_chaos_war_camp_battering_ram_use_02",
				"pdr_level_chaos_war_camp_battering_ram_use_03",
				"pdr_level_chaos_war_camp_battering_ram_use_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				6.2393751144409,
				5.421854019165,
				6.4811248779297,
				3.3101251125336
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_battering_ram_use_01",
				"pdr_level_chaos_war_camp_battering_ram_use_02",
				"pdr_level_chaos_war_camp_battering_ram_use_03",
				"pdr_level_chaos_war_camp_battering_ram_use_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_surprise_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_surprise_01",
				"pdr_level_chaos_war_surprise_02",
				"pdr_level_chaos_war_surprise_03",
				"pdr_level_chaos_war_surprise_04"
			},
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
			sound_events_duration = {
				7.0088748931885,
				5.3991665840149,
				2.7855417728424,
				3.5601665973663
			},
			localization_strings = {
				"pdr_level_chaos_war_surprise_01",
				"pdr_level_chaos_war_surprise_02",
				"pdr_level_chaos_war_surprise_03",
				"pdr_level_chaos_war_surprise_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_dead_champion = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_level_chaos_war_camp_dead_champion_01",
				"pdr_level_chaos_war_camp_dead_champion_02",
				"pdr_level_chaos_war_camp_dead_champion_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.1928749084473,
				4.1272916793823,
				5.3082914352417
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_dead_champion_01",
				"pdr_level_chaos_war_camp_dead_champion_02",
				"pdr_level_chaos_war_camp_dead_champion_03"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_taunt_payback_reply = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_chaos_war_camp_taunt_payback_reply_01",
				"pdr_chaos_war_camp_taunt_payback_reply_02",
				"pdr_chaos_war_camp_taunt_payback_reply_03"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				6.4716248512268,
				7.0027709007263,
				5.9319376945496
			},
			localization_strings = {
				"pdr_chaos_war_camp_taunt_payback_reply_01",
				"pdr_chaos_war_camp_taunt_payback_reply_02",
				"pdr_chaos_war_camp_taunt_payback_reply_03"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_challenge_reply_slayer = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1458539962769,
				[2.0] = 3.5618333816528
			},
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_live_in_swamp = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_live_in_swamp_01",
				"pdr_level_chaos_war_camp_live_in_swamp_02",
				"pdr_level_chaos_war_camp_live_in_swamp_03",
				"pdr_level_chaos_war_camp_live_in_swamp_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				6.2953958511353,
				4.3743124008179,
				4.7586874961853,
				4.6501460075378
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_live_in_swamp_01",
				"pdr_level_chaos_war_camp_live_in_swamp_02",
				"pdr_level_chaos_war_camp_live_in_swamp_03",
				"pdr_level_chaos_war_camp_live_in_swamp_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_islands_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_islands_01",
				"pdr_level_chaos_war_camp_islands_02",
				"pdr_level_chaos_war_camp_islands_03",
				"pdr_level_chaos_war_camp_islands_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_neutral"
			},
			sound_events_duration = {
				3.4183332920074,
				3.3116250038147,
				2.1881041526794,
				3.6276874542236
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_islands_01",
				"pdr_level_chaos_war_camp_islands_02",
				"pdr_level_chaos_war_camp_islands_03",
				"pdr_level_chaos_war_camp_islands_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_ravine = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_ravine_01",
				"pdr_level_chaos_war_camp_ravine_02",
				"pdr_level_chaos_war_camp_ravine_03",
				"pdr_level_chaos_war_camp_ravine_04"
			},
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
			sound_events_duration = {
				1.6120833158493,
				2.4384999275208,
				5.4414792060852,
				2.6672291755676
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_ravine_01",
				"pdr_level_chaos_war_camp_ravine_02",
				"pdr_level_chaos_war_camp_ravine_03",
				"pdr_level_chaos_war_camp_ravine_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_camp_view_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_camp_view_01",
				"pdr_level_chaos_war_camp_camp_view_02",
				"pdr_level_chaos_war_camp_camp_view_03",
				"pdr_level_chaos_war_camp_camp_view_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.2530832290649,
				3.5898125171661,
				1.2865417003632,
				4.241687297821
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_camp_view_01",
				"pdr_level_chaos_war_camp_camp_view_02",
				"pdr_level_chaos_war_camp_camp_view_03",
				"pdr_level_chaos_war_camp_camp_view_04"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_taunt_payback = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "ecc_chaos_war_camp_taunt_payback_01",
				[2.0] = "ecc_chaos_war_camp_taunt_payback_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 8.8785371780396,
				[2.0] = 9.2046413421631
			},
			localization_strings = {
				[1.0] = "ecc_chaos_war_camp_taunt_payback_01",
				[2.0] = "ecc_chaos_war_camp_taunt_payback_02"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_chaos_champion_throwing_axe = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_gameplay_chaos_champion_throwing_axe_01",
				"pdr_gameplay_chaos_champion_throwing_axe_02",
				"pdr_gameplay_chaos_champion_throwing_axe_03",
				"pdr_gameplay_chaos_champion_throwing_axe_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.6778333187103,
				3.0682291984558,
				2.6660833358765,
				4.2252497673035
			},
			localization_strings = {
				"pdr_gameplay_chaos_champion_throwing_axe_01",
				"pdr_gameplay_chaos_champion_throwing_axe_02",
				"pdr_gameplay_chaos_champion_throwing_axe_03",
				"pdr_gameplay_chaos_champion_throwing_axe_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_ghost_town_state = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_ghost_town_state_01",
				"pdr_level_chaos_war_camp_ghost_town_state_02",
				"pdr_level_chaos_war_camp_ghost_town_state_03",
				"pdr_level_chaos_war_camp_ghost_town_state_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				3.9200208187103,
				2.3238332271576,
				5.4277291297913,
				5.356041431427
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_ghost_town_state_01",
				"pdr_level_chaos_war_camp_ghost_town_state_02",
				"pdr_level_chaos_war_camp_ghost_town_state_03",
				"pdr_level_chaos_war_camp_ghost_town_state_04"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_challenge_reply_ranger = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_b_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.6755623817444,
				[2.0] = 4.6228752136231
			},
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_b_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_which_way = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_which_way_01",
				"pdr_level_chaos_war_camp_which_way_02",
				"pdr_level_chaos_war_camp_which_way_03",
				"pdr_level_chaos_war_camp_which_way_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.5066874027252,
				5.4025001525879,
				2.7901666164398,
				3.2608542442322
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_which_way_01",
				"pdr_level_chaos_war_camp_which_way_02",
				"pdr_level_chaos_war_camp_which_way_03",
				"pdr_level_chaos_war_camp_which_way_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_success_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_success_01",
				"pdr_level_chaos_war_camp_success_02",
				"pdr_level_chaos_war_camp_success_03",
				"pdr_level_chaos_war_camp_success_04"
			},
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
			sound_events_duration = {
				7.4482293128967,
				4.5966248512268,
				3.9997708797455,
				3.5510001182556
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_success_01",
				"pdr_level_chaos_war_camp_success_02",
				"pdr_level_chaos_war_camp_success_03",
				"pdr_level_chaos_war_camp_success_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_cabin = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_cabin_01",
				"pdr_level_chaos_war_camp_cabin_02",
				"pdr_level_chaos_war_camp_cabin_03",
				"pdr_level_chaos_war_camp_cabin_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				3.5488333702087,
				4.4025416374206,
				2.9634792804718,
				9.0701665878296
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_cabin_01",
				"pdr_level_chaos_war_camp_cabin_02",
				"pdr_level_chaos_war_camp_cabin_03",
				"pdr_level_chaos_war_camp_cabin_04"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_ground_pound = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"ecc_chaos_war_camp_ground_pound_01",
				"ecc_chaos_war_camp_ground_pound_02",
				"ecc_chaos_war_camp_ground_pound_03",
				"ecc_chaos_war_camp_ground_pound_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.1924643516541,
				0.85249203443527,
				1.9837415218353,
				2.0614395141602
			},
			localization_strings = {
				"ecc_chaos_war_camp_ground_pound_01",
				"ecc_chaos_war_camp_ground_pound_02",
				"ecc_chaos_war_camp_ground_pound_03",
				"ecc_chaos_war_camp_ground_pound_04"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_challenge = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"ecc_chaos_war_camp_challenge_02",
				"ecc_chaos_war_camp_challenge_04",
				"ecc_chaos_war_camp_challenge_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				7.8709897994995,
				7.3965692520142,
				7.3138999938965
			},
			localization_strings = {
				"ecc_chaos_war_camp_challenge_02",
				"ecc_chaos_war_camp_challenge_04",
				"ecc_chaos_war_camp_challenge_05"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_depart_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_depart_01",
				"pdr_level_chaos_war_camp_depart_02",
				"pdr_level_chaos_war_camp_depart_03",
				"pdr_level_chaos_war_camp_depart_04"
			},
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
			sound_events_duration = {
				2.5352709293366,
				3.1748125553131,
				6.0558543205261,
				3.7480208873749
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_depart_01",
				"pdr_level_chaos_war_camp_depart_02",
				"pdr_level_chaos_war_camp_depart_03",
				"pdr_level_chaos_war_camp_depart_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_wall_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_wall_01",
				"pdr_level_chaos_war_camp_wall_02",
				"pdr_level_chaos_war_camp_wall_03",
				"pdr_level_chaos_war_camp_wall_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				4.7372708320618,
				2.1937084197998,
				2.1900417804718,
				2.7162082195282
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_wall_01",
				"pdr_level_chaos_war_camp_wall_02",
				"pdr_level_chaos_war_camp_wall_03",
				"pdr_level_chaos_war_camp_wall_04"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_battering_ram_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_chaos_war_camp_battering_ram_01",
				"pdr_level_chaos_war_camp_battering_ram_02",
				"pdr_level_chaos_war_camp_battering_ram_03",
				"pdr_level_chaos_war_camp_battering_ram_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.9236042499542,
				1.8214792013168,
				3.0367915630341,
				4.2989168167114
			},
			localization_strings = {
				"pdr_level_chaos_war_camp_battering_ram_01",
				"pdr_level_chaos_war_camp_battering_ram_02",
				"pdr_level_chaos_war_camp_battering_ram_03",
				"pdr_level_chaos_war_camp_battering_ram_04"
			},
			randomize_indexes = {}
		}
	})
end
