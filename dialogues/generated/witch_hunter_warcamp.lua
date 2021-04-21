return function ()
	define_rule({
		name = "pwh_level_chaos_war_camp_ravine",
		response = "pwh_level_chaos_war_camp_ravine",
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
		name = "pwh_level_chaos_war_camp_live_in_swamp",
		response = "pwh_level_chaos_war_camp_live_in_swamp",
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
		name = "pwh_level_chaos_war_camp_cabin",
		response = "pwh_level_chaos_war_camp_cabin",
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
		name = "pwh_level_chaos_war_camp_which_way",
		response = "pwh_level_chaos_war_camp_which_way",
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
		name = "pwh_level_chaos_war_camp_islands_01",
		response = "pwh_level_chaos_war_camp_islands_01",
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
		name = "pwh_level_chaos_war_camp_camp_view_01",
		response = "pwh_level_chaos_war_camp_camp_view_01",
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
		name = "pwh_level_chaos_war_camp_tree",
		response = "pwh_level_chaos_war_camp_tree",
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
		name = "pwh_level_chaos_war_camp_outer_gate_01",
		response = "pwh_level_chaos_war_camp_outer_gate_01",
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
		name = "pwh_level_chaos_war_camp_battering_ram_01",
		response = "pwh_level_chaos_war_camp_battering_ram_01",
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
		name = "pwh_level_chaos_war_camp_battering_ram_use_01",
		response = "pwh_level_chaos_war_camp_battering_ram_use_01",
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
		name = "pwh_level_chaos_war_camp_wall_01",
		response = "pwh_level_chaos_war_camp_wall_01",
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
		name = "pwh_level_chaos_war_surprise_01",
		response = "pwh_level_chaos_war_surprise_01",
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
		name = "pwh_level_chaos_war_camp_keep_fighting_01",
		response = "pwh_level_chaos_war_camp_keep_fighting_01",
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
		name = "pwh_level_chaos_war_camp_arena_01",
		response = "pwh_level_chaos_war_camp_arena_01",
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
		name = "pwh_level_chaos_war_camp_dead_champion_01",
		response = "pwh_level_chaos_war_camp_dead_champion_01",
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
		name = "pwh_level_chaos_war_camp_depart_01",
		response = "pwh_level_chaos_war_camp_depart_01",
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
		name = "pwh_level_chaos_war_camp_success_01",
		response = "pwh_level_chaos_war_camp_success_01",
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
		name = "pwh_level_chaos_war_camp_portal_01",
		response = "pwh_level_chaos_war_camp_portal_01",
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
		name = "pwh_chaos_war_camp_intro_a",
		response = "pwh_chaos_war_camp_intro_a",
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
		name = "pwh_chaos_war_camp_intro_b",
		response = "pwh_chaos_war_camp_intro_b",
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
				"witch_hunter"
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
		name = "pwh_chaos_war_camp_intro_c",
		response = "pwh_chaos_war_camp_intro_c",
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
				"witch_hunter"
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
		name = "pwh_gameplay_chaos_champion_throwing_axe",
		response = "pwh_gameplay_chaos_champion_throwing_axe",
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
				"witch_hunter"
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
		name = "pwh_gameplay_chaos_champion_charge_reply",
		response = "pwh_gameplay_chaos_champion_charge_reply",
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
				"witch_hunter"
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
		name = "pwh_gameplay_chaos_champion_summon_reply",
		response = "pwh_gameplay_chaos_champion_summon_reply",
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
				"witch_hunter"
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
		name = "pwh_chaos_war_camp_challenge_reply_a",
		response = "pwh_chaos_war_camp_challenge_reply_a",
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
				"witch_hunter"
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
		name = "pwh_chaos_war_camp_taunt_payback_reply",
		response = "pwh_chaos_war_camp_taunt_payback_reply",
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
				"witch_hunter"
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
		name = "pwh_level_chaos_war_camp_dead_champion",
		response = "pwh_level_chaos_war_camp_dead_champion",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
	define_rule({
		name = "pdr_level_ground_zero_cargo_elevator",
		response = "pdr_level_ground_zero_cargo_elevator",
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
				"ground_zero_cargo_elevator"
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
				"level_ground_zero_cargo_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_cargo_elevator",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwh_level_chaos_war_camp_live_in_swamp = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_live_in_swamp_01",
				"pwh_level_chaos_war_camp_live_in_swamp_02",
				"pwh_level_chaos_war_camp_live_in_swamp_03",
				"pwh_level_chaos_war_camp_live_in_swamp_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_live_in_swamp_01",
				"pwh_level_chaos_war_camp_live_in_swamp_02",
				"pwh_level_chaos_war_camp_live_in_swamp_03",
				"pwh_level_chaos_war_camp_live_in_swamp_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.9447915554047,
				3.811541557312,
				7.1218123435974,
				4.0791873931885
			}
		},
		pwh_level_chaos_war_camp_battering_ram_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_battering_ram_01",
				"pwh_level_chaos_war_camp_battering_ram_02",
				"pwh_level_chaos_war_camp_battering_ram_03",
				"pwh_level_chaos_war_camp_battering_ram_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_battering_ram_01",
				"pwh_level_chaos_war_camp_battering_ram_02",
				"pwh_level_chaos_war_camp_battering_ram_03",
				"pwh_level_chaos_war_camp_battering_ram_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.5327916145325,
				3.9527082443237,
				4.68204164505,
				2.3751249313355
			}
		},
		pwh_level_chaos_war_camp_portal_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_portal_01",
				"pwh_level_chaos_war_camp_portal_02",
				"pwh_level_chaos_war_camp_portal_03",
				"pwh_level_chaos_war_camp_portal_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_portal_01",
				"pwh_level_chaos_war_camp_portal_02",
				"pwh_level_chaos_war_camp_portal_03",
				"pwh_level_chaos_war_camp_portal_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.2555418014526,
				3.3521873950958,
				4.4043960571289,
				6.1164793968201
			}
		},
		pwh_level_chaos_war_camp_outer_gate_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_outer_gate_01",
				"pwh_level_chaos_war_camp_outer_gate_02",
				"pwh_level_chaos_war_camp_outer_gate_03",
				"pwh_level_chaos_war_camp_outer_gate_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_outer_gate_01",
				"pwh_level_chaos_war_camp_outer_gate_02",
				"pwh_level_chaos_war_camp_outer_gate_03",
				"pwh_level_chaos_war_camp_outer_gate_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.8329374790192,
				5.3020000457764,
				4.8200626373291,
				3.3741457462311
			}
		},
		pwh_level_chaos_war_camp_battering_ram_use_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_battering_ram_use_01",
				"pwh_level_chaos_war_camp_battering_ram_use_02",
				"pwh_level_chaos_war_camp_battering_ram_use_03",
				"pwh_level_chaos_war_camp_battering_ram_use_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_battering_ram_use_01",
				"pwh_level_chaos_war_camp_battering_ram_use_02",
				"pwh_level_chaos_war_camp_battering_ram_use_03",
				"pwh_level_chaos_war_camp_battering_ram_use_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.0383749008179,
				3.0586667060852,
				3.5517499446869,
				4.0304584503174
			}
		},
		pwh_chaos_war_camp_taunt_payback_reply = {
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_taunt_payback_reply_01",
				[2.0] = "pwh_chaos_war_camp_taunt_payback_reply_02"
			},
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_taunt_payback_reply_01",
				[2.0] = "pwh_chaos_war_camp_taunt_payback_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 11.234375,
				[2.0] = 9.9589996337891
			}
		},
		pdr_level_ground_zero_cargo_elevator = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_ground_zero_cargo_elevator_01",
				"pdr_level_ground_zero_cargo_elevator_02",
				"pdr_level_ground_zero_cargo_elevator_03",
				"pdr_level_ground_zero_cargo_elevator_04"
			},
			sound_events = {
				"pdr_level_ground_zero_cargo_elevator_01",
				"pdr_level_ground_zero_cargo_elevator_02",
				"pdr_level_ground_zero_cargo_elevator_03",
				"pdr_level_ground_zero_cargo_elevator_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.5256457328796,
				3.7195208072662,
				3.1259791851044,
				3.2862915992737
			}
		},
		pwh_chaos_war_camp_intro_b = {
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_intro_b_01",
				[2.0] = "pwh_chaos_war_camp_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_intro_b_01",
				[2.0] = "pwh_chaos_war_camp_intro_b_02"
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
				[1.0] = 5.6101875305176,
				[2.0] = 5.7909374237061
			}
		},
		pwh_level_chaos_war_camp_depart_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_depart_01",
				"pwh_level_chaos_war_camp_depart_02",
				"pwh_level_chaos_war_camp_depart_03",
				"pwh_level_chaos_war_camp_depart_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_depart_01",
				"pwh_level_chaos_war_camp_depart_02",
				"pwh_level_chaos_war_camp_depart_03",
				"pwh_level_chaos_war_camp_depart_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.8133542537689,
				3.8984375,
				3.5284583568573,
				5.5837082862854
			}
		},
		pwh_gameplay_chaos_champion_charge_reply = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_chaos_champion_charge_reply_01",
				"pwh_gameplay_chaos_champion_charge_reply_02",
				"pwh_gameplay_chaos_champion_charge_reply_03",
				"pwh_gameplay_chaos_champion_charge_reply_04"
			},
			sound_events = {
				"pwh_gameplay_chaos_champion_charge_reply_01",
				"pwh_gameplay_chaos_champion_charge_reply_02",
				"pwh_gameplay_chaos_champion_charge_reply_03",
				"pwh_gameplay_chaos_champion_charge_reply_04"
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
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.1448957920074,
				4.1578125953674,
				3.4203541278839,
				4.9029998779297
			}
		},
		pwh_gameplay_chaos_champion_summon_reply = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_chaos_champion_summon_reply_01",
				"pwh_gameplay_chaos_champion_summon_reply_02",
				"pwh_gameplay_chaos_champion_summon_reply_03",
				"pwh_gameplay_chaos_champion_summon_reply_04"
			},
			sound_events = {
				"pwh_gameplay_chaos_champion_summon_reply_01",
				"pwh_gameplay_chaos_champion_summon_reply_02",
				"pwh_gameplay_chaos_champion_summon_reply_03",
				"pwh_gameplay_chaos_champion_summon_reply_04"
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
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				6.7931876182556,
				6.3498125076294,
				7.3258543014526,
				7.164541721344
			}
		},
		pwh_chaos_war_camp_challenge_reply_a = {
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pwh_chaos_war_camp_challenge_reply_a_02"
			},
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pwh_chaos_war_camp_challenge_reply_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.5658750534058,
				[2.0] = 4.6368541717529
			}
		},
		pwh_chaos_war_camp_intro_a = {
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_intro_a_01",
				[2.0] = "pwh_chaos_war_camp_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_intro_a_01",
				[2.0] = "pwh_chaos_war_camp_intro_a_02"
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
				[1.0] = 6.3837084770203,
				[2.0] = 5.5720624923706
			}
		},
		pwh_level_chaos_war_camp_arena_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_arena_01",
				"pwh_level_chaos_war_camp_arena_02",
				"pwh_level_chaos_war_camp_arena_03",
				"pwh_level_chaos_war_camp_arena_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_arena_01",
				"pwh_level_chaos_war_camp_arena_02",
				"pwh_level_chaos_war_camp_arena_03",
				"pwh_level_chaos_war_camp_arena_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.552812576294,
				8.2322082519531,
				5.1421456336975,
				6.9419374465942
			}
		},
		pwh_gameplay_chaos_champion_throwing_axe = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_chaos_champion_throwing_axe_01",
				"pwh_gameplay_chaos_champion_throwing_axe_02",
				"pwh_gameplay_chaos_champion_throwing_axe_03",
				"pwh_gameplay_chaos_champion_throwing_axe_04"
			},
			sound_events = {
				"pwh_gameplay_chaos_champion_throwing_axe_01",
				"pwh_gameplay_chaos_champion_throwing_axe_02",
				"pwh_gameplay_chaos_champion_throwing_axe_03",
				"pwh_gameplay_chaos_champion_throwing_axe_04"
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
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.9260417222977,
				2.5325417518616,
				1.347479224205,
				1.9925832748413
			}
		},
		pwh_level_chaos_war_camp_keep_fighting_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_keep_fighting_01",
				"pwh_level_chaos_war_camp_keep_fighting_02",
				"pwh_level_chaos_war_camp_keep_fighting_03",
				"pwh_level_chaos_war_camp_keep_fighting_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_keep_fighting_01",
				"pwh_level_chaos_war_camp_keep_fighting_02",
				"pwh_level_chaos_war_camp_keep_fighting_03",
				"pwh_level_chaos_war_camp_keep_fighting_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2416458129883,
				4.1682081222534,
				5.7955832481384,
				5.2742290496826
			}
		},
		pwh_level_chaos_war_camp_ravine = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_ravine_01",
				"pwh_level_chaos_war_camp_ravine_02",
				"pwh_level_chaos_war_camp_ravine_03",
				"pwh_level_chaos_war_camp_ravine_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_ravine_01",
				"pwh_level_chaos_war_camp_ravine_02",
				"pwh_level_chaos_war_camp_ravine_03",
				"pwh_level_chaos_war_camp_ravine_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.6449582576752,
				2.9863750934601,
				1.7635208368301,
				4.1831459999084
			}
		},
		pwh_level_chaos_war_camp_dead_champion = {
			face_animations_n = 3,
			database = "witch_hunter_warcamp",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.923749923706,
				3.6827292442322,
				4.5125832557678
			}
		},
		pwh_level_chaos_war_camp_camp_view_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_camp_view_01",
				"pwh_level_chaos_war_camp_camp_view_02",
				"pwh_level_chaos_war_camp_camp_view_03",
				"pwh_level_chaos_war_camp_camp_view_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_camp_view_01",
				"pwh_level_chaos_war_camp_camp_view_02",
				"pwh_level_chaos_war_camp_camp_view_03",
				"pwh_level_chaos_war_camp_camp_view_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.5194165706634,
				5.5789585113525,
				5.2401041984558,
				5.8643126487732
			}
		},
		pwh_level_chaos_war_camp_success_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_success_01",
				"pwh_level_chaos_war_camp_success_02",
				"pwh_level_chaos_war_camp_success_03",
				"pwh_level_chaos_war_camp_success_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_success_01",
				"pwh_level_chaos_war_camp_success_02",
				"pwh_level_chaos_war_camp_success_03",
				"pwh_level_chaos_war_camp_success_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				7.2528958320618,
				6.9847497940064,
				7.0661668777466,
				5.3509793281555
			}
		},
		pwh_level_chaos_war_camp_cabin = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_cabin_01",
				"pwh_level_chaos_war_camp_cabin_02",
				"pwh_level_chaos_war_camp_cabin_03",
				"pwh_level_chaos_war_camp_cabin_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_cabin_01",
				"pwh_level_chaos_war_camp_cabin_02",
				"pwh_level_chaos_war_camp_cabin_03",
				"pwh_level_chaos_war_camp_cabin_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.1923332214356,
				5.8484582901001,
				6.185604095459,
				6.3247084617615
			}
		},
		pwh_level_chaos_war_surprise_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_surprise_01",
				"pwh_level_chaos_war_surprise_02",
				"pwh_level_chaos_war_surprise_03",
				"pwh_level_chaos_war_surprise_04"
			},
			sound_events = {
				"pwh_level_chaos_war_surprise_01",
				"pwh_level_chaos_war_surprise_02",
				"pwh_level_chaos_war_surprise_03",
				"pwh_level_chaos_war_surprise_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				7.6942915916443,
				5.1220417022705,
				3.1870000362396,
				3.235312461853
			}
		},
		pwh_level_chaos_war_camp_wall_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_wall_01",
				"pwh_level_chaos_war_camp_wall_02",
				"pwh_level_chaos_war_camp_wall_03",
				"pwh_level_chaos_war_camp_wall_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_wall_01",
				"pwh_level_chaos_war_camp_wall_02",
				"pwh_level_chaos_war_camp_wall_03",
				"pwh_level_chaos_war_camp_wall_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.4091668128967,
				3.310250043869,
				4.8822917938232,
				8.5941667556763
			}
		},
		pwh_level_chaos_war_camp_tree = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_tree_01",
				"pwh_level_chaos_war_camp_tree_02",
				"pwh_level_chaos_war_camp_tree_03",
				"pwh_level_chaos_war_camp_tree_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_tree_01",
				"pwh_level_chaos_war_camp_tree_02",
				"pwh_level_chaos_war_camp_tree_03",
				"pwh_level_chaos_war_camp_tree_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.422812461853,
				5.568395614624,
				5.0914998054504,
				5.5999999046326
			}
		},
		pwh_chaos_war_camp_intro_c = {
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_intro_c_01",
				[2.0] = "pwh_chaos_war_camp_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_intro_c_01",
				[2.0] = "pwh_chaos_war_camp_intro_c_02"
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
				[1.0] = 6.0233335494995,
				[2.0] = 4.3950624465942
			}
		},
		pwh_level_chaos_war_camp_dead_champion_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03",
				"pwh_level_chaos_war_camp_dead_champion_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03",
				"pwh_level_chaos_war_camp_dead_champion_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.923749923706,
				3.6827292442322,
				4.5125832557678,
				3.3834583759308
			}
		},
		pwh_level_chaos_war_camp_which_way = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_which_way_01",
				"pwh_level_chaos_war_camp_which_way_02",
				"pwh_level_chaos_war_camp_which_way_03",
				"pwh_level_chaos_war_camp_which_way_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_which_way_01",
				"pwh_level_chaos_war_camp_which_way_02",
				"pwh_level_chaos_war_camp_which_way_03",
				"pwh_level_chaos_war_camp_which_way_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.5488750934601,
				2.2860832214356,
				4.4952707290649,
				4.229896068573
			}
		},
		pwh_level_chaos_war_camp_islands_01 = {
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_chaos_war_camp_islands_01",
				"pwh_level_chaos_war_camp_islands_02",
				"pwh_level_chaos_war_camp_islands_03",
				"pwh_level_chaos_war_camp_islands_04"
			},
			sound_events = {
				"pwh_level_chaos_war_camp_islands_01",
				"pwh_level_chaos_war_camp_islands_02",
				"pwh_level_chaos_war_camp_islands_03",
				"pwh_level_chaos_war_camp_islands_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.3907499313355,
				6.7112498283386,
				4.1390209197998,
				4.8327498435974
			}
		}
	})
end
