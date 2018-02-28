return function ()
	define_rule({
		name = "pes_gameplay_casual_quotes",
		response = "pes_gameplay_casual_quotes",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"query_context",
				"is_forced",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
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
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_witch_hunter_being_helped_up",
		name = "pes_gameplay_witch_hunter_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_bright_wizard_being_helped_up",
		name = "pes_gameplay_bright_wizard_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wood_elf_being_helped_up",
		name = "pes_gameplay_wood_elf_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_dwarf_ranger_being_helped",
		name = "pes_gameplay_dwarf_ranger_being_helped",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_witch_hunter",
		response = "pes_gameplay_healing_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_bright_wizard",
		response = "pes_gameplay_healing_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_wood_elf",
		response = "pes_gameplay_healing_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_dwarf_ranger",
		response = "pes_gameplay_healing_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_witch_hunter",
		response = "pes_gameplay_helped_by_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_bright_wizard",
		response = "pes_gameplay_helped_by_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_wood_elf",
		response = "pes_gameplay_helped_by_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_dwarf_ranger",
		response = "pes_gameplay_helped_by_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"user_memory",
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_low_on_health",
		response = "pes_gameplay_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"health_trigger"
			},
			{
				"query_context",
				"current_amount",
				OP.LTEQ,
				0.4
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				0.1
			},
			{
				"query_context",
				"trigger_type",
				OP.EQ,
				"decreasing"
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
				"user_memory",
				"low_health",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"low_health",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_low_on_health",
		response = "pes_gameplay_witch_hunter_low_on_health",
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
				"pwh_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pwh",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pwh",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_low_on_health",
		response = "pes_gameplay_bright_wizard_low_on_health",
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
				"pbw_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pbw",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pbw",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_low_on_health",
		response = "pes_gameplay_wood_elf_low_on_health",
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
				"pwe_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pwe",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pwe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_low_on_health",
		response = "pes_gameplay_dwarf_ranger_low_on_health",
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
				"pdr_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pdr",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pdr",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_ammo",
		response = "pes_gameplay_spots_ammo",
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
				"ammo"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				25
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"faction_memory",
				"last_saw_ammo",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_ammo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_health",
		response = "pes_gameplay_spots_health",
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
				"health"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				25
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_health",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_health",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_draught",
		response = "pes_gameplay_healing_draught",
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
				"health_flask"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				25
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_health",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_health",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_potion",
		response = "pes_gameplay_spots_potion",
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
				"potion"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				25
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_potion",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_potion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_bomb",
		response = "pes_gameplay_spots_bomb",
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
				"bomb"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				25
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_bomb",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_bomb",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_out_of_ammo",
		response = "pes_gameplay_out_of_ammo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"reload_failed"
			},
			{
				"query_context",
				"fail_reason",
				OP.EQ,
				"out_of_ammo"
			},
			{
				"query_context",
				"item_name",
				OP.NEQ,
				"healthkit_first_aid_kit_01"
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
				"user_memory",
				"time_since_out_of_ammo",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_out_of_ammo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_using_potion",
		response = "pes_gameplay_using_potion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_healing_draught"
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
				"user_memory",
				"time_since_used_potion",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_used_potion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_self_heal",
		response = "pes_gameplay_self_heal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"user_memory",
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_throwing_bomb",
		response = "pes_gameplay_throwing_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"throwing_item"
			},
			{
				"query_context",
				"item_type",
				OP.EQ,
				"grenade"
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
				"user_memory",
				"time_since_throwing_bomb",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_throwing_bomb",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_activating_magic_weapon_offensive",
		response = "pes_gameplay_activating_magic_weapon_offensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"stance_triggered"
			},
			{
				"query_context",
				"stance_type",
				OP.EQ,
				"offensive"
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
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_activating_magic_weapon_defensive",
		response = "pes_gameplay_activating_magic_weapon_defensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"stance_triggered"
			},
			{
				"query_context",
				"stance_type",
				OP.EQ,
				"defensive"
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
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_witch_hunter",
		response = "pes_gameplay_friendly_fire_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_bright_wizard",
		response = "pes_gameplay_friendly_fire_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_wood_elf",
		response = "pes_gameplay_friendly_fire_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_dwarf_ranger",
		response = "pes_gameplay_friendly_fire_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"user_memory",
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_encouraging_words",
		response = "pes_gameplay_encouraging_words",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friends_close"
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				180
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_special_enemy_kill_melee",
		response = "pes_gameplay_special_enemy_kill_melee",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"hit_zone",
				OP.EQ,
				"head"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMEDIFF,
				OP.GT,
				220
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_special_enemy_kill_ranged",
		response = "pes_gameplay_special_enemy_kill_ranged",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"hit_zone",
				OP.EQ,
				"head"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_special_kill_ranged",
				OP.TIMEDIFF,
				OP.GT,
				220
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_kill_ranged",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_on_a_frenzy",
		response = "pes_gameplay_witch_hunter_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_witch_hunter",
				OP.TIMEDIFF,
				OP.GT,
				90
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_witch_hunter",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_on_a_frenzy",
		response = "pes_gameplay_bright_wizard_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_bright_wizard",
				OP.TIMEDIFF,
				OP.GT,
				90
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_bright_wizard",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_on_a_frenzy",
		response = "pes_gameplay_wood_elf_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_wood_elf",
				OP.TIMEDIFF,
				OP.GT,
				90
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_wood_elf",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_on_a_frenzy",
		response = "pes_gameplay_dwarf_ranger_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_dwarf_ranger",
				OP.TIMEDIFF,
				OP.GT,
				90
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_dwarf_ranger",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_witch_hunter",
		response = "pes_gameplay_armoured_enemy_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_bright_wizard",
		response = "pes_gameplay_armoured_enemy_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_wood_elf",
		response = "pes_gameplay_armoured_enemy_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_dwarf_ranger",
		response = "pes_gameplay_armoured_enemy_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_activate_ability_knight",
		name = "pes_activate_ability_knight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"player_career",
				OP.EQ,
				"es_knight"
			}
		}
	})
	define_rule({
		response = "pes_activate_ability_mercenary",
		name = "pes_activate_ability_mercenary",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"player_career",
				OP.EQ,
				"es_mercenary"
			}
		}
	})
	define_rule({
		response = "pes_activate_ability_huntsman",
		name = "pes_activate_ability_huntsman",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"player_career",
				OP.EQ,
				"es_huntsman"
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bile_troll_incapacitaded",
		response = "pes_gameplay_bile_troll_incapacitaded",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"troll_incapacitaded"
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
				"troll_incapacitaded",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"troll_incapacitaded",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_eaten",
		response = "pes_gameplay_wood_elf_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_eaten",
		response = "pes_gameplay_bright_wizard_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_eaten",
		response = "pes_gameplay_dwarf_ranger_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_eaten",
		response = "pes_gameplay_witch_hunter_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_witch_hunter",
		response = "pes_gameplay_parry_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_wood_elf",
		response = "pes_gameplay_parry_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_dwarf_ranger",
		response = "pes_gameplay_parry_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_bright_wizard",
		response = "pes_gameplay_parry_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_interacting_with_objective",
		response = "pes_objective_interacting_with_objective",
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
				"objective_interacting_with_objective"
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
				"time_since_objective_interacting_with_objective_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_interacting_with_objective_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_nearing_objective_deadline",
		response = "pes_objective_nearing_objective_deadline",
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
				"objective_nearing_objective_deadline"
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
				"time_since_objective_nearing_objective_deadline_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_nearing_objective_deadline_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_achieved_all_but_one_goal",
		response = "pes_objective_achieved_all_but_one_goal",
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
				"objective_achieved_all_but_one_goal"
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
				"time_since_objective_achieved_all_but_one_goal_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_achieved_all_but_one_goal_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_goal_achieved_more_left",
		response = "pes_objective_goal_achieved_more_left",
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
				"objective_goal_achieved_more_left"
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
				"time_since_objective_goal_achieved_more_left_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_goal_achieved_more_left_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_goal_achieved_escape",
		response = "pes_objective_goal_achieved_escape",
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
				"objective_goal_achieved_escape"
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
				"time_since_objective_goal_achieved_escape_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_goal_achieved_escape_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_this_way",
		response = "pes_objective_correct_path_this_way",
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
				"this_way"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_up",
		response = "pes_objective_correct_path_up",
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
				"this_way_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_up",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_down",
		response = "pes_objective_correct_path_down",
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
				"this_way_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_down",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_bridge",
		response = "pes_objective_correct_path_bridge",
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
				"this_way_bridge"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_bridge",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found way_bridge",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_street",
		response = "pes_objective_correct_path_street",
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
				"this_way_street"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_street",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_street",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_door",
		response = "pes_objective_correct_path_door",
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
				"this_way_door"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_door",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_door",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_stairs_up",
		response = "pes_objective_correct_path_stairs_up",
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
				"this_way_stairs_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7
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
				"time_since_found_way_stairs_up",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_stairs_down",
		response = "pes_objective_correct_path_stairs_down",
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
				"this_way_stairs_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				7
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
				"time_since_found_way_stairs_down",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_dropping_grimoire",
		response = "pes_objective_dropping_grimoire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"throwing_item"
			},
			{
				"query_context",
				"item_type",
				OP.EQ,
				"grimoire"
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
				"user_memory",
				"time_since_throwing_grimoire",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_throwing_grimoire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_picking_up_grimoire",
		response = "pes_objective_picking_up_grimoire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_pickup"
			},
			{
				"query_context",
				"pickup_name",
				OP.EQ,
				"pickup_grimoire"
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
				"user_memory",
				"time_since_picking_up_grimoire",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_picking_up_grimoire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dead_body",
		response = "pes_gameplay_dead_body",
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
				"generic_spotting_dead_body"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"global_context",
				"level_time ",
				OP.GT,
				90
			},
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMEDIFF,
				OP.GT,
				180
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dead_end",
		response = "pes_gameplay_dead_end",
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
				"generic_dead_end"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_dead_end",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_dead_end",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_across",
		response = "pes_objective_correct_path_across",
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
				"this_way_correct_path_across"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_correct_path_across",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_across",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_alley",
		response = "pes_objective_correct_path_alley",
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
				"this_way_correct_path_alley"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_correct_path_alley",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_alley",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_ladder_down",
		response = "pes_objective_correct_path_ladder_down",
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
				"this_way_correct_path_ladder_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_correct_path_ladder_down",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_ladder_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_ladder_up",
		response = "pes_objective_correct_path_ladder_up",
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
				"this_way_correct_path_ladder_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_correct_path_ladder_up",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_ladder_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_globadier_guck",
		response = "pes_gameplay_globadier_guck",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"pwg_projectile"
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
				"pwg_projectile_thrown",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_projectile_thrown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hit_by_goo",
		name = "pes_gameplay_hit_by_goo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo"
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
			}
		}
	})
	define_rule({
		name = "pes_gameplay_taking_heavy_damage",
		response = "pes_gameplay_taking_heavy_damage",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"health_trigger"
			},
			{
				"query_context",
				"trigger_type",
				OP.EQ,
				"losing_rapidly"
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
				"user_memory",
				"time_since_taking_heavy_damage",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taking_heavy_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_incoming_globadier",
		response = "pes_gameplay_incoming_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"pwg_suicide_run"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pwg_suicides",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_suicides",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_knocked_down",
		response = "pes_gameplay_knocked_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
				"user_memory",
				"time_since_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMESET
			},
			{
				"faction_memory",
				"times_we_downed",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_gameplay_player_pounced",
		response = "pes_gameplay_player_pounced",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
				"user_memory",
				"time_since_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_grabbed",
		response = "pes_gameplay_witch_hunter_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_grabbed",
		response = "pes_gameplay_bright_wizard_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_grabbed",
		response = "pes_gameplay_dwarf_ranger_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_grabbed",
		response = "pes_gameplay_wood_elf_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_saltzpyre",
		response = "pes_gameplay_chaos_wizard_leech_leeching_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_sienna",
		response = "pes_gameplay_chaos_wizard_leech_leeching_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_bardin",
		response = "pes_gameplay_chaos_wizard_leech_leeching_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_keriliian",
		response = "pes_gameplay_chaos_wizard_leech_leeching_keriliian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_witch_hunter_in_trouble",
		response = "pes_gameplay_heard_witch_hunter_in_trouble",
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
				"pwh_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_bright_wizard_in_trouble",
		response = "pes_gameplay_heard_bright_wizard_in_trouble",
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
				"pbw_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_wood_elf_in_trouble",
		response = "pes_gameplay_heard_wood_elf_in_trouble",
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
				"pwe_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_dwarf_ranger_in_trouble",
		response = "pes_gameplay_heard_dwarf_ranger_in_trouble",
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
				"pdr_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_no_nearby_teammates",
		response = "pes_gameplay_no_nearby_teammates",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friends_distant"
			},
			{
				"user_context",
				"friends_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"user_memory",
				"time_since_alone",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_dead",
		response = "pes_gameplay_witch_hunter_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pwh_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pwh_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_dead",
		response = "pes_gameplay_bright_wizard_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pbw_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pbw_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_dead",
		response = "pes_gameplay_wood_elf_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pwe_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pwe_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_dead",
		response = "pes_gameplay_dwarf_ranger_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pdr_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pdr_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ambush_horde_spawned",
		response = "pes_gameplay_ambush_horde_spawned",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
			},
			{
				"query_context",
				"horde_type",
				OP.EQ,
				"ambush"
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
				"time_since_ambush",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bile_troll_before_puke",
		response = "pes_gameplay_bile_troll_before_puke",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"before_puke"
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
				"before_puke",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"before_puke",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_last_hero_standing",
		name = "pes_last_hero_standing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"last_hero_standing"
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
			}
		}
	})
	define_rule({
		name = "pes_curse",
		response = "pes_curse",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_close"
			},
			{
				"query_context",
				"num_units      ",
				OP.GT,
				5
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_targeted_by_ratling",
		response = "pes_targeted_by_ratling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ratling_target"
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
				"user_memory",
				"time_since_ratling_target",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_target",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_stormvermin",
		response = "pes_gameplay_seeing_a_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
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
				"last_seen_storm_vermin_commander",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_gutter_runner",
		response = "pes_gameplay_seeing_a_gutter_runner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_gutter_runner",
		response = "pes_gameplay_hearing_a_gutter_runner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_globadier",
		response = "pes_gameplay_seeing_a_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_globadier",
		response = "pes_gameplay_hearing_a_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_rat_ogre",
		response = "pes_gameplay_seeing_a_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_incoming_skaven_rat_ogre",
		response = "pes_gameplay_incoming_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"rat_ogre_charge"
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
				"ogre_charges",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"ogre_charges",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hears_incoming_horde",
		response = "pes_gameplay_hears_incoming_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
			},
			{
				"query_context",
				"horde_type",
				OP.EQ,
				"vector"
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
				"time_since_horde",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_horde",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_patrol_stormvermin",
		response = "pes_gameplay_seeing_a_skaven_patrol_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_patrol_stormvermin",
		response = "pes_gameplay_hearing_a_skaven_patrol_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_slaver",
		response = "pes_gameplay_seeing_a_skaven_slaver",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				4
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
				"time_since_slaver",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_ratling_gun",
		response = "pes_gameplay_seeing_a_skaven_ratling_gun",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_ratling_gun",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_tension_no_enemies",
		response = "pes_gameplay_tension_no_enemies",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_distant"
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				5
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				90
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_globadier",
		response = "pes_gameplay_killing_globadier",
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
				"user_memory",
				"time_since_killing_globadier",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_globadier",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_ratling",
		response = "pes_gameplay_killing_ratling",
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
				"user_memory",
				"time_since_killing_ratling",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_ratling",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_packmaster",
		response = "pes_gameplay_killing_packmaster",
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
				"user_memory",
				"time_since_killing_packmaster",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_packmaster",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_gutterrunner",
		response = "pes_gameplay_killing_gutterrunner",
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
				"user_memory",
				"time_since_killing_gutterrunner",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_gutterrunner",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_lootrat",
		response = "pes_gameplay_killing_lootrat",
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
				"skaven_loot_rat"
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
				"user_memory",
				"time_since_killing_lootrat",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_lootrat",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_gutter_runner_combat",
		response = "pes_gameplay_hearing_a_gutter_runner_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_globadier_combat",
		response = "pes_gameplay_hearing_a_globadier_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_rat_ogre_combat",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_ratling_gun_combat",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_pm",
		response = "pes_gameplay_seeing_a_pm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_scr",
		response = "pes_gameplay_seeing_a_scr",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"seeing_a_scr",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"seeing_a_scr",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_pm",
		response = "pes_gameplay_hearing_a_pm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_pm_in_combat",
		response = "pes_gameplay_hearing_a_pm_in_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_spawn_combat",
		response = "pes_gameplay_hearing_a_chaos_spawn_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_spawn",
		response = "pes_gameplay_seeing_a_chaos_spawn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_spawn",
		response = "pes_gameplay_hearing_a_chaos_spawn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_spawn",
		response = "pes_gameplay_killing_a_chaos_spawn",
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
				"chaos_spawn"
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
				"user_memory",
				"time_since_killing_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_chaos_spawn",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_stormfiend",
		response = "pes_gameplay_killing_a_stormfiend",
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
				"skaven_stormfiend"
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
				"user_memory",
				"time_since_killing_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_skaven_stormfiend",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_warrior_combat",
		response = "pes_gameplay_hearing_a_chaos_warrior_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_plague",
		response = "pes_gameplay_hearing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_plague_combat",
		response = "pes_gameplay_hearing_a_chaos_wizard_plague_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_tentacle",
		response = "pes_gameplay_hearing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		response = "pes_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_wind",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_wind_combat",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_stormfiend",
		response = "pes_gameplay_hearing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_stormfiend_combat",
		response = "pes_gameplay_hearing_a_stormfiend_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_troll",
		response = "pes_gameplay_hearing_a_troll",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_troll_combat",
		response = "pes_gameplay_hearing_a_troll_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_marauder_berserker_combat",
		response = "pes_gameplay_hearing_marauder_berserker_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_berzerker"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_heard_chaos_berzerker",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_berzerker",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_warrior",
		response = "pes_gameplay_killing_a_chaos_warrior",
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
				"chaos_warrior"
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
				"user_memory",
				"time_since_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_warrior",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_warrior_champion",
		response = "pes_gameplay_killing_a_chaos_warrior_champion",
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
				"chaos_exalted_champion"
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
				"user_memory",
				"time_since_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_exalted_champion",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_plague",
		response = "pes_gameplay_killing_a_chaos_wizard_plague",
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
				"chaos_plague_sorcerer"
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
				"user_memory",
				"time_since_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_plague_sorcerer",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_tentacle",
		response = "pes_gameplay_killing_a_chaos_wizard_tentacle",
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
				"chaos_tentacle_sorcerer"
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
				"user_memory",
				"time_since_chaos_wizard_tentacle",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_wizard_tentacle",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_wind",
		response = "pes_gameplay_killing_a_chaos_wizard_wind",
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
				"chaos_vortex_sorcerer"
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
				"user_memory",
				"time_since_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_vortex_sorcerer",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_skaven_warpfire_thrower",
		response = "pes_gameplay_killing_a_skaven_warpfire_thrower",
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
				"skaven_warpfire_thrower"
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
				"user_memory",
				"time_since_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_skaven_warpfire_thrower",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_troll",
		response = "pes_gameplay_killing_a_troll",
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
				"chaos_troll"
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
				"user_memory",
				"time_since_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_troll",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_warrior",
		response = "pes_gameplay_seeing_a_chaos_warrior",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_warrior_champion_combat",
		response = "pes_gameplay_seeing_a_chaos_warrior_champion_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_exalted_champion"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_exalted_champion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_wizard_plague",
		response = "pes_gameplay_seeing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_wizard_tentacle",
		response = "pes_gameplay_seeing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_wizard_wind",
		response = "pes_gameplay_seeing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_shield_stormvermin",
		response = "pes_gameplay_seeing_a_shield_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_skaven_storm_vermin_with_shield",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_storm_vermin_with_shield",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_Skaven_warpfire_thrower",
		response = "pes_gameplay_seeing_a_Skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_stormfiend",
		response = "pes_gameplay_seeing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_troll",
		response = "pes_gameplay_seeing_a_troll",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
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
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_rat_ogre",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_leech",
		response = "pes_gameplay_hearing_a_chaos_wizard_leech",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"last_heard_leech",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_leech",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_leech",
		response = "pes_gameplay_killing_a_chaos_wizard_leech",
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
				"chaos_corruptor_sorcerer"
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
				"user_memory",
				"time_since_chaos_wizard_leech",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_wizard_leech",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	add_dialogues({
		pes_gameplay_hearing_a_gutter_runner_combat = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hearing_a_gutter_runner_combat_03",
				"pes_gameplay_hearing_a_gutter_runner_combat_04",
				"pes_gameplay_hearing_a_gutter_runner_combat_05",
				"pes_gameplay_hearing_a_gutter_runner_combat_06",
				"pes_gameplay_hearing_a_gutter_runner_combat_07",
				"pes_gameplay_hearing_a_gutter_runner_combat_08"
			},
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
				"pes_gameplay_hearing_a_gutter_runner_combat_03",
				"pes_gameplay_hearing_a_gutter_runner_combat_04",
				"pes_gameplay_hearing_a_gutter_runner_combat_05",
				"pes_gameplay_hearing_a_gutter_runner_combat_06",
				"pes_gameplay_hearing_a_gutter_runner_combat_07",
				"pes_gameplay_hearing_a_gutter_runner_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_healing_dwarf_ranger = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_healing_dwarf_ranger_03",
				"pes_gameplay_healing_dwarf_ranger_04",
				"pes_gameplay_healing_dwarf_ranger_05",
				"pes_gameplay_healing_dwarf_ranger_06",
				"pes_gameplay_healing_dwarf_ranger_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_healing_dwarf_ranger_03",
				"pes_gameplay_healing_dwarf_ranger_04",
				"pes_gameplay_healing_dwarf_ranger_05",
				"pes_gameplay_healing_dwarf_ranger_06",
				"pes_gameplay_healing_dwarf_ranger_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_being_helped_up = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_wood_elf_being_helped_up_01",
				"pes_gameplay_wood_elf_being_helped_up_02",
				"pes_gameplay_wood_elf_being_helped_up_05",
				"pes_gameplay_wood_elf_being_helped_up_06",
				"pes_gameplay_wood_elf_being_helped_up_07",
				"pes_gameplay_wood_elf_being_helped_up_08",
				"pes_gameplay_wood_elf_being_helped_up_09",
				"pes_gameplay_wood_elf_being_helped_up_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_wood_elf_being_helped_up_01",
				"pes_gameplay_wood_elf_being_helped_up_02",
				"pes_gameplay_wood_elf_being_helped_up_05",
				"pes_gameplay_wood_elf_being_helped_up_06",
				"pes_gameplay_wood_elf_being_helped_up_07",
				"pes_gameplay_wood_elf_being_helped_up_08",
				"pes_gameplay_wood_elf_being_helped_up_09",
				"pes_gameplay_wood_elf_being_helped_up_10"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_ladder_up = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_ladder_up_01",
				"pes_objective_correct_path_ladder_up_02",
				"pes_objective_correct_path_ladder_up_03",
				"pes_objective_correct_path_ladder_up_04"
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
				"pes_objective_correct_path_ladder_up_01",
				"pes_objective_correct_path_ladder_up_02",
				"pes_objective_correct_path_ladder_up_03",
				"pes_objective_correct_path_ladder_up_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_bright_wizard_dead_03",
				"pes_gameplay_bright_wizard_dead_05",
				"pes_gameplay_bright_wizard_dead_06",
				"pes_gameplay_bright_wizard_dead_07"
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
				"pes_gameplay_bright_wizard_dead_03",
				"pes_gameplay_bright_wizard_dead_05",
				"pes_gameplay_bright_wizard_dead_06",
				"pes_gameplay_bright_wizard_dead_07"
			},
			randomize_indexes = {}
		},
		pes_activate_ability_huntsman = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "activate_ability",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_activate_ability_huntsman_01",
				"pes_activate_ability_huntsman_02",
				"pes_activate_ability_huntsman_03",
				"pes_activate_ability_huntsman_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_activate_ability_huntsman_01",
				"pes_activate_ability_huntsman_02",
				"pes_activate_ability_huntsman_03",
				"pes_activate_ability_huntsman_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_lootrat = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_killing_lootrat_03",
				"pes_gameplay_killing_lootrat_05",
				"pes_gameplay_killing_lootrat_06",
				"pes_gameplay_killing_lootrat_07"
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
				"pes_gameplay_killing_lootrat_03",
				"pes_gameplay_killing_lootrat_05",
				"pes_gameplay_killing_lootrat_06",
				"pes_gameplay_killing_lootrat_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_wizard_plague = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_plague_01",
				"pes_gameplay_killing_a_chaos_wizard_plague_02",
				"pes_gameplay_killing_a_chaos_wizard_plague_03",
				"pes_gameplay_killing_a_chaos_wizard_plague_04",
				"pes_gameplay_killing_a_chaos_wizard_plague_05",
				"pes_gameplay_killing_a_chaos_wizard_plague_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_wizard_plague_01",
				"pes_gameplay_killing_a_chaos_wizard_plague_02",
				"pes_gameplay_killing_a_chaos_wizard_plague_03",
				"pes_gameplay_killing_a_chaos_wizard_plague_04",
				"pes_gameplay_killing_a_chaos_wizard_plague_05",
				"pes_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_healing_witch_hunter = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_healing_witch_hunter_01",
				"pes_gameplay_healing_witch_hunter_02",
				"pes_gameplay_healing_witch_hunter_03",
				"pes_gameplay_healing_witch_hunter_04"
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
				"pes_gameplay_healing_witch_hunter_01",
				"pes_gameplay_healing_witch_hunter_02",
				"pes_gameplay_healing_witch_hunter_03",
				"pes_gameplay_healing_witch_hunter_04"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_stairs_up = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_objective_correct_path_stairs_up_05",
				"pes_objective_correct_path_stairs_up_06",
				"pes_objective_correct_path_stairs_up_07",
				"pes_objective_correct_path_stairs_up_08",
				"pes_objective_correct_path_stairs_up_09"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_correct_path_stairs_up_05",
				"pes_objective_correct_path_stairs_up_06",
				"pes_objective_correct_path_stairs_up_07",
				"pes_objective_correct_path_stairs_up_08",
				"pes_objective_correct_path_stairs_up_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_gutter_runner = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06",
				"pes_gameplay_seeing_a_gutter_runner_07",
				"pes_gameplay_seeing_a_gutter_runner_08",
				"pes_gameplay_seeing_a_gutter_runner_09"
			},
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
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06",
				"pes_gameplay_seeing_a_gutter_runner_07",
				"pes_gameplay_seeing_a_gutter_runner_08",
				"pes_gameplay_seeing_a_gutter_runner_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_chaos_wizard_wind = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_wind_01",
				"pes_gameplay_seeing_a_chaos_wizard_wind_02",
				"pes_gameplay_seeing_a_chaos_wizard_wind_03",
				"pes_gameplay_seeing_a_chaos_wizard_wind_04"
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
				"pes_gameplay_seeing_a_chaos_wizard_wind_01",
				"pes_gameplay_seeing_a_chaos_wizard_wind_02",
				"pes_gameplay_seeing_a_chaos_wizard_wind_03",
				"pes_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_wood_elf_in_trouble = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_wood_elf_in_trouble_04",
				"pes_gameplay_heard_wood_elf_in_trouble_05",
				"pes_gameplay_heard_wood_elf_in_trouble_06",
				"pes_gameplay_heard_wood_elf_in_trouble_07"
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
				"pes_gameplay_heard_wood_elf_in_trouble_04",
				"pes_gameplay_heard_wood_elf_in_trouble_05",
				"pes_gameplay_heard_wood_elf_in_trouble_06",
				"pes_gameplay_heard_wood_elf_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_chaos_warrior = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_chaos_warrior_01",
				"pes_gameplay_seeing_a_chaos_warrior_02",
				"pes_gameplay_seeing_a_chaos_warrior_03",
				"pes_gameplay_seeing_a_chaos_warrior_04",
				"pes_gameplay_seeing_a_chaos_warrior_05",
				"pes_gameplay_seeing_a_chaos_warrior_06",
				"pes_gameplay_seeing_a_chaos_warrior_07",
				"pes_gameplay_seeing_a_chaos_warrior_08"
			},
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
				"pes_gameplay_seeing_a_chaos_warrior_01",
				"pes_gameplay_seeing_a_chaos_warrior_02",
				"pes_gameplay_seeing_a_chaos_warrior_03",
				"pes_gameplay_seeing_a_chaos_warrior_04",
				"pes_gameplay_seeing_a_chaos_warrior_05",
				"pes_gameplay_seeing_a_chaos_warrior_06",
				"pes_gameplay_seeing_a_chaos_warrior_07",
				"pes_gameplay_seeing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_down_01",
				"pes_objective_correct_path_down_02",
				"pes_objective_correct_path_down_04",
				"pes_objective_correct_path_down_05"
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
				"pes_objective_correct_path_down_01",
				"pes_objective_correct_path_down_02",
				"pes_objective_correct_path_down_04",
				"pes_objective_correct_path_down_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_patrol_stormvermin = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_13"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_witch_hunter_dead_04",
				"pes_gameplay_witch_hunter_dead_05",
				"pes_gameplay_witch_hunter_dead_06",
				"pes_gameplay_witch_hunter_dead_07"
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
				"pes_gameplay_witch_hunter_dead_04",
				"pes_gameplay_witch_hunter_dead_05",
				"pes_gameplay_witch_hunter_dead_06",
				"pes_gameplay_witch_hunter_dead_07"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_across = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_across_01",
				"pes_objective_correct_path_across_02",
				"pes_objective_correct_path_across_03",
				"pes_objective_correct_path_across_04"
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
				"pes_objective_correct_path_across_01",
				"pes_objective_correct_path_across_02",
				"pes_objective_correct_path_across_03",
				"pes_objective_correct_path_across_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_grabbed = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_07",
				"pes_gameplay_dwarf_ranger_grabbed_08",
				"pes_gameplay_dwarf_ranger_grabbed_09",
				"pes_gameplay_dwarf_ranger_grabbed_10",
				"pes_gameplay_dwarf_ranger_grabbed_11",
				"pes_gameplay_dwarf_ranger_grabbed_12",
				"pes_gameplay_dwarf_ranger_grabbed_13",
				"pes_gameplay_dwarf_ranger_grabbed_14"
			},
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
				"face_neutral",
				"face_neutral",
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
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_07",
				"pes_gameplay_dwarf_ranger_grabbed_08",
				"pes_gameplay_dwarf_ranger_grabbed_09",
				"pes_gameplay_dwarf_ranger_grabbed_10",
				"pes_gameplay_dwarf_ranger_grabbed_11",
				"pes_gameplay_dwarf_ranger_grabbed_12",
				"pes_gameplay_dwarf_ranger_grabbed_13",
				"pes_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_globadier_guck = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_globadier_guck_01",
				"pes_gameplay_globadier_guck_02",
				"pes_gameplay_globadier_guck_07",
				"pes_gameplay_globadier_guck_08",
				"pes_gameplay_globadier_guck_09",
				"pes_gameplay_globadier_guck_10",
				"pes_gameplay_globadier_guck_11",
				"pes_gameplay_globadier_guck_12"
			},
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_globadier_guck_01",
				"pes_gameplay_globadier_guck_02",
				"pes_gameplay_globadier_guck_07",
				"pes_gameplay_globadier_guck_08",
				"pes_gameplay_globadier_guck_09",
				"pes_gameplay_globadier_guck_10",
				"pes_gameplay_globadier_guck_11",
				"pes_gameplay_globadier_guck_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre_combat = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
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
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_being_helped = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_dwarf_ranger_being_helped_up_02",
				"pes_gameplay_dwarf_ranger_being_helped_up_04",
				"pes_gameplay_dwarf_ranger_being_helped_up_05",
				"pes_gameplay_dwarf_ranger_being_helped_up_06",
				"pes_gameplay_dwarf_ranger_being_helped_up_07",
				"pes_gameplay_dwarf_ranger_being_helped_up_08",
				"pes_gameplay_dwarf_ranger_being_helped_up_09",
				"pes_gameplay_dwarf_ranger_being_helped_up_10",
				"pes_gameplay_dwarf_ranger_being_helped_up_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
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
				"pes_gameplay_dwarf_ranger_being_helped_up_02",
				"pes_gameplay_dwarf_ranger_being_helped_up_04",
				"pes_gameplay_dwarf_ranger_being_helped_up_05",
				"pes_gameplay_dwarf_ranger_being_helped_up_06",
				"pes_gameplay_dwarf_ranger_being_helped_up_07",
				"pes_gameplay_dwarf_ranger_being_helped_up_08",
				"pes_gameplay_dwarf_ranger_being_helped_up_09",
				"pes_gameplay_dwarf_ranger_being_helped_up_10",
				"pes_gameplay_dwarf_ranger_being_helped_up_11"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_this_way = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_objective_correct_path_this_way_01",
				[2.0] = "pes_objective_correct_path_this_way_13"
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
				[1.0] = "pes_objective_correct_path_this_way_01",
				[2.0] = "pes_objective_correct_path_this_way_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
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
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_being_helped_up = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_witch_hunter_being_helped_up_01",
				"pes_gameplay_witch_hunter_being_helped_up_04",
				"pes_gameplay_witch_hunter_being_helped_up_05",
				"pes_gameplay_witch_hunter_being_helped_up_06",
				"pes_gameplay_witch_hunter_being_helped_up_07",
				"pes_gameplay_witch_hunter_being_helped_up_08",
				"pes_gameplay_witch_hunter_being_helped_up_09",
				"pes_gameplay_witch_hunter_being_helped_up_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_witch_hunter_being_helped_up_01",
				"pes_gameplay_witch_hunter_being_helped_up_04",
				"pes_gameplay_witch_hunter_being_helped_up_05",
				"pes_gameplay_witch_hunter_being_helped_up_06",
				"pes_gameplay_witch_hunter_being_helped_up_07",
				"pes_gameplay_witch_hunter_being_helped_up_08",
				"pes_gameplay_witch_hunter_being_helped_up_09",
				"pes_gameplay_witch_hunter_being_helped_up_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_gutter_runner = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_hearing_a_gutter_runner_03",
				"pes_gameplay_hearing_a_gutter_runner_07",
				"pes_gameplay_hearing_a_gutter_runner_08",
				"pes_gameplay_hearing_a_gutter_runner_09",
				"pes_gameplay_hearing_a_gutter_runner_10",
				"pes_gameplay_hearing_a_gutter_runner_11",
				"pes_gameplay_hearing_a_gutter_runner_12",
				"pes_gameplay_hearing_a_gutter_runner_13",
				"pes_gameplay_hearing_a_gutter_runner_14"
			},
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_gutter_runner_03",
				"pes_gameplay_hearing_a_gutter_runner_07",
				"pes_gameplay_hearing_a_gutter_runner_08",
				"pes_gameplay_hearing_a_gutter_runner_09",
				"pes_gameplay_hearing_a_gutter_runner_10",
				"pes_gameplay_hearing_a_gutter_runner_11",
				"pes_gameplay_hearing_a_gutter_runner_12",
				"pes_gameplay_hearing_a_gutter_runner_13",
				"pes_gameplay_hearing_a_gutter_runner_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_warrior_champion = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_killing_a_chaos_warrior_champion_01",
				"pes_gameplay_killing_a_chaos_warrior_champion_02",
				"pes_gameplay_killing_a_chaos_warrior_champion_03",
				"pes_gameplay_killing_a_chaos_warrior_champion_04",
				"pes_gameplay_killing_a_chaos_warrior_champion_05",
				"pes_gameplay_killing_a_chaos_warrior_champion_06",
				"pes_gameplay_killing_a_chaos_warrior_champion_07",
				"pes_gameplay_killing_a_chaos_warrior_champion_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_warrior_champion_01",
				"pes_gameplay_killing_a_chaos_warrior_champion_02",
				"pes_gameplay_killing_a_chaos_warrior_champion_03",
				"pes_gameplay_killing_a_chaos_warrior_champion_04",
				"pes_gameplay_killing_a_chaos_warrior_champion_05",
				"pes_gameplay_killing_a_chaos_warrior_champion_06",
				"pes_gameplay_killing_a_chaos_warrior_champion_07",
				"pes_gameplay_killing_a_chaos_warrior_champion_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_bomb = {
			sound_events_n = 14,
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "empire_soldier_honduras",
			category = "seen_items",
			dialogue_animations_n = 14,
			sound_events = {
				"pes_gameplay_spots_bomb_05",
				"pes_gameplay_spots_bomb_09",
				"pes_gameplay_spots_bomb_10",
				"pes_gameplay_spots_bomb_11",
				"pes_gameplay_spots_bomb_12",
				"pes_gameplay_spots_bomb_13",
				"pes_gameplay_spots_bomb_14",
				"pes_gameplay_spots_bomb_15",
				"pes_gameplay_spots_bomb_16",
				"pes_gameplay_spots_bomb_17",
				"pes_gameplay_spots_bomb_18",
				"pes_gameplay_spots_bomb_19",
				"pes_gameplay_spots_bomb_20",
				"pes_gameplay_spots_bomb_21"
			},
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_bomb_05",
				"pes_gameplay_spots_bomb_09",
				"pes_gameplay_spots_bomb_10",
				"pes_gameplay_spots_bomb_11",
				"pes_gameplay_spots_bomb_12",
				"pes_gameplay_spots_bomb_13",
				"pes_gameplay_spots_bomb_14",
				"pes_gameplay_spots_bomb_15",
				"pes_gameplay_spots_bomb_16",
				"pes_gameplay_spots_bomb_17",
				"pes_gameplay_spots_bomb_18",
				"pes_gameplay_spots_bomb_19",
				"pes_gameplay_spots_bomb_20",
				"pes_gameplay_spots_bomb_21"
			},
			randomize_indexes = {}
		},
		pes_gameplay_incoming_globadier = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_incoming_globadier_01",
				"pes_gameplay_incoming_globadier_02",
				"pes_gameplay_incoming_globadier_03",
				"pes_gameplay_incoming_globadier_04",
				"pes_gameplay_incoming_globadier_05",
				"pes_gameplay_incoming_globadier_06"
			},
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
				"pes_gameplay_incoming_globadier_01",
				"pes_gameplay_incoming_globadier_02",
				"pes_gameplay_incoming_globadier_03",
				"pes_gameplay_incoming_globadier_04",
				"pes_gameplay_incoming_globadier_05",
				"pes_gameplay_incoming_globadier_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_low_on_health = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_bright_wizard_low_on_health_05",
				"pes_gameplay_bright_wizard_low_on_health_06",
				"pes_gameplay_bright_wizard_low_on_health_07",
				"pes_gameplay_bright_wizard_low_on_health_08"
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
				"pes_gameplay_bright_wizard_low_on_health_05",
				"pes_gameplay_bright_wizard_low_on_health_06",
				"pes_gameplay_bright_wizard_low_on_health_07",
				"pes_gameplay_bright_wizard_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_witch_hunter_in_trouble = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_05",
				"pes_gameplay_heard_witch_hunter_in_trouble_06",
				"pes_gameplay_heard_witch_hunter_in_trouble_07"
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
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_05",
				"pes_gameplay_heard_witch_hunter_in_trouble_06",
				"pes_gameplay_heard_witch_hunter_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_on_a_frenzy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_08"
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
				"pes_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_street = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_street_01",
				"pes_objective_correct_path_street_04",
				"pes_objective_correct_path_street_05",
				"pes_objective_correct_path_street_06"
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
				"pes_objective_correct_path_street_01",
				"pes_objective_correct_path_street_04",
				"pes_objective_correct_path_street_05",
				"pes_objective_correct_path_street_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_stormfiend = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hearing_a_stormfiend_01",
				"pes_gameplay_hearing_a_stormfiend_02",
				"pes_gameplay_hearing_a_stormfiend_03",
				"pes_gameplay_hearing_a_stormfiend_04",
				"pes_gameplay_hearing_a_stormfiend_05",
				"pes_gameplay_hearing_a_stormfiend_06"
			},
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
				"pes_gameplay_hearing_a_stormfiend_01",
				"pes_gameplay_hearing_a_stormfiend_02",
				"pes_gameplay_hearing_a_stormfiend_03",
				"pes_gameplay_hearing_a_stormfiend_04",
				"pes_gameplay_hearing_a_stormfiend_05",
				"pes_gameplay_hearing_a_stormfiend_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_on_a_frenzy = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_wood_elf_on_a_frenzy_04",
				"pes_gameplay_wood_elf_on_a_frenzy_05",
				"pes_gameplay_wood_elf_on_a_frenzy_06",
				"pes_gameplay_wood_elf_on_a_frenzy_07",
				"pes_gameplay_wood_elf_on_a_frenzy_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_on_a_frenzy_04",
				"pes_gameplay_wood_elf_on_a_frenzy_05",
				"pes_gameplay_wood_elf_on_a_frenzy_06",
				"pes_gameplay_wood_elf_on_a_frenzy_07",
				"pes_gameplay_wood_elf_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_helped_by_dwarf_ranger = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "help_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_helped_by_dwarf_ranger_05",
				"pes_gameplay_helped_by_dwarf_ranger_06",
				"pes_gameplay_helped_by_dwarf_ranger_07",
				"pes_gameplay_helped_by_dwarf_ranger_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_dwarf_ranger_05",
				"pes_gameplay_helped_by_dwarf_ranger_06",
				"pes_gameplay_helped_by_dwarf_ranger_07",
				"pes_gameplay_helped_by_dwarf_ranger_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_07",
				"pes_gameplay_hearing_a_chaos_wizard_wind_08"
			},
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
				"pes_gameplay_hearing_a_chaos_wizard_wind_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_07",
				"pes_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_ammo = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_05",
				"pes_gameplay_spots_ammo_06",
				"pes_gameplay_spots_ammo_07",
				"pes_gameplay_spots_ammo_08",
				"pes_gameplay_spots_ammo_09",
				"pes_gameplay_spots_ammo_10"
			},
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
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_05",
				"pes_gameplay_spots_ammo_06",
				"pes_gameplay_spots_ammo_07",
				"pes_gameplay_spots_ammo_08",
				"pes_gameplay_spots_ammo_09",
				"pes_gameplay_spots_ammo_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
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
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_activating_magic_weapon_offensive = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_activating_magic_weapon_offensive_01",
				"pes_gameplay_activating_magic_weapon_offensive_02",
				"pes_gameplay_activating_magic_weapon_offensive_03",
				"pes_gameplay_activating_magic_weapon_offensive_04",
				"pes_gameplay_activating_magic_weapon_offensive_05"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_activating_magic_weapon_offensive_01",
				"pes_gameplay_activating_magic_weapon_offensive_02",
				"pes_gameplay_activating_magic_weapon_offensive_03",
				"pes_gameplay_activating_magic_weapon_offensive_04",
				"pes_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_chaos_wizard_leech_leeching_keriliian = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_01",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_02",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_03",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_04",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_05",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_06",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_07"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_01",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_02",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_03",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_04",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_05",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_06",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_special_enemy_kill_ranged = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_special_enemy_kill_ranged_02",
				"pes_gameplay_special_enemy_kill_ranged_09",
				"pes_gameplay_special_enemy_kill_ranged_10",
				"pes_gameplay_special_enemy_kill_ranged_11",
				"pes_gameplay_special_enemy_kill_ranged_12",
				"pes_gameplay_special_enemy_kill_ranged_13",
				"pes_gameplay_special_enemy_kill_ranged_14",
				"pes_gameplay_special_enemy_kill_ranged_15",
				"pes_gameplay_special_enemy_kill_ranged_16",
				"pes_gameplay_special_enemy_kill_ranged_17",
				"pes_gameplay_special_enemy_kill_ranged_18",
				"pes_gameplay_special_enemy_kill_ranged_19"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
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
				"pes_gameplay_special_enemy_kill_ranged_02",
				"pes_gameplay_special_enemy_kill_ranged_09",
				"pes_gameplay_special_enemy_kill_ranged_10",
				"pes_gameplay_special_enemy_kill_ranged_11",
				"pes_gameplay_special_enemy_kill_ranged_12",
				"pes_gameplay_special_enemy_kill_ranged_13",
				"pes_gameplay_special_enemy_kill_ranged_14",
				"pes_gameplay_special_enemy_kill_ranged_15",
				"pes_gameplay_special_enemy_kill_ranged_16",
				"pes_gameplay_special_enemy_kill_ranged_17",
				"pes_gameplay_special_enemy_kill_ranged_18",
				"pes_gameplay_special_enemy_kill_ranged_19"
			},
			randomize_indexes = {}
		},
		pes_gameplay_casual_quotes = {
			sound_events_n = 30,
			randomize_indexes_n = 0,
			face_animations_n = 30,
			database = "empire_soldier_honduras",
			category = "casual_talk",
			dialogue_animations_n = 30,
			sound_events = {
				"pes_gameplay_casual_quotes_03",
				"pes_gameplay_casual_quotes_11",
				"pes_gameplay_casual_quotes_12",
				"pes_gameplay_casual_quotes_13",
				"pes_gameplay_casual_quotes_14",
				"pes_gameplay_casual_quotes_15",
				"pes_gameplay_casual_quotes_16",
				"pes_gameplay_casual_quotes_17",
				"pes_gameplay_casual_quotes_18",
				"pes_gameplay_casual_quotes_19",
				"pes_gameplay_casual_quotes_20",
				"pes_gameplay_casual_quotes_21",
				"pes_gameplay_casual_quotes_22",
				"pes_gameplay_casual_quotes_23",
				"pes_gameplay_casual_quotes_24",
				"pes_gameplay_casual_quotes_25",
				"pes_gameplay_casual_quotes_26",
				"pes_gameplay_casual_quotes_27",
				"pes_gameplay_casual_quotes_28",
				"pes_gameplay_casual_quotes_29",
				"pes_gameplay_casual_quotes_30",
				"pes_gameplay_casual_quotes_31",
				"pes_gameplay_casual_quotes_32",
				"pes_gameplay_casual_quotes_33",
				"pes_gameplay_casual_quotes_34",
				"pes_gameplay_casual_quotes_35",
				"pes_gameplay_casual_quotes_36",
				"pes_gameplay_casual_quotes_37",
				"pes_gameplay_casual_quotes_38",
				"pes_gameplay_casual_quotes_39"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_casual_quotes_03",
				"pes_gameplay_casual_quotes_11",
				"pes_gameplay_casual_quotes_12",
				"pes_gameplay_casual_quotes_13",
				"pes_gameplay_casual_quotes_14",
				"pes_gameplay_casual_quotes_15",
				"pes_gameplay_casual_quotes_16",
				"pes_gameplay_casual_quotes_17",
				"pes_gameplay_casual_quotes_18",
				"pes_gameplay_casual_quotes_19",
				"pes_gameplay_casual_quotes_20",
				"pes_gameplay_casual_quotes_21",
				"pes_gameplay_casual_quotes_22",
				"pes_gameplay_casual_quotes_23",
				"pes_gameplay_casual_quotes_24",
				"pes_gameplay_casual_quotes_25",
				"pes_gameplay_casual_quotes_26",
				"pes_gameplay_casual_quotes_27",
				"pes_gameplay_casual_quotes_28",
				"pes_gameplay_casual_quotes_29",
				"pes_gameplay_casual_quotes_30",
				"pes_gameplay_casual_quotes_31",
				"pes_gameplay_casual_quotes_32",
				"pes_gameplay_casual_quotes_33",
				"pes_gameplay_casual_quotes_34",
				"pes_gameplay_casual_quotes_35",
				"pes_gameplay_casual_quotes_36",
				"pes_gameplay_casual_quotes_37",
				"pes_gameplay_casual_quotes_38",
				"pes_gameplay_casual_quotes_39"
			},
			randomize_indexes = {}
		},
		pes_gameplay_parry_witch_hunter = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_parry_witch_hunter_01",
				"pes_gameplay_parry_witch_hunter_02",
				"pes_gameplay_parry_witch_hunter_03",
				"pes_gameplay_parry_witch_hunter_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_witch_hunter_01",
				"pes_gameplay_parry_witch_hunter_02",
				"pes_gameplay_parry_witch_hunter_03",
				"pes_gameplay_parry_witch_hunter_04"
			},
			randomize_indexes = {}
		},
		pes_targeted_by_ratling = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_targeted_by_ratling_09",
				"pes_targeted_by_ratling_10",
				"pes_targeted_by_ratling_11",
				"pes_targeted_by_ratling_12",
				"pes_targeted_by_ratling_13",
				"pes_targeted_by_ratling_14",
				"pes_targeted_by_ratling_15",
				"pes_targeted_by_ratling_16"
			},
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
				"pes_targeted_by_ratling_09",
				"pes_targeted_by_ratling_10",
				"pes_targeted_by_ratling_11",
				"pes_targeted_by_ratling_12",
				"pes_targeted_by_ratling_13",
				"pes_targeted_by_ratling_14",
				"pes_targeted_by_ratling_15",
				"pes_targeted_by_ratling_16"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bile_troll_incapacitaded = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_bile_troll_incapacitaded_01",
				"pes_gameplay_bile_troll_incapacitaded_02",
				"pes_gameplay_bile_troll_incapacitaded_03",
				"pes_gameplay_bile_troll_incapacitaded_04",
				"pes_gameplay_bile_troll_incapacitaded_05",
				"pes_gameplay_bile_troll_incapacitaded_06",
				"pes_gameplay_bile_troll_incapacitaded_07",
				"pes_gameplay_bile_troll_incapacitaded_08"
			},
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_bile_troll_incapacitaded_01",
				"pes_gameplay_bile_troll_incapacitaded_02",
				"pes_gameplay_bile_troll_incapacitaded_03",
				"pes_gameplay_bile_troll_incapacitaded_04",
				"pes_gameplay_bile_troll_incapacitaded_05",
				"pes_gameplay_bile_troll_incapacitaded_06",
				"pes_gameplay_bile_troll_incapacitaded_07",
				"pes_gameplay_bile_troll_incapacitaded_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_17",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_18"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_hearing_a_skaven_ratling_gun_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_17",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_18"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_dwarf_ranger_dead_04",
				"pes_gameplay_dwarf_ranger_dead_05",
				"pes_gameplay_dwarf_ranger_dead_06",
				"pes_gameplay_dwarf_ranger_dead_07"
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
				"pes_gameplay_dwarf_ranger_dead_04",
				"pes_gameplay_dwarf_ranger_dead_05",
				"pes_gameplay_dwarf_ranger_dead_06",
				"pes_gameplay_dwarf_ranger_dead_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_slaver = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_Skaven_slaver_09",
				"pes_gameplay_seeing_a_Skaven_slaver_10",
				"pes_gameplay_seeing_a_Skaven_slaver_11",
				"pes_gameplay_seeing_a_Skaven_slaver_12",
				"pes_gameplay_seeing_a_Skaven_slaver_13"
			},
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
				"face_concerned",
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
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_Skaven_slaver_09",
				"pes_gameplay_seeing_a_Skaven_slaver_10",
				"pes_gameplay_seeing_a_Skaven_slaver_11",
				"pes_gameplay_seeing_a_Skaven_slaver_12",
				"pes_gameplay_seeing_a_Skaven_slaver_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hit_by_goo = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_hit_by_goo_06",
				"pes_gameplay_hit_by_goo_08",
				"pes_gameplay_hit_by_goo_09",
				"pes_gameplay_hit_by_goo_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_hit_by_goo_06",
				"pes_gameplay_hit_by_goo_08",
				"pes_gameplay_hit_by_goo_09",
				"pes_gameplay_hit_by_goo_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_spawn_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_spawn_combat_01",
				"pes_gameplay_hearing_a_chaos_spawn_combat_02",
				"pes_gameplay_hearing_a_chaos_spawn_combat_03",
				"pes_gameplay_hearing_a_chaos_spawn_combat_04",
				"pes_gameplay_hearing_a_chaos_spawn_combat_05",
				"pes_gameplay_hearing_a_chaos_spawn_combat_06",
				"pes_gameplay_hearing_a_chaos_spawn_combat_07",
				"pes_gameplay_hearing_a_chaos_spawn_combat_08"
			},
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
				"pes_gameplay_hearing_a_chaos_spawn_combat_01",
				"pes_gameplay_hearing_a_chaos_spawn_combat_02",
				"pes_gameplay_hearing_a_chaos_spawn_combat_03",
				"pes_gameplay_hearing_a_chaos_spawn_combat_04",
				"pes_gameplay_hearing_a_chaos_spawn_combat_05",
				"pes_gameplay_hearing_a_chaos_spawn_combat_06",
				"pes_gameplay_hearing_a_chaos_spawn_combat_07",
				"pes_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_stormfiend_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_stormfiend_combat_01",
				"pes_gameplay_hearing_a_stormfiend_combat_02",
				"pes_gameplay_hearing_a_stormfiend_combat_03",
				"pes_gameplay_hearing_a_stormfiend_combat_04",
				"pes_gameplay_hearing_a_stormfiend_combat_05",
				"pes_gameplay_hearing_a_stormfiend_combat_06",
				"pes_gameplay_hearing_a_stormfiend_combat_07",
				"pes_gameplay_hearing_a_stormfiend_combat_08"
			},
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
				"pes_gameplay_hearing_a_stormfiend_combat_01",
				"pes_gameplay_hearing_a_stormfiend_combat_02",
				"pes_gameplay_hearing_a_stormfiend_combat_03",
				"pes_gameplay_hearing_a_stormfiend_combat_04",
				"pes_gameplay_hearing_a_stormfiend_combat_05",
				"pes_gameplay_hearing_a_stormfiend_combat_06",
				"pes_gameplay_hearing_a_stormfiend_combat_07",
				"pes_gameplay_hearing_a_stormfiend_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_grabbed = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_07",
				"pes_gameplay_wood_elf_grabbed_08",
				"pes_gameplay_wood_elf_grabbed_09",
				"pes_gameplay_wood_elf_grabbed_10"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_07",
				"pes_gameplay_wood_elf_grabbed_08",
				"pes_gameplay_wood_elf_grabbed_09",
				"pes_gameplay_wood_elf_grabbed_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_special_enemy_kill_melee = {
			sound_events_n = 16,
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 16,
			sound_events = {
				"pes_gameplay_special_enemy_kill_melee_03",
				"pes_gameplay_special_enemy_kill_melee_09",
				"pes_gameplay_special_enemy_kill_melee_10",
				"pes_gameplay_special_enemy_kill_melee_11",
				"pes_gameplay_special_enemy_kill_melee_12",
				"pes_gameplay_special_enemy_kill_melee_13",
				"pes_gameplay_special_enemy_kill_melee_14",
				"pes_gameplay_special_enemy_kill_melee_15",
				"pes_gameplay_special_enemy_kill_melee_16",
				"pes_gameplay_special_enemy_kill_melee_17",
				"pes_gameplay_special_enemy_kill_melee_18",
				"pes_gameplay_special_enemy_kill_melee_19",
				"pes_gameplay_special_enemy_kill_melee_20",
				"pes_gameplay_special_enemy_kill_melee_21",
				"pes_gameplay_special_enemy_kill_melee_22",
				"pes_gameplay_special_enemy_kill_melee_23"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
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
				"pes_gameplay_special_enemy_kill_melee_03",
				"pes_gameplay_special_enemy_kill_melee_09",
				"pes_gameplay_special_enemy_kill_melee_10",
				"pes_gameplay_special_enemy_kill_melee_11",
				"pes_gameplay_special_enemy_kill_melee_12",
				"pes_gameplay_special_enemy_kill_melee_13",
				"pes_gameplay_special_enemy_kill_melee_14",
				"pes_gameplay_special_enemy_kill_melee_15",
				"pes_gameplay_special_enemy_kill_melee_16",
				"pes_gameplay_special_enemy_kill_melee_17",
				"pes_gameplay_special_enemy_kill_melee_18",
				"pes_gameplay_special_enemy_kill_melee_19",
				"pes_gameplay_special_enemy_kill_melee_20",
				"pes_gameplay_special_enemy_kill_melee_21",
				"pes_gameplay_special_enemy_kill_melee_22",
				"pes_gameplay_special_enemy_kill_melee_23"
			},
			randomize_indexes = {}
		},
		pes_gameplay_activating_magic_weapon_defensive = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_activating_magic_weapon_defensive_01",
				"pes_gameplay_activating_magic_weapon_defensive_02",
				"pes_gameplay_activating_magic_weapon_defensive_03",
				"pes_gameplay_activating_magic_weapon_defensive_04",
				"pes_gameplay_activating_magic_weapon_defensive_05"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_activating_magic_weapon_defensive_01",
				"pes_gameplay_activating_magic_weapon_defensive_02",
				"pes_gameplay_activating_magic_weapon_defensive_03",
				"pes_gameplay_activating_magic_weapon_defensive_04",
				"pes_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_chaos_wizard_leech_leeching_bardin = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_01",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_02",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_03",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_04",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_05",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_06",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_07"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_01",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_02",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_03",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_04",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_05",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_06",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_armoured_enemy_wood_elf = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_armoured_enemy_wood_elf_04",
				"pes_gameplay_armoured_enemy_wood_elf_05",
				"pes_gameplay_armoured_enemy_wood_elf_06",
				"pes_gameplay_armoured_enemy_wood_elf_07",
				"pes_gameplay_armoured_enemy_wood_elf_08",
				"pes_gameplay_armoured_enemy_wood_elf_09",
				"pes_gameplay_armoured_enemy_wood_elf_10",
				"pes_gameplay_armoured_enemy_wood_elf_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_armoured_enemy_wood_elf_04",
				"pes_gameplay_armoured_enemy_wood_elf_05",
				"pes_gameplay_armoured_enemy_wood_elf_06",
				"pes_gameplay_armoured_enemy_wood_elf_07",
				"pes_gameplay_armoured_enemy_wood_elf_08",
				"pes_gameplay_armoured_enemy_wood_elf_09",
				"pes_gameplay_armoured_enemy_wood_elf_10",
				"pes_gameplay_armoured_enemy_wood_elf_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_player_pounced = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 10,
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
			randomize_indexes = {}
		},
		pes_gameplay_healing_bright_wizard = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_healing_bright_wizard_04",
				"pes_gameplay_healing_bright_wizard_05",
				"pes_gameplay_healing_bright_wizard_06",
				"pes_gameplay_healing_bright_wizard_07",
				"pes_gameplay_healing_bright_wizard_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_healing_bright_wizard_04",
				"pes_gameplay_healing_bright_wizard_05",
				"pes_gameplay_healing_bright_wizard_06",
				"pes_gameplay_healing_bright_wizard_07",
				"pes_gameplay_healing_bright_wizard_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_stormvermin = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_09",
				"pes_gameplay_seeing_a_stormvermin_10",
				"pes_gameplay_seeing_a_stormvermin_11",
				"pes_gameplay_seeing_a_stormvermin_12",
				"pes_gameplay_seeing_a_stormvermin_13",
				"pes_gameplay_seeing_a_stormvermin_14",
				"pes_gameplay_seeing_a_stormvermin_15",
				"pes_gameplay_seeing_a_stormvermin_16",
				"pes_gameplay_seeing_a_stormvermin_17"
			},
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
				"face_contempt",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_09",
				"pes_gameplay_seeing_a_stormvermin_10",
				"pes_gameplay_seeing_a_stormvermin_11",
				"pes_gameplay_seeing_a_stormvermin_12",
				"pes_gameplay_seeing_a_stormvermin_13",
				"pes_gameplay_seeing_a_stormvermin_14",
				"pes_gameplay_seeing_a_stormvermin_15",
				"pes_gameplay_seeing_a_stormvermin_16",
				"pes_gameplay_seeing_a_stormvermin_17"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_low_on_health = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_witch_hunter_low_on_health_01",
				"pes_gameplay_witch_hunter_low_on_health_05",
				"pes_gameplay_witch_hunter_low_on_health_06",
				"pes_gameplay_witch_hunter_low_on_health_07",
				"pes_gameplay_witch_hunter_low_on_health_09"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_low_on_health_01",
				"pes_gameplay_witch_hunter_low_on_health_05",
				"pes_gameplay_witch_hunter_low_on_health_06",
				"pes_gameplay_witch_hunter_low_on_health_07",
				"pes_gameplay_witch_hunter_low_on_health_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_chaos_wizard_leech_leeching_sienna = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_01",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_02",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_03",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_04",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_05",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_06",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_07"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_01",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_02",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_03",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_04",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_05",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_06",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_eaten = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_witch_hunter_eaten_01",
				"pes_witch_hunter_eaten_02",
				"pes_witch_hunter_eaten_03",
				"pes_witch_hunter_eaten_04",
				"pes_witch_hunter_eaten_05",
				"pes_witch_hunter_eaten_06"
			},
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
				"pes_witch_hunter_eaten_01",
				"pes_witch_hunter_eaten_02",
				"pes_witch_hunter_eaten_03",
				"pes_witch_hunter_eaten_04",
				"pes_witch_hunter_eaten_05",
				"pes_witch_hunter_eaten_06"
			},
			randomize_indexes = {}
		},
		pes_activate_ability_mercenary = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "activate_ability",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_activate_ability_mercenary_01",
				"pes_activate_ability_mercenary_02",
				"pes_activate_ability_mercenary_04",
				"pes_activate_ability_mercenary_05",
				"pes_activate_ability_mercenary_06",
				"pes_activate_ability_mercenary_07",
				"pes_activate_ability_mercenary_08"
			},
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
				"pes_activate_ability_mercenary_01",
				"pes_activate_ability_mercenary_02",
				"pes_activate_ability_mercenary_04",
				"pes_activate_ability_mercenary_05",
				"pes_activate_ability_mercenary_06",
				"pes_activate_ability_mercenary_07",
				"pes_activate_ability_mercenary_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_friendly_fire_witch_hunter = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_friendly_fire_witch_hunter_05",
				"pes_gameplay_friendly_fire_witch_hunter_06",
				"pes_gameplay_friendly_fire_witch_hunter_07",
				"pes_gameplay_friendly_fire_witch_hunter_08",
				"pes_gameplay_friendly_fire_witch_hunter_09",
				"pes_gameplay_friendly_fire_witch_hunter_10",
				"pes_gameplay_friendly_fire_witch_hunter_11",
				"pes_gameplay_friendly_fire_witch_hunter_12",
				"pes_gameplay_friendly_fire_witch_hunter_13"
			},
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_witch_hunter_05",
				"pes_gameplay_friendly_fire_witch_hunter_06",
				"pes_gameplay_friendly_fire_witch_hunter_07",
				"pes_gameplay_friendly_fire_witch_hunter_08",
				"pes_gameplay_friendly_fire_witch_hunter_09",
				"pes_gameplay_friendly_fire_witch_hunter_10",
				"pes_gameplay_friendly_fire_witch_hunter_11",
				"pes_gameplay_friendly_fire_witch_hunter_12",
				"pes_gameplay_friendly_fire_witch_hunter_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_pm_in_combat = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_hearing_a_pm_in_combat_01",
				"pes_gameplay_hearing_a_pm_in_combat_02",
				"pes_gameplay_hearing_a_pm_in_combat_03",
				"pes_gameplay_hearing_a_pm_in_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_01",
				"pes_gameplay_hearing_a_plague_monk_combat_02",
				"pes_gameplay_hearing_a_plague_monk_combat_03",
				"pes_gameplay_hearing_a_plague_monk_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_05",
				"pes_gameplay_hearing_a_plague_monk_combat_06",
				"pes_gameplay_hearing_a_plague_monk_combat_07",
				"pes_gameplay_hearing_a_plague_monk_combat_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_hearing_a_pm_in_combat_01",
				"pes_gameplay_hearing_a_pm_in_combat_02",
				"pes_gameplay_hearing_a_pm_in_combat_03",
				"pes_gameplay_hearing_a_pm_in_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_01",
				"pes_gameplay_hearing_a_plague_monk_combat_02",
				"pes_gameplay_hearing_a_plague_monk_combat_03",
				"pes_gameplay_hearing_a_plague_monk_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_05",
				"pes_gameplay_hearing_a_plague_monk_combat_06",
				"pes_gameplay_hearing_a_plague_monk_combat_07",
				"pes_gameplay_hearing_a_plague_monk_combat_08"
			},
			randomize_indexes = {}
		},
		pes_objective_picking_up_grimoire = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_objective_picking_up_grimoire_05",
				"pes_objective_picking_up_grimoire_06",
				"pes_objective_picking_up_grimoire_07",
				"pes_objective_picking_up_grimoire_08",
				"pes_objective_picking_up_grimoire_09",
				"pes_objective_picking_up_grimoire_10",
				"pes_objective_picking_up_grimoire_11",
				"pes_objective_picking_up_grimoire_12"
			},
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
				"pes_objective_picking_up_grimoire_05",
				"pes_objective_picking_up_grimoire_06",
				"pes_objective_picking_up_grimoire_07",
				"pes_objective_picking_up_grimoire_08",
				"pes_objective_picking_up_grimoire_09",
				"pes_objective_picking_up_grimoire_10",
				"pes_objective_picking_up_grimoire_11",
				"pes_objective_picking_up_grimoire_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_knocked_down = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06",
				"pes_gameplay_knocked_down_07",
				"pes_gameplay_knocked_down_08",
				"pes_gameplay_knocked_down_09",
				"pes_gameplay_knocked_down_10",
				"pes_gameplay_knocked_down_11"
			},
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
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06",
				"pes_gameplay_knocked_down_07",
				"pes_gameplay_knocked_down_08",
				"pes_gameplay_knocked_down_09",
				"pes_gameplay_knocked_down_10",
				"pes_gameplay_knocked_down_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_chaos_wizard_leech_leeching_saltzpyre = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_01",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_02",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_03",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_04",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_05",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_06"
			},
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
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_01",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_02",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_03",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_04",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_05",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_06"
			},
			randomize_indexes = {}
		},
		pes_objective_goal_achieved_escape = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_objective_goal_achieved_escape_04",
				"pes_objective_goal_achieved_escape_05",
				"pes_objective_goal_achieved_escape_06",
				"pes_objective_goal_achieved_escape_07",
				"pes_objective_goal_achieved_escape_08",
				"pes_objective_goal_achieved_escape_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_objective_goal_achieved_escape_04",
				"pes_objective_goal_achieved_escape_05",
				"pes_objective_goal_achieved_escape_06",
				"pes_objective_goal_achieved_escape_07",
				"pes_objective_goal_achieved_escape_08",
				"pes_objective_goal_achieved_escape_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_low_on_health = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_low_on_health_01",
				"pes_gameplay_low_on_health_09",
				"pes_gameplay_low_on_health_10",
				"pes_gameplay_low_on_health_11",
				"pes_gameplay_low_on_health_12",
				"pes_gameplay_low_on_health_13",
				"pes_gameplay_low_on_health_14",
				"pes_gameplay_low_on_health_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_pain"
			},
			localization_strings = {
				"pes_gameplay_low_on_health_01",
				"pes_gameplay_low_on_health_09",
				"pes_gameplay_low_on_health_10",
				"pes_gameplay_low_on_health_11",
				"pes_gameplay_low_on_health_12",
				"pes_gameplay_low_on_health_13",
				"pes_gameplay_low_on_health_14",
				"pes_gameplay_low_on_health_15"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_wizard_wind = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_wind_01",
				"pes_gameplay_killing_a_chaos_wizard_wind_02",
				"pes_gameplay_killing_a_chaos_wizard_wind_03",
				"pes_gameplay_killing_a_chaos_wizard_wind_04",
				"pes_gameplay_killing_a_chaos_wizard_wind_05",
				"pes_gameplay_killing_a_chaos_wizard_wind_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_wizard_wind_01",
				"pes_gameplay_killing_a_chaos_wizard_wind_02",
				"pes_gameplay_killing_a_chaos_wizard_wind_03",
				"pes_gameplay_killing_a_chaos_wizard_wind_04",
				"pes_gameplay_killing_a_chaos_wizard_wind_05",
				"pes_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_on_a_frenzy = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_witch_hunter_on_a_frenzy_05",
				"pes_gameplay_witch_hunter_on_a_frenzy_06",
				"pes_gameplay_witch_hunter_on_a_frenzy_07",
				"pes_gameplay_witch_hunter_on_a_frenzy_08",
				"pes_gameplay_witch_hunter_on_a_frenzy_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_on_a_frenzy_05",
				"pes_gameplay_witch_hunter_on_a_frenzy_06",
				"pes_gameplay_witch_hunter_on_a_frenzy_07",
				"pes_gameplay_witch_hunter_on_a_frenzy_08",
				"pes_gameplay_witch_hunter_on_a_frenzy_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_health = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "seen_items",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_07",
				"pes_gameplay_spots_health_08",
				"pes_gameplay_spots_health_09",
				"pes_gameplay_spots_health_10",
				"pes_gameplay_spots_health_11",
				"pes_gameplay_spots_health_12",
				"pes_gameplay_spots_health_13",
				"pes_gameplay_spots_health_14",
				"pes_gameplay_spots_health_15",
				"pes_gameplay_spots_health_16",
				"pes_gameplay_spots_health_17"
			},
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
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_07",
				"pes_gameplay_spots_health_08",
				"pes_gameplay_spots_health_09",
				"pes_gameplay_spots_health_10",
				"pes_gameplay_spots_health_11",
				"pes_gameplay_spots_health_12",
				"pes_gameplay_spots_health_13",
				"pes_gameplay_spots_health_14",
				"pes_gameplay_spots_health_15",
				"pes_gameplay_spots_health_16",
				"pes_gameplay_spots_health_17"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_ladder_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_ladder_down_01",
				"pes_objective_correct_path_ladder_down_02",
				"pes_objective_correct_path_ladder_down_03",
				"pes_objective_correct_path_ladder_down_04"
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
				"pes_objective_correct_path_ladder_down_01",
				"pes_objective_correct_path_ladder_down_02",
				"pes_objective_correct_path_ladder_down_03",
				"pes_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_helped_by_witch_hunter = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "help_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_helped_by_witch_hunter_01",
				"pes_gameplay_helped_by_witch_hunter_02",
				"pes_gameplay_helped_by_witch_hunter_03",
				"pes_gameplay_helped_by_witch_hunter_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_witch_hunter_01",
				"pes_gameplay_helped_by_witch_hunter_02",
				"pes_gameplay_helped_by_witch_hunter_03",
				"pes_gameplay_helped_by_witch_hunter_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_packmaster = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_killing_packmaster_01",
				"pes_gameplay_killing_packmaster_02",
				"pes_gameplay_killing_packmaster_05",
				"pes_gameplay_killing_packmaster_06"
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
				"pes_gameplay_killing_packmaster_01",
				"pes_gameplay_killing_packmaster_02",
				"pes_gameplay_killing_packmaster_05",
				"pes_gameplay_killing_packmaster_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_grabbed = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_06",
				"pes_gameplay_witch_hunter_grabbed_07",
				"pes_gameplay_witch_hunter_grabbed_08",
				"pes_gameplay_witch_hunter_grabbed_09",
				"pes_gameplay_witch_hunter_grabbed_10",
				"pes_gameplay_witch_hunter_grabbed_11",
				"pes_gameplay_witch_hunter_grabbed_12",
				"pes_gameplay_witch_hunter_grabbed_13"
			},
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
				"face_neutral",
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
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_06",
				"pes_gameplay_witch_hunter_grabbed_07",
				"pes_gameplay_witch_hunter_grabbed_08",
				"pes_gameplay_witch_hunter_grabbed_09",
				"pes_gameplay_witch_hunter_grabbed_10",
				"pes_gameplay_witch_hunter_grabbed_11",
				"pes_gameplay_witch_hunter_grabbed_12",
				"pes_gameplay_witch_hunter_grabbed_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_wizard_leech = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_leech_01",
				"pes_gameplay_killing_a_chaos_wizard_leech_02",
				"pes_gameplay_killing_a_chaos_wizard_leech_03",
				"pes_gameplay_killing_a_chaos_wizard_leech_04",
				"pes_gameplay_killing_a_chaos_wizard_leech_05",
				"pes_gameplay_killing_a_chaos_wizard_leech_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_wizard_leech_01",
				"pes_gameplay_killing_a_chaos_wizard_leech_02",
				"pes_gameplay_killing_a_chaos_wizard_leech_03",
				"pes_gameplay_killing_a_chaos_wizard_leech_04",
				"pes_gameplay_killing_a_chaos_wizard_leech_05",
				"pes_gameplay_killing_a_chaos_wizard_leech_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_gutterrunner = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_killing_gutterrunner_05",
				"pes_gameplay_killing_gutterrunner_06",
				"pes_gameplay_killing_gutterrunner_07",
				"pes_gameplay_killing_gutterrunner_08"
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
				"pes_gameplay_killing_gutterrunner_05",
				"pes_gameplay_killing_gutterrunner_06",
				"pes_gameplay_killing_gutterrunner_07",
				"pes_gameplay_killing_gutterrunner_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_armoured_enemy_bright_wizard = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_armoured_enemy_bright_wizard_04",
				"pes_gameplay_armoured_enemy_bright_wizard_05",
				"pes_gameplay_armoured_enemy_bright_wizard_06",
				"pes_gameplay_armoured_enemy_bright_wizard_07",
				"pes_gameplay_armoured_enemy_bright_wizard_08",
				"pes_gameplay_armoured_enemy_bright_wizard_09",
				"pes_gameplay_armoured_enemy_bright_wizard_10",
				"pes_gameplay_armoured_enemy_bright_wizard_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_armoured_enemy_bright_wizard_04",
				"pes_gameplay_armoured_enemy_bright_wizard_05",
				"pes_gameplay_armoured_enemy_bright_wizard_06",
				"pes_gameplay_armoured_enemy_bright_wizard_07",
				"pes_gameplay_armoured_enemy_bright_wizard_08",
				"pes_gameplay_armoured_enemy_bright_wizard_09",
				"pes_gameplay_armoured_enemy_bright_wizard_10",
				"pes_gameplay_armoured_enemy_bright_wizard_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_eaten = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_dwarf_ranger_eaten_01",
				"pes_dwarf_ranger_eaten_02",
				"pes_dwarf_ranger_eaten_03",
				"pes_dwarf_ranger_eaten_04",
				"pes_dwarf_ranger_eaten_05",
				"pes_dwarf_ranger_eaten_06",
				"pes_dwarf_ranger_eaten_07"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_dwarf_ranger_eaten_01",
				"pes_dwarf_ranger_eaten_02",
				"pes_dwarf_ranger_eaten_03",
				"pes_dwarf_ranger_eaten_04",
				"pes_dwarf_ranger_eaten_05",
				"pes_dwarf_ranger_eaten_06",
				"pes_dwarf_ranger_eaten_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_wood_elf_dead_04",
				"pes_gameplay_wood_elf_dead_05",
				"pes_gameplay_wood_elf_dead_06",
				"pes_gameplay_wood_elf_dead_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_dead_04",
				"pes_gameplay_wood_elf_dead_05",
				"pes_gameplay_wood_elf_dead_06",
				"pes_gameplay_wood_elf_dead_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_troll = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_troll_01",
				"pes_gameplay_seeing_a_troll_02",
				"pes_gameplay_seeing_a_troll_03",
				"pes_gameplay_seeing_a_troll_04",
				"pes_gameplay_seeing_a_troll_05",
				"pes_gameplay_seeing_a_troll_06",
				"pes_gameplay_seeing_a_troll_07",
				"pes_gameplay_seeing_a_troll_08"
			},
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
				"pes_gameplay_seeing_a_troll_01",
				"pes_gameplay_seeing_a_troll_02",
				"pes_gameplay_seeing_a_troll_03",
				"pes_gameplay_seeing_a_troll_04",
				"pes_gameplay_seeing_a_troll_05",
				"pes_gameplay_seeing_a_troll_06",
				"pes_gameplay_seeing_a_troll_07",
				"pes_gameplay_seeing_a_troll_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ambush_horde_spawned = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_ambush_horde_spawned_02",
				"pes_gameplay_ambush_horde_spawned_03",
				"pes_gameplay_ambush_horde_spawned_05",
				"pes_gameplay_ambush_horde_spawned_07",
				"pes_gameplay_ambush_horde_spawned_08",
				"pes_gameplay_ambush_horde_spawned_09",
				"pes_gameplay_ambush_horde_spawned_10",
				"pes_gameplay_ambush_horde_spawned_11"
			},
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_ambush_horde_spawned_02",
				"pes_gameplay_ambush_horde_spawned_03",
				"pes_gameplay_ambush_horde_spawned_05",
				"pes_gameplay_ambush_horde_spawned_07",
				"pes_gameplay_ambush_horde_spawned_08",
				"pes_gameplay_ambush_horde_spawned_09",
				"pes_gameplay_ambush_horde_spawned_10",
				"pes_gameplay_ambush_horde_spawned_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_stormfiend = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_stormfiend_01",
				"pes_gameplay_seeing_a_stormfiend_02",
				"pes_gameplay_seeing_a_stormfiend_03",
				"pes_gameplay_seeing_a_stormfiend_04",
				"pes_gameplay_seeing_a_stormfiend_05",
				"pes_gameplay_seeing_a_stormfiend_06",
				"pes_gameplay_seeing_a_stormfiend_07",
				"pes_gameplay_seeing_a_stormfiend_08"
			},
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
				"pes_gameplay_seeing_a_stormfiend_01",
				"pes_gameplay_seeing_a_stormfiend_02",
				"pes_gameplay_seeing_a_stormfiend_03",
				"pes_gameplay_seeing_a_stormfiend_04",
				"pes_gameplay_seeing_a_stormfiend_05",
				"pes_gameplay_seeing_a_stormfiend_06",
				"pes_gameplay_seeing_a_stormfiend_07",
				"pes_gameplay_seeing_a_stormfiend_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_pm = {
			sound_events_n = 16,
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 16,
			sound_events = {
				"pes_gameplay_seeing_a_pm_01",
				"pes_gameplay_seeing_a_pm_02",
				"pes_gameplay_seeing_a_pm_03",
				"pes_gameplay_seeing_a_pm_04",
				"pes_gameplay_seeing_a_pm_05",
				"pes_gameplay_seeing_a_pm_06",
				"pes_gameplay_seeing_a_pm_07",
				"pes_gameplay_seeing_a_pm_08",
				"pes_gameplay_seeing_a_plague_monk_01",
				"pes_gameplay_seeing_a_plague_monk_02",
				"pes_gameplay_seeing_a_plague_monk_03",
				"pes_gameplay_seeing_a_plague_monk_04",
				"pes_gameplay_seeing_a_plague_monk_05",
				"pes_gameplay_seeing_a_plague_monk_06",
				"pes_gameplay_seeing_a_plague_monk_07",
				"pes_gameplay_seeing_a_plague_monk_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_seeing_a_pm_01",
				"pes_gameplay_seeing_a_pm_02",
				"pes_gameplay_seeing_a_pm_03",
				"pes_gameplay_seeing_a_pm_04",
				"pes_gameplay_seeing_a_pm_05",
				"pes_gameplay_seeing_a_pm_06",
				"pes_gameplay_seeing_a_pm_07",
				"pes_gameplay_seeing_a_pm_08",
				"pes_gameplay_seeing_a_plague_monk_01",
				"pes_gameplay_seeing_a_plague_monk_02",
				"pes_gameplay_seeing_a_plague_monk_03",
				"pes_gameplay_seeing_a_plague_monk_04",
				"pes_gameplay_seeing_a_plague_monk_05",
				"pes_gameplay_seeing_a_plague_monk_06",
				"pes_gameplay_seeing_a_plague_monk_07",
				"pes_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_Skaven_warpfire_thrower = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
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
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_shield_stormvermin = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_shield_stormvermin_01",
				"pes_gameplay_seeing_a_shield_stormvermin_02",
				"pes_gameplay_seeing_a_shield_stormvermin_03",
				"pes_gameplay_seeing_a_shield_stormvermin_04",
				"pes_gameplay_seeing_a_shield_stormvermin_05",
				"pes_gameplay_seeing_a_shield_stormvermin_06",
				"pes_gameplay_seeing_a_shield_stormvermin_07",
				"pes_gameplay_seeing_a_shield_stormvermin_08"
			},
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
				"pes_gameplay_seeing_a_shield_stormvermin_01",
				"pes_gameplay_seeing_a_shield_stormvermin_02",
				"pes_gameplay_seeing_a_shield_stormvermin_03",
				"pes_gameplay_seeing_a_shield_stormvermin_04",
				"pes_gameplay_seeing_a_shield_stormvermin_05",
				"pes_gameplay_seeing_a_shield_stormvermin_06",
				"pes_gameplay_seeing_a_shield_stormvermin_07",
				"pes_gameplay_seeing_a_shield_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_no_nearby_teammates = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "casual_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_no_nearby_teammates_05",
				"pes_gameplay_no_nearby_teammates_06",
				"pes_gameplay_no_nearby_teammates_09",
				"pes_gameplay_no_nearby_teammates_10",
				"pes_gameplay_no_nearby_teammates_11",
				"pes_gameplay_no_nearby_teammates_12",
				"pes_gameplay_no_nearby_teammates_13",
				"pes_gameplay_no_nearby_teammates_14"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous"
			},
			localization_strings = {
				"pes_gameplay_no_nearby_teammates_05",
				"pes_gameplay_no_nearby_teammates_06",
				"pes_gameplay_no_nearby_teammates_09",
				"pes_gameplay_no_nearby_teammates_10",
				"pes_gameplay_no_nearby_teammates_11",
				"pes_gameplay_no_nearby_teammates_12",
				"pes_gameplay_no_nearby_teammates_13",
				"pes_gameplay_no_nearby_teammates_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_chaos_wizard_tentacle = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_04"
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
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_eaten = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_wood_elf_eaten_01",
				"pes_wood_elf_eaten_02",
				"pes_wood_elf_eaten_03",
				"pes_wood_elf_eaten_04",
				"pes_wood_elf_eaten_05",
				"pes_wood_elf_eaten_06",
				"pes_wood_elf_eaten_07"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_wood_elf_eaten_01",
				"pes_wood_elf_eaten_02",
				"pes_wood_elf_eaten_03",
				"pes_wood_elf_eaten_04",
				"pes_wood_elf_eaten_05",
				"pes_wood_elf_eaten_06",
				"pes_wood_elf_eaten_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_troll = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hearing_a_troll_01",
				"pes_gameplay_hearing_a_troll_02",
				"pes_gameplay_hearing_a_troll_03",
				"pes_gameplay_hearing_a_troll_04",
				"pes_gameplay_hearing_a_troll_05",
				"pes_gameplay_hearing_a_troll_06"
			},
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
				"pes_gameplay_hearing_a_troll_01",
				"pes_gameplay_hearing_a_troll_02",
				"pes_gameplay_hearing_a_troll_03",
				"pes_gameplay_hearing_a_troll_04",
				"pes_gameplay_hearing_a_troll_05",
				"pes_gameplay_hearing_a_troll_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_chaos_wizard_plague = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_plague_01",
				"pes_gameplay_seeing_a_chaos_wizard_plague_02",
				"pes_gameplay_seeing_a_chaos_wizard_plague_03",
				"pes_gameplay_seeing_a_chaos_wizard_plague_04"
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
				"pes_gameplay_seeing_a_chaos_wizard_plague_01",
				"pes_gameplay_seeing_a_chaos_wizard_plague_02",
				"pes_gameplay_seeing_a_chaos_wizard_plague_03",
				"pes_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_chaos_warrior_champion_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
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
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dead_end = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_dead_end_02",
				"pes_gameplay_dead_end_07",
				"pes_gameplay_dead_end_08",
				"pes_gameplay_dead_end_09",
				"pes_gameplay_dead_end_10"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dead_end_02",
				"pes_gameplay_dead_end_07",
				"pes_gameplay_dead_end_08",
				"pes_gameplay_dead_end_09",
				"pes_gameplay_dead_end_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_skaven_warpfire_thrower = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_spawn = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_killing_a_chaos_spawn_01",
				"pes_gameplay_killing_a_chaos_spawn_02",
				"pes_gameplay_killing_a_chaos_spawn_03",
				"pes_gameplay_killing_a_chaos_spawn_04",
				"pes_gameplay_killing_a_chaos_spawn_05",
				"pes_gameplay_killing_a_chaos_spawn_06",
				"pes_gameplay_killing_a_chaos_spawn_07",
				"pes_gameplay_killing_a_chaos_spawn_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_spawn_01",
				"pes_gameplay_killing_a_chaos_spawn_02",
				"pes_gameplay_killing_a_chaos_spawn_03",
				"pes_gameplay_killing_a_chaos_spawn_04",
				"pes_gameplay_killing_a_chaos_spawn_05",
				"pes_gameplay_killing_a_chaos_spawn_06",
				"pes_gameplay_killing_a_chaos_spawn_07",
				"pes_gameplay_killing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_being_helped_up = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_bright_wizard_being_helped_up_04",
				"pes_gameplay_bright_wizard_being_helped_up_05",
				"pes_gameplay_bright_wizard_being_helped_up_06",
				"pes_gameplay_bright_wizard_being_helped_up_07",
				"pes_gameplay_bright_wizard_being_helped_up_08",
				"pes_gameplay_bright_wizard_being_helped_up_09",
				"pes_gameplay_bright_wizard_being_helped_up_10",
				"pes_gameplay_bright_wizard_being_helped_up_11",
				"pes_gameplay_bright_wizard_being_helped_up_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
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
				"pes_gameplay_bright_wizard_being_helped_up_04",
				"pes_gameplay_bright_wizard_being_helped_up_05",
				"pes_gameplay_bright_wizard_being_helped_up_06",
				"pes_gameplay_bright_wizard_being_helped_up_07",
				"pes_gameplay_bright_wizard_being_helped_up_08",
				"pes_gameplay_bright_wizard_being_helped_up_09",
				"pes_gameplay_bright_wizard_being_helped_up_10",
				"pes_gameplay_bright_wizard_being_helped_up_11",
				"pes_gameplay_bright_wizard_being_helped_up_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_warrior = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_killing_a_chaos_warrior_01",
				"pes_gameplay_killing_a_chaos_warrior_02",
				"pes_gameplay_killing_a_chaos_warrior_03",
				"pes_gameplay_killing_a_chaos_warrior_04",
				"pes_gameplay_killing_a_chaos_warrior_05",
				"pes_gameplay_killing_a_chaos_warrior_06",
				"pes_gameplay_killing_a_chaos_warrior_07",
				"pes_gameplay_killing_a_chaos_warrior_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_warrior_01",
				"pes_gameplay_killing_a_chaos_warrior_02",
				"pes_gameplay_killing_a_chaos_warrior_03",
				"pes_gameplay_killing_a_chaos_warrior_04",
				"pes_gameplay_killing_a_chaos_warrior_05",
				"pes_gameplay_killing_a_chaos_warrior_06",
				"pes_gameplay_killing_a_chaos_warrior_07",
				"pes_gameplay_killing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_helped_by_bright_wizard = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "help_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_helped_by_bright_wizard_05",
				"pes_gameplay_helped_by_bright_wizard_06",
				"pes_gameplay_helped_by_bright_wizard_07",
				"pes_gameplay_helped_by_bright_wizard_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_bright_wizard_05",
				"pes_gameplay_helped_by_bright_wizard_06",
				"pes_gameplay_helped_by_bright_wizard_07",
				"pes_gameplay_helped_by_bright_wizard_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_warrior_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_warrior_combat_01",
				"pes_gameplay_hearing_a_chaos_warrior_combat_02",
				"pes_gameplay_hearing_a_chaos_warrior_combat_03",
				"pes_gameplay_hearing_a_chaos_warrior_combat_04",
				"pes_gameplay_hearing_a_chaos_warrior_combat_05",
				"pes_gameplay_hearing_a_chaos_warrior_combat_06",
				"pes_gameplay_hearing_a_chaos_warrior_combat_07",
				"pes_gameplay_hearing_a_chaos_warrior_combat_08"
			},
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
				"pes_gameplay_hearing_a_chaos_warrior_combat_01",
				"pes_gameplay_hearing_a_chaos_warrior_combat_02",
				"pes_gameplay_hearing_a_chaos_warrior_combat_03",
				"pes_gameplay_hearing_a_chaos_warrior_combat_04",
				"pes_gameplay_hearing_a_chaos_warrior_combat_05",
				"pes_gameplay_hearing_a_chaos_warrior_combat_06",
				"pes_gameplay_hearing_a_chaos_warrior_combat_07",
				"pes_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_troll = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_killing_a_troll_01",
				"pes_gameplay_killing_a_troll_02",
				"pes_gameplay_killing_a_troll_03",
				"pes_gameplay_killing_a_troll_04",
				"pes_gameplay_killing_a_troll_05",
				"pes_gameplay_killing_a_troll_06",
				"pes_gameplay_killing_a_troll_07",
				"pes_gameplay_killing_a_troll_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_troll_01",
				"pes_gameplay_killing_a_troll_02",
				"pes_gameplay_killing_a_troll_03",
				"pes_gameplay_killing_a_troll_04",
				"pes_gameplay_killing_a_troll_05",
				"pes_gameplay_killing_a_troll_06",
				"pes_gameplay_killing_a_troll_07",
				"pes_gameplay_killing_a_troll_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_tension_no_enemies = {
			sound_events_n = 16,
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "empire_soldier_honduras",
			category = "casual_talk",
			dialogue_animations_n = 16,
			sound_events = {
				"pes_gameplay_tension_no_enemies_06",
				"pes_gameplay_tension_no_enemies_08",
				"pes_gameplay_tension_no_enemies_09",
				"pes_gameplay_tension_no_enemies_10",
				"pes_gameplay_tension_no_enemies_11",
				"pes_gameplay_tension_no_enemies_12",
				"pes_gameplay_tension_no_enemies_13",
				"pes_gameplay_tension_no_enemies_14",
				"pes_gameplay_tension_no_enemies_15",
				"pes_gameplay_tension_no_enemies_16",
				"pes_gameplay_tension_no_enemies_17",
				"pes_gameplay_tension_no_enemies_18",
				"pes_gameplay_tension_no_enemies_19",
				"pes_gameplay_tension_no_enemies_20",
				"pes_gameplay_tension_no_enemies_21",
				"pes_gameplay_tension_no_enemies_22"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_tension_no_enemies_06",
				"pes_gameplay_tension_no_enemies_08",
				"pes_gameplay_tension_no_enemies_09",
				"pes_gameplay_tension_no_enemies_10",
				"pes_gameplay_tension_no_enemies_11",
				"pes_gameplay_tension_no_enemies_12",
				"pes_gameplay_tension_no_enemies_13",
				"pes_gameplay_tension_no_enemies_14",
				"pes_gameplay_tension_no_enemies_15",
				"pes_gameplay_tension_no_enemies_16",
				"pes_gameplay_tension_no_enemies_17",
				"pes_gameplay_tension_no_enemies_18",
				"pes_gameplay_tension_no_enemies_19",
				"pes_gameplay_tension_no_enemies_20",
				"pes_gameplay_tension_no_enemies_21",
				"pes_gameplay_tension_no_enemies_22"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_tentacle = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
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
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_parry_wood_elf = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_parry_wood_elf_01",
				"pes_gameplay_parry_wood_elf_02",
				"pes_gameplay_parry_wood_elf_03",
				"pes_gameplay_parry_wood_elf_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_wood_elf_01",
				"pes_gameplay_parry_wood_elf_02",
				"pes_gameplay_parry_wood_elf_03",
				"pes_gameplay_parry_wood_elf_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_friendly_fire_dwarf_ranger = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_friendly_fire_dwarf_ranger_01",
				"pes_gameplay_friendly_fire_dwarf_ranger_02",
				"pes_gameplay_friendly_fire_dwarf_ranger_03",
				"pes_gameplay_friendly_fire_dwarf_ranger_04"
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
				"pes_gameplay_friendly_fire_dwarf_ranger_01",
				"pes_gameplay_friendly_fire_dwarf_ranger_02",
				"pes_gameplay_friendly_fire_dwarf_ranger_03",
				"pes_gameplay_friendly_fire_dwarf_ranger_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_plague = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_plague_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_08"
			},
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
				"pes_gameplay_hearing_a_chaos_wizard_plague_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_troll_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_troll_combat_01",
				"pes_gameplay_hearing_a_troll_combat_02",
				"pes_gameplay_hearing_a_troll_combat_03",
				"pes_gameplay_hearing_a_troll_combat_04",
				"pes_gameplay_hearing_a_troll_combat_05",
				"pes_gameplay_hearing_a_troll_combat_06",
				"pes_gameplay_hearing_a_troll_combat_07",
				"pes_gameplay_hearing_a_troll_combat_08"
			},
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
				"pes_gameplay_hearing_a_troll_combat_01",
				"pes_gameplay_hearing_a_troll_combat_02",
				"pes_gameplay_hearing_a_troll_combat_03",
				"pes_gameplay_hearing_a_troll_combat_04",
				"pes_gameplay_hearing_a_troll_combat_05",
				"pes_gameplay_hearing_a_troll_combat_06",
				"pes_gameplay_hearing_a_troll_combat_07",
				"pes_gameplay_hearing_a_troll_combat_08"
			},
			randomize_indexes = {}
		},
		pes_objective_achieved_all_but_one_goal = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_objective_achieved_all_but_one_goal_01",
				"pes_objective_achieved_all_but_one_goal_03",
				"pes_objective_achieved_all_but_one_goal_04",
				"pes_objective_achieved_all_but_one_goal_05",
				"pes_objective_achieved_all_but_one_goal_06",
				"pes_objective_achieved_all_but_one_goal_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_objective_achieved_all_but_one_goal_01",
				"pes_objective_achieved_all_but_one_goal_03",
				"pes_objective_achieved_all_but_one_goal_04",
				"pes_objective_achieved_all_but_one_goal_05",
				"pes_objective_achieved_all_but_one_goal_06",
				"pes_objective_achieved_all_but_one_goal_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_stormfiend = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_killing_a_stormfiend_01",
				"pes_gameplay_killing_a_stormfiend_02",
				"pes_gameplay_killing_a_stormfiend_03",
				"pes_gameplay_killing_a_stormfiend_04",
				"pes_gameplay_killing_a_stormfiend_05",
				"pes_gameplay_killing_a_stormfiend_06",
				"pes_gameplay_killing_a_stormfiend_07",
				"pes_gameplay_killing_a_stormfiend_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_stormfiend_01",
				"pes_gameplay_killing_a_stormfiend_02",
				"pes_gameplay_killing_a_stormfiend_03",
				"pes_gameplay_killing_a_stormfiend_04",
				"pes_gameplay_killing_a_stormfiend_05",
				"pes_gameplay_killing_a_stormfiend_06",
				"pes_gameplay_killing_a_stormfiend_07",
				"pes_gameplay_killing_a_stormfiend_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_a_chaos_wizard_tentacle = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_spawn = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_spawn_01",
				"pes_gameplay_hearing_a_chaos_spawn_02",
				"pes_gameplay_hearing_a_chaos_spawn_03",
				"pes_gameplay_hearing_a_chaos_spawn_04",
				"pes_gameplay_hearing_a_chaos_spawn_05",
				"pes_gameplay_hearing_a_chaos_spawn_06",
				"pes_gameplay_hearing_a_chaos_spawn_07",
				"pes_gameplay_hearing_a_chaos_spawn_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_chaos_spawn_01",
				"pes_gameplay_hearing_a_chaos_spawn_02",
				"pes_gameplay_hearing_a_chaos_spawn_03",
				"pes_gameplay_hearing_a_chaos_spawn_04",
				"pes_gameplay_hearing_a_chaos_spawn_05",
				"pes_gameplay_hearing_a_chaos_spawn_06",
				"pes_gameplay_hearing_a_chaos_spawn_07",
				"pes_gameplay_hearing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_grabbed = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_bright_wizard_grabbed_07",
				"pes_gameplay_bright_wizard_grabbed_08",
				"pes_gameplay_bright_wizard_grabbed_09",
				"pes_gameplay_bright_wizard_grabbed_10",
				"pes_gameplay_bright_wizard_grabbed_11",
				"pes_gameplay_bright_wizard_grabbed_12",
				"pes_gameplay_bright_wizard_grabbed_13",
				"pes_gameplay_bright_wizard_grabbed_14"
			},
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
				"pes_gameplay_bright_wizard_grabbed_07",
				"pes_gameplay_bright_wizard_grabbed_08",
				"pes_gameplay_bright_wizard_grabbed_09",
				"pes_gameplay_bright_wizard_grabbed_10",
				"pes_gameplay_bright_wizard_grabbed_11",
				"pes_gameplay_bright_wizard_grabbed_12",
				"pes_gameplay_bright_wizard_grabbed_13",
				"pes_gameplay_bright_wizard_grabbed_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_chaos_spawn = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_chaos_spawn_01",
				"pes_gameplay_seeing_a_chaos_spawn_02",
				"pes_gameplay_seeing_a_chaos_spawn_03",
				"pes_gameplay_seeing_a_chaos_spawn_04",
				"pes_gameplay_seeing_a_chaos_spawn_05",
				"pes_gameplay_seeing_a_chaos_spawn_06",
				"pes_gameplay_seeing_a_chaos_spawn_07",
				"pes_gameplay_seeing_a_chaos_spawn_08"
			},
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
				"pes_gameplay_seeing_a_chaos_spawn_01",
				"pes_gameplay_seeing_a_chaos_spawn_02",
				"pes_gameplay_seeing_a_chaos_spawn_03",
				"pes_gameplay_seeing_a_chaos_spawn_04",
				"pes_gameplay_seeing_a_chaos_spawn_05",
				"pes_gameplay_seeing_a_chaos_spawn_06",
				"pes_gameplay_seeing_a_chaos_spawn_07",
				"pes_gameplay_seeing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_pm = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_hearing_a_pm_01",
				"pes_gameplay_hearing_a_pm_02",
				"pes_gameplay_hearing_a_pm_03",
				"pes_gameplay_hearing_a_pm_04",
				"pes_gameplay_hearing_a_plague_monk_01",
				"pes_gameplay_hearing_a_plague_monk_02",
				"pes_gameplay_hearing_a_plague_monk_03",
				"pes_gameplay_hearing_a_plague_monk_04",
				"pes_gameplay_hearing_a_plague_monk_05",
				"pes_gameplay_hearing_a_plague_monk_06",
				"pes_gameplay_hearing_a_plague_monk_07",
				"pes_gameplay_hearing_a_plague_monk_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_hearing_a_pm_01",
				"pes_gameplay_hearing_a_pm_02",
				"pes_gameplay_hearing_a_pm_03",
				"pes_gameplay_hearing_a_pm_04",
				"pes_gameplay_hearing_a_plague_monk_01",
				"pes_gameplay_hearing_a_plague_monk_02",
				"pes_gameplay_hearing_a_plague_monk_03",
				"pes_gameplay_hearing_a_plague_monk_04",
				"pes_gameplay_hearing_a_plague_monk_05",
				"pes_gameplay_hearing_a_plague_monk_06",
				"pes_gameplay_hearing_a_plague_monk_07",
				"pes_gameplay_hearing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_scr = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 15,
			sound_events = {
				"pes_gameplay_seeing_a_scr_01",
				"pes_gameplay_seeing_a_scr_02",
				"pes_gameplay_seeing_a_scr_03",
				"pes_gameplay_seeing_a_scr_04",
				"pes_gameplay_seeing_a_scr_05",
				"pes_gameplay_seeing_a_scr_06",
				"pes_gameplay_seeing_a_scr_07",
				"pes_gameplay_seeing_a_shield_clanrat_01",
				"pes_gameplay_seeing_a_shield_clanrat_02",
				"pes_gameplay_seeing_a_shield_clanrat_03",
				"pes_gameplay_seeing_a_shield_clanrat_04",
				"pes_gameplay_seeing_a_shield_clanrat_05",
				"pes_gameplay_seeing_a_shield_clanrat_06",
				"pes_gameplay_seeing_a_shield_clanrat_07",
				"pes_gameplay_seeing_a_shield_clanrat_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_seeing_a_scr_01",
				"pes_gameplay_seeing_a_scr_02",
				"pes_gameplay_seeing_a_scr_03",
				"pes_gameplay_seeing_a_scr_04",
				"pes_gameplay_seeing_a_scr_05",
				"pes_gameplay_seeing_a_scr_06",
				"pes_gameplay_seeing_a_scr_07",
				"pes_gameplay_seeing_a_shield_clanrat_01",
				"pes_gameplay_seeing_a_shield_clanrat_02",
				"pes_gameplay_seeing_a_shield_clanrat_03",
				"pes_gameplay_seeing_a_shield_clanrat_04",
				"pes_gameplay_seeing_a_shield_clanrat_05",
				"pes_gameplay_seeing_a_shield_clanrat_06",
				"pes_gameplay_seeing_a_shield_clanrat_07",
				"pes_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun_combat = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_09"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
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
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_09"
			},
			randomize_indexes = {}
		},
		pes_last_hero_standing = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_last_hero_standing_01",
				"pes_last_hero_standing_02",
				"pes_last_hero_standing_03",
				"pes_last_hero_standing_04",
				"pes_last_hero_standing_05",
				"pes_last_hero_standing_06",
				"pes_last_hero_standing_07",
				"pes_last_hero_standing_08"
			},
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
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pes_last_hero_standing_01",
				"pes_last_hero_standing_02",
				"pes_last_hero_standing_03",
				"pes_last_hero_standing_04",
				"pes_last_hero_standing_05",
				"pes_last_hero_standing_06",
				"pes_last_hero_standing_07",
				"pes_last_hero_standing_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_marauder_berserker_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_marauder_berserker_combat_01",
				"pes_gameplay_hearing_marauder_berserker_combat_02",
				"pes_gameplay_hearing_marauder_berserker_combat_03",
				"pes_gameplay_hearing_marauder_berserker_combat_04",
				"pes_gameplay_hearing_marauder_berserker_combat_05",
				"pes_gameplay_hearing_marauder_berserker_combat_06",
				"pes_gameplay_hearing_marauder_berserker_combat_07",
				"pes_gameplay_hearing_marauder_berserker_combat_08"
			},
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
				"pes_gameplay_hearing_marauder_berserker_combat_01",
				"pes_gameplay_hearing_marauder_berserker_combat_02",
				"pes_gameplay_hearing_marauder_berserker_combat_03",
				"pes_gameplay_hearing_marauder_berserker_combat_04",
				"pes_gameplay_hearing_marauder_berserker_combat_05",
				"pes_gameplay_hearing_marauder_berserker_combat_06",
				"pes_gameplay_hearing_marauder_berserker_combat_07",
				"pes_gameplay_hearing_marauder_berserker_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_parry_dwarf_ranger = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_parry_dwarf_ranger_01",
				"pes_gameplay_parry_dwarf_ranger_02",
				"pes_gameplay_parry_dwarf_ranger_03",
				"pes_gameplay_parry_dwarf_ranger_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_dwarf_ranger_01",
				"pes_gameplay_parry_dwarf_ranger_02",
				"pes_gameplay_parry_dwarf_ranger_03",
				"pes_gameplay_parry_dwarf_ranger_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hears_incoming_horde = {
			sound_events_n = 18,
			randomize_indexes_n = 0,
			face_animations_n = 18,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 18,
			sound_events = {
				"pes_gameplay_hears_incoming_horde_06",
				"pes_gameplay_hears_incoming_horde_10",
				"pes_gameplay_hears_incoming_horde_11",
				"pes_gameplay_hears_incoming_horde_12",
				"pes_gameplay_hears_incoming_horde_13",
				"pes_gameplay_hears_incoming_horde_14",
				"pes_gameplay_hears_incoming_horde_15",
				"pes_gameplay_hears_incoming_horde_16",
				"pes_gameplay_hears_incoming_horde_17",
				"pes_gameplay_hears_incoming_horde_18",
				"pes_gameplay_hears_incoming_horde_19",
				"pes_gameplay_hears_incoming_horde_20",
				"pes_gameplay_hears_incoming_horde_21",
				"pes_gameplay_hears_incoming_horde_22",
				"pes_gameplay_hears_incoming_horde_23",
				"pes_gameplay_hears_incoming_horde_24",
				"pes_gameplay_hears_incoming_horde_25",
				"pes_gameplay_hears_incoming_horde_26"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_contempt",
				"face_smug",
				"face_smug",
				"face_smug",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hears_incoming_horde_06",
				"pes_gameplay_hears_incoming_horde_10",
				"pes_gameplay_hears_incoming_horde_11",
				"pes_gameplay_hears_incoming_horde_12",
				"pes_gameplay_hears_incoming_horde_13",
				"pes_gameplay_hears_incoming_horde_14",
				"pes_gameplay_hears_incoming_horde_15",
				"pes_gameplay_hears_incoming_horde_16",
				"pes_gameplay_hears_incoming_horde_17",
				"pes_gameplay_hears_incoming_horde_18",
				"pes_gameplay_hears_incoming_horde_19",
				"pes_gameplay_hears_incoming_horde_20",
				"pes_gameplay_hears_incoming_horde_21",
				"pes_gameplay_hears_incoming_horde_22",
				"pes_gameplay_hears_incoming_horde_23",
				"pes_gameplay_hears_incoming_horde_24",
				"pes_gameplay_hears_incoming_horde_25",
				"pes_gameplay_hears_incoming_horde_26"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_up = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_up",
				"pes_objective_correct_path_up_02",
				"pes_objective_correct_path_up_03",
				"pes_objective_correct_path_up_04"
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
				"pes_objective_correct_path_up",
				"pes_objective_correct_path_up_02",
				"pes_objective_correct_path_up_03",
				"pes_objective_correct_path_up_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_armoured_enemy_dwarf_ranger = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_armoured_enemy_dwarf_04",
				"pes_gameplay_armoured_enemy_dwarf_05",
				"pes_gameplay_armoured_enemy_dwarf_06",
				"pes_gameplay_armoured_enemy_dwarf_07",
				"pes_gameplay_armoured_enemy_dwarf_08",
				"pes_gameplay_armoured_enemy_dwarf_ranger_04",
				"pes_gameplay_armoured_enemy_dwarf_ranger_05",
				"pes_gameplay_armoured_enemy_dwarf_ranger_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_armoured_enemy_dwarf_04",
				"pes_gameplay_armoured_enemy_dwarf_05",
				"pes_gameplay_armoured_enemy_dwarf_06",
				"pes_gameplay_armoured_enemy_dwarf_07",
				"pes_gameplay_armoured_enemy_dwarf_08",
				"pes_gameplay_armoured_enemy_dwarf_ranger_04",
				"pes_gameplay_armoured_enemy_dwarf_ranger_05",
				"pes_gameplay_armoured_enemy_dwarf_ranger_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_on_a_frenzy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_bright_wizard_on_a_frenzy_02",
				"pes_gameplay_bright_wizard_on_a_frenzy_05",
				"pes_gameplay_bright_wizard_on_a_frenzy_06",
				"pes_gameplay_bright_wizard_on_a_frenzy_07"
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
				"pes_gameplay_bright_wizard_on_a_frenzy_02",
				"pes_gameplay_bright_wizard_on_a_frenzy_05",
				"pes_gameplay_bright_wizard_on_a_frenzy_06",
				"pes_gameplay_bright_wizard_on_a_frenzy_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_globadier_combat = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_hearing_a_globadier_combat_03",
				"pes_gameplay_hearing_a_globadier_combat_04",
				"pes_gameplay_hearing_a_globadier_combat_06",
				"pes_gameplay_hearing_a_globadier_combat_07",
				"pes_gameplay_hearing_a_globadier_combat_08"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_globadier_combat_03",
				"pes_gameplay_hearing_a_globadier_combat_04",
				"pes_gameplay_hearing_a_globadier_combat_06",
				"pes_gameplay_hearing_a_globadier_combat_07",
				"pes_gameplay_hearing_a_globadier_combat_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_potion = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "empire_soldier_honduras",
			category = "seen_items",
			dialogue_animations_n = 15,
			sound_events = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_06",
				"pes_gameplay_spots_potion_07",
				"pes_gameplay_spots_potion_08",
				"pes_gameplay_spots_potion_09",
				"pes_gameplay_spots_potion_10",
				"pes_gameplay_spots_potion_11",
				"pes_gameplay_spots_potion_12",
				"pes_gameplay_spots_potion_13",
				"pes_gameplay_spots_potion_14",
				"pes_gameplay_spots_potion_15",
				"pes_gameplay_spots_potion_16",
				"pes_gameplay_spots_potion_17"
			},
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
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_06",
				"pes_gameplay_spots_potion_07",
				"pes_gameplay_spots_potion_08",
				"pes_gameplay_spots_potion_09",
				"pes_gameplay_spots_potion_10",
				"pes_gameplay_spots_potion_11",
				"pes_gameplay_spots_potion_12",
				"pes_gameplay_spots_potion_13",
				"pes_gameplay_spots_potion_14",
				"pes_gameplay_spots_potion_15",
				"pes_gameplay_spots_potion_16",
				"pes_gameplay_spots_potion_17"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_door = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_objective_correct_path_door_01",
				"pes_objective_correct_path_door_02",
				"pes_objective_correct_path_door_05",
				"pes_objective_correct_path_door_06",
				"pes_objective_correct_path_door_07"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_correct_path_door_01",
				"pes_objective_correct_path_door_02",
				"pes_objective_correct_path_door_05",
				"pes_objective_correct_path_door_06",
				"pes_objective_correct_path_door_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_friendly_fire_bright_wizard = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_friendly_fire_bright_wizard_05",
				"pes_gameplay_friendly_fire_bright_wizard_06",
				"pes_gameplay_friendly_fire_bright_wizard_07",
				"pes_gameplay_friendly_fire_bright_wizard_08",
				"pes_gameplay_friendly_fire_bright_wizard_09"
			},
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_bright_wizard_05",
				"pes_gameplay_friendly_fire_bright_wizard_06",
				"pes_gameplay_friendly_fire_bright_wizard_07",
				"pes_gameplay_friendly_fire_bright_wizard_08",
				"pes_gameplay_friendly_fire_bright_wizard_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_leech = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_leech_01",
				"pes_gameplay_hearing_a_chaos_wizard_leech_02",
				"pes_gameplay_hearing_a_chaos_wizard_leech_03",
				"pes_gameplay_hearing_a_chaos_wizard_leech_04",
				"pes_gameplay_seeing_a_chaos_wizard_leech_07",
				"pes_gameplay_seeing_a_chaos_wizard_leech_08",
				"pes_gameplay_seeing_a_chaos_wizard_leech_09",
				"pes_gameplay_seeing_a_chaos_wizard_leech_10"
			},
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
				"pes_gameplay_hearing_a_chaos_wizard_leech_01",
				"pes_gameplay_hearing_a_chaos_wizard_leech_02",
				"pes_gameplay_hearing_a_chaos_wizard_leech_03",
				"pes_gameplay_hearing_a_chaos_wizard_leech_04",
				"pes_gameplay_seeing_a_chaos_wizard_leech_07",
				"pes_gameplay_seeing_a_chaos_wizard_leech_08",
				"pes_gameplay_seeing_a_chaos_wizard_leech_09",
				"pes_gameplay_seeing_a_chaos_wizard_leech_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_rat_ogre = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
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
				"pes_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_out_of_ammo = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_out_of_ammo_05",
				"pes_gameplay_out_of_ammo_06",
				"pes_gameplay_out_of_ammo_07",
				"pes_gameplay_out_of_ammo_08",
				"pes_gameplay_out_of_ammo_09",
				"pes_gameplay_out_of_ammo_10",
				"pes_gameplay_out_of_ammo_11",
				"pes_gameplay_out_of_ammo_12",
				"pes_gameplay_out_of_ammo_13"
			},
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_out_of_ammo_05",
				"pes_gameplay_out_of_ammo_06",
				"pes_gameplay_out_of_ammo_07",
				"pes_gameplay_out_of_ammo_08",
				"pes_gameplay_out_of_ammo_09",
				"pes_gameplay_out_of_ammo_10",
				"pes_gameplay_out_of_ammo_11",
				"pes_gameplay_out_of_ammo_12",
				"pes_gameplay_out_of_ammo_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_globadier = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_killing_globadier_02",
				"pes_gameplay_killing_globadier_03",
				"pes_gameplay_killing_globadier_05",
				"pes_gameplay_killing_globadier_06"
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
				"pes_gameplay_killing_globadier_02",
				"pes_gameplay_killing_globadier_03",
				"pes_gameplay_killing_globadier_05",
				"pes_gameplay_killing_globadier_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_killing_ratling = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_killing_ratling_03",
				"pes_gameplay_killing_ratling_05",
				"pes_gameplay_killing_ratling_06",
				"pes_gameplay_killing_ratling_07"
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
				"pes_gameplay_killing_ratling_03",
				"pes_gameplay_killing_ratling_05",
				"pes_gameplay_killing_ratling_06",
				"pes_gameplay_killing_ratling_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_globadier = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_hearing_a_globadier_07",
				"pes_gameplay_hearing_a_globadier_08",
				"pes_gameplay_hearing_a_globadier_09",
				"pes_gameplay_hearing_a_globadier_10",
				"pes_gameplay_hearing_a_globadier_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_globadier_07",
				"pes_gameplay_hearing_a_globadier_08",
				"pes_gameplay_hearing_a_globadier_09",
				"pes_gameplay_hearing_a_globadier_10",
				"pes_gameplay_hearing_a_globadier_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_armoured_enemy_witch_hunter = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_armoured_enemy_witch_hunter_04",
				"pes_gameplay_armoured_enemy_witch_hunter_05",
				"pes_gameplay_armoured_enemy_witch_hunter_06",
				"pes_gameplay_armoured_enemy_witch_hunter_07",
				"pes_gameplay_armoured_enemy_witch_hunter_08",
				"pes_gameplay_armoured_enemy_witch_hunter_09",
				"pes_gameplay_armoured_enemy_witch_hunter_10",
				"pes_gameplay_armoured_enemy_witch_hunter_11"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_armoured_enemy_witch_hunter_04",
				"pes_gameplay_armoured_enemy_witch_hunter_05",
				"pes_gameplay_armoured_enemy_witch_hunter_06",
				"pes_gameplay_armoured_enemy_witch_hunter_07",
				"pes_gameplay_armoured_enemy_witch_hunter_08",
				"pes_gameplay_armoured_enemy_witch_hunter_09",
				"pes_gameplay_armoured_enemy_witch_hunter_10",
				"pes_gameplay_armoured_enemy_witch_hunter_11"
			},
			randomize_indexes = {}
		},
		pes_activate_ability_knight = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "activate_ability",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_activate_ability_knight_01",
				"pes_activate_ability_knight_02",
				"pes_activate_ability_knight_03",
				"pes_activate_ability_knight_04",
				"pes_activate_ability_knight_05",
				"pes_activate_ability_knight_06"
			},
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
				"pes_activate_ability_knight_01",
				"pes_activate_ability_knight_02",
				"pes_activate_ability_knight_03",
				"pes_activate_ability_knight_04",
				"pes_activate_ability_knight_05",
				"pes_activate_ability_knight_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_incoming_skaven_rat_ogre = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			category = "enemy_alerts_boss",
			dialogue_animations_n = 9,
			sound_events = {
				"pes_gameplay_incoming_skaven_rat_ogre_01",
				"pes_gameplay_incoming_skaven_rat_ogre_05",
				"pes_gameplay_incoming_skaven_rat_ogre_06",
				"pes_gameplay_incoming_Skaven_rat_ogre_09",
				"pes_gameplay_incoming_Skaven_rat_ogre_10",
				"pes_gameplay_incoming_Skaven_rat_ogre_11",
				"pes_gameplay_incoming_Skaven_rat_ogre_12",
				"pes_gameplay_incoming_Skaven_rat_ogre_13",
				"pes_gameplay_incoming_Skaven_rat_ogre_14"
			},
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
				"pes_gameplay_incoming_skaven_rat_ogre_01",
				"pes_gameplay_incoming_skaven_rat_ogre_05",
				"pes_gameplay_incoming_skaven_rat_ogre_06",
				"pes_gameplay_incoming_Skaven_rat_ogre_09",
				"pes_gameplay_incoming_Skaven_rat_ogre_10",
				"pes_gameplay_incoming_Skaven_rat_ogre_11",
				"pes_gameplay_incoming_Skaven_rat_ogre_12",
				"pes_gameplay_incoming_Skaven_rat_ogre_13",
				"pes_gameplay_incoming_Skaven_rat_ogre_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind_combat = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
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
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_eaten = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_bright_wizard_eaten_01",
				"pes_bright_wizard_eaten_02",
				"pes_bright_wizard_eaten_03",
				"pes_bright_wizard_eaten_04",
				"pes_bright_wizard_eaten_05",
				"pes_bright_wizard_eaten_06",
				"pes_bright_wizard_eaten_07"
			},
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_bright_wizard_eaten_01",
				"pes_bright_wizard_eaten_02",
				"pes_bright_wizard_eaten_03",
				"pes_bright_wizard_eaten_04",
				"pes_bright_wizard_eaten_05",
				"pes_bright_wizard_eaten_06",
				"pes_bright_wizard_eaten_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_ratling_gun = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_11"
			},
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
				"pes_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_11"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_low_on_health = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_wood_elf_low_on_health_05",
				"pes_gameplay_wood_elf_low_on_health_06",
				"pes_gameplay_wood_elf_low_on_health_07",
				"pes_gameplay_wood_elf_low_on_health_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_low_on_health_05",
				"pes_gameplay_wood_elf_low_on_health_06",
				"pes_gameplay_wood_elf_low_on_health_07",
				"pes_gameplay_wood_elf_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_stairs_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_stairs_down_01",
				"pes_objective_correct_path_stairs_down_04",
				"pes_objective_correct_path_stairs_down_05",
				"pes_objective_correct_path_stairs_down_06"
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
				"pes_objective_correct_path_stairs_down_01",
				"pes_objective_correct_path_stairs_down_04",
				"pes_objective_correct_path_stairs_down_05",
				"pes_objective_correct_path_stairs_down_06"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_alley = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_objective_correct_path_alley_01",
				"pes_objective_correct_path_alley_02",
				"pes_objective_correct_path_alley_03",
				"pes_objective_correct_path_alley_04"
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
				"pes_objective_correct_path_alley_01",
				"pes_objective_correct_path_alley_02",
				"pes_objective_correct_path_alley_03",
				"pes_objective_correct_path_alley_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_globadier = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
			},
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
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
			randomize_indexes = {}
		},
		pes_objective_dropping_grimoire = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_objective_dropping_grimoire_05",
				"pes_objective_dropping_grimoire_06",
				"pes_objective_dropping_grimoire_07",
				"pes_objective_dropping_grimoire_08",
				"pes_objective_dropping_grimoire_09",
				"pes_objective_dropping_grimoire_10",
				"pes_objective_dropping_grimoire_11",
				"pes_objective_dropping_grimoire_12"
			},
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
				"pes_objective_dropping_grimoire_05",
				"pes_objective_dropping_grimoire_06",
				"pes_objective_dropping_grimoire_07",
				"pes_objective_dropping_grimoire_08",
				"pes_objective_dropping_grimoire_09",
				"pes_objective_dropping_grimoire_10",
				"pes_objective_dropping_grimoire_11",
				"pes_objective_dropping_grimoire_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bile_troll_before_puke = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_bile_troll_before_puke_01",
				"pes_gameplay_bile_troll_before_puke_02",
				"pes_gameplay_bile_troll_before_puke_03",
				"pes_gameplay_bile_troll_before_puke_04",
				"pes_gameplay_bile_troll_before_puke_05",
				"pes_gameplay_bile_troll_before_puke_06",
				"pes_gameplay_bile_troll_before_puke_07",
				"pes_gameplay_bile_troll_before_puke_08"
			},
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_bile_troll_before_puke_01",
				"pes_gameplay_bile_troll_before_puke_02",
				"pes_gameplay_bile_troll_before_puke_03",
				"pes_gameplay_bile_troll_before_puke_04",
				"pes_gameplay_bile_troll_before_puke_05",
				"pes_gameplay_bile_troll_before_puke_06",
				"pes_gameplay_bile_troll_before_puke_07",
				"pes_gameplay_bile_troll_before_puke_08"
			},
			randomize_indexes = {}
		},
		pes_objective_interacting_with_objective = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_objective_interacting_with_objective_02",
				"pes_objective_interacting_with_objective_04",
				"pes_objective_interacting_with_objective_05",
				"pes_objective_interacting_with_objective_06",
				"pes_objective_interacting_with_objective_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_interacting_with_objective_02",
				"pes_objective_interacting_with_objective_04",
				"pes_objective_interacting_with_objective_05",
				"pes_objective_interacting_with_objective_06",
				"pes_objective_interacting_with_objective_07"
			},
			randomize_indexes = {}
		},
		pes_curse = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "casual_talk",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_curse_01",
				"pes_curse_02",
				"pes_curse_03",
				"pes_curse_04",
				"pes_curse_05",
				"pes_curse_06",
				"pes_curse_07",
				"pes_curse_08",
				"pes_curse_09",
				"pes_curse_10",
				"pes_curse_11",
				"pes_curse_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_curse_01",
				"pes_curse_02",
				"pes_curse_03",
				"pes_curse_04",
				"pes_curse_05",
				"pes_curse_06",
				"pes_curse_07",
				"pes_curse_08",
				"pes_curse_09",
				"pes_curse_10",
				"pes_curse_11",
				"pes_curse_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_throwing_bomb = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_throwing_bomb_01",
				"pes_gameplay_throwing_bomb_03",
				"pes_gameplay_throwing_bomb_06",
				"pes_gameplay_throwing_bomb_07",
				"pes_gameplay_throwing_bomb_08"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_throwing_bomb_01",
				"pes_gameplay_throwing_bomb_03",
				"pes_gameplay_throwing_bomb_06",
				"pes_gameplay_throwing_bomb_07",
				"pes_gameplay_throwing_bomb_08"
			},
			randomize_indexes = {}
		},
		pes_objective_goal_achieved_more_left = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_objective_goal_achieved_more_left_01",
				"pes_objective_goal_achieved_more_left_04",
				"pes_objective_goal_achieved_more_left_06",
				"pes_objective_goal_achieved_more_left_09",
				"pes_objective_goal_achieved_more_left_10",
				"pes_objective_goal_achieved_more_left_11",
				"pes_objective_goal_achieved_more_left_12",
				"pes_objective_goal_achieved_more_left_13"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_objective_goal_achieved_more_left_01",
				"pes_objective_goal_achieved_more_left_04",
				"pes_objective_goal_achieved_more_left_06",
				"pes_objective_goal_achieved_more_left_09",
				"pes_objective_goal_achieved_more_left_10",
				"pes_objective_goal_achieved_more_left_11",
				"pes_objective_goal_achieved_more_left_12",
				"pes_objective_goal_achieved_more_left_13"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_dwarf_ranger_in_trouble = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_09"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_bright_wizard_in_trouble = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_05",
				"pes_gameplay_heard_bright_wizard_in_trouble_06"
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
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_05",
				"pes_gameplay_heard_bright_wizard_in_trouble_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_parry_bright_wizard = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_parry_bright_wizard_01",
				"pes_gameplay_parry_bright_wizard_02",
				"pes_gameplay_parry_bright_wizard_03",
				"pes_gameplay_parry_bright_wizard_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_bright_wizard_01",
				"pes_gameplay_parry_bright_wizard_02",
				"pes_gameplay_parry_bright_wizard_03",
				"pes_gameplay_parry_bright_wizard_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_taking_heavy_damage = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			category = "player_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_taking_heavy_damage_10",
				"pes_gameplay_taking_heavy_damage_11",
				"pes_gameplay_taking_heavy_damage_12",
				"pes_gameplay_taking_heavy_damage_13",
				"pes_gameplay_taking_heavy_damage_14",
				"pes_gameplay_taking_heavy_damage_15",
				"pes_gameplay_taking_heavy_damage_16",
				"pes_gameplay_taking_heavy_damage_17",
				"pes_gameplay_taking_heavy_damage_18",
				"pes_gameplay_taking_heavy_damage_19",
				"pes_gameplay_taking_heavy_damage_20",
				"pes_gameplay_taking_heavy_damage_21"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pes_gameplay_taking_heavy_damage_10",
				"pes_gameplay_taking_heavy_damage_11",
				"pes_gameplay_taking_heavy_damage_12",
				"pes_gameplay_taking_heavy_damage_13",
				"pes_gameplay_taking_heavy_damage_14",
				"pes_gameplay_taking_heavy_damage_15",
				"pes_gameplay_taking_heavy_damage_16",
				"pes_gameplay_taking_heavy_damage_17",
				"pes_gameplay_taking_heavy_damage_18",
				"pes_gameplay_taking_heavy_damage_19",
				"pes_gameplay_taking_heavy_damage_20",
				"pes_gameplay_taking_heavy_damage_21"
			},
			randomize_indexes = {}
		},
		pes_gameplay_healing_draught = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			category = "seen_items",
			dialogue_animations_n = 10,
			sound_events = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_09",
				"pes_gameplay_healing_draught_10",
				"pes_gameplay_healing_draught_11",
				"pes_gameplay_healing_draught_12",
				"pes_gameplay_healing_draught_13",
				"pes_gameplay_healing_draught_14",
				"pes_gameplay_healing_draught_15",
				"pes_gameplay_healing_draught_16"
			},
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
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_09",
				"pes_gameplay_healing_draught_10",
				"pes_gameplay_healing_draught_11",
				"pes_gameplay_healing_draught_12",
				"pes_gameplay_healing_draught_13",
				"pes_gameplay_healing_draught_14",
				"pes_gameplay_healing_draught_15",
				"pes_gameplay_healing_draught_16"
			},
			randomize_indexes = {}
		},
		pes_gameplay_healing_wood_elf = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_healing_wood_elf_01",
				"pes_gameplay_healing_wood_elf_02",
				"pes_gameplay_healing_wood_elf_03",
				"pes_gameplay_healing_wood_elf_04"
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
				"pes_gameplay_healing_wood_elf_01",
				"pes_gameplay_healing_wood_elf_02",
				"pes_gameplay_healing_wood_elf_03",
				"pes_gameplay_healing_wood_elf_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_encouraging_words = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			category = "casual_talk",
			dialogue_animations_n = 10,
			sound_events = {
				"pes_gameplay_encouraging_words_06",
				"pes_gameplay_encouraging_words_07",
				"pes_gameplay_encouraging_words_08",
				"pes_gameplay_encouraging_words_09",
				"pes_gameplay_encouraging_words_10",
				"pes_gameplay_encouraging_words_11",
				"pes_gameplay_encouraging_words_12",
				"pes_gameplay_encouraging_words_13",
				"pes_gameplay_encouraging_words_14",
				"pes_gameplay_encouraging_words_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_encouraging_words_06",
				"pes_gameplay_encouraging_words_07",
				"pes_gameplay_encouraging_words_08",
				"pes_gameplay_encouraging_words_09",
				"pes_gameplay_encouraging_words_10",
				"pes_gameplay_encouraging_words_11",
				"pes_gameplay_encouraging_words_12",
				"pes_gameplay_encouraging_words_13",
				"pes_gameplay_encouraging_words_14",
				"pes_gameplay_encouraging_words_15"
			},
			randomize_indexes = {}
		},
		pes_objective_nearing_objective_deadline = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_objective_nearing_objective_deadline_01",
				"pes_objective_nearing_objective_deadline_02",
				"pes_objective_nearing_objective_deadline_03"
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
				"pes_objective_nearing_objective_deadline_01",
				"pes_objective_nearing_objective_deadline_02",
				"pes_objective_nearing_objective_deadline_03"
			},
			randomize_indexes = {}
		},
		pes_objective_correct_path_bridge = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "empire_soldier_honduras",
			category = "guidance",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_objective_correct_path_bridge_15",
				"pes_objective_correct_path_bridge_17",
				"pes_objective_correct_path_bridge_18"
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
				"pes_objective_correct_path_bridge_15",
				"pes_objective_correct_path_bridge_17",
				"pes_objective_correct_path_bridge_18"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_low_on_health = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_dwarf_ranger_low_on_health_05",
				"pes_gameplay_dwarf_ranger_low_on_health_06",
				"pes_gameplay_dwarf_ranger_low_on_health_07",
				"pes_gameplay_dwarf_ranger_low_on_health_08"
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
				"pes_gameplay_dwarf_ranger_low_on_health_05",
				"pes_gameplay_dwarf_ranger_low_on_health_06",
				"pes_gameplay_dwarf_ranger_low_on_health_07",
				"pes_gameplay_dwarf_ranger_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_using_potion = {
			sound_events_n = 14,
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 14,
			sound_events = {
				"pes_gameplay_using_potion_06",
				"pes_gameplay_using_potion_07",
				"pes_gameplay_using_potion_08",
				"pes_gameplay_using_potion_09",
				"pes_gameplay_using_potion_10",
				"pes_gameplay_using_potion_11",
				"pes_gameplay_using_potion_12",
				"pes_gameplay_using_potion_13",
				"pes_gameplay_using_potion_14",
				"pes_gameplay_using_potion_15",
				"pes_gameplay_using_potion_16",
				"pes_gameplay_using_potion_17",
				"pes_gameplay_using_potion_17",
				"pes_important_line_01"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_using_potion_06",
				"pes_gameplay_using_potion_07",
				"pes_gameplay_using_potion_08",
				"pes_gameplay_using_potion_09",
				"pes_gameplay_using_potion_10",
				"pes_gameplay_using_potion_11",
				"pes_gameplay_using_potion_12",
				"pes_gameplay_using_potion_13",
				"pes_gameplay_using_potion_14",
				"pes_gameplay_using_potion_15",
				"pes_gameplay_using_potion_16",
				"pes_gameplay_using_potion_17",
				"pes_gameplay_using_potion_17",
				"pes_important_line_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_friendly_fire_wood_elf = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_friendly_fire_wood_elf_03",
				"pes_gameplay_friendly_fire_wood_elf_05",
				"pes_gameplay_friendly_fire_wood_elf_06",
				"pes_gameplay_friendly_fire_wood_elf_07",
				"pes_gameplay_friendly_fire_wood_elf_08",
				"pes_gameplay_friendly_fire_wood_elf_09"
			},
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_wood_elf_03",
				"pes_gameplay_friendly_fire_wood_elf_05",
				"pes_gameplay_friendly_fire_wood_elf_06",
				"pes_gameplay_friendly_fire_wood_elf_07",
				"pes_gameplay_friendly_fire_wood_elf_08",
				"pes_gameplay_friendly_fire_wood_elf_09"
			},
			randomize_indexes = {}
		},
		pes_gameplay_helped_by_wood_elf = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			category = "help_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_helped_by_wood_elf_02",
				"pes_gameplay_helped_by_wood_elf_05",
				"pes_gameplay_helped_by_wood_elf_06",
				"pes_gameplay_helped_by_wood_elf_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_wood_elf_02",
				"pes_gameplay_helped_by_wood_elf_05",
				"pes_gameplay_helped_by_wood_elf_06",
				"pes_gameplay_helped_by_wood_elf_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_self_heal = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			category = "player_feedback",
			dialogue_animations_n = 10,
			sound_events = {
				"pes_gameplay_self_heal_06",
				"pes_gameplay_self_heal_07",
				"pes_gameplay_self_heal_08",
				"pes_gameplay_self_heal_09",
				"pes_gameplay_self_heal_10",
				"pes_gameplay_self_heal_11",
				"pes_gameplay_self_heal_12",
				"pes_gameplay_self_heal_13",
				"pes_gameplay_self_heal_14",
				"pes_gameplay_self_heal_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_self_heal_06",
				"pes_gameplay_self_heal_07",
				"pes_gameplay_self_heal_08",
				"pes_gameplay_self_heal_09",
				"pes_gameplay_self_heal_10",
				"pes_gameplay_self_heal_11",
				"pes_gameplay_self_heal_12",
				"pes_gameplay_self_heal_13",
				"pes_gameplay_self_heal_14",
				"pes_gameplay_self_heal_15"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dead_body = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			category = "casual_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_dead_body_06",
				"pes_gameplay_dead_body_07",
				"pes_gameplay_dead_body_08",
				"pes_gameplay_dead_body_09",
				"pes_gameplay_dead_body_10"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dead_body_06",
				"pes_gameplay_dead_body_07",
				"pes_gameplay_dead_body_08",
				"pes_gameplay_dead_body_09",
				"pes_gameplay_dead_body_10"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hearing_a_chaos_wizard_plague_combat = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
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
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			randomize_indexes = {}
		}
	})

	return 
end
