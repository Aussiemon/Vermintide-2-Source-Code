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
		response = "ecc_chaos_war_camp_taunt_payback",
		name = "ecc_chaos_war_camp_taunt_payback",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_intro_c_01",
				[2.0] = "pdr_chaos_war_camp_intro_c_02"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_ground_summon = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				"ecc_chaos_war_camp_ground_summon_01",
				"ecc_chaos_war_camp_ground_summon_02",
				"ecc_chaos_war_camp_ground_summon_03"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_arena_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_intro_a_01",
				[2.0] = "pdr_chaos_war_camp_intro_a_02"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_throw_axe = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_intro_b_01",
				[2.0] = "pdr_chaos_war_camp_intro_b_02"
			},
			randomize_indexes = {}
		},
		ecc_chaos_war_camp_charge = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "ecc_chaos_war_camp_charge_05",
				[2.0] = "ecc_chaos_war_camp_charge_06"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_challenge_reply_ironbreaker = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_b_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_dead_champion_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			category = "level_talk",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				"pdr_level_chaos_war_camp_dead_champion_01",
				"pdr_level_chaos_war_camp_dead_champion_02",
				"pdr_level_chaos_war_camp_dead_champion_03"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_taunt_payback_reply = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				"pdr_chaos_war_camp_taunt_payback_reply_01",
				"pdr_chaos_war_camp_taunt_payback_reply_02",
				"pdr_chaos_war_camp_taunt_payback_reply_03"
			},
			randomize_indexes = {}
		},
		pdr_chaos_war_camp_challenge_reply_slayer = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_live_in_swamp = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "ecc_chaos_war_camp_taunt_payback_01",
				[2.0] = "ecc_chaos_war_camp_taunt_payback_02"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_chaos_champion_throwing_axe = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				[1.0] = "pdr_chaos_war_camp_challenge_reply_b_01",
				[2.0] = "pdr_chaos_war_camp_challenge_reply_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_which_way = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_warcamp",
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
			localization_strings = {
				"ecc_chaos_war_camp_challenge_02",
				"ecc_chaos_war_camp_challenge_04",
				"ecc_chaos_war_camp_challenge_05"
			},
			randomize_indexes = {}
		},
		pdr_level_chaos_war_camp_depart_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_warcamp",
			category = "level_talk",
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
			localization_strings = {
				"pdr_level_chaos_war_camp_battering_ram_01",
				"pdr_level_chaos_war_camp_battering_ram_02",
				"pdr_level_chaos_war_camp_battering_ram_03",
				"pdr_level_chaos_war_camp_battering_ram_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
