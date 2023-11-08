return function ()
	define_rule({
		name = "pbw_gameplay_dwarf_ranger_grabbed_ping",
		response = "pbw_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_empire_soldier_grabbed_ping",
		response = "pbw_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_grabbed_ping",
		response = "pbw_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hanging_help_ping",
		response = "pbw_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_healing_draught_ping",
		response = "pbw_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_heard_dwarf_ranger_in_trouble_ping",
		response = "pbw_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_heard_empire_soldier_in_trouble_ping",
		response = "pbw_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_heard_witch_hunter_in_trouble_ping",
		response = "pbw_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_heard_wood_elf_in_trouble_ping",
		response = "pbw_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_knocked_down_ping",
		response = "pbw_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_player_pounced_ping",
		name = "pbw_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_seeing_a_globadier_ping",
		response = "pbw_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_seeing_a_gutter_runner_ping",
		response = "pbw_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_seeing_a_skaven_rat_ogre_ping",
		response = "pbw_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_seeing_a_skaven_ratling_gun_ping",
		response = "pbw_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_seeing_a_skaven_slaver_ping",
		response = "pbw_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_seeing_a_stormvermin_ping",
		response = "pbw_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_spots_ammo_ping",
		response = "pbw_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_spots_bomb_ping",
		response = "pbw_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_spots_health_ping",
		response = "pbw_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_spots_potion_ping",
		response = "pbw_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_witch_hunter_grabbed_ping",
		response = "pbw_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wood_elf_grabbed_ping",
		response = "pbw_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_bright_wizard_grabbed_ping",
		response = "pdr_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_empire_soldier_grabbed_ping",
		response = "pdr_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_grabbed_ping",
		response = "pdr_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hanging_help_ping",
		response = "pdr_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_healing_draught_ping",
		response = "pdr_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_heard_bright_wizard_in_trouble_ping",
		response = "pdr_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_heard_empire_soldier_in_trouble_ping",
		response = "pdr_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_heard_witch_hunter_in_trouble_ping",
		response = "pdr_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_heard_wood_elf_in_trouble_ping",
		response = "pdr_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_knocked_down_ping",
		response = "pdr_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_player_pounced_ping",
		name = "pdr_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_globadier_ping",
		response = "pdr_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_gutter_runner_ping",
		response = "pdr_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_skaven_rat_ogre_ping",
		response = "pdr_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_skaven_ratling_gun_ping",
		response = "pdr_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_skaven_slaver_ping",
		response = "pdr_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_stormvermin_ping",
		response = "pdr_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_spots_ammo_ping",
		response = "pdr_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_spots_bomb_ping",
		response = "pdr_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_spots_health_ping",
		response = "pdr_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_spots_potion_ping",
		response = "pdr_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_witch_hunter_grabbed_ping",
		response = "pdr_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wood_elf_grabbed_ping",
		response = "pdr_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_grabbed_ping",
		response = "pes_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_grabbed_ping",
		response = "pes_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_grabbed_ping",
		response = "pes_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hanging_help_ping",
		response = "pes_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_draught_ping",
		response = "pes_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_bright_wizard_in_trouble_ping",
		response = "pes_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_dwarf_ranger_in_trouble_ping",
		response = "pes_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_witch_hunter_in_trouble_ping",
		response = "pes_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_wood_elf_in_trouble_ping",
		response = "pes_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_knocked_down_ping",
		response = "pes_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_player_pounced_ping",
		name = "pes_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_globadier_ping",
		response = "pes_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_gutter_runner_ping",
		response = "pes_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_rat_ogre_ping",
		response = "pes_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_ratling_gun_ping",
		response = "pes_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_slaver_ping",
		response = "pes_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_stormvermin_ping",
		response = "pes_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_ammo_ping",
		response = "pes_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_bomb_ping",
		response = "pes_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_health_ping",
		response = "pes_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_potion_ping",
		response = "pes_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_grabbed_ping",
		response = "pes_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_grabbed_ping",
		response = "pes_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_bright_wizard_grabbed_ping",
		response = "pwe_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_dwarf_ranger_grabbed_ping",
		response = "pwe_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_empire_soldier_grabbed_ping",
		response = "pwe_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_grabbed_ping",
		response = "pwe_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hanging_help_ping",
		response = "pwe_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_healing_draught_ping",
		response = "pwe_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_heard_bright_wizard_in_trouble_ping",
		response = "pwe_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_heard_dwarf_ranger_in_trouble_ping",
		response = "pwe_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_heard_empire_soldier_in_trouble_ping",
		response = "pwe_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_heard_witch_hunter_in_trouble_ping",
		response = "pwe_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_knocked_down_ping",
		response = "pwe_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_player_pounced_ping",
		name = "pwe_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_globadier_ping",
		response = "pwe_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_gutter_runner_ping",
		response = "pwe_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_skaven_rat_ogre_ping",
		response = "pwe_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_skaven_ratling_gun_ping",
		response = "pwe_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_skaven_slaver_ping",
		response = "pwe_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_stormvermin_ping",
		response = "pwe_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_spots_ammo_ping",
		response = "pwe_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_spots_bomb_ping",
		response = "pwe_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_spots_health_ping",
		response = "pwe_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_spots_potion_ping",
		response = "pwe_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_witch_hunter_grabbed_ping",
		response = "pwe_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_bright_wizard_grabbed_ping",
		response = "pwh_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_grabbed_ping",
		response = "pwh_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_empire_soldier_grabbed_ping",
		response = "pwh_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_grabbed_ping",
		response = "pwh_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hanging_help_ping",
		response = "pwh_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_draught_ping",
		response = "pwh_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_bright_wizard_in_trouble_ping",
		response = "pwh_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_dwarf_ranger_in_trouble_ping",
		response = "pwh_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_empire_soldier_in_trouble_ping",
		response = "pwh_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_heard_wood_elf_in_trouble_ping",
		response = "pwh_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_knocked_down_ping",
		response = "pwh_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_player_pounced_ping",
		name = "pwh_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_globadier_ping",
		response = "pwh_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_gutter_runner_ping",
		response = "pwh_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_rat_ogre_ping",
		response = "pwh_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_ratling_gun_ping",
		response = "pwh_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_skaven_slaver_ping",
		response = "pwh_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_seeing_a_stormvermin_ping",
		response = "pwh_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
				"time_since_ping_enemy",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_enemy",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_ammo_ping",
		response = "pwh_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_bomb_ping",
		response = "pwh_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_health_ping",
		response = "pwh_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_spots_potion_ping",
		response = "pwh_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				8
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wood_elf_grabbed_ping",
		response = "pwh_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ping_alert",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pbw_gameplay_dwarf_ranger_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_dwarf_ranger_grabbed_01",
				"pbw_gameplay_dwarf_ranger_grabbed_02",
				"pbw_gameplay_dwarf_ranger_grabbed_03",
				"pbw_gameplay_dwarf_ranger_grabbed_04",
				"pbw_gameplay_dwarf_ranger_grabbed_05",
				"pbw_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dwarf_ranger_grabbed_01",
				"pbw_gameplay_dwarf_ranger_grabbed_02",
				"pbw_gameplay_dwarf_ranger_grabbed_03",
				"pbw_gameplay_dwarf_ranger_grabbed_04",
				"pbw_gameplay_dwarf_ranger_grabbed_05",
				"pbw_gameplay_dwarf_ranger_grabbed_06"
			},
			sound_events_duration = {
				0.9003124833107,
				1.5918124914169,
				1.9727292060852,
				2.1905624866486,
				1.3812083005905,
				1.622229218483
			}
		},
		pbw_gameplay_empire_soldier_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_empire_soldier_grabbed_01",
				"pbw_gameplay_empire_soldier_grabbed_02",
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_04",
				"pbw_gameplay_empire_soldier_grabbed_05",
				"pbw_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_empire_soldier_grabbed_01",
				"pbw_gameplay_empire_soldier_grabbed_02",
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_04",
				"pbw_gameplay_empire_soldier_grabbed_05",
				"pbw_gameplay_empire_soldier_grabbed_06"
			},
			sound_events_duration = {
				1.483854174614,
				1.7744166851044,
				3.2694582939148,
				1.4534791707993,
				1.4840416908264,
				5.4102501869202
			}
		},
		pbw_gameplay_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "ping_dialogues_honduras",
			sound_events_n = 3,
			category = "player_alerts",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				2.6722707748413,
				1.7201978564262,
				1.86172914505
			}
		},
		pbw_gameplay_hanging_help_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			sound_events_duration = {
				1.9009791612625,
				1.270187497139,
				2.1469790935516,
				1.5290207862854,
				3.4056251049042,
				1.9411041736603
			}
		},
		pbw_gameplay_healing_draught_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "seen_items",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_02",
				"pbw_gameplay_healing_draught_03",
				"pbw_gameplay_healing_draught_04",
				"pbw_gameplay_healing_draught_05",
				"pbw_gameplay_healing_draught_06",
				"pbw_gameplay_healing_draught_07",
				"pbw_gameplay_healing_draught_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_02",
				"pbw_gameplay_healing_draught_03",
				"pbw_gameplay_healing_draught_04",
				"pbw_gameplay_healing_draught_05",
				"pbw_gameplay_healing_draught_06",
				"pbw_gameplay_healing_draught_07",
				"pbw_gameplay_healing_draught_08"
			},
			sound_events_duration = {
				1.2832083702087,
				1.1075625419617,
				1.6141458749771,
				1.8481041193008,
				2.0866875648499,
				2.3591248989105,
				1.7227708101273,
				1.141104221344
			}
		},
		pbw_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			sound_events_duration = {
				1.4887917041779,
				1.4887917041779,
				1.7024583816528,
				2.9942917823791
			}
		},
		pbw_gameplay_heard_empire_soldier_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			sound_events_duration = {
				1.6243749856949,
				1.6243749856949,
				1.7200208902359,
				2.6290209293366
			}
		},
		pbw_gameplay_heard_witch_hunter_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pbw_gameplay_heard_witch_hunter_in_trouble_04",
				"pbw_gameplay_heard_witch_hunter_in_trouble_05",
				"pbw_gameplay_heard_witch_hunter_in_trouble_06",
				"pbw_gameplay_heard_witch_hunter_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_witch_hunter_in_trouble_04",
				"pbw_gameplay_heard_witch_hunter_in_trouble_05",
				"pbw_gameplay_heard_witch_hunter_in_trouble_06",
				"pbw_gameplay_heard_witch_hunter_in_trouble_07"
			},
			sound_events_duration = {
				1.7883541584015,
				1.7883541584015,
				3.2207708358765,
				2.1981041431427
			}
		},
		pbw_gameplay_heard_wood_elf_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			sound_events_duration = {
				1.5703749656677,
				1.7235000133514,
				1.5703749656677,
				1.7235000133514
			}
		},
		pbw_gameplay_knocked_down_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_02",
				"pbw_gameplay_knocked_down_03",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_05",
				"pbw_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_02",
				"pbw_gameplay_knocked_down_03",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_05",
				"pbw_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				2.6722707748413,
				3.2808332443237,
				0.78593748807907,
				1.7201978564262,
				0.89645832777023,
				1.86172914505
			}
		},
		pbw_gameplay_player_pounced_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_07",
				"pbw_gameplay_player_pounced_08",
				"pbw_gameplay_player_pounced_09",
				"pbw_gameplay_player_pounced_10",
				"pbw_gameplay_player_pounced_11",
				"pbw_gameplay_player_pounced_12",
				"pbw_gameplay_player_pounced_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_07",
				"pbw_gameplay_player_pounced_08",
				"pbw_gameplay_player_pounced_09",
				"pbw_gameplay_player_pounced_10",
				"pbw_gameplay_player_pounced_11",
				"pbw_gameplay_player_pounced_12",
				"pbw_gameplay_player_pounced_13"
			},
			sound_events_duration = {
				3.9640207290649,
				1.4472500085831,
				1.8378332853317,
				3.3440625667572,
				2.345624923706,
				2.5729999542236,
				2.2814583778381,
				2.5771250724792
			}
		},
		pbw_gameplay_seeing_a_globadier_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			sound_events_duration = {
				0.90679168701172,
				1.2430416345596,
				1.0505625009537,
				1.7316666841507,
				1.9557917118073,
				2.0025625228882
			}
		},
		pbw_gameplay_seeing_a_gutter_runner_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_gutter_runner_01",
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_03",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_05",
				"pbw_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_gutter_runner_01",
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_03",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_05",
				"pbw_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events_duration = {
				0.87484374642372,
				0.99937498569489,
				1.2948124408722,
				1.0250416994095,
				1.2072499990463,
				1.5232708454132
			}
		},
		pbw_gameplay_seeing_a_skaven_rat_ogre_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_06",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_02",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_03",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_06",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_02",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_03",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events_duration = {
				0.86841666698456,
				0.92958331108093,
				1.5173749923706,
				1.6626875400543,
				1.4283125400543,
				1.8274999260902
			}
		},
		pbw_gameplay_seeing_a_skaven_ratling_gun_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_01",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_02",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_03",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_04",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_06",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_01",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_02",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_03",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_04",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_06",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events_duration = {
				1.7094583511352,
				1.7010208368301,
				3.2105000019074,
				1.6218020915985,
				1.4486042261124,
				1.5277082920075,
				1.9582187533379
			}
		},
		pbw_gameplay_seeing_a_skaven_slaver_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_skaven_slaver_02",
				"pbw_gameplay_seeing_a_skaven_slaver_07",
				"pbw_gameplay_seeing_a_skaven_slaver_03",
				"pbw_gameplay_seeing_a_skaven_slaver_04",
				"pbw_gameplay_seeing_a_skaven_slaver_05",
				"pbw_gameplay_seeing_a_skaven_slaver_06",
				"pbw_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_skaven_slaver_02",
				"pbw_gameplay_seeing_a_skaven_slaver_07",
				"pbw_gameplay_seeing_a_skaven_slaver_03",
				"pbw_gameplay_seeing_a_skaven_slaver_04",
				"pbw_gameplay_seeing_a_skaven_slaver_05",
				"pbw_gameplay_seeing_a_skaven_slaver_06",
				"pbw_gameplay_seeing_a_skaven_slaver_08"
			},
			sound_events_duration = {
				1.0244166851044,
				1.6000000238419,
				1.6985207796097,
				1.5659166574478,
				1.3828958272934,
				2.1854791641235,
				2.5449894666672,
				1.5654374957085
			}
		},
		pbw_gameplay_seeing_a_stormvermin_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_02",
				"pbw_gameplay_seeing_a_stormvermin_03",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_05",
				"pbw_gameplay_seeing_a_stormvermin_06",
				"pbw_gameplay_seeing_a_stormvermin_07",
				"pbw_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_02",
				"pbw_gameplay_seeing_a_stormvermin_03",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_05",
				"pbw_gameplay_seeing_a_stormvermin_06",
				"pbw_gameplay_seeing_a_stormvermin_07",
				"pbw_gameplay_seeing_a_stormvermin_08"
			},
			sound_events_duration = {
				1.4211666584015,
				2.7914373874664,
				1.6849374771118,
				0.74827080965042,
				1.0893125534058,
				2.9714999198914,
				0.97741669416428,
				1.1080000400543
			}
		},
		pbw_gameplay_spots_ammo_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_ammo_01",
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_03",
				"pbw_gameplay_spots_ammo_04",
				"pbw_gameplay_spots_ammo_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_ammo_01",
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_03",
				"pbw_gameplay_spots_ammo_04",
				"pbw_gameplay_spots_ammo_05"
			},
			sound_events_duration = {
				1.2871667146683,
				1.2568333148956,
				2.0754582881927,
				2.1627082824707,
				1.1633958816528
			}
		},
		pbw_gameplay_spots_bomb_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_02",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_04",
				"pbw_gameplay_spots_bomb_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_02",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_04",
				"pbw_gameplay_spots_bomb_05"
			},
			sound_events_duration = {
				0.55416667461395,
				1.2000000476837,
				0.7821249961853,
				1.1964374780655,
				1.360791683197
			}
		},
		pbw_gameplay_spots_health_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_health_01",
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_03",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_health_01",
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_03",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_05"
			},
			sound_events_duration = {
				1.4653958082199,
				1.3064166307449,
				1.9694583415985,
				1.52443754673,
				2.826812505722
			}
		},
		pbw_gameplay_spots_potion_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_potion_01",
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_potion_01",
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05"
			},
			sound_events_duration = {
				1.2340208292007,
				0.80279165506363,
				0.88877081871033,
				0.77170830965042,
				1.6242500543594
			}
		},
		pbw_gameplay_witch_hunter_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_witch_hunter_grabbed_01",
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_03",
				"pbw_gameplay_witch_hunter_grabbed_04",
				"pbw_gameplay_witch_hunter_grabbed_05",
				"pbw_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_witch_hunter_grabbed_01",
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_03",
				"pbw_gameplay_witch_hunter_grabbed_04",
				"pbw_gameplay_witch_hunter_grabbed_05",
				"pbw_gameplay_witch_hunter_grabbed_06"
			},
			sound_events_duration = {
				1.1952500343323,
				2.7377083301544,
				1.3208957910538,
				1.2835208177566,
				1.6282291412354,
				1.6418333053589
			}
		},
		pbw_gameplay_wood_elf_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_06",
				"pbw_gameplay_wood_elf_grabbed_07",
				"pbw_gameplay_wood_elf_grabbed_08",
				"pbw_gameplay_wood_elf_grabbed_09",
				"pbw_gameplay_wood_elf_grabbed_10",
				"pbw_gameplay_wood_elf_grabbed_11",
				"pbw_gameplay_wood_elf_grabbed_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_06",
				"pbw_gameplay_wood_elf_grabbed_07",
				"pbw_gameplay_wood_elf_grabbed_08",
				"pbw_gameplay_wood_elf_grabbed_09",
				"pbw_gameplay_wood_elf_grabbed_10",
				"pbw_gameplay_wood_elf_grabbed_11",
				"pbw_gameplay_wood_elf_grabbed_12"
			},
			sound_events_duration = {
				1.1747499704361,
				1.2441666126251,
				1.3670624494553,
				1.4226249456406,
				1.9345417022705,
				2.2365832328796,
				1.4497083425522,
				1.8150625228882
			}
		},
		pdr_gameplay_bright_wizard_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_gameplay_bright_wizard_grabbed_05 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				},
				pdr_gameplay_bright_wizard_grabbed_06 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06"
			},
			sound_events_duration = {
				2.8293540477753,
				2.5886459350586,
				3.0292084217072,
				1.9528332948685,
				2.2222917079926,
				1.4103125333786
			}
		},
		pdr_gameplay_empire_soldier_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06"
			},
			sound_events_duration = {
				1.8123333454132,
				3.0456249713898,
				1.3761041164398,
				1.4493541717529,
				2.7625832557678,
				3.6173748970032
			}
		},
		pdr_gameplay_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			sound_events_n = 9,
			category = "player_alerts",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_angry",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			sound_events_duration = {
				1.0656042098999,
				1.2492083311081,
				3.405291557312,
				1.7666041851044,
				1.7004582881927,
				1.4683542251587,
				1.8250833749771,
				1.4203958511352,
				1.6496458053589
			}
		},
		pdr_gameplay_hanging_help_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "ping_dialogues_honduras",
			sound_events_n = 12,
			category = "player_alerts",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			sound_events_duration = {
				3.2312500476837,
				2.1472499370575,
				3.9923958778381,
				4.2404165267944,
				3.0713124275208,
				4.147979259491,
				1.7666041851044,
				1.7004582881927,
				1.4683542251587,
				1.8250833749771,
				1.4203958511352,
				1.6496458053589
			}
		},
		pdr_gameplay_healing_draught_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "seen_items",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08"
			},
			sound_events_duration = {
				1.200395822525,
				1.2401041984558,
				1.9977916479111,
				1.9578125476837,
				1.3660416603088,
				1.4826458692551,
				1.624583363533,
				1.987520813942
			}
		},
		pdr_gameplay_heard_bright_wizard_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04",
				"pdr_gameplay_heard_bright_wizard_in_trouble_05",
				"pdr_gameplay_heard_bright_wizard_in_trouble_06",
				"pdr_gameplay_heard_bright_wizard_in_trouble_07",
				"pdr_gameplay_heard_bright_wizard_in_trouble_08"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_gameplay_heard_bright_wizard_in_trouble_01 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04",
				"pdr_gameplay_heard_bright_wizard_in_trouble_05",
				"pdr_gameplay_heard_bright_wizard_in_trouble_06",
				"pdr_gameplay_heard_bright_wizard_in_trouble_07",
				"pdr_gameplay_heard_bright_wizard_in_trouble_08"
			},
			sound_events_duration = {
				1.5651667118073,
				1.6471458673477,
				1.8375208377838,
				2.138729095459,
				1.6471458673477,
				1.7650624513626,
				1.8035000562668,
				1.9347916841507
			}
		},
		pdr_gameplay_heard_empire_soldier_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04",
				"pdr_gameplay_heard_empire_soldier_in_trouble_05",
				"pdr_gameplay_heard_empire_soldier_in_trouble_06",
				"pdr_gameplay_heard_empire_soldier_in_trouble_07",
				"pdr_gameplay_heard_empire_soldier_in_trouble_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04",
				"pdr_gameplay_heard_empire_soldier_in_trouble_05",
				"pdr_gameplay_heard_empire_soldier_in_trouble_06",
				"pdr_gameplay_heard_empire_soldier_in_trouble_07",
				"pdr_gameplay_heard_empire_soldier_in_trouble_08"
			},
			sound_events_duration = {
				1.2592083215714,
				1.5378750562668,
				2.0759375095367,
				2.2247290611267,
				1.5378750562668,
				2.2402708530426,
				2.4633750915527,
				1.368499994278
			}
		},
		pdr_gameplay_heard_witch_hunter_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04",
				"pdr_gameplay_heard_witch_hunter_in_trouble_05",
				"pdr_gameplay_heard_witch_hunter_in_trouble_06",
				"pdr_gameplay_heard_witch_hunter_in_trouble_07",
				"pdr_gameplay_heard_witch_hunter_in_trouble_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04",
				"pdr_gameplay_heard_witch_hunter_in_trouble_05",
				"pdr_gameplay_heard_witch_hunter_in_trouble_06",
				"pdr_gameplay_heard_witch_hunter_in_trouble_07",
				"pdr_gameplay_heard_witch_hunter_in_trouble_08"
			},
			sound_events_duration = {
				1.3812500238419,
				1.6709166765213,
				1.2552708387375,
				1.0518125295639,
				1.6709166765213,
				2.9041666984558,
				2.0831875801086,
				1.9018958806992
			}
		},
		pdr_gameplay_heard_wood_elf_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04",
				"pdr_gameplay_heard_wood_elf_in_trouble_05",
				"pdr_gameplay_heard_wood_elf_in_trouble_06",
				"pdr_gameplay_heard_wood_elf_in_trouble_07",
				"pdr_gameplay_heard_wood_elf_in_trouble_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04",
				"pdr_gameplay_heard_wood_elf_in_trouble_05",
				"pdr_gameplay_heard_wood_elf_in_trouble_06",
				"pdr_gameplay_heard_wood_elf_in_trouble_07",
				"pdr_gameplay_heard_wood_elf_in_trouble_08"
			},
			sound_events_duration = {
				3.2454373836517,
				2.9572291374206,
				1.6475207805634,
				1.9035416841507,
				1.6475207805634,
				3.1744375228882,
				2.4753959178925,
				3.5543124675751
			}
		},
		pdr_gameplay_knocked_down_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "ping_dialogues_honduras",
			sound_events_n = 12,
			category = "player_alerts",
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_knocked_down_01",
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_03",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_05",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_knocked_down_01",
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_03",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_05",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			sound_events_duration = {
				2.1633541584015,
				1.0656042098999,
				1.4827916622162,
				1.2492083311081,
				3.8256874084473,
				3.405291557312,
				1.7666041851044,
				1.7004582881927,
				1.4683542251587,
				1.8250833749771,
				1.4203958511352,
				1.6496458053589
			}
		},
		pdr_gameplay_player_pounced_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_player_pounced_01",
				"pdr_gameplay_player_pounced_02",
				"pdr_gameplay_player_pounced_03",
				"pdr_gameplay_player_pounced_04",
				"pdr_gameplay_player_pounced_05",
				"pdr_gameplay_player_pounced_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_player_pounced_01",
				"pdr_gameplay_player_pounced_02",
				"pdr_gameplay_player_pounced_03",
				"pdr_gameplay_player_pounced_04",
				"pdr_gameplay_player_pounced_05",
				"pdr_gameplay_player_pounced_06"
			},
			sound_events_duration = {
				1.8028957843781,
				2.4435207843781,
				3.1357707977295,
				1.4399791955948,
				1.1300624608993,
				1.7185833454132
			}
		},
		pdr_gameplay_seeing_a_globadier_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06"
			},
			sound_events_duration = {
				0.78350001573563,
				1.7310416698456,
				2.2000000476837,
				2.3795416355133,
				2.2583959102631,
				1.7092916965485
			}
		},
		pdr_gameplay_seeing_a_gutter_runner_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_gutter_runner_01",
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_seeing_a_gutter_runner_04",
				"pdr_gameplay_seeing_a_gutter_runner_05",
				"pdr_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_gutter_runner_01",
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_seeing_a_gutter_runner_04",
				"pdr_gameplay_seeing_a_gutter_runner_05",
				"pdr_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events_duration = {
				1.9182292222977,
				0.96768748760223,
				1.4616249799728,
				2.6431457996368,
				2.8068957328796,
				3.7946667671204
			}
		},
		pdr_gameplay_seeing_a_skaven_rat_ogre_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_04",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_06",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_02",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_03",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_04",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_06",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_02",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_03",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events_duration = {
				0.90260416269302,
				2.4410417079926,
				1.9105000495911,
				2.3701250553131,
				1.3839583396912,
				2.4952292442322
			}
		},
		pdr_gameplay_seeing_a_skaven_ratling_gun_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_ratling_gun_01",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_02",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_03",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_04",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_05",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_06",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_ratling_gun_01",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_02",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_03",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_04",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_05",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_06",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events_duration = {
				1.4744583368301,
				3.0902707576752,
				2.2358958721161,
				2.0123333930969,
				2.6204373836517,
				3.4370000362396,
				3.1293957233429
			}
		},
		pdr_gameplay_seeing_a_skaven_slaver_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_slaver_01",
				"pdr_gameplay_seeing_a_skaven_slaver_02",
				"pdr_gameplay_seeing_a_skaven_slaver_07",
				"pdr_gameplay_seeing_a_skaven_slaver_03",
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_05",
				"pdr_gameplay_seeing_a_skaven_slaver_06",
				"pdr_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_slaver_01",
				"pdr_gameplay_seeing_a_skaven_slaver_02",
				"pdr_gameplay_seeing_a_skaven_slaver_07",
				"pdr_gameplay_seeing_a_skaven_slaver_03",
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_05",
				"pdr_gameplay_seeing_a_skaven_slaver_06",
				"pdr_gameplay_seeing_a_skaven_slaver_08"
			},
			sound_events_duration = {
				1.9516249895096,
				1.3174583911896,
				2.9727499485016,
				2.0299792289734,
				0.72427082061768,
				2.8370208740234,
				2.8320417404175,
				0.81135416030884
			}
		},
		pdr_gameplay_seeing_a_stormvermin_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_stormvermin_01",
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_03",
				"pdr_gameplay_seeing_a_stormvermin_04",
				"pdr_gameplay_seeing_a_stormvermin_05",
				"pdr_gameplay_seeing_a_stormvermin_06",
				"pdr_gameplay_seeing_a_stormvermin_07",
				"pdr_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_stormvermin_01",
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_03",
				"pdr_gameplay_seeing_a_stormvermin_04",
				"pdr_gameplay_seeing_a_stormvermin_05",
				"pdr_gameplay_seeing_a_stormvermin_06",
				"pdr_gameplay_seeing_a_stormvermin_07",
				"pdr_gameplay_seeing_a_stormvermin_08"
			},
			sound_events_duration = {
				1.1232291460037,
				1.4101041555405,
				1.96774995327,
				2.0123751163483,
				1.9935417175293,
				2.7631874084473,
				2.7478957176209,
				1.1241666078568
			}
		},
		pdr_gameplay_spots_ammo_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_02",
				"pdr_gameplay_spots_ammo_03",
				"pdr_gameplay_spots_ammo_04",
				"pdr_gameplay_spots_ammo_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_02",
				"pdr_gameplay_spots_ammo_03",
				"pdr_gameplay_spots_ammo_04",
				"pdr_gameplay_spots_ammo_05"
			},
			sound_events_duration = {
				1.0678958892822,
				2.9667291641235,
				2.394770860672,
				1.7650624513626,
				1.9373124837875
			}
		},
		pdr_gameplay_spots_bomb_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_bomb_01",
				"pdr_gameplay_spots_bomb_02",
				"pdr_gameplay_spots_bomb_03",
				"pdr_gameplay_spots_bomb_04",
				"pdr_gameplay_spots_bomb_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_bomb_01",
				"pdr_gameplay_spots_bomb_02",
				"pdr_gameplay_spots_bomb_03",
				"pdr_gameplay_spots_bomb_04",
				"pdr_gameplay_spots_bomb_05"
			},
			sound_events_duration = {
				0.71539580821991,
				2.3319375514984,
				0.90652084350586,
				3.9988749027252,
				1.7546249628067
			}
		},
		pdr_gameplay_spots_health_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_02",
				"pdr_gameplay_spots_health_03",
				"pdr_gameplay_spots_health_04",
				"pdr_gameplay_spots_health_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_02",
				"pdr_gameplay_spots_health_03",
				"pdr_gameplay_spots_health_04",
				"pdr_gameplay_spots_health_05"
			},
			sound_events_duration = {
				1.4754999876022,
				1.8728749752045,
				1.8875000476837,
				2.0023334026337,
				2.9242708683014
			}
		},
		pdr_gameplay_spots_potion_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05"
			},
			sound_events_duration = {
				1.9800208806992,
				2.2517499923706,
				1.0111875534058,
				1.3843958377838,
				2.8736250400543
			}
		},
		pdr_gameplay_witch_hunter_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_witch_hunter_grabbed_01",
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_03",
				"pdr_gameplay_witch_hunter_grabbed_04",
				"pdr_gameplay_witch_hunter_grabbed_05",
				"pdr_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_witch_hunter_grabbed_01",
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_03",
				"pdr_gameplay_witch_hunter_grabbed_04",
				"pdr_gameplay_witch_hunter_grabbed_05",
				"pdr_gameplay_witch_hunter_grabbed_06"
			},
			sound_events_duration = {
				2.532083272934,
				3.9856667518616,
				2.4831249713898,
				2.1710207462311,
				1.4569166898727,
				1.9064791202545
			}
		},
		pdr_gameplay_wood_elf_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_wood_elf_grabbed_01",
				"pdr_gameplay_wood_elf_grabbed_03",
				"pdr_gameplay_wood_elf_grabbed_05",
				"pdr_gameplay_wood_elf_grabbed_02",
				"pdr_gameplay_wood_elf_grabbed_04",
				"pdr_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_wood_elf_grabbed_01",
				"pdr_gameplay_wood_elf_grabbed_03",
				"pdr_gameplay_wood_elf_grabbed_05",
				"pdr_gameplay_wood_elf_grabbed_02",
				"pdr_gameplay_wood_elf_grabbed_04",
				"pdr_gameplay_wood_elf_grabbed_06"
			},
			sound_events_duration = {
				2.9000000953674,
				3.357604265213,
				2.1514167785645,
				2.7301459312439,
				1.581791639328,
				2.4825208187103
			}
		},
		pes_gameplay_bright_wizard_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_bright_wizard_grabbed_01",
				"pes_gameplay_bright_wizard_grabbed_02",
				"pes_gameplay_bright_wizard_grabbed_03",
				"pes_gameplay_bright_wizard_grabbed_04",
				"pes_gameplay_bright_wizard_grabbed_05",
				"pes_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bright_wizard_grabbed_01",
				"pes_gameplay_bright_wizard_grabbed_02",
				"pes_gameplay_bright_wizard_grabbed_03",
				"pes_gameplay_bright_wizard_grabbed_04",
				"pes_gameplay_bright_wizard_grabbed_05",
				"pes_gameplay_bright_wizard_grabbed_06"
			},
			sound_events_duration = {
				1.703385412693,
				1.684770822525,
				1.185666680336,
				1.2417291402817,
				1.513791680336,
				1.5037708282471
			}
		},
		pes_gameplay_dwarf_ranger_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dwarf_ranger_grabbed_01",
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_04",
				"pes_gameplay_dwarf_ranger_grabbed_05",
				"pes_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dwarf_ranger_grabbed_01",
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_04",
				"pes_gameplay_dwarf_ranger_grabbed_05",
				"pes_gameplay_dwarf_ranger_grabbed_06"
			},
			sound_events_duration = {
				1.6241874694824,
				2.2966041564941,
				3.1192290782928,
				1.980291724205,
				2.2680833339691,
				1.5908124446869
			}
		},
		pes_gameplay_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "ping_dialogues_honduras",
			sound_events_n = 3,
			category = "player_alerts",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				1.4447083473206,
				1.0446041822434,
				1.9732916355133
			}
		},
		pes_gameplay_hanging_help_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			sound_events_duration = {
				1.7967916727066,
				1.9630000591278,
				2.0131666660309,
				1.4808541536331,
				2.4451458454132,
				2.6665208339691
			}
		},
		pes_gameplay_healing_draught_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "seen_items",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_03",
				"pes_gameplay_healing_draught_04",
				"pes_gameplay_healing_draught_05",
				"pes_gameplay_healing_draught_06",
				"pes_gameplay_healing_draught_07",
				"pes_gameplay_healing_draught_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_03",
				"pes_gameplay_healing_draught_04",
				"pes_gameplay_healing_draught_05",
				"pes_gameplay_healing_draught_06",
				"pes_gameplay_healing_draught_07",
				"pes_gameplay_healing_draught_08"
			},
			sound_events_duration = {
				1.1509791612625,
				1.4188749790192,
				1.7438750267029,
				1.4933124780655,
				1.6009999513626,
				1.7311041355133,
				1.3082083463669,
				1.8218645453453
			}
		},
		pes_gameplay_heard_bright_wizard_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_03",
				"pes_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_03",
				"pes_gameplay_heard_bright_wizard_in_trouble_04"
			},
			sound_events_duration = {
				0.92252081632614,
				1.6449791193008,
				2.1928334236145,
				1.8140833377838
			}
		},
		pes_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			sound_events_duration = {
				1.8457291126251,
				2.3775000572205,
				1.2909166812897,
				1.9193333387375
			}
		},
		pes_gameplay_heard_witch_hunter_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_02",
				"pes_gameplay_heard_witch_hunter_in_trouble_03",
				"pes_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_02",
				"pes_gameplay_heard_witch_hunter_in_trouble_03",
				"pes_gameplay_heard_witch_hunter_in_trouble_04"
			},
			sound_events_duration = {
				1.1610833108425,
				1.2810624837875,
				1.4553542137146,
				1.6274791955948
			}
		},
		pes_gameplay_heard_wood_elf_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_wood_elf_in_trouble_01",
				"pes_gameplay_heard_wood_elf_in_trouble_02",
				"pes_gameplay_heard_wood_elf_in_trouble_03",
				"pes_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_wood_elf_in_trouble_01",
				"pes_gameplay_heard_wood_elf_in_trouble_02",
				"pes_gameplay_heard_wood_elf_in_trouble_03",
				"pes_gameplay_heard_wood_elf_in_trouble_04"
			},
			sound_events_duration = {
				1.4580833911896,
				1.6531250476837,
				2.8337603807449,
				1.3036667108536
			}
		},
		pes_gameplay_knocked_down_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "player_alerts",
			dialogue_animations_n = 5,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_02",
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_knocked_down_02",
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				1.6168124675751,
				1.4447083473206,
				1.0710208415985,
				1.0446041822434,
				1.9732916355133
			}
		},
		pes_gameplay_player_pounced_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "ping_dialogues_honduras",
			sound_events_n = 10,
			category = "player_alerts",
			dialogue_animations_n = 10,
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
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_player_pounced_01",
				"pes_gameplay_player_pounced_07",
				"pes_gameplay_player_pounced_08",
				"pes_gameplay_player_pounced_09",
				"pes_gameplay_player_pounced_10",
				"pes_gameplay_player_pounced_11",
				"pes_gameplay_player_pounced_13",
				"pes_gameplay_player_pounced_14",
				"pes_gameplay_player_pounced_15",
				"pes_gameplay_player_pounced_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_player_pounced_01",
				"pes_gameplay_player_pounced_07",
				"pes_gameplay_player_pounced_08",
				"pes_gameplay_player_pounced_09",
				"pes_gameplay_player_pounced_10",
				"pes_gameplay_player_pounced_11",
				"pes_gameplay_player_pounced_13",
				"pes_gameplay_player_pounced_14",
				"pes_gameplay_player_pounced_15",
				"pes_gameplay_player_pounced_16"
			},
			sound_events_duration = {
				1.4091458320618,
				1.954437494278,
				1.9655417203903,
				2.2325625419617,
				2.4606249332428,
				1.9934166669846,
				2.183354139328,
				2.1371250152588,
				2.6592707633972,
				2.0841457843781
			}
		},
		pes_gameplay_seeing_a_globadier_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
			},
			sound_events_duration = {
				1.0624375343323,
				0.86418747901917,
				1.6050624847412,
				2.0940520167351,
				1.2890416383743,
				1.6476249694824,
				1.3189582824707
			}
		},
		pes_gameplay_seeing_a_gutter_runner_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events_duration = {
				1.5134791135788,
				1.676677107811,
				1.0027500391007,
				1.245020866394,
				1.3851875066757,
				1.2981666326523
			}
		},
		pes_gameplay_seeing_a_skaven_rat_ogre_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events_duration = {
				1.1322083473206,
				1.6407187581062,
				1.6288541555405,
				2.2949166297913,
				1.6217082738876,
				1.6924583315849
			}
		},
		pes_gameplay_seeing_a_skaven_ratling_gun_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events_duration = {
				1.0576041936874,
				1.2963750362396,
				1.5645208358765,
				1.8267291784286,
				1.8766458034515,
				1.2735208272934,
				2.3948957920074
			}
		},
		pes_gameplay_seeing_a_skaven_slaver_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
			},
			sound_events_duration = {
				0.88443750143051,
				0.94454169273376,
				1.0481250286102,
				1.186562538147,
				1.029000043869,
				1.6907708644867,
				1.5038958787918,
				2.1278958320618
			}
		},
		pes_gameplay_seeing_a_stormvermin_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
			},
			sound_events_duration = {
				2.8007292747498,
				1.3295208215714,
				1.1208958625793,
				1.6428542137146,
				1.8358124494553,
				1.5434583425522,
				1.5376875400543,
				2.2200417518616
			}
		},
		pes_gameplay_spots_ammo_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_03",
				"pes_gameplay_spots_ammo_04",
				"pes_gameplay_spots_ammo_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_03",
				"pes_gameplay_spots_ammo_04",
				"pes_gameplay_spots_ammo_05"
			},
			sound_events_duration = {
				0.8832291662693,
				1.2390208244324,
				1.1732292175293,
				1.5708020925522,
				1.3858958482742
			}
		},
		pes_gameplay_spots_bomb_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_bomb_01",
				"pes_gameplay_spots_bomb_02",
				"pes_gameplay_spots_bomb_03",
				"pes_gameplay_spots_bomb_04",
				"pes_gameplay_spots_bomb_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_bomb_01",
				"pes_gameplay_spots_bomb_02",
				"pes_gameplay_spots_bomb_03",
				"pes_gameplay_spots_bomb_04",
				"pes_gameplay_spots_bomb_05"
			},
			sound_events_duration = {
				0.93804168701172,
				2.8779165744781,
				1.2478125095367,
				1.442062497139,
				0.59333330392838
			}
		},
		pes_gameplay_spots_health_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_02",
				"pes_gameplay_spots_health_03",
				"pes_gameplay_spots_health_04",
				"pes_gameplay_spots_health_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_02",
				"pes_gameplay_spots_health_03",
				"pes_gameplay_spots_health_04",
				"pes_gameplay_spots_health_05"
			},
			sound_events_duration = {
				1.276270866394,
				1.2110625505447,
				2.8102917671204,
				1.846895813942,
				1.0241041183472
			}
		},
		pes_gameplay_spots_potion_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_03",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_03",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_05"
			},
			sound_events_duration = {
				0.61514586210251,
				1.1201041936874,
				1.0991666316986,
				1.0846041440964,
				1.3954166173935
			}
		},
		pes_gameplay_witch_hunter_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_grabbed_01",
				"pes_gameplay_witch_hunter_grabbed_02",
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_04",
				"pes_gameplay_witch_hunter_grabbed_05",
				"pes_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_witch_hunter_grabbed_01",
				"pes_gameplay_witch_hunter_grabbed_02",
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_04",
				"pes_gameplay_witch_hunter_grabbed_05",
				"pes_gameplay_witch_hunter_grabbed_06"
			},
			sound_events_duration = {
				1.2408541440964,
				1.8010833263397,
				2.925083398819,
				1.2971041202545,
				1.8527708649635,
				2.9000415802002
			}
		},
		pes_gameplay_wood_elf_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_03",
				"pes_gameplay_wood_elf_grabbed_05",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_03",
				"pes_gameplay_wood_elf_grabbed_05",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_06"
			},
			sound_events_duration = {
				1.2238124608993,
				1.3475416898727,
				1.3961666822434,
				1.5253541469574,
				1.3945416212082,
				1.4618958234787
			}
		},
		pwe_gameplay_bright_wizard_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_grabbed_01",
				"pwe_gameplay_bright_wizard_grabbed_02",
				"pwe_gameplay_bright_wizard_grabbed_03",
				"pwe_gameplay_bright_wizard_grabbed_04",
				"pwe_gameplay_bright_wizard_grabbed_05",
				"pwe_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwe_gameplay_bright_wizard_grabbed_01 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pwe_gameplay_bright_wizard_grabbed_01",
				"pwe_gameplay_bright_wizard_grabbed_02",
				"pwe_gameplay_bright_wizard_grabbed_03",
				"pwe_gameplay_bright_wizard_grabbed_04",
				"pwe_gameplay_bright_wizard_grabbed_05",
				"pwe_gameplay_bright_wizard_grabbed_06"
			},
			sound_events_duration = {
				2.7155001163483,
				2.5529687404633,
				2.0999999046326,
				2.1590416431427,
				1.7324999570847,
				1.75
			}
		},
		pwe_gameplay_dwarf_ranger_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_grabbed_01",
				"pwe_gameplay_dwarf_ranger_grabbed_02",
				"pwe_gameplay_dwarf_ranger_grabbed_03",
				"pwe_gameplay_dwarf_ranger_grabbed_04",
				"pwe_gameplay_dwarf_ranger_grabbed_05",
				"pwe_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_dwarf_ranger_grabbed_01",
				"pwe_gameplay_dwarf_ranger_grabbed_02",
				"pwe_gameplay_dwarf_ranger_grabbed_03",
				"pwe_gameplay_dwarf_ranger_grabbed_04",
				"pwe_gameplay_dwarf_ranger_grabbed_05",
				"pwe_gameplay_dwarf_ranger_grabbed_06"
			},
			sound_events_duration = {
				3.5885207653046,
				2.7087500095367,
				1.9386249780655,
				2.4441459178925,
				1.6653541326523,
				2.5006248950958
			}
		},
		pwe_gameplay_empire_soldier_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_grabbed_01",
				"pwe_gameplay_empire_soldier_grabbed_02",
				"pwe_gameplay_empire_soldier_grabbed_03",
				"pwe_gameplay_empire_soldier_grabbed_04",
				"pwe_gameplay_empire_soldier_grabbed_05",
				"pwe_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_empire_soldier_grabbed_01",
				"pwe_gameplay_empire_soldier_grabbed_02",
				"pwe_gameplay_empire_soldier_grabbed_03",
				"pwe_gameplay_empire_soldier_grabbed_04",
				"pwe_gameplay_empire_soldier_grabbed_05",
				"pwe_gameplay_empire_soldier_grabbed_06"
			},
			sound_events_duration = {
				1.472833275795,
				1.7745624780655,
				1.8655208349228,
				1.7783333063126,
				2.2640209197998,
				3.7172915935516
			}
		},
		pwe_gameplay_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "ping_dialogues_honduras",
			sound_events_n = 3,
			category = "player_alerts",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05"
			},
			sound_events_duration = {
				1.548864543438,
				1.6000000238419,
				2.4834792613983
			}
		},
		pwe_gameplay_hanging_help_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			sound_events_duration = {
				3.2326250076294,
				3.2326250076294,
				1.8696249723434,
				1.6470416784286,
				1.9007707834244,
				3.8779792785645
			}
		},
		pwe_gameplay_healing_draught_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "seen_items",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_02",
				"pwe_gameplay_healing_draught_03",
				"pwe_gameplay_healing_draught_04",
				"pwe_gameplay_healing_draught_05",
				"pwe_gameplay_healing_draught_06",
				"pwe_gameplay_healing_draught_07",
				"pwe_gameplay_healing_draught_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_02",
				"pwe_gameplay_healing_draught_03",
				"pwe_gameplay_healing_draught_04",
				"pwe_gameplay_healing_draught_05",
				"pwe_gameplay_healing_draught_06",
				"pwe_gameplay_healing_draught_07",
				"pwe_gameplay_healing_draught_08"
			},
			sound_events_duration = {
				1.1028333902359,
				1.4579792022705,
				2.3794584274292,
				2.0469999313355,
				1.9737395644188,
				2.1306250095367,
				1.5523124933243,
				2.7821562290192
			}
		},
		pwe_gameplay_heard_bright_wizard_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwe_gameplay_heard_bright_wizard_in_trouble_04 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04"
			},
			sound_events_duration = {
				2.1667292118073,
				2.8870208263397,
				3.1275832653046,
				1.7281874418259
			}
		},
		pwe_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_10",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_11",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_12",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_10",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_11",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_12",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_13"
			},
			sound_events_duration = {
				2.3739583492279,
				3.0156667232513,
				3.5678749084473,
				2.8650207519531,
				2.7755625247955,
				3.6468124389648,
				1.5331875085831,
				1.455958366394
			}
		},
		pwe_gameplay_heard_empire_soldier_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwe_gameplay_heard_empire_soldier_in_trouble_01",
				"pwe_gameplay_heard_empire_soldier_in_trouble_02",
				"pwe_gameplay_heard_empire_soldier_in_trouble_03",
				"pwe_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_heard_empire_soldier_in_trouble_01",
				"pwe_gameplay_heard_empire_soldier_in_trouble_02",
				"pwe_gameplay_heard_empire_soldier_in_trouble_03",
				"pwe_gameplay_heard_empire_soldier_in_trouble_04"
			},
			sound_events_duration = {
				3.1396250724792,
				1.3999999761581,
				3.3761875629425,
				1.5878541469574
			}
		},
		pwe_gameplay_heard_witch_hunter_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_02",
				"pwe_gameplay_heard_witch_hunter_in_trouble_03",
				"pwe_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_02",
				"pwe_gameplay_heard_witch_hunter_in_trouble_03",
				"pwe_gameplay_heard_witch_hunter_in_trouble_04"
			},
			sound_events_duration = {
				2.0213124752045,
				1.7471458911896,
				2.5593957901001,
				2.8821249008179
			}
		},
		pwe_gameplay_knocked_down_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_01",
				"pwe_gameplay_knocked_down_02",
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05",
				"pwe_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_knocked_down_01",
				"pwe_gameplay_knocked_down_02",
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05",
				"pwe_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				3.3558542728424,
				4.695333480835,
				1.548864543438,
				1.6000000238419,
				2.4834792613983,
				2.9985415935516
			}
		},
		pwe_gameplay_player_pounced_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_player_pounced_07",
				"pwe_gameplay_player_pounced_08",
				"pwe_gameplay_player_pounced_09",
				"pwe_gameplay_player_pounced_10",
				"pwe_gameplay_player_pounced_11",
				"pwe_gameplay_player_pounced_12",
				"pwe_gameplay_player_pounced_13",
				"pwe_gameplay_player_pounced_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_player_pounced_07",
				"pwe_gameplay_player_pounced_08",
				"pwe_gameplay_player_pounced_09",
				"pwe_gameplay_player_pounced_10",
				"pwe_gameplay_player_pounced_11",
				"pwe_gameplay_player_pounced_12",
				"pwe_gameplay_player_pounced_13",
				"pwe_gameplay_player_pounced_14"
			},
			sound_events_duration = {
				3.1520416736603,
				1.0867083072662,
				2.6682915687561,
				1.7609791755676,
				2.2080833911896,
				2.0916666984558,
				2.7163751125336,
				2.4906666278839
			}
		},
		pwe_gameplay_seeing_a_globadier_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			sound_events_duration = {
				0.99164581298828,
				3.1963334083557,
				1.3089582920075,
				3.290374994278,
				2.0898957252502
			}
		},
		pwe_gameplay_seeing_a_gutter_runner_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events_duration = {
				1.0780832767487,
				1.5039374828339,
				1.9376250505447,
				2.4213333129883,
				2.6882083415985,
				1.5567708015442
			}
		},
		pwe_gameplay_seeing_a_skaven_rat_ogre_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events_duration = {
				1.7894999980927,
				2.8174583911896,
				1.5526041984558,
				2.6048123836517,
				2.2405834197998,
				4.3446664810181
			}
		},
		pwe_gameplay_seeing_a_skaven_ratling_gun_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events_duration = {
				1.4262083768845,
				1.2635624408722,
				1.4607291221619,
				1.3288958072662,
				2.6527707576752,
				1.6027083396912,
				2.951708316803
			}
		},
		pwe_gameplay_seeing_a_skaven_slaver_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
			},
			sound_events_duration = {
				1.1537916660309,
				1.2984166145325,
				3.5764167308807,
				1.4687082767487,
				1.6713124513626,
				4.1267085075378,
				2.5171248912811,
				3.4214792251587
			}
		},
		pwe_gameplay_seeing_a_stormvermin_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_stormvermin_01",
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_03",
				"pwe_gameplay_seeing_a_stormvermin_04",
				"pwe_gameplay_seeing_a_stormvermin_05",
				"pwe_gameplay_seeing_a_stormvermin_06",
				"pwe_gameplay_seeing_a_stormvermin_07",
				"pwe_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_seeing_a_stormvermin_01",
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_03",
				"pwe_gameplay_seeing_a_stormvermin_04",
				"pwe_gameplay_seeing_a_stormvermin_05",
				"pwe_gameplay_seeing_a_stormvermin_06",
				"pwe_gameplay_seeing_a_stormvermin_07",
				"pwe_gameplay_seeing_a_stormvermin_08"
			},
			sound_events_duration = {
				1.6789375543594,
				2.6539375782013,
				1.488041639328,
				2.9750416278839,
				3.1721665859222,
				2.8721249103546,
				2.6800000667572,
				3.1020624637604
			}
		},
		pwe_gameplay_spots_ammo_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			sound_events_n = 9,
			category = "seen_items",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_03",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_04",
				"pwe_gameplay_spots_ammo_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_03",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_04",
				"pwe_gameplay_spots_ammo_05"
			},
			sound_events_duration = {
				1.0168124735355,
				1.0168124735355,
				1.0168124735355,
				1.4996041655541,
				2.5793957710266,
				1.4996041655541,
				1.4996041655541,
				2.050062417984,
				3.6066250801086
			}
		},
		pwe_gameplay_spots_bomb_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			sound_events_n = 9,
			category = "seen_items",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_02",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_04",
				"pwe_gameplay_spots_bomb_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_02",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_04",
				"pwe_gameplay_spots_bomb_05"
			},
			sound_events_duration = {
				1.3423854112625,
				1.3423854112625,
				1.3423854112625,
				3.2777917385101,
				0.67687499523163,
				0.67687499523163,
				0.67687499523163,
				1.8670208454132,
				5.7456874847412
			}
		},
		pwe_gameplay_spots_health_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			sound_events_n = 9,
			category = "seen_items",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_02",
				"pwe_gameplay_spots_health_03",
				"pwe_gameplay_spots_health_04",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_01"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_02",
				"pwe_gameplay_spots_health_03",
				"pwe_gameplay_spots_health_04",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_01"
			},
			sound_events_duration = {
				2.1787917613983,
				1.8781042098999,
				2.88316655159,
				2.5270624160767,
				1.3825207948685,
				1.3825207948685,
				1.3825207948685,
				2.1787917613983,
				2.1787917613983
			}
		},
		pwe_gameplay_spots_potion_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "ping_dialogues_honduras",
			sound_events_n = 11,
			category = "seen_items",
			dialogue_animations_n = 11,
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
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_02",
				"pwe_gameplay_spots_potion_03",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_02",
				"pwe_gameplay_spots_potion_03",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_05"
			},
			sound_events_duration = {
				1.4769062995911,
				1.4769062995911,
				1.4769062995911,
				1.4769062995911,
				2.8501250743866,
				3.947208404541,
				1.2878124713898,
				1.2878124713898,
				1.2878124713898,
				1.2878124713898,
				2.7670624256134
			}
		},
		pwe_gameplay_witch_hunter_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_grabbed_01",
				"pwe_gameplay_witch_hunter_grabbed_02",
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_04",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gameplay_witch_hunter_grabbed_01",
				"pwe_gameplay_witch_hunter_grabbed_02",
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_04",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_06"
			},
			sound_events_duration = {
				1.564333319664,
				1.3977082967758,
				4.9106874465942,
				2.079895734787,
				4.8246250152588,
				1.2140208482742
			}
		},
		pwh_gameplay_bright_wizard_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_grabbed_01",
				"pwh_gameplay_bright_wizard_grabbed_02",
				"pwh_gameplay_bright_wizard_grabbed_03",
				"pwh_gameplay_bright_wizard_grabbed_04",
				"pwh_gameplay_bright_wizard_grabbed_05",
				"pwh_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwh_gameplay_bright_wizard_grabbed_04 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pwh_gameplay_bright_wizard_grabbed_01",
				"pwh_gameplay_bright_wizard_grabbed_02",
				"pwh_gameplay_bright_wizard_grabbed_03",
				"pwh_gameplay_bright_wizard_grabbed_04",
				"pwh_gameplay_bright_wizard_grabbed_05",
				"pwh_gameplay_bright_wizard_grabbed_06"
			},
			sound_events_duration = {
				1.0245208740234,
				1.7937083244324,
				2.2235832214356,
				1.5746250152588,
				2.7115833759308,
				2.0618958473206
			}
		},
		pwh_gameplay_dwarf_ranger_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			sound_events_duration = {
				6.6559376716614,
				4.7599167823792,
				4.1109580993652,
				4.2269582748413,
				3.3395833969116,
				3.5397291183472,
				5.2292709350586,
				5.6597499847412
			}
		},
		pwh_gameplay_empire_soldier_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_grabbed_01",
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_03",
				"pwh_gameplay_empire_soldier_grabbed_04",
				"pwh_gameplay_empire_soldier_grabbed_05",
				"pwh_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_empire_soldier_grabbed_01",
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_03",
				"pwh_gameplay_empire_soldier_grabbed_04",
				"pwh_gameplay_empire_soldier_grabbed_05",
				"pwh_gameplay_empire_soldier_grabbed_06"
			},
			sound_events_duration = {
				1.3242917060852,
				5.6487708091736,
				2.1114583015442,
				2.3381249904633,
				2.7741665840149,
				1.4644166231155
			}
		},
		pwh_gameplay_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				1.3382083177566,
				2.1602082252502,
				4.1698956489563,
				2.4713542461395,
				1.4846249818802,
				2.2484166622162
			}
		},
		pwh_gameplay_hanging_help_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			sound_events_duration = {
				2.4445834159851,
				1.726083278656,
				1.9011458158493,
				1.6703333854675,
				2.4530000686645,
				3.1792917251587
			}
		},
		pwh_gameplay_healing_draught_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "seen_items",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_04",
				"pwh_gameplay_healing_draught_05",
				"pwh_gameplay_healing_draught_06",
				"pwh_gameplay_healing_draught_07",
				"pwh_gameplay_healing_draught_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_04",
				"pwh_gameplay_healing_draught_05",
				"pwh_gameplay_healing_draught_06",
				"pwh_gameplay_healing_draught_07",
				"pwh_gameplay_healing_draught_08"
			},
			sound_events_duration = {
				1.167208313942,
				1.5602707862854,
				1.9068332910538,
				2.0719165802002,
				1.6317917108536,
				2.0558958053589,
				1.2922291755676,
				2.8157291412353
			}
		},
		pwh_gameplay_heard_bright_wizard_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwh_gameplay_heard_bright_wizard_in_trouble_01",
				"pwh_gameplay_heard_bright_wizard_in_trouble_02",
				"pwh_gameplay_heard_bright_wizard_in_trouble_03",
				"pwh_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_heard_bright_wizard_in_trouble_01",
				"pwh_gameplay_heard_bright_wizard_in_trouble_02",
				"pwh_gameplay_heard_bright_wizard_in_trouble_03",
				"pwh_gameplay_heard_bright_wizard_in_trouble_04"
			},
			sound_events_duration = {
				1.3471875190735,
				2.3553333282471,
				3.1672916412353,
				1.7128541469574
			}
		},
		pwh_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			sound_events_duration = {
				2.743958234787,
				3.30433344841,
				1.4511458873749,
				2.6228125095367
			}
		},
		pwh_gameplay_heard_empire_soldier_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_02",
				"pwh_gameplay_heard_empire_soldier_in_trouble_03",
				"pwh_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_02",
				"pwh_gameplay_heard_empire_soldier_in_trouble_03",
				"pwh_gameplay_heard_empire_soldier_in_trouble_04"
			},
			sound_events_duration = {
				2.4131667613983,
				1.1640000343323,
				2.0070209503174,
				2.2758123874664
			}
		},
		pwh_gameplay_heard_wood_elf_in_trouble_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pwh_gameplay_heard_wood_elf_in_trouble_01",
				"pwh_gameplay_heard_wood_elf_in_trouble_02",
				"pwh_gameplay_heard_wood_elf_in_trouble_03",
				"pwh_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_heard_wood_elf_in_trouble_01",
				"pwh_gameplay_heard_wood_elf_in_trouble_02",
				"pwh_gameplay_heard_wood_elf_in_trouble_03",
				"pwh_gameplay_heard_wood_elf_in_trouble_04"
			},
			sound_events_duration = {
				4.7503333091736,
				3.3670415878296,
				2.4401249885559,
				3.1996250152588
			}
		},
		pwh_gameplay_knocked_down_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			sound_events_duration = {
				1.3382083177566,
				2.1602082252502,
				4.1698956489563,
				2.4713542461395,
				1.4846249818802,
				2.2484166622162
			}
		},
		pwh_gameplay_player_pounced_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			sound_events_n = 9,
			category = "player_alerts",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			sound_events_duration = {
				7.6838126182556,
				3.0750417709351,
				3.7804374694824,
				4.1342916488647,
				7.6838126182556,
				3.0750417709351,
				3.7804374694824,
				4.1342916488647,
				2.5830624103546
			}
		},
		pwh_gameplay_seeing_a_globadier_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			sound_events_duration = {
				1.1562291383743,
				1.9745833873749,
				1.7494583129883,
				0.72389584779739,
				2.5012707710266,
				2.8589582443237
			}
		},
		pwh_gameplay_seeing_a_gutter_runner_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events_duration = {
				1.1499999761581,
				1.5371249914169,
				2.4105625152588,
				1.6474167108536,
				1.6872708797455,
				1.5026041269302
			}
		},
		pwh_gameplay_seeing_a_skaven_rat_ogre_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events_duration = {
				0.99374997615814,
				2.6876873970032,
				2.3519582748413,
				2.4551665782928,
				2.4962084293366,
				2.7526667118073
			}
		},
		pwh_gameplay_seeing_a_skaven_ratling_gun_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events_duration = {
				1.6915208101273,
				2.1699583530426,
				1.7403957843781,
				2.4467499256134,
				1.688812494278,
				1.0182499885559,
				1.3904166221619
			}
		},
		pwh_gameplay_seeing_a_skaven_slaver_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_skaven_slaver_02",
				"pwh_gameplay_seeing_a_skaven_slaver_07",
				"pwh_gameplay_seeing_a_skaven_slaver_03",
				"pwh_gameplay_seeing_a_skaven_slaver_04",
				"pwh_gameplay_seeing_a_skaven_slaver_05",
				"pwh_gameplay_seeing_a_skaven_slaver_06",
				"pwh_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_skaven_slaver_02",
				"pwh_gameplay_seeing_a_skaven_slaver_07",
				"pwh_gameplay_seeing_a_skaven_slaver_03",
				"pwh_gameplay_seeing_a_skaven_slaver_04",
				"pwh_gameplay_seeing_a_skaven_slaver_05",
				"pwh_gameplay_seeing_a_skaven_slaver_06",
				"pwh_gameplay_seeing_a_skaven_slaver_08"
			},
			sound_events_duration = {
				0.73816668987274,
				1.3902916908264,
				1.963708281517,
				1.5728750228882,
				1.2996666431427,
				1.4105833768845,
				1.4785416126251,
				0.78702086210251
			}
		},
		pwh_gameplay_seeing_a_stormvermin_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_stormvermin_01",
				"pwh_gameplay_seeing_a_stormvermin_02",
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_04",
				"pwh_gameplay_seeing_a_stormvermin_05",
				"pwh_gameplay_seeing_a_stormvermin_06",
				"pwh_gameplay_seeing_a_stormvermin_07",
				"pwh_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_seeing_a_stormvermin_01",
				"pwh_gameplay_seeing_a_stormvermin_02",
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_04",
				"pwh_gameplay_seeing_a_stormvermin_05",
				"pwh_gameplay_seeing_a_stormvermin_06",
				"pwh_gameplay_seeing_a_stormvermin_07",
				"pwh_gameplay_seeing_a_stormvermin_08"
			},
			sound_events_duration = {
				1.275229215622,
				2.1979374885559,
				0.926020860672,
				2.738874912262,
				2.6363959312439,
				3.2690000534058,
				1.9176249504089,
				1.3986458778381
			}
		},
		pwh_gameplay_spots_ammo_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_02",
				"pwh_gameplay_spots_ammo_03",
				"pwh_gameplay_spots_ammo_04",
				"pwh_gameplay_spots_ammo_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_02",
				"pwh_gameplay_spots_ammo_03",
				"pwh_gameplay_spots_ammo_04",
				"pwh_gameplay_spots_ammo_05"
			},
			sound_events_duration = {
				0.78841668367386,
				1.8109583854675,
				2.2756667137146,
				2.4412915706634,
				2.1311249732971
			}
		},
		pwh_gameplay_spots_bomb_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			sound_events_n = 5,
			category = "seen_items",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_bomb_01",
				"pwh_gameplay_spots_bomb_02",
				"pwh_gameplay_spots_bomb_03",
				"pwh_gameplay_spots_bomb_04",
				"pwh_gameplay_spots_bomb_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_spots_bomb_01",
				"pwh_gameplay_spots_bomb_02",
				"pwh_gameplay_spots_bomb_03",
				"pwh_gameplay_spots_bomb_04",
				"pwh_gameplay_spots_bomb_05"
			},
			sound_events_duration = {
				1.1236041784286,
				2.9355833530426,
				1.5158749818802,
				2.4151875972748,
				4.129020690918
			}
		},
		pwh_gameplay_spots_health_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 18,
			database = "ping_dialogues_honduras",
			sound_events_n = 18,
			category = "seen_items",
			dialogue_animations_n = 18,
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_02",
				"pwh_gameplay_spots_health_03",
				"pwh_gameplay_spots_health_04",
				"pwh_gameplay_spots_health_05",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_02",
				"pwh_gameplay_spots_health_03",
				"pwh_gameplay_spots_health_04",
				"pwh_gameplay_spots_health_05",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			sound_events_duration = {
				1.5,
				1.7714289426804,
				2.192125082016,
				1.7206457853317,
				2.4975416660309,
				1.1868958473206,
				2.5612082481384,
				2.2792291641235,
				1.8147916793823,
				1.974312543869,
				1.9256666898727,
				3.2132709026337,
				1.3126041889191,
				2.1138124465942,
				2.8836250305176,
				3.6013123989105,
				1.733958363533,
				2.0114998817444
			}
		},
		pwh_gameplay_spots_potion_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "ping_dialogues_honduras",
			sound_events_n = 15,
			category = "seen_items",
			dialogue_animations_n = 15,
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_potion_01",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18",
				"pwh_gameplay_spots_potion_19",
				"pwh_gameplay_spots_potion_20"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_spots_potion_01",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18",
				"pwh_gameplay_spots_potion_19",
				"pwh_gameplay_spots_potion_20"
			},
			sound_events_duration = {
				1.016937494278,
				1.0672708749771,
				1.3848750591278,
				1.0501041412354,
				1.6987916231155,
				1.3762916326523,
				1.9510416984558,
				2.1991457939148,
				1.7391250133514,
				2.3171665668488,
				3.1935625076294,
				1.8360625505447,
				1.2418124675751,
				1.7924166917801,
				2.0999999046326
			}
		},
		pwh_gameplay_wood_elf_grabbed_ping = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_grabbed_01",
				"pwh_gameplay_wood_elf_grabbed_03",
				"pwh_gameplay_wood_elf_grabbed_05",
				"pwh_gameplay_wood_elf_grabbed_02",
				"pwh_gameplay_wood_elf_grabbed_04",
				"pwh_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_wood_elf_grabbed_01",
				"pwh_gameplay_wood_elf_grabbed_03",
				"pwh_gameplay_wood_elf_grabbed_05",
				"pwh_gameplay_wood_elf_grabbed_02",
				"pwh_gameplay_wood_elf_grabbed_04",
				"pwh_gameplay_wood_elf_grabbed_06"
			},
			sound_events_duration = {
				1.3517708778381,
				2.3532500267029,
				1.8957707881927,
				1.2308750152588,
				1.9314999580383,
				2.6413125991821
			}
		}
	})
end
