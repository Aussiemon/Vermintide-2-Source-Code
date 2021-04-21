return function ()
	define_rule({
		name = "pwh_crawl_drunk_buff_wears_off",
		response = "pwh_crawl_drunk_buff_wears_off",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"buff_wears_off"
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
				"buff_wears_off",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"buff_wears_off",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_crawl_drunk_buff_begins",
		response = "pwh_crawl_drunk_buff_begins",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"drunk_buff_begins"
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
				"drunk_buff_begins",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"drunk_buff_begins",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_crawl_drunk_buff_begins_from_sick",
		response = "pwh_crawl_drunk_buff_begins_from_sick",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"buff_begins_from_sick"
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
				"buff_begins_from_sick",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"buff_begins_from_sick",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_draught_drunk",
		response = "pwh_gameplay_healing_draught_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"enemies_distant",
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
				17
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
				120
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
		name = "pwh_gameplay_spots_potion_drunk",
		response = "pwh_gameplay_spots_potion_drunk",
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
				"witch_hunter"
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
				17
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
				120
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
		name = "pwh_gameplay_using_potion_drunk",
		response = "pwh_gameplay_using_potion_drunk",
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
		name = "pwh_gameplay_tips_wizard_wind_drunk",
		response = "pwh_gameplay_tips_wizard_wind_drunk",
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
				"chaos_vortex_spawned"
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				55
			},
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMESET
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_crawl_drank",
		name = "pwh_crawl_drank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_drank_vce"
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
			}
		}
	})
	define_rule({
		name = "pwh_hiccup",
		response = "pwh_hiccup",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"time_since_hiccup",
				OP.TIMEDIFF,
				OP.GT,
				150
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hiccup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_burp",
		response = "pwh_burp",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"crawl_heard_us",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"time_since_burp",
				OP.TIMEDIFF,
				OP.GT,
				150
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_burp",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_empire_soldier_being_helped_up_drunk",
		name = "pwh_gameplay_empire_soldier_being_helped_up_drunk",
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_dwarf_ranger_being_helped_up_drunk",
		name = "pwh_gameplay_dwarf_ranger_being_helped_up_drunk",
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wood_elf_being_helped_up_drunk",
		name = "pwh_gameplay_wood_elf_being_helped_up_drunk",
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_bright_wizard_being_helped_up_drunk",
		name = "pwh_gameplay_bright_wizard_being_helped_up_drunk",
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
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_healing_empire_soldier_drunk",
		response = "pwh_gameplay_healing_empire_soldier_drunk",
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
		name = "pwh_gameplay_healing_dwarf_ranger_drunk",
		response = "pwh_gameplay_healing_dwarf_ranger_drunk",
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
		name = "pwh_gameplay_healing_wood_elf_drunk",
		response = "pwh_gameplay_healing_wood_elf_drunk",
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
		name = "pwh_gameplay_healing_bright_wizard_drunk",
		response = "pwh_gameplay_healing_bright_wizard_drunk",
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
		name = "pwh_gameplay_helped_by_empire_soldier_drunk",
		response = "pwh_gameplay_helped_by_empire_soldier_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"healer_name",
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
		name = "pwh_gameplay_helped_by_dwarf_ranger_drunk",
		response = "pwh_gameplay_helped_by_dwarf_ranger_drunk",
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
				"witch_hunter"
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
				"witch_hunter"
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
		name = "pwh_gameplay_helped_by_wood_elf_drunk",
		response = "pwh_gameplay_helped_by_wood_elf_drunk",
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
				"witch_hunter"
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
				"witch_hunter"
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
		name = "pwh_gameplay_helped_by_bright_wizard_drunk",
		response = "pwh_gameplay_helped_by_bright_wizard_drunk",
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
				"witch_hunter"
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
				"witch_hunter"
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
		name = "pwh_gameplay_low_on_health_drunk",
		response = "pwh_gameplay_low_on_health_drunk",
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
		name = "pwh_gameplay_empire_soldier_low_on_health_drunk",
		response = "pwh_gameplay_empire_soldier_low_on_health_drunk",
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
				"pes_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_low_health_pes",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_dwarf_ranger_low_on_health_drunk",
		response = "pwh_gameplay_dwarf_ranger_low_on_health_drunk",
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
				"witch_hunter"
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
		name = "pwh_gameplay_wood_elf_low_on_health_drunk",
		response = "pwh_gameplay_wood_elf_low_on_health_drunk",
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
				"witch_hunter"
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
		name = "pwh_gameplay_bright_wizard_low_on_health_drunk",
		response = "pwh_gameplay_bright_wizard_low_on_health_drunk",
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
				"witch_hunter"
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
		name = "pwh_gameplay_spots_ammo_drunk",
		response = "pwh_gameplay_spots_ammo_drunk",
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
				17
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
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
		name = "pwh_gameplay_spots_health_drunk",
		response = "pwh_gameplay_spots_health_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"enemies_distant",
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
				17
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
				240
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
		name = "pwh_gameplay_spots_bomb_drunk",
		response = "pwh_gameplay_spots_bomb_drunk",
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
				"witch_hunter"
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
				17
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
				240
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
		name = "pwh_gameplay_out_of_ammo_drunk",
		response = "pwh_gameplay_out_of_ammo_drunk",
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
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_self_heal_drunk",
		response = "pwh_gameplay_self_heal_drunk",
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
		name = "pwh_gameplay_throwing_bomb_drunk",
		response = "pwh_gameplay_throwing_bomb_drunk",
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
		name = "pwh_gameplay_friendly_fire_dwarf_ranger_drunk",
		response = "pwh_gameplay_friendly_fire_dwarf_ranger_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
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
				"witch_hunter"
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
		name = "pwh_gameplay_friendly_fire_bright_wizard_drunk",
		response = "pwh_gameplay_friendly_fire_bright_wizard_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
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
				"witch_hunter"
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
		name = "pwh_gameplay_friendly_fire_wood_elf_drunk",
		response = "pwh_gameplay_friendly_fire_wood_elf_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
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
				"witch_hunter"
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
		name = "pwh_gameplay_friendly_fire_empire_soldier_drunk",
		response = "pwh_gameplay_friendly_fire_empire_soldier_drunk",
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
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"player_profile",
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
		response = "pwh_special_ability_captain_non_drunk",
		name = "pwh_special_ability_captain_non_drunk",
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
				"player_career",
				OP.EQ,
				"wh_captain"
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "pwh_activate_ability_bounty_hunter_non_drunk",
		name = "pwh_activate_ability_bounty_hunter_non_drunk",
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
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "pwh_activate_ability_zealot_non_drunk",
		name = "pwh_activate_ability_zealot_non_drunk",
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
				"player_career",
				OP.EQ,
				"wh_zealot"
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_knocked_down_drunk",
		response = "pwh_gameplay_knocked_down_drunk",
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
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_player_pounced_drunk",
		response = "pwh_gameplay_player_pounced_drunk",
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
		name = "pwh_gameplay_hearing_a_gutter_runner_drunk",
		response = "pwh_gameplay_hearing_a_gutter_runner_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_globadier_drunk",
		response = "pwh_gameplay_hearing_a_globadier_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_incoming_skaven_rat_ogre_drunk",
		response = "pwh_gameplay_incoming_skaven_rat_ogre_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
		response = "pwh_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_ratling_gun_drunk",
		response = "pwh_gameplay_hearing_a_skaven_ratling_gun_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
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
		name = "pwh_gameplay_hearing_a_gutter_runner_combat_drunk",
		response = "pwh_gameplay_hearing_a_gutter_runner_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_globadier_combat_drunk",
		response = "pwh_gameplay_hearing_a_globadier_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
		response = "pwh_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
		response = "pwh_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_spawn_combat_drunk",
		response = "pwh_gameplay_hearing_a_chaos_spawn_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_spawn_drunk",
		response = "pwh_gameplay_hearing_a_chaos_spawn_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_wind_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_wind_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
		response = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
		response = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_stormfiend_drunk",
		response = "pwh_gameplay_hearing_a_stormfiend_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_stormfiend_combat_drunk",
		response = "pwh_gameplay_hearing_a_stormfiend_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_troll_drunk",
		response = "pwh_gameplay_hearing_a_troll_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_troll_combat_drunk",
		response = "pwh_gameplay_hearing_a_troll_combat_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hearing_a_skaven_rat_ogre_drunk",
		response = "pwh_gameplay_hearing_a_skaven_rat_ogre_drunk",
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
				"incoming_threat_victor",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
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
			},
			{
				"user_memory",
				"incoming_threat_victor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hears_incoming_horde_drunk",
		response = "pwh_gameplay_hears_incoming_horde_drunk",
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
		name = "pwh_gameplay_ambush_horde_spawned_drunk",
		response = "pwh_gameplay_ambush_horde_spawned_drunk",
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
		name = "pwh_gameplay_seeing_a_pm_no_drunk",
		response = "pwh_gameplay_seeing_a_pm_no_drunk",
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
				10
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_scr_no_drunk",
		response = "pwh_gameplay_seeing_a_scr_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwh_gameplay_hearing_a_pm_no_drunk",
		response = "pwh_gameplay_hearing_a_pm_no_drunk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"Play_plague_monk_alerted_vce"
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_pm_in_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_pm_in_combat_no_drunk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"Play_plague_monk_alerted_vce"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_spawn_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_spawn_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_chaos_spawn_no_drunk",
		response = "pwh_gameplay_seeing_a_chaos_spawn_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_spawn_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_spawn_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_killing_a_stormfiend_no_drunk",
		response = "pwh_gameplay_killing_a_stormfiend_no_drunk",
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
				"time_since_killing_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				5
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_hearing_a_chaos_warrior_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_warrior_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_plague_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_plague_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_wind_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_wind_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_stormfiend_no_drunk",
		response = "pwh_gameplay_hearing_a_stormfiend_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_stormfiend_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_stormfiend_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_troll_no_drunk",
		response = "pwh_gameplay_hearing_a_troll_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_a_troll_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_troll_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_hearing_marauder_berserker_combat_no_drunk",
		response = "pwh_gameplay_hearing_marauder_berserker_combat_no_drunk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"ecb_gameplay_running_towards_players"
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwh_gameplay_killing_a_chaos_warrior_no_drunk",
		response = "pwh_gameplay_killing_a_chaos_warrior_no_drunk",
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
				"time_since_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				5
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_killing_a_chaos_warrior_champion_no_drunk",
		response = "pwh_gameplay_killing_a_chaos_warrior_champion_no_drunk",
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
				"time_since_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				3
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_killing_a_chaos_wizard_plague_no_drunk",
		response = "pwh_gameplay_killing_a_chaos_wizard_plague_no_drunk",
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
				"time_since_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
		response = "pwh_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
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
				"time_since_chaos_wizard_tentacle",
				OP.TIMEDIFF,
				OP.GT,
				3
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_killing_a_chaos_wizard_wind_no_drunk",
		response = "pwh_gameplay_killing_a_chaos_wizard_wind_no_drunk",
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
				"time_since_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
		response = "pwh_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
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
				"time_since_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				3
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_seeing_a_chaos_warrior_no_drunk",
		response = "pwh_gameplay_seeing_a_chaos_warrior_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
		response = "pwh_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
		response = "pwh_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
		response = "pwh_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
		response = "pwh_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_shield_stormvermin_no_drunk",
		response = "pwh_gameplay_seeing_a_shield_stormvermin_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwh_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pwh_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_stormfiend_no_drunk",
		response = "pwh_gameplay_seeing_a_stormfiend_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_seeing_a_troll_no_drunk",
		response = "pwh_gameplay_seeing_a_troll_no_drunk",
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
				20
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwh_gameplay_killing_a_chaos_wizard_leech_no_drunk",
		response = "pwh_gameplay_killing_a_chaos_wizard_leech_no_drunk",
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
				"time_since_chaos_wizard_leech",
				OP.TIMEDIFF,
				OP.GT,
				3
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
				"witch_hunter_special_kills_in_row",
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
		name = "pwh_gameplay_hearing_a_gutter_runner_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_gutter_runner_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_hearing_a_globadier_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_globadier_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk",
		response = "pwh_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk",
		response = "pwh_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_seeing_a_stormvermin_no_drunk",
		response = "pwh_gameplay_seeing_a_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_seeing_a_gutter_runner_no_drunk",
		response = "pwh_gameplay_seeing_a_gutter_runner_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_hearing_a_gutter_runner_no_drunk",
		response = "pwh_gameplay_hearing_a_gutter_runner_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_seeing_a_globadier_no_drunk",
		response = "pwh_gameplay_seeing_a_globadier_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_hearing_a_globadier_no_drunk",
		response = "pwh_gameplay_hearing_a_globadier_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_seeing_a_skaven_rat_ogre_no_drunk",
		response = "pwh_gameplay_seeing_a_skaven_rat_ogre_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_hearing_a_skaven_rat_ogre_no_drunk",
		response = "pwh_gameplay_hearing_a_skaven_rat_ogre_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_incoming_skaven_rat_ogre_no_drunk",
		response = "pwh_gameplay_incoming_skaven_rat_ogre_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwh_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk",
		response = "pwh_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk",
		response = "pwh_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
		name = "pwh_gameplay_seeing_a_skaven_slaver_no_drunk",
		response = "pwh_gameplay_seeing_a_skaven_slaver_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_seeing_a_skaven_ratling_gun_no_drunk",
		response = "pwh_gameplay_seeing_a_skaven_ratling_gun_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwh_gameplay_hearing_a_skaven_ratling_gun_no_drunk",
		response = "pwh_gameplay_hearing_a_skaven_ratling_gun_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
				30
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
	add_dialogues({
		pwh_gameplay_hearing_a_gutter_runner_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_bright_wizard_low_on_health_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_bright_wizard_low_on_health_05",
				"pwh_gameplay_bright_wizard_low_on_health_06",
				"pwh_gameplay_bright_wizard_low_on_health_07",
				"pwh_gameplay_bright_wizard_low_on_health_08"
			},
			sound_events = {
				"pwh_gameplay_bright_wizard_low_on_health_05",
				"pwh_gameplay_bright_wizard_low_on_health_06",
				"pwh_gameplay_bright_wizard_low_on_health_07",
				"pwh_gameplay_bright_wizard_low_on_health_08"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.9483333826065,
				2.9688334465027,
				2.2873957157135,
				2.4161458015442
			}
		},
		pwh_gameplay_hearing_a_gutter_runner_combat_no_drunk = {
			face_animations_n = 3,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_gutter_runner_combat_01",
				"pwh_gameplay_hearing_a_gutter_runner_combat_02",
				"pwh_gameplay_hearing_a_gutter_runner_03"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_gutter_runner_combat_01",
				"pwh_gameplay_hearing_a_gutter_runner_combat_02",
				"pwh_gameplay_hearing_a_gutter_runner_03"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.2913957834244,
				1.4397708177566,
				1.8757916688919
			}
		},
		pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.6568332910538,
				1.1054791212082,
				1.3664166927338,
				1.7453541755676,
				2.2313957214356,
				1.1920416355133
			}
		},
		pwh_gameplay_knocked_down_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_knocked_down_01",
				"pwh_crawl_drunk_knocked_down_02",
				"pwh_crawl_drunk_knocked_down_03",
				"pwh_crawl_drunk_knocked_down_04"
			},
			sound_events = {
				"pwh_crawl_drunk_knocked_down_01",
				"pwh_crawl_drunk_knocked_down_02",
				"pwh_crawl_drunk_knocked_down_03",
				"pwh_crawl_drunk_knocked_down_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.1015625,
				5.6771249771118,
				3.0148959159851,
				4.3863959312439
			}
		},
		pwh_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_seeing_a_Skaven_warpfire_thrower_08"
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
			sound_events_duration = {
				2.5207500457764,
				2.5623333454132,
				1.8236042261124,
				3.3464584350586,
				2.9436666965485,
				1.8281874656677,
				3.1632499694824,
				2.9568750858307
			}
		},
		pwh_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_hearing_a_skaven_patrol_stormvermin_07"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6061041355133,
				3.4500207901001,
				2.7389376163483,
				2.9523124694824,
				3.0307500362396,
				4.1424584388733,
				1.6945416927338
			}
		},
		pwh_gameplay_bright_wizard_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_bright_wizard_being_helped_up_05",
				"pwh_gameplay_bright_wizard_being_helped_up_06",
				"pwh_gameplay_bright_wizard_being_helped_up_07",
				"pwh_gameplay_bright_wizard_being_helped_up_08",
				"pwh_gameplay_bright_wizard_being_helped_up_09",
				"pwh_gameplay_bright_wizard_being_helped_up_10",
				"pwh_gameplay_bright_wizard_being_helped_up_11",
				"pwh_gameplay_bright_wizard_being_helped_up_12"
			},
			sound_events = {
				"pwh_gameplay_bright_wizard_being_helped_up_05",
				"pwh_gameplay_bright_wizard_being_helped_up_06",
				"pwh_gameplay_bright_wizard_being_helped_up_07",
				"pwh_gameplay_bright_wizard_being_helped_up_08",
				"pwh_gameplay_bright_wizard_being_helped_up_09",
				"pwh_gameplay_bright_wizard_being_helped_up_10",
				"pwh_gameplay_bright_wizard_being_helped_up_11",
				"pwh_gameplay_bright_wizard_being_helped_up_12"
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
			sound_events_duration = {
				3.3247499465942,
				3.1895833015442,
				4.3973751068115,
				2.6344375610352,
				2.448979139328,
				4.6547918319702,
				2.5351874828339,
				2.1329998970032
			}
		},
		pwh_gameplay_empire_soldier_low_on_health_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_empire_soldier_low_on_health_01",
				"pwh_gameplay_empire_soldier_low_on_health_05",
				"pwh_gameplay_empire_soldier_low_on_health_06",
				"pwh_gameplay_empire_soldier_low_on_health_07",
				"pwh_gameplay_empire_soldier_low_on_health_08"
			},
			sound_events = {
				"pwh_gameplay_empire_soldier_low_on_health_01",
				"pwh_gameplay_empire_soldier_low_on_health_05",
				"pwh_gameplay_empire_soldier_low_on_health_06",
				"pwh_gameplay_empire_soldier_low_on_health_07",
				"pwh_gameplay_empire_soldier_low_on_health_08"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.4624999761581,
				1.4624999761581,
				2.9811251163483,
				2.6770207881927,
				3.6535415649414
			}
		},
		pwh_gameplay_seeing_a_stormfiend_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_stormfiend_01",
				"pwh_gameplay_seeing_a_stormfiend_02",
				"pwh_gameplay_seeing_a_stormfiend_03",
				"pwh_gameplay_seeing_a_stormfiend_04",
				"pwh_gameplay_seeing_a_stormfiend_05",
				"pwh_gameplay_seeing_a_stormfiend_06",
				"pwh_gameplay_seeing_a_stormfiend_07",
				"pwh_gameplay_seeing_a_stormfiend_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_stormfiend_01",
				"pwh_gameplay_seeing_a_stormfiend_02",
				"pwh_gameplay_seeing_a_stormfiend_03",
				"pwh_gameplay_seeing_a_stormfiend_04",
				"pwh_gameplay_seeing_a_stormfiend_05",
				"pwh_gameplay_seeing_a_stormfiend_06",
				"pwh_gameplay_seeing_a_stormfiend_07",
				"pwh_gameplay_seeing_a_stormfiend_08"
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
			sound_events_duration = {
				2.2606041431427,
				2.5906457901001,
				3.8130834102631,
				3.3619375228882,
				2.6097083091736,
				2.8463125228882,
				2.7636666297913,
				4.4331459999084
			}
		},
		pwh_gameplay_hearing_a_skaven_rat_ogre_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_incoming_skaven_rat_ogre_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_burp = {
			face_animations_n = 1,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 1,
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_burp"
			},
			sound_events = {
				[1.0] = "pwh_burp"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.3205609917641
			}
		},
		pwh_gameplay_seeing_a_skaven_slaver_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
		pwh_gameplay_seeing_a_scr_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_shield_clanrat_01",
				"pwh_gameplay_seeing_a_shield_clanrat_02",
				"pwh_gameplay_seeing_a_shield_clanrat_03",
				"pwh_gameplay_seeing_a_shield_clanrat_04",
				"pwh_gameplay_seeing_a_shield_clanrat_05",
				"pwh_gameplay_seeing_a_shield_clanrat_06",
				"pwh_gameplay_seeing_a_shield_clanrat_07",
				"pwh_gameplay_seeing_a_shield_clanrat_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_shield_clanrat_01",
				"pwh_gameplay_seeing_a_shield_clanrat_02",
				"pwh_gameplay_seeing_a_shield_clanrat_03",
				"pwh_gameplay_seeing_a_shield_clanrat_04",
				"pwh_gameplay_seeing_a_shield_clanrat_05",
				"pwh_gameplay_seeing_a_shield_clanrat_06",
				"pwh_gameplay_seeing_a_shield_clanrat_07",
				"pwh_gameplay_seeing_a_shield_clanrat_08"
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
			sound_events_duration = {
				1.0814583301544,
				1.93068754673,
				1.6217082738876,
				1.5820416212082,
				1.2600417137146,
				2.9505207538605,
				2.0148749351502,
				2.2593541145325
			}
		},
		pwh_gameplay_healing_dwarf_ranger_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_healing_dwarf_ranger_03",
				"pwh_gameplay_healing_dwarf_ranger_04",
				"pwh_gameplay_healing_dwarf_ranger_05",
				"pwh_gameplay_healing_dwarf_ranger_06",
				"pwh_gameplay_healing_dwarf_ranger_07",
				"pwh_gameplay_healing_dwarf_ranger_08",
				"pwh_gameplay_healing_dwarf_ranger_09"
			},
			sound_events = {
				"pwh_gameplay_healing_dwarf_ranger_03",
				"pwh_gameplay_healing_dwarf_ranger_04",
				"pwh_gameplay_healing_dwarf_ranger_05",
				"pwh_gameplay_healing_dwarf_ranger_06",
				"pwh_gameplay_healing_dwarf_ranger_07",
				"pwh_gameplay_healing_dwarf_ranger_08",
				"pwh_gameplay_healing_dwarf_ranger_09"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.8657499551773,
				3.3627290725708,
				1.8657499551773,
				3.3627290725708,
				2.2356667518616,
				2.2901666164398,
				5.3768539428711
			}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
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
			sound_events_duration = {
				3.0324375629425,
				2.1746873855591,
				6.9284167289734,
				6.2197499275208,
				1.6431875228882,
				1.182000041008,
				3.4538958072662
			}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_04"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_combat_04"
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
				3.0916042327881,
				1.8273333311081,
				2.1063125133514,
				1.8273333311081
			}
		},
		pwh_gameplay_tips_wizard_wind_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.0190207958221,
				2.816645860672,
				1.8283333778381,
				3.2214167118073,
				2.9673125743866
			}
		},
		pwh_gameplay_spots_bomb_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_spots_bomb_10",
				"pwh_gameplay_spots_bomb_11",
				"pwh_gameplay_spots_bomb_12",
				"pwh_gameplay_spots_bomb_13",
				"pwh_gameplay_spots_bomb_14",
				"pwh_gameplay_spots_bomb_15",
				"pwh_gameplay_spots_bomb_16"
			},
			sound_events = {
				"pwh_gameplay_spots_bomb_10",
				"pwh_gameplay_spots_bomb_11",
				"pwh_gameplay_spots_bomb_12",
				"pwh_gameplay_spots_bomb_13",
				"pwh_gameplay_spots_bomb_14",
				"pwh_gameplay_spots_bomb_15",
				"pwh_gameplay_spots_bomb_16"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
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
			sound_events_duration = {
				2.5675208568573,
				2.6886250972748,
				1.9807292222977,
				2.4678957462311,
				1.932833313942,
				1.9871875047684,
				2.4983541965485
			}
		},
		pwh_gameplay_seeing_a_skaven_rat_ogre_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
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
		pwh_gameplay_hearing_a_globadier_no_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_globadier_02",
				"pwh_gameplay_hearing_a_globadier_05",
				"pwh_gameplay_hearing_a_globadier_06",
				"pwh_gameplay_hearing_a_globadier_01",
				"pwh_gameplay_hearing_a_globadier_04"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_globadier_02",
				"pwh_gameplay_hearing_a_globadier_05",
				"pwh_gameplay_hearing_a_globadier_06",
				"pwh_gameplay_hearing_a_globadier_01",
				"pwh_gameplay_hearing_a_globadier_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.5494167804718,
				2.5040416717529,
				1.6293333768845,
				0.92208331823349,
				2.3662707805634
			}
		},
		pwh_gameplay_healing_empire_soldier_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_healing_empire_soldier_05",
				"pwh_gameplay_healing_empire_soldier_06",
				"pwh_gameplay_healing_empire_soldier_07",
				"pwh_gameplay_healing_empire_soldier_08",
				"pwh_gameplay_healing_empire_soldier_09"
			},
			sound_events = {
				"pwh_gameplay_healing_empire_soldier_05",
				"pwh_gameplay_healing_empire_soldier_06",
				"pwh_gameplay_healing_empire_soldier_07",
				"pwh_gameplay_healing_empire_soldier_08",
				"pwh_gameplay_healing_empire_soldier_09"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2458333969116,
				1.7514791488648,
				2.1439583301544,
				2.4165415763855,
				2.8800625801086
			}
		},
		pwh_crawl_drank = {
			face_animations_n = 1,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 1,
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_drank_drunk"
			},
			sound_events = {
				[1.0] = "pwh_drank_drunk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.5114442408085
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_08"
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
			sound_events_duration = {
				3.7142915725708,
				3.4277291297913,
				4.3478126525879,
				4.2340416908264,
				2.4661874771118,
				1.8862500190735,
				2.0664374828339,
				2.5227084159851
			}
		},
		pwh_gameplay_hearing_a_gutter_runner_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_gutter_runner_01",
				"pwh_gameplay_hearing_a_gutter_runner_02",
				"pwh_gameplay_hearing_a_gutter_runner_03",
				"pwh_gameplay_hearing_a_gutter_runner_04",
				"pwh_gameplay_hearing_a_gutter_runner_05",
				"pwh_gameplay_hearing_a_gutter_runner_06"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_gutter_runner_01",
				"pwh_gameplay_hearing_a_gutter_runner_02",
				"pwh_gameplay_hearing_a_gutter_runner_03",
				"pwh_gameplay_hearing_a_gutter_runner_04",
				"pwh_gameplay_hearing_a_gutter_runner_05",
				"pwh_gameplay_hearing_a_gutter_runner_06"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				0.77458333969116,
				2.8789374828339,
				1.8757916688919,
				1.592333316803,
				2.4951875209808,
				1.9661874771118
			}
		},
		pwh_gameplay_spots_health_drunk = {
			face_animations_n = 14,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 14,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 14,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_spots_health_01",
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
			sound_events = {
				"pwh_gameplay_spots_health_01",
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
			sound_events_duration = {
				1.5,
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
		pwh_gameplay_killing_a_chaos_wizard_tentacle_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwh_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.0966041088104,
				2.4180624485016,
				2.8248751163483,
				4.710000038147,
				2.8280000686645,
				1.8997708559036
			}
		},
		pwh_gameplay_seeing_a_gutter_runner_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
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
		pwh_special_ability_captain_non_drunk = {
			face_animations_n = 12,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 12,
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			randomize_indexes = {},
			localization_strings = {
				"pwh_activate_ability_captain_01",
				"pwh_activate_ability_captain_02",
				"pwh_activate_ability_captain_03",
				"pwh_activate_ability_captain_04",
				"pwh_activate_ability_captain_05",
				"pwh_activate_ability_captain_06",
				"pwh_activate_ability_captain_07",
				"pwh_activate_ability_captain_08",
				"pwh_activate_ability_captain_09",
				"pwh_activate_ability_captain_10",
				"pwh_activate_ability_captain_11",
				"pwh_activate_ability_captain_12"
			},
			sound_events = {
				"pwh_activate_ability_captain_01",
				"pwh_activate_ability_captain_02",
				"pwh_activate_ability_captain_03",
				"pwh_activate_ability_captain_04",
				"pwh_activate_ability_captain_05",
				"pwh_activate_ability_captain_06",
				"pwh_activate_ability_captain_07",
				"pwh_activate_ability_captain_08",
				"pwh_activate_ability_captain_09",
				"pwh_activate_ability_captain_10",
				"pwh_activate_ability_captain_11",
				"pwh_activate_ability_captain_12"
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
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
			sound_events_duration = {
				4.323625087738,
				3.9455833435059,
				4.2957501411438,
				3.2558333873749,
				5.6500625610352,
				4.8167500495911,
				4.8942499160767,
				4.2619581222534,
				4.1698126792908,
				2.877833366394,
				4.0537915229797,
				3.9332292079926
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_wind_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_03",
				"pwh_gameplay_first_time_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_first_time_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_01"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_combat_03",
				"pwh_gameplay_first_time_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_first_time_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_01"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_contempt",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.1632291078568,
				1.1809375286102,
				1.1632291078568,
				0.82735419273376,
				2.7173957824707,
				3.1846876144409
			}
		},
		pwh_gameplay_hears_incoming_horde_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hears_incoming_horde_11",
				"pwh_gameplay_hears_incoming_horde_12",
				"pwh_gameplay_hears_incoming_horde_13",
				"pwh_gameplay_hears_incoming_horde_14",
				"pwh_gameplay_hears_incoming_horde_15",
				"pwh_gameplay_hears_incoming_horde_16",
				"pwh_gameplay_hears_incoming_horde_17"
			},
			sound_events = {
				"pwh_gameplay_hears_incoming_horde_11",
				"pwh_gameplay_hears_incoming_horde_12",
				"pwh_gameplay_hears_incoming_horde_13",
				"pwh_gameplay_hears_incoming_horde_14",
				"pwh_gameplay_hears_incoming_horde_15",
				"pwh_gameplay_hears_incoming_horde_16",
				"pwh_gameplay_hears_incoming_horde_17"
			},
			face_animations = {
				"face_contempt",
				"face_smug",
				"face_smug",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.1505000591278,
				2.7698333263397,
				2.3357291221619,
				3.6595416069031,
				2.1621458530426,
				3.2892916202545,
				4.3789167404175
			}
		},
		pwh_gameplay_seeing_a_stormvermin_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
		pwh_gameplay_throwing_bomb_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_throwing_bomb_01",
				"pwh_gameplay_throwing_bomb_06",
				"pwh_gameplay_throwing_bomb_07",
				"pwh_gameplay_throwing_bomb_08",
				"pwh_gameplay_throwing_bomb_09"
			},
			sound_events = {
				"pwh_gameplay_throwing_bomb_01",
				"pwh_gameplay_throwing_bomb_06",
				"pwh_gameplay_throwing_bomb_07",
				"pwh_gameplay_throwing_bomb_08",
				"pwh_gameplay_throwing_bomb_09"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				0.98325002193451,
				0.90381252765655,
				0.9190416932106,
				1.5736042261124,
				1.6831874847412
			}
		},
		pwh_gameplay_seeing_a_chaos_spawn_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_spawn_01",
				"pwh_gameplay_seeing_a_chaos_spawn_02",
				"pwh_gameplay_seeing_a_chaos_spawn_03",
				"pwh_gameplay_seeing_a_chaos_spawn_04",
				"pwh_gameplay_seeing_a_chaos_spawn_05",
				"pwh_gameplay_seeing_a_chaos_spawn_06",
				"pwh_gameplay_seeing_a_chaos_spawn_07",
				"pwh_gameplay_seeing_a_chaos_spawn_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_spawn_01",
				"pwh_gameplay_seeing_a_chaos_spawn_02",
				"pwh_gameplay_seeing_a_chaos_spawn_03",
				"pwh_gameplay_seeing_a_chaos_spawn_04",
				"pwh_gameplay_seeing_a_chaos_spawn_05",
				"pwh_gameplay_seeing_a_chaos_spawn_06",
				"pwh_gameplay_seeing_a_chaos_spawn_07",
				"pwh_gameplay_seeing_a_chaos_spawn_08"
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
			sound_events_duration = {
				3.7176876068115,
				3.915937423706,
				3.3081874847412,
				3.3229374885559,
				2.7965624332428,
				3.9403123855591,
				4.2420001029968,
				2.7758123874664
			}
		},
		pwh_gameplay_hearing_a_troll_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_troll_01",
				"pwh_gameplay_hearing_a_troll_02",
				"pwh_gameplay_hearing_a_troll_03",
				"pwh_gameplay_hearing_a_troll_04",
				"pwh_gameplay_hearing_a_troll_05",
				"pwh_gameplay_hearing_a_troll_06"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_troll_01",
				"pwh_gameplay_hearing_a_troll_02",
				"pwh_gameplay_hearing_a_troll_03",
				"pwh_gameplay_hearing_a_troll_04",
				"pwh_gameplay_hearing_a_troll_05",
				"pwh_gameplay_hearing_a_troll_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.0798332691193,
				3.4201250076294,
				2.7738125324249,
				3.3578333854675,
				3.1308751106262,
				3.1733748912811
			}
		},
		pwh_gameplay_dwarf_ranger_low_on_health_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_low_on_health_02",
				"pwh_gameplay_dwarf_ranger_low_on_health_05",
				"pwh_gameplay_dwarf_ranger_low_on_health_06",
				"pwh_gameplay_dwarf_ranger_low_on_health_07"
			},
			sound_events = {
				"pwh_gameplay_dwarf_ranger_low_on_health_02",
				"pwh_gameplay_dwarf_ranger_low_on_health_05",
				"pwh_gameplay_dwarf_ranger_low_on_health_06",
				"pwh_gameplay_dwarf_ranger_low_on_health_07"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.9755833148956,
				2.9755833148956,
				3.659458398819,
				2.0665833950043
			}
		},
		pwh_gameplay_helped_by_empire_soldier_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_helped_by_empire_soldier_05",
				"pwh_gameplay_helped_by_empire_soldier_06",
				"pwh_gameplay_helped_by_empire_soldier_07",
				"pwh_gameplay_helped_by_empire_soldier_11"
			},
			sound_events = {
				"pwh_gameplay_helped_by_empire_soldier_05",
				"pwh_gameplay_helped_by_empire_soldier_06",
				"pwh_gameplay_helped_by_empire_soldier_07",
				"pwh_gameplay_helped_by_empire_soldier_11"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.8230625391007,
				3.5883123874664,
				2.3576667308807,
				1.6251250505447
			}
		},
		pwh_activate_ability_bounty_hunter_non_drunk = {
			face_animations_n = 12,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 12,
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			randomize_indexes = {},
			localization_strings = {
				"pwh_activate_ability_bounty_hunter_01",
				"pwh_activate_ability_bounty_hunter_02",
				"pwh_activate_ability_bounty_hunter_03",
				"pwh_activate_ability_bounty_hunter_04",
				"pwh_activate_ability_bounty_hunter_05",
				"pwh_activate_ability_bounty_hunter_06",
				"pwh_activate_ability_bounty_hunter_07",
				"pwh_activate_ability_bounty_hunter_08",
				"pwh_activate_ability_bounty_hunter_09",
				"pwh_activate_ability_bounty_hunter_10",
				"pwh_activate_ability_bounty_hunter_11",
				"pwh_activate_ability_bounty_hunter_12"
			},
			sound_events = {
				"pwh_activate_ability_bounty_hunter_01",
				"pwh_activate_ability_bounty_hunter_02",
				"pwh_activate_ability_bounty_hunter_03",
				"pwh_activate_ability_bounty_hunter_04",
				"pwh_activate_ability_bounty_hunter_05",
				"pwh_activate_ability_bounty_hunter_06",
				"pwh_activate_ability_bounty_hunter_07",
				"pwh_activate_ability_bounty_hunter_08",
				"pwh_activate_ability_bounty_hunter_09",
				"pwh_activate_ability_bounty_hunter_10",
				"pwh_activate_ability_bounty_hunter_11",
				"pwh_activate_ability_bounty_hunter_12"
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
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
			sound_events_duration = {
				1.792791724205,
				1.7863124608993,
				2.0773749351502,
				2.5558958053589,
				1.3838958740234,
				1.8010624647141,
				2.5448124408722,
				1.6548957824707,
				1.8603333234787,
				2.3688333034515,
				2.6929376125336,
				2.3858749866486
			}
		},
		pwh_gameplay_hearing_a_skaven_patrol_stormvermin_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_incoming_skaven_rat_ogre_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_incoming_skaven_rat_ogre_01",
				"pwh_gameplay_incoming_skaven_rat_ogre_05",
				"pwh_gameplay_incoming_skaven_rat_ogre_06",
				"pwh_gameplay_incoming_skaven_rat_ogre_02",
				"pwh_gameplay_incoming_skaven_rat_ogre_03",
				"pwh_gameplay_incoming_skaven_rat_ogre_04",
				"pwh_gameplay_incoming_skaven_rat_ogre_07",
				"pwh_gameplay_incoming_skaven_rat_ogre_08"
			},
			sound_events = {
				"pwh_gameplay_incoming_skaven_rat_ogre_01",
				"pwh_gameplay_incoming_skaven_rat_ogre_05",
				"pwh_gameplay_incoming_skaven_rat_ogre_06",
				"pwh_gameplay_incoming_skaven_rat_ogre_02",
				"pwh_gameplay_incoming_skaven_rat_ogre_03",
				"pwh_gameplay_incoming_skaven_rat_ogre_04",
				"pwh_gameplay_incoming_skaven_rat_ogre_07",
				"pwh_gameplay_incoming_skaven_rat_ogre_08"
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
			sound_events_duration = {
				2.1474165916443,
				2.1509375572205,
				1.0751041173935,
				1.531666636467,
				3.1611666679382,
				1.5364583730698,
				0.85377085208893,
				2.5129165649414
			}
		},
		pwh_gameplay_hearing_a_pm_in_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_plague_monk_combat_01",
				"pwh_gameplay_hearing_a_plague_monk_combat_02",
				"pwh_gameplay_hearing_a_plague_monk_combat_03",
				"pwh_gameplay_hearing_a_plague_monk_combat_04",
				"pwh_gameplay_hearing_a_plague_monk_combat_05",
				"pwh_gameplay_hearing_a_plague_monk_combat_06",
				"pwh_gameplay_hearing_a_plague_monk_combat_07",
				"pwh_gameplay_hearing_a_plague_monk_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_plague_monk_combat_01",
				"pwh_gameplay_hearing_a_plague_monk_combat_02",
				"pwh_gameplay_hearing_a_plague_monk_combat_03",
				"pwh_gameplay_hearing_a_plague_monk_combat_04",
				"pwh_gameplay_hearing_a_plague_monk_combat_05",
				"pwh_gameplay_hearing_a_plague_monk_combat_06",
				"pwh_gameplay_hearing_a_plague_monk_combat_07",
				"pwh_gameplay_hearing_a_plague_monk_combat_08"
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
			sound_events_duration = {
				1.2856249809265,
				2.2950832843781,
				1.5780625343323,
				1.3232707977295,
				2.1643126010895,
				1.5085417032242,
				1.6605833768845,
				1.6614583730698
			}
		},
		pwh_gameplay_hearing_a_stormfiend_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_stormfiend_combat_01",
				"pwh_gameplay_hearing_a_stormfiend_combat_02",
				"pwh_gameplay_hearing_a_stormfiend_combat_03",
				"pwh_gameplay_hearing_a_stormfiend_combat_04",
				"pwh_gameplay_hearing_a_stormfiend_combat_05",
				"pwh_gameplay_hearing_a_stormfiend_combat_06",
				"pwh_gameplay_hearing_a_stormfiend_combat_07",
				"pwh_gameplay_hearing_a_stormfiend_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_stormfiend_combat_01",
				"pwh_gameplay_hearing_a_stormfiend_combat_02",
				"pwh_gameplay_hearing_a_stormfiend_combat_03",
				"pwh_gameplay_hearing_a_stormfiend_combat_04",
				"pwh_gameplay_hearing_a_stormfiend_combat_05",
				"pwh_gameplay_hearing_a_stormfiend_combat_06",
				"pwh_gameplay_hearing_a_stormfiend_combat_07",
				"pwh_gameplay_hearing_a_stormfiend_combat_08"
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
			sound_events_duration = {
				1.6592291593552,
				1.5400832891464,
				3.1917917728424,
				3.2584583759308,
				1.3402500152588,
				2.6421248912811,
				1.8347500562668,
				2.7560832500458
			}
		},
		pwh_gameplay_healing_draught_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_spotted_liquid_01",
				"pwh_crawl_drunk_spotted_liquid_02",
				"pwh_crawl_drunk_spotted_liquid_03",
				"pwh_crawl_drunk_spotted_liquid_04"
			},
			sound_events = {
				"pwh_crawl_drunk_spotted_liquid_01",
				"pwh_crawl_drunk_spotted_liquid_02",
				"pwh_crawl_drunk_spotted_liquid_03",
				"pwh_crawl_drunk_spotted_liquid_04"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.8119168281555,
				3.3932707309723,
				2.6729791164398,
				3.9593541622162
			}
		},
		pwh_crawl_drunk_buff_wears_off = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_buff_wears_off_01",
				"pwh_crawl_drunk_buff_wears_off_02",
				"pwh_crawl_drunk_buff_wears_off_03",
				"pwh_crawl_drunk_buff_wears_off_04",
				"pwh_crawl_drunk_buff_wears_off_05",
				"pwh_crawl_drunk_buff_wears_off_06",
				"pwh_crawl_drunk_buff_wears_off_07",
				"pwh_crawl_drunk_buff_wears_off_08"
			},
			sound_events = {
				"pwh_crawl_drunk_buff_wears_off_01",
				"pwh_crawl_drunk_buff_wears_off_02",
				"pwh_crawl_drunk_buff_wears_off_03",
				"pwh_crawl_drunk_buff_wears_off_04",
				"pwh_crawl_drunk_buff_wears_off_05",
				"pwh_crawl_drunk_buff_wears_off_06",
				"pwh_crawl_drunk_buff_wears_off_07",
				"pwh_crawl_drunk_buff_wears_off_08"
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
			sound_events_duration = {
				2.6411459445953,
				4.9619164466858,
				1.5942916870117,
				3.1549792289734,
				4.9027290344238,
				4.5687708854675,
				5.2468333244324,
				4.7392706871033
			}
		},
		pwh_gameplay_hearing_a_globadier_combat_no_drunk = {
			face_animations_n = 3,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_globadier_combat_01",
				"pwh_gameplay_hearing_a_globadier_combat_02",
				"pwh_gameplay_hearing_a_globadier_combat_03"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_globadier_combat_01",
				"pwh_gameplay_hearing_a_globadier_combat_02",
				"pwh_gameplay_hearing_a_globadier_combat_03"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.4960833787918,
				1.6890416145325,
				0.83137500286102
			}
		},
		pwh_gameplay_killing_a_chaos_wizard_leech_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_leech_01",
				"pwh_gameplay_killing_a_chaos_wizard_leech_02",
				"pwh_gameplay_killing_a_chaos_wizard_leech_03",
				"pwh_gameplay_killing_a_chaos_wizard_leech_04",
				"pwh_gameplay_killing_a_chaos_wizard_leech_05",
				"pwh_gameplay_killing_a_chaos_wizard_leech_06"
			},
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_leech_01",
				"pwh_gameplay_killing_a_chaos_wizard_leech_02",
				"pwh_gameplay_killing_a_chaos_wizard_leech_03",
				"pwh_gameplay_killing_a_chaos_wizard_leech_04",
				"pwh_gameplay_killing_a_chaos_wizard_leech_05",
				"pwh_gameplay_killing_a_chaos_wizard_leech_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.770708322525,
				1.7957291603088,
				2.374520778656,
				2.209041595459,
				2.91441655159,
				1.6020624637604
			}
		},
		pwh_gameplay_hearing_a_chaos_spawn_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_spawn_01",
				"pwh_gameplay_hearing_a_chaos_spawn_02",
				"pwh_gameplay_hearing_a_chaos_spawn_03",
				"pwh_gameplay_hearing_a_chaos_spawn_04",
				"pwh_gameplay_hearing_a_chaos_spawn_05",
				"pwh_gameplay_hearing_a_chaos_spawn_06",
				"pwh_gameplay_hearing_a_chaos_spawn_07",
				"pwh_gameplay_hearing_a_chaos_spawn_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_spawn_01",
				"pwh_gameplay_hearing_a_chaos_spawn_02",
				"pwh_gameplay_hearing_a_chaos_spawn_03",
				"pwh_gameplay_hearing_a_chaos_spawn_04",
				"pwh_gameplay_hearing_a_chaos_spawn_05",
				"pwh_gameplay_hearing_a_chaos_spawn_06",
				"pwh_gameplay_hearing_a_chaos_spawn_07",
				"pwh_gameplay_hearing_a_chaos_spawn_08"
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
			sound_events_duration = {
				2.3970415592194,
				2.9136667251587,
				2.3558125495911,
				3.1198959350586,
				1.706375002861,
				1.0322916507721,
				2.3063333034515,
				1.9142916202545
			}
		},
		pwh_gameplay_seeing_a_troll_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_troll_01",
				"pwh_gameplay_seeing_a_troll_02",
				"pwh_gameplay_seeing_a_troll_03",
				"pwh_gameplay_seeing_a_troll_04",
				"pwh_gameplay_seeing_a_troll_05",
				"pwh_gameplay_seeing_a_troll_06",
				"pwh_gameplay_seeing_a_troll_07",
				"pwh_gameplay_seeing_a_troll_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_troll_01",
				"pwh_gameplay_seeing_a_troll_02",
				"pwh_gameplay_seeing_a_troll_03",
				"pwh_gameplay_seeing_a_troll_04",
				"pwh_gameplay_seeing_a_troll_05",
				"pwh_gameplay_seeing_a_troll_06",
				"pwh_gameplay_seeing_a_troll_07",
				"pwh_gameplay_seeing_a_troll_08"
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
			sound_events_duration = {
				3.00745844841,
				1.6679375171661,
				2.9149374961853,
				4.0016875267029,
				3.6269791126251,
				4.5096459388733,
				4.1006665229797,
				3.4137291908264
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_plague_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_08"
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
			sound_events_duration = {
				2.9182708263397,
				5.2907500267029,
				3.7517499923706,
				5.158145904541,
				3.2472915649414,
				2.836895942688,
				2.0083959102631,
				2.5031042098999
			}
		},
		pwh_gameplay_wood_elf_low_on_health_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_wood_elf_low_on_health_05",
				"pwh_gameplay_wood_elf_low_on_health_06",
				"pwh_gameplay_wood_elf_low_on_health_07",
				"pwh_gameplay_wood_elf_low_on_health_08"
			},
			sound_events = {
				"pwh_gameplay_wood_elf_low_on_health_05",
				"pwh_gameplay_wood_elf_low_on_health_06",
				"pwh_gameplay_wood_elf_low_on_health_07",
				"pwh_gameplay_wood_elf_low_on_health_08"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.5910832881927,
				2.7195415496826,
				2.6752917766571,
				2.0489165782928
			}
		},
		pwh_gameplay_seeing_a_chaos_wizard_wind_no_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwh_gameplay_seeing_a_chaos_wizard_wind_04"
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
				3.0619790554047,
				2.3637082576752,
				3.3215832710266,
				3.4785833358765
			}
		},
		pwh_gameplay_killing_a_stormfiend_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_stormfiend_01",
				"pwh_gameplay_killing_a_stormfiend_02",
				"pwh_gameplay_killing_a_stormfiend_03",
				"pwh_gameplay_killing_a_stormfiend_04",
				"pwh_gameplay_killing_a_stormfiend_05",
				"pwh_gameplay_killing_a_stormfiend_06",
				"pwh_gameplay_killing_a_stormfiend_07",
				"pwh_gameplay_killing_a_stormfiend_08"
			},
			sound_events = {
				"pwh_gameplay_killing_a_stormfiend_01",
				"pwh_gameplay_killing_a_stormfiend_02",
				"pwh_gameplay_killing_a_stormfiend_03",
				"pwh_gameplay_killing_a_stormfiend_04",
				"pwh_gameplay_killing_a_stormfiend_05",
				"pwh_gameplay_killing_a_stormfiend_06",
				"pwh_gameplay_killing_a_stormfiend_07",
				"pwh_gameplay_killing_a_stormfiend_08"
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
			sound_events_duration = {
				2.3135209083557,
				3.6036040782928,
				3.0741457939148,
				2.7582292556763,
				2.9649374485016,
				3.2365624904633,
				1.9317291975021,
				2.7531249523163
			}
		},
		pwh_gameplay_hearing_a_troll_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_killing_a_chaos_warrior_champion_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_warrior_champion_01",
				"pwh_gameplay_killing_a_chaos_warrior_champion_02",
				"pwh_gameplay_killing_a_chaos_warrior_champion_03",
				"pwh_gameplay_killing_a_chaos_warrior_champion_04",
				"pwh_gameplay_killing_a_chaos_warrior_champion_05",
				"pwh_gameplay_killing_a_chaos_warrior_champion_06",
				"pwh_gameplay_killing_a_chaos_warrior_champion_07",
				"pwh_gameplay_killing_a_chaos_warrior_champion_08"
			},
			sound_events = {
				"pwh_gameplay_killing_a_chaos_warrior_champion_01",
				"pwh_gameplay_killing_a_chaos_warrior_champion_02",
				"pwh_gameplay_killing_a_chaos_warrior_champion_03",
				"pwh_gameplay_killing_a_chaos_warrior_champion_04",
				"pwh_gameplay_killing_a_chaos_warrior_champion_05",
				"pwh_gameplay_killing_a_chaos_warrior_champion_06",
				"pwh_gameplay_killing_a_chaos_warrior_champion_07",
				"pwh_gameplay_killing_a_chaos_warrior_champion_08"
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
			sound_events_duration = {
				4.0201873779297,
				4.4205207824707,
				4.0177292823792,
				3.5383958816528,
				3.6567499637604,
				3.9674582481384,
				3.3354375362396,
				5.098228931427
			}
		},
		pwh_gameplay_wood_elf_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_wood_elf_being_helped_up_05",
				"pwh_gameplay_wood_elf_being_helped_up_06",
				"pwh_gameplay_wood_elf_being_helped_up_07",
				"pwh_gameplay_wood_elf_being_helped_up_08",
				"pwh_gameplay_wood_elf_being_helped_up_09",
				"pwh_gameplay_wood_elf_being_helped_up_10",
				"pwh_gameplay_wood_elf_being_helped_up_11",
				"pwh_gameplay_wood_elf_being_helped_up_12"
			},
			sound_events = {
				"pwh_gameplay_wood_elf_being_helped_up_05",
				"pwh_gameplay_wood_elf_being_helped_up_06",
				"pwh_gameplay_wood_elf_being_helped_up_07",
				"pwh_gameplay_wood_elf_being_helped_up_08",
				"pwh_gameplay_wood_elf_being_helped_up_09",
				"pwh_gameplay_wood_elf_being_helped_up_10",
				"pwh_gameplay_wood_elf_being_helped_up_11",
				"pwh_gameplay_wood_elf_being_helped_up_12"
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
			sound_events_duration = {
				1.2633541822434,
				2.0590624809265,
				3.6357500553131,
				2.7461249828339,
				3.3264374732971,
				2.9137916564941,
				3.0420207977295,
				3.1517708301544
			}
		},
		pwh_gameplay_hearing_a_globadier_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwh_gameplay_seeing_a_chaos_wizard_tentacle_04"
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
				2.8868334293366,
				2.7578542232513,
				3.1478126049042,
				3.2129583358765
			}
		},
		pwh_gameplay_helped_by_bright_wizard_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_helped_by_bright_wizard_03",
				"pwh_gameplay_helped_by_bright_wizard_05",
				"pwh_gameplay_helped_by_bright_wizard_06",
				"pwh_gameplay_helped_by_bright_wizard_07",
				"pwh_gameplay_helped_by_bright_wizard_08"
			},
			sound_events = {
				"pwh_gameplay_helped_by_bright_wizard_03",
				"pwh_gameplay_helped_by_bright_wizard_05",
				"pwh_gameplay_helped_by_bright_wizard_06",
				"pwh_gameplay_helped_by_bright_wizard_07",
				"pwh_gameplay_helped_by_bright_wizard_08"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.5048333406448,
				1.5048333406448,
				1.2281874418259,
				1.5620000362396,
				2.9541459083557
			}
		},
		pwh_gameplay_helped_by_wood_elf_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_helped_by_wood_elf_01",
				"pwh_gameplay_helped_by_wood_elf_02",
				"pwh_gameplay_helped_by_wood_elf_05",
				"pwh_gameplay_helped_by_wood_elf_06",
				"pwh_gameplay_helped_by_wood_elf_07"
			},
			sound_events = {
				"pwh_gameplay_helped_by_wood_elf_01",
				"pwh_gameplay_helped_by_wood_elf_02",
				"pwh_gameplay_helped_by_wood_elf_05",
				"pwh_gameplay_helped_by_wood_elf_06",
				"pwh_gameplay_helped_by_wood_elf_07"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7400624752045,
				1.9810416698456,
				1.7400624752045,
				1.9810416698456,
				1.6733750104904
			}
		},
		pwh_gameplay_friendly_fire_empire_soldier_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_friendly_fire_empire_soldier_04",
				"pwh_gameplay_friendly_fire_empire_soldier_05",
				"pwh_gameplay_friendly_fire_empire_soldier_06",
				"pwh_gameplay_friendly_fire_empire_soldier_07",
				"pwh_gameplay_friendly_fire_empire_soldier_08"
			},
			sound_events = {
				"pwh_gameplay_friendly_fire_empire_soldier_04",
				"pwh_gameplay_friendly_fire_empire_soldier_05",
				"pwh_gameplay_friendly_fire_empire_soldier_06",
				"pwh_gameplay_friendly_fire_empire_soldier_07",
				"pwh_gameplay_friendly_fire_empire_soldier_08"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.3938541412353,
				2.3938541412353,
				2.7055833339691,
				2.8527915477753,
				2.0943541526794
			}
		},
		pwh_gameplay_hearing_a_stormfiend_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_stormfiend_01",
				"pwh_gameplay_hearing_a_stormfiend_02",
				"pwh_gameplay_hearing_a_stormfiend_03",
				"pwh_gameplay_hearing_a_stormfiend_04",
				"pwh_gameplay_hearing_a_stormfiend_05",
				"pwh_gameplay_hearing_a_stormfiend_06"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_stormfiend_01",
				"pwh_gameplay_hearing_a_stormfiend_02",
				"pwh_gameplay_hearing_a_stormfiend_03",
				"pwh_gameplay_hearing_a_stormfiend_04",
				"pwh_gameplay_hearing_a_stormfiend_05",
				"pwh_gameplay_hearing_a_stormfiend_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.9813749790192,
				2.2892708778381,
				4.8232707977295,
				3.0719165802002,
				3.2645416259766,
				2.3358333110809
			}
		},
		pwh_gameplay_killing_a_chaos_wizard_plague_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_plague_01",
				"pwh_gameplay_killing_a_chaos_wizard_plague_02",
				"pwh_gameplay_killing_a_chaos_wizard_plague_03",
				"pwh_gameplay_killing_a_chaos_wizard_plague_04",
				"pwh_gameplay_killing_a_chaos_wizard_plague_05",
				"pwh_gameplay_killing_a_chaos_wizard_plague_06"
			},
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_plague_01",
				"pwh_gameplay_killing_a_chaos_wizard_plague_02",
				"pwh_gameplay_killing_a_chaos_wizard_plague_03",
				"pwh_gameplay_killing_a_chaos_wizard_plague_04",
				"pwh_gameplay_killing_a_chaos_wizard_plague_05",
				"pwh_gameplay_killing_a_chaos_wizard_plague_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.792603969574,
				1.8420833349228,
				3.5264167785645,
				3.6645624637604,
				2.0455000400543,
				1.4589375257492
			}
		},
		pwh_gameplay_seeing_a_chaos_wizard_plague_no_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwh_gameplay_seeing_a_chaos_wizard_plague_04"
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
				3.2874584197998,
				1.8626874685288,
				2.6933124065399,
				2.6596667766571
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_wind_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_killing_a_chaos_wizard_wind_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_wizard_wind_01",
				"pwh_gameplay_killing_a_chaos_wizard_wind_02",
				"pwh_gameplay_killing_a_chaos_wizard_wind_03",
				"pwh_gameplay_killing_a_chaos_wizard_wind_04",
				"pwh_gameplay_killing_a_chaos_wizard_wind_05",
				"pwh_gameplay_killing_a_chaos_wizard_wind_06"
			},
			sound_events = {
				"pwh_gameplay_killing_a_chaos_wizard_wind_01",
				"pwh_gameplay_killing_a_chaos_wizard_wind_02",
				"pwh_gameplay_killing_a_chaos_wizard_wind_03",
				"pwh_gameplay_killing_a_chaos_wizard_wind_04",
				"pwh_gameplay_killing_a_chaos_wizard_wind_05",
				"pwh_gameplay_killing_a_chaos_wizard_wind_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.0922291278839,
				3.3006041049957,
				2.254499912262,
				5.1373748779297,
				3.4113750457764,
				3.7598540782928
			}
		},
		pwh_activate_ability_zealot_non_drunk = {
			face_animations_n = 10,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"pwh_activate_ability_zealot_01",
				"pwh_activate_ability_zealot_02",
				"pwh_activate_ability_zealot_03",
				"pwh_activate_ability_zealot_04",
				"pwh_activate_ability_zealot_05",
				"pwh_activate_ability_zealot_06",
				"pwh_activate_ability_zealot_11",
				"pwh_activate_ability_zealot_12",
				"pwh_activate_ability_zealot_13",
				"pwh_activate_ability_zealot_14"
			},
			sound_events = {
				"pwh_activate_ability_zealot_01",
				"pwh_activate_ability_zealot_02",
				"pwh_activate_ability_zealot_03",
				"pwh_activate_ability_zealot_04",
				"pwh_activate_ability_zealot_05",
				"pwh_activate_ability_zealot_06",
				"pwh_activate_ability_zealot_11",
				"pwh_activate_ability_zealot_12",
				"pwh_activate_ability_zealot_13",
				"pwh_activate_ability_zealot_14"
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
				"face_contempt",
				"face_contempt"
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
			sound_events_duration = {
				1.8398333787918,
				2.5024375915527,
				2.2073957920074,
				1.8702708482742,
				2.6938333511352,
				1.8445416688919,
				2.3204584121704,
				3.3400626182556,
				4.5431876182556,
				5.2194375991821
			}
		},
		pwh_gameplay_seeing_a_chaos_warrior_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_warrior_01",
				"pwh_gameplay_seeing_a_chaos_warrior_02",
				"pwh_gameplay_seeing_a_chaos_warrior_03",
				"pwh_gameplay_seeing_a_chaos_warrior_04",
				"pwh_gameplay_seeing_a_chaos_warrior_05",
				"pwh_gameplay_seeing_a_chaos_warrior_06",
				"pwh_gameplay_seeing_a_chaos_warrior_07",
				"pwh_gameplay_seeing_a_chaos_warrior_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_warrior_01",
				"pwh_gameplay_seeing_a_chaos_warrior_02",
				"pwh_gameplay_seeing_a_chaos_warrior_03",
				"pwh_gameplay_seeing_a_chaos_warrior_04",
				"pwh_gameplay_seeing_a_chaos_warrior_05",
				"pwh_gameplay_seeing_a_chaos_warrior_06",
				"pwh_gameplay_seeing_a_chaos_warrior_07",
				"pwh_gameplay_seeing_a_chaos_warrior_08"
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
			sound_events_duration = {
				1.3892916440964,
				3.0593333244324,
				3.6088540554047,
				2.1536457538605,
				4.3406457901001,
				3.5663957595825,
				3.2569375038147,
				3.640625
			}
		},
		pwh_gameplay_hearing_a_Skaven_warpfire_thrower_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_hearing_a_skaven_rat_ogre_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_killing_a_skaven_warpfire_thrower_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			sound_events = {
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pwh_gameplay_killing_a_Skaven_warpfire_thrower_08"
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
			sound_events_duration = {
				2.1155207157135,
				4.2271041870117,
				5.0612707138061,
				2.1505832672119,
				3.0059790611267,
				3.0624375343323,
				2.0495417118073,
				2.8715832233429
			}
		},
		pwh_gameplay_killing_a_chaos_warrior_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_killing_a_chaos_warrior_01",
				"pwh_gameplay_killing_a_chaos_warrior_02",
				"pwh_gameplay_killing_a_chaos_warrior_03",
				"pwh_gameplay_killing_a_chaos_warrior_04",
				"pwh_gameplay_killing_a_chaos_warrior_05",
				"pwh_gameplay_killing_a_chaos_warrior_06",
				"pwh_gameplay_killing_a_chaos_warrior_07",
				"pwh_gameplay_killing_a_chaos_warrior_08"
			},
			sound_events = {
				"pwh_gameplay_killing_a_chaos_warrior_01",
				"pwh_gameplay_killing_a_chaos_warrior_02",
				"pwh_gameplay_killing_a_chaos_warrior_03",
				"pwh_gameplay_killing_a_chaos_warrior_04",
				"pwh_gameplay_killing_a_chaos_warrior_05",
				"pwh_gameplay_killing_a_chaos_warrior_06",
				"pwh_gameplay_killing_a_chaos_warrior_07",
				"pwh_gameplay_killing_a_chaos_warrior_08"
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
			sound_events_duration = {
				2.0691249370575,
				2.0295207500458,
				2.8494791984558,
				3.3012082576752,
				3.7788124084473,
				4.6155834197998,
				3.3726458549499,
				3.0421667098999
			}
		},
		pwh_gameplay_hearing_marauder_berserker_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_marauder_berserker_combat_01",
				"pwh_gameplay_hearing_marauder_berserker_combat_02",
				"pwh_gameplay_hearing_marauder_berserker_combat_03",
				"pwh_gameplay_hearing_marauder_berserker_combat_04",
				"pwh_gameplay_hearing_marauder_berserker_combat_05",
				"pwh_gameplay_hearing_marauder_berserker_combat_06",
				"pwh_gameplay_hearing_marauder_berserker_combat_07",
				"pwh_gameplay_hearing_marauder_berserker_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_marauder_berserker_combat_01",
				"pwh_gameplay_hearing_marauder_berserker_combat_02",
				"pwh_gameplay_hearing_marauder_berserker_combat_03",
				"pwh_gameplay_hearing_marauder_berserker_combat_04",
				"pwh_gameplay_hearing_marauder_berserker_combat_05",
				"pwh_gameplay_hearing_marauder_berserker_combat_06",
				"pwh_gameplay_hearing_marauder_berserker_combat_07",
				"pwh_gameplay_hearing_marauder_berserker_combat_08"
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
			sound_events_duration = {
				1.8604583740234,
				0.7803750038147,
				0.94412499666214,
				1.1969583034515,
				1.6923542022705,
				2.4954583644867,
				1.5255000591278,
				1.5495208501816
			}
		},
		pwh_gameplay_hearing_a_troll_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_troll_combat_01",
				"pwh_gameplay_hearing_a_troll_combat_02",
				"pwh_gameplay_hearing_a_troll_combat_03",
				"pwh_gameplay_hearing_a_troll_combat_04",
				"pwh_gameplay_hearing_a_troll_combat_05",
				"pwh_gameplay_hearing_a_troll_combat_06",
				"pwh_gameplay_hearing_a_troll_combat_07",
				"pwh_gameplay_hearing_a_troll_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_troll_combat_01",
				"pwh_gameplay_hearing_a_troll_combat_02",
				"pwh_gameplay_hearing_a_troll_combat_03",
				"pwh_gameplay_hearing_a_troll_combat_04",
				"pwh_gameplay_hearing_a_troll_combat_05",
				"pwh_gameplay_hearing_a_troll_combat_06",
				"pwh_gameplay_hearing_a_troll_combat_07",
				"pwh_gameplay_hearing_a_troll_combat_08"
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
			sound_events_duration = {
				0.78835415840149,
				0.90762501955032,
				1.5771458148956,
				1.523854136467,
				3.1536874771118,
				2.2649583816528,
				4.0302500724792,
				1.3572291135788
			}
		},
		pwh_crawl_drunk_buff_begins = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_buff_begins_01",
				"pwh_crawl_drunk_buff_begins_02",
				"pwh_crawl_drunk_buff_begins_03",
				"pwh_crawl_drunk_buff_begins_04",
				"pwh_crawl_drunk_buff_begins_05",
				"pwh_crawl_drunk_buff_begins_06"
			},
			sound_events = {
				"pwh_crawl_drunk_buff_begins_01",
				"pwh_crawl_drunk_buff_begins_02",
				"pwh_crawl_drunk_buff_begins_03",
				"pwh_crawl_drunk_buff_begins_04",
				"pwh_crawl_drunk_buff_begins_05",
				"pwh_crawl_drunk_buff_begins_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4,
				4.1116666793823,
				3.2331042289734,
				6.6900210380554,
				0.90229165554047,
				5.517520904541
			}
		},
		pwh_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwh_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.8008124828339,
				3.9004375934601,
				3.3390207290649,
				5.1754999160767,
				2.2306458950043,
				1.2797291278839
			}
		},
		pwh_gameplay_hearing_a_skaven_rat_ogre_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_rat_ogre_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_04",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_05",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_02",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_03",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_06"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_rat_ogre_01",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_04",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_05",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_02",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_03",
				"pwh_gameplay_hearing_a_skaven_rat_ogre_06"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_contempt",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.1846876144409,
				3.0723750591278,
				4.1131043434143,
				2.239354133606,
				2.8075625896454,
				3.1552083492279
			}
		},
		pwh_gameplay_low_on_health_drunk = {
			face_animations_n = 10,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_low_on_health_03",
				"pwh_gameplay_low_on_health_04",
				"pwh_gameplay_low_on_health_09",
				"pwh_gameplay_low_on_health_10",
				"pwh_gameplay_low_on_health_11",
				"pwh_gameplay_low_on_health_12",
				"pwh_gameplay_low_on_health_13",
				"pwh_gameplay_low_on_health_14",
				"pwh_gameplay_low_on_health_15",
				"pwh_gameplay_low_on_health_16"
			},
			sound_events = {
				"pwh_gameplay_low_on_health_03",
				"pwh_gameplay_low_on_health_04",
				"pwh_gameplay_low_on_health_09",
				"pwh_gameplay_low_on_health_10",
				"pwh_gameplay_low_on_health_11",
				"pwh_gameplay_low_on_health_12",
				"pwh_gameplay_low_on_health_13",
				"pwh_gameplay_low_on_health_14",
				"pwh_gameplay_low_on_health_15",
				"pwh_gameplay_low_on_health_16"
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
			sound_events_duration = {
				5.2520418167114,
				2.6154582500458,
				5.2520418167114,
				2.6154582500458,
				2.723249912262,
				4.3913750648499,
				3.7060208320618,
				4.2663750648499,
				2.7368125915527,
				2.8518333435059
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_wind_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_01",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_02",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_07",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_wind_01",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_02",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_03",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_04",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_05",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_06",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_07",
				"pwh_gameplay_hearing_a_chaos_wizard_wind_08"
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
			sound_events_duration = {
				3.5466666221619,
				3.3521249294281,
				3.60902094841,
				4.0590834617615,
				1.7508125305176,
				1.57712495327,
				2.1300625801086,
				2.4142708778381
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
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
			sound_events_duration = {
				2.7322707176209,
				1.135541677475,
				2.6719584465027,
				3.5476250648499,
				2.7562291622162,
				1.3727291822434,
				3.1708958148956,
				2.8697917461395
			}
		},
		pwh_gameplay_healing_wood_elf_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_healing_wood_elf_05",
				"pwh_gameplay_healing_wood_elf_06",
				"pwh_gameplay_healing_wood_elf_07",
				"pwh_gameplay_healing_wood_elf_08",
				"pwh_gameplay_healing_wood_elf_09"
			},
			sound_events = {
				"pwh_gameplay_healing_wood_elf_05",
				"pwh_gameplay_healing_wood_elf_06",
				"pwh_gameplay_healing_wood_elf_07",
				"pwh_gameplay_healing_wood_elf_08",
				"pwh_gameplay_healing_wood_elf_09"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6238749027252,
				3.9895832538605,
				5.3361248970032,
				2.070770740509,
				3.1902916431427
			}
		},
		pwh_gameplay_hearing_a_globadier_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_seeing_a_globadier_no_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
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
		pwh_gameplay_out_of_ammo_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_out_of_ammo_04",
				"pwh_gameplay_out_of_ammo_05",
				"pwh_gameplay_out_of_ammo_06",
				"pwh_gameplay_out_of_ammo_07",
				"pwh_gameplay_out_of_ammo_08",
				"pwh_gameplay_out_of_ammo_09",
				"pwh_gameplay_out_of_ammo_10"
			},
			sound_events = {
				"pwh_gameplay_out_of_ammo_04",
				"pwh_gameplay_out_of_ammo_05",
				"pwh_gameplay_out_of_ammo_06",
				"pwh_gameplay_out_of_ammo_07",
				"pwh_gameplay_out_of_ammo_08",
				"pwh_gameplay_out_of_ammo_09",
				"pwh_gameplay_out_of_ammo_10"
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
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				0.70027083158493,
				1.5856041908264,
				0.70027083158493,
				1.5856041908264,
				1.5100208520889,
				2.401624917984,
				1.6210833787918
			}
		},
		pwh_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pwh_gameplay_hearing_a_chaos_wizard_plague_combat_08"
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
			sound_events_duration = {
				2.4007499217987,
				1.2270624637604,
				1.5171666145325,
				3.5665209293366,
				2.9372916221619,
				2.917729139328,
				2.8675000667572,
				4.0422706604004
			}
		},
		pwh_gameplay_seeing_a_pm_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_plague_monk_01",
				"pwh_gameplay_seeing_a_plague_monk_02",
				"pwh_gameplay_seeing_a_plague_monk_03",
				"pwh_gameplay_seeing_a_plague_monk_04",
				"pwh_gameplay_seeing_a_plague_monk_05",
				"pwh_gameplay_seeing_a_plague_monk_06",
				"pwh_gameplay_seeing_a_plague_monk_07",
				"pwh_gameplay_seeing_a_plague_monk_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_plague_monk_01",
				"pwh_gameplay_seeing_a_plague_monk_02",
				"pwh_gameplay_seeing_a_plague_monk_03",
				"pwh_gameplay_seeing_a_plague_monk_04",
				"pwh_gameplay_seeing_a_plague_monk_05",
				"pwh_gameplay_seeing_a_plague_monk_06",
				"pwh_gameplay_seeing_a_plague_monk_07",
				"pwh_gameplay_seeing_a_plague_monk_08"
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
			sound_events_duration = {
				2.8594374656677,
				2.4032707214356,
				2.5563957691193,
				1.9938541650772,
				2.5190000534058,
				3.6631875038147,
				4.0663542747498,
				3.6199791431427
			}
		},
		pwh_gameplay_spots_ammo_drunk = {
			face_animations_n = 10,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_06",
				"pwh_gameplay_spots_ammo_07",
				"pwh_gameplay_spots_ammo_08",
				"pwh_gameplay_spots_ammo_09",
				"pwh_gameplay_spots_ammo_10",
				"pwh_gameplay_spots_ammo_11",
				"pwh_gameplay_spots_ammo_12",
				"pwh_gameplay_spots_ammo_13",
				"pwh_gameplay_spots_ammo_14"
			},
			sound_events = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_06",
				"pwh_gameplay_spots_ammo_07",
				"pwh_gameplay_spots_ammo_08",
				"pwh_gameplay_spots_ammo_09",
				"pwh_gameplay_spots_ammo_10",
				"pwh_gameplay_spots_ammo_11",
				"pwh_gameplay_spots_ammo_12",
				"pwh_gameplay_spots_ammo_13",
				"pwh_gameplay_spots_ammo_14"
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
			sound_events_duration = {
				0.78841668367386,
				0.78841668367386,
				1.3619791269302,
				3.591854095459,
				2.9074375629425,
				2.5953750610352,
				2.0797290802002,
				2.5508124828339,
				2.2433750629425,
				2.7019374370575
			}
		},
		pwh_gameplay_friendly_fire_dwarf_ranger_drunk = {
			face_animations_n = 9,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 9,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_friendly_fire_dwarf_ranger_01",
				"pwh_gameplay_friendly_fire_dwarf_ranger_02",
				"pwh_gameplay_friendly_fire_dwarf_ranger_03",
				"pwh_gameplay_friendly_fire_dwarf_ranger_04",
				"pwh_gameplay_friendly_fire_dwarf_ranger_05",
				"pwh_gameplay_friendly_fire_dwarf_ranger_06",
				"pwh_gameplay_friendly_fire_dwarf_ranger_07",
				"pwh_gameplay_friendly_fire_dwarf_ranger_08",
				"pwh_gameplay_friendly_fire_dwarf_ranger_09"
			},
			sound_events = {
				"pwh_gameplay_friendly_fire_dwarf_ranger_01",
				"pwh_gameplay_friendly_fire_dwarf_ranger_02",
				"pwh_gameplay_friendly_fire_dwarf_ranger_03",
				"pwh_gameplay_friendly_fire_dwarf_ranger_04",
				"pwh_gameplay_friendly_fire_dwarf_ranger_05",
				"pwh_gameplay_friendly_fire_dwarf_ranger_06",
				"pwh_gameplay_friendly_fire_dwarf_ranger_07",
				"pwh_gameplay_friendly_fire_dwarf_ranger_08",
				"pwh_gameplay_friendly_fire_dwarf_ranger_09"
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
				"face_neutral"
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
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9814374446869,
				2.2940833568573,
				2.0422291755676,
				2.0244791507721,
				2.9730207920074,
				2.3359375,
				1.7015416622162,
				5.0945210456848,
				5.3822708129883
			}
		},
		pwh_gameplay_hearing_a_gutter_runner_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_seeing_a_shield_stormvermin_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_shield_stormvermin_01",
				"pwh_gameplay_seeing_a_shield_stormvermin_02",
				"pwh_gameplay_seeing_a_shield_stormvermin_03",
				"pwh_gameplay_seeing_a_shield_stormvermin_04",
				"pwh_gameplay_seeing_a_shield_stormvermin_05",
				"pwh_gameplay_seeing_a_shield_stormvermin_06",
				"pwh_gameplay_seeing_a_shield_stormvermin_07",
				"pwh_gameplay_seeing_a_shield_stormvermin_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_shield_stormvermin_01",
				"pwh_gameplay_seeing_a_shield_stormvermin_02",
				"pwh_gameplay_seeing_a_shield_stormvermin_03",
				"pwh_gameplay_seeing_a_shield_stormvermin_04",
				"pwh_gameplay_seeing_a_shield_stormvermin_05",
				"pwh_gameplay_seeing_a_shield_stormvermin_06",
				"pwh_gameplay_seeing_a_shield_stormvermin_07",
				"pwh_gameplay_seeing_a_shield_stormvermin_08"
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
			sound_events_duration = {
				1.9392291307449,
				2,
				1.5326249599457,
				1.5886875391007,
				2.0051040649414,
				3.2488541603088,
				2.9343957901001,
				2.383291721344
			}
		},
		pwh_gameplay_hearing_a_chaos_warrior_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_warrior_combat_01",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_02",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_03",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_04",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_05",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_06",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_07",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_warrior_combat_01",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_02",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_03",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_04",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_05",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_06",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_07",
				"pwh_gameplay_hearing_a_chaos_warrior_combat_08"
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
			sound_events_duration = {
				1.0930207967758,
				1.2835416793823,
				1.7139791250229,
				1.5832916498184,
				2.4128124713898,
				2.8318123817444,
				2.5357916355133,
				2.2198333740234
			}
		},
		pwh_gameplay_hearing_a_chaos_spawn_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_chaos_spawn_combat_01",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_02",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_03",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_04",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_05",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_06",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_07",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_chaos_spawn_combat_01",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_02",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_03",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_04",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_05",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_06",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_07",
				"pwh_gameplay_hearing_a_chaos_spawn_combat_08"
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
			sound_events_duration = {
				1.2853125333786,
				1.074979186058,
				1.3404582738876,
				1.1725833415985,
				1.7478749752045,
				1.3083125352859,
				1.3879791498184,
				2.1899375915527
			}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_hearing_a_pm_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_plague_monk_01",
				"pwh_gameplay_hearing_a_plague_monk_02",
				"pwh_gameplay_hearing_a_plague_monk_03",
				"pwh_gameplay_hearing_a_plague_monk_04",
				"pwh_gameplay_hearing_a_plague_monk_05",
				"pwh_gameplay_hearing_a_plague_monk_06",
				"pwh_gameplay_hearing_a_plague_monk_07",
				"pwh_gameplay_hearing_a_plague_monk_08"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_plague_monk_01",
				"pwh_gameplay_hearing_a_plague_monk_02",
				"pwh_gameplay_hearing_a_plague_monk_03",
				"pwh_gameplay_hearing_a_plague_monk_04",
				"pwh_gameplay_hearing_a_plague_monk_05",
				"pwh_gameplay_hearing_a_plague_monk_06",
				"pwh_gameplay_hearing_a_plague_monk_07",
				"pwh_gameplay_hearing_a_plague_monk_08"
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
			sound_events_duration = {
				3.675062417984,
				3.0011875629425,
				3.9522292613983,
				4.310124874115,
				1.3590416908264,
				1.4879167079925,
				2.6002082824707,
				1.6687500476837
			}
		},
		pwh_hiccup = {
			face_animations_n = 1,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 1,
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_hiccup"
			},
			sound_events = {
				[1.0] = "pwh_hiccup"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 0.65712313354015
			}
		},
		pwh_gameplay_hearing_a_skaven_ratling_gun_no_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_hearing_a_skaven_ratling_gun_04",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_05",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_06",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_01",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_02",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_03",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_07"
			},
			sound_events = {
				"pwh_gameplay_hearing_a_skaven_ratling_gun_04",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_05",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_06",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_01",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_02",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_03",
				"pwh_gameplay_hearing_a_skaven_ratling_gun_07"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6503748893738,
				3.0799374580383,
				2.4053957462311,
				2.7553749084473,
				1.7467917203903,
				2.4562916755676,
				1.8103958368301
			}
		},
		pwh_gameplay_hearing_a_troll_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_ambush_horde_spawned_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_ambush_horde_spawned_02",
				"pwh_gameplay_ambush_horde_spawned_03",
				"pwh_gameplay_ambush_horde_spawned_05",
				"pwh_gameplay_ambush_horde_spawned_07",
				"pwh_gameplay_ambush_horde_spawned_08",
				"pwh_gameplay_ambush_horde_spawned_09",
				"pwh_gameplay_ambush_horde_spawned_10"
			},
			sound_events = {
				"pwh_gameplay_ambush_horde_spawned_02",
				"pwh_gameplay_ambush_horde_spawned_03",
				"pwh_gameplay_ambush_horde_spawned_05",
				"pwh_gameplay_ambush_horde_spawned_07",
				"pwh_gameplay_ambush_horde_spawned_08",
				"pwh_gameplay_ambush_horde_spawned_09",
				"pwh_gameplay_ambush_horde_spawned_10"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
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
			sound_events_duration = {
				1.3519166707993,
				0.94499999284744,
				2.4966249465942,
				2.565687417984,
				0.92485415935516,
				0.94499999284744,
				0.92485415935516
			}
		},
		pwh_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pwh_gameplay_seeing_a_chaos_warrior_champion_combat_08"
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
			sound_events_duration = {
				3.1646666526794,
				3.7005207538605,
				1.2922916412354,
				2.0399167537689,
				3.0873334407806,
				2.8439791202545,
				3.3857500553131,
				2.7551040649414
			}
		},
		pwh_gameplay_empire_soldier_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_empire_soldier_being_helped_up_03",
				"pwh_gameplay_empire_soldier_being_helped_up_05",
				"pwh_gameplay_empire_soldier_being_helped_up_06",
				"pwh_gameplay_empire_soldier_being_helped_up_07",
				"pwh_gameplay_empire_soldier_being_helped_up_08",
				"pwh_gameplay_empire_soldier_being_helped_up_09",
				"pwh_gameplay_empire_soldier_being_helped_up_10",
				"pwh_gameplay_empire_soldier_being_helped_up_11"
			},
			sound_events = {
				"pwh_gameplay_empire_soldier_being_helped_up_03",
				"pwh_gameplay_empire_soldier_being_helped_up_05",
				"pwh_gameplay_empire_soldier_being_helped_up_06",
				"pwh_gameplay_empire_soldier_being_helped_up_07",
				"pwh_gameplay_empire_soldier_being_helped_up_08",
				"pwh_gameplay_empire_soldier_being_helped_up_09",
				"pwh_gameplay_empire_soldier_being_helped_up_10",
				"pwh_gameplay_empire_soldier_being_helped_up_11"
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
			sound_events_duration = {
				2.1272292137146,
				2.1272292137146,
				1.5265417098999,
				2.1024792194366,
				2.7359375953674,
				2.5977499485016,
				2.0640208721161,
				2.5158333778381
			}
		},
		pwh_gameplay_hearing_a_stormfiend_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_friendly_fire_wood_elf_drunk = {
			face_animations_n = 5,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_friendly_fire_wood_elf_05",
				"pwh_gameplay_friendly_fire_wood_elf_06",
				"pwh_gameplay_friendly_fire_wood_elf_07",
				"pwh_gameplay_friendly_fire_wood_elf_08",
				"pwh_gameplay_friendly_fire_wood_elf_09"
			},
			sound_events = {
				"pwh_gameplay_friendly_fire_wood_elf_05",
				"pwh_gameplay_friendly_fire_wood_elf_06",
				"pwh_gameplay_friendly_fire_wood_elf_07",
				"pwh_gameplay_friendly_fire_wood_elf_08",
				"pwh_gameplay_friendly_fire_wood_elf_09"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.3699998855591,
				1.5162916183472,
				3.9025626182556,
				3.0087082386017,
				5.885666847229
			}
		},
		pwh_gameplay_dwarf_ranger_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_being_helped_up_05",
				"pwh_gameplay_dwarf_ranger_being_helped_up_06",
				"pwh_gameplay_dwarf_ranger_being_helped_up_07",
				"pwh_gameplay_dwarf_ranger_being_helped_up_08",
				"pwh_gameplay_dwarf_ranger_being_helped_up_09",
				"pwh_gameplay_dwarf_ranger_being_helped_up_10",
				"pwh_gameplay_dwarf_ranger_being_helped_up_11",
				"pwh_gameplay_dwarf_ranger_being_helped_up_12"
			},
			sound_events = {
				"pwh_gameplay_dwarf_ranger_being_helped_up_05",
				"pwh_gameplay_dwarf_ranger_being_helped_up_06",
				"pwh_gameplay_dwarf_ranger_being_helped_up_07",
				"pwh_gameplay_dwarf_ranger_being_helped_up_08",
				"pwh_gameplay_dwarf_ranger_being_helped_up_09",
				"pwh_gameplay_dwarf_ranger_being_helped_up_10",
				"pwh_gameplay_dwarf_ranger_being_helped_up_11",
				"pwh_gameplay_dwarf_ranger_being_helped_up_12"
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
			sound_events_duration = {
				2.4245417118073,
				2.4348957538605,
				4.1490001678467,
				3.5600209236145,
				1.9294791221619,
				2.4999165534973,
				3.6836874485016,
				3.3026041984558
			}
		},
		pwh_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_helped_by_dwarf_ranger_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_helped_by_dwarf_ranger_01",
				"pwh_gameplay_helped_by_dwarf_ranger_02",
				"pwh_gameplay_helped_by_dwarf_ranger_03",
				"pwh_gameplay_helped_by_dwarf_ranger_04",
				"pwh_gameplay_helped_by_dwarf_ranger_05",
				"pwh_gameplay_helped_by_dwarf_ranger_06",
				"pwh_gameplay_helped_by_dwarf_ranger_07"
			},
			sound_events = {
				"pwh_gameplay_helped_by_dwarf_ranger_01",
				"pwh_gameplay_helped_by_dwarf_ranger_02",
				"pwh_gameplay_helped_by_dwarf_ranger_03",
				"pwh_gameplay_helped_by_dwarf_ranger_04",
				"pwh_gameplay_helped_by_dwarf_ranger_05",
				"pwh_gameplay_helped_by_dwarf_ranger_06",
				"pwh_gameplay_helped_by_dwarf_ranger_07"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
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
			sound_events_duration = {
				1.2588332891464,
				2.3998749256134,
				1.3598958253861,
				3.7912707328796,
				2.5315208435059,
				1.6549583673477,
				1.5482499599457
			}
		},
		pwh_gameplay_healing_bright_wizard_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_healing_bright_wizard_02",
				"pwh_gameplay_healing_bright_wizard_05",
				"pwh_gameplay_healing_bright_wizard_06",
				"pwh_gameplay_healing_bright_wizard_07",
				"pwh_gameplay_healing_bright_wizard_08",
				"pwh_gameplay_healing_bright_wizard_09"
			},
			sound_events = {
				"pwh_gameplay_healing_bright_wizard_02",
				"pwh_gameplay_healing_bright_wizard_05",
				"pwh_gameplay_healing_bright_wizard_06",
				"pwh_gameplay_healing_bright_wizard_07",
				"pwh_gameplay_healing_bright_wizard_08",
				"pwh_gameplay_healing_bright_wizard_09"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.9588332176209,
				3.9588332176209,
				3.4568123817444,
				2.341020822525,
				2.6422083377838,
				3.8699584007263
			}
		},
		pwh_gameplay_self_heal_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_self_heal_06",
				"pwh_gameplay_self_heal_02",
				"pwh_gameplay_self_heal_07",
				"pwh_gameplay_self_heal_08",
				"pwh_gameplay_self_heal_09",
				"pwh_gameplay_self_heal_10"
			},
			sound_events = {
				"pwh_gameplay_self_heal_06",
				"pwh_gameplay_self_heal_02",
				"pwh_gameplay_self_heal_07",
				"pwh_gameplay_self_heal_08",
				"pwh_gameplay_self_heal_09",
				"pwh_gameplay_self_heal_10"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.74968749284744,
				6.3066248893738,
				3.2419166564941,
				3.1528959274292,
				3.1719374656677,
				0.89620834589005
			}
		},
		pwh_gameplay_player_pounced_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_knocked_down_01",
				"pwh_crawl_drunk_knocked_down_02",
				"pwh_crawl_drunk_knocked_down_03",
				"pwh_crawl_drunk_knocked_down_04"
			},
			sound_events = {
				"pwh_crawl_drunk_knocked_down_01",
				"pwh_crawl_drunk_knocked_down_02",
				"pwh_crawl_drunk_knocked_down_03",
				"pwh_crawl_drunk_knocked_down_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.1015625,
				5.6771249771118,
				3.0148959159851,
				4.3863959312439
			}
		},
		pwh_gameplay_hearing_a_chaos_spawn_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_hearing_a_chaos_spawn_combat_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		},
		pwh_gameplay_friendly_fire_bright_wizard_drunk = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_friendly_fire_bright_wizard_02",
				"pwh_gameplay_friendly_fire_bright_wizard_05",
				"pwh_gameplay_friendly_fire_bright_wizard_06",
				"pwh_gameplay_friendly_fire_bright_wizard_07",
				"pwh_gameplay_friendly_fire_bright_wizard_08",
				"pwh_gameplay_friendly_fire_bright_wizard_09"
			},
			sound_events = {
				"pwh_gameplay_friendly_fire_bright_wizard_02",
				"pwh_gameplay_friendly_fire_bright_wizard_05",
				"pwh_gameplay_friendly_fire_bright_wizard_06",
				"pwh_gameplay_friendly_fire_bright_wizard_07",
				"pwh_gameplay_friendly_fire_bright_wizard_08",
				"pwh_gameplay_friendly_fire_bright_wizard_09"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.8437708616257,
				1.8437708616257,
				4.0555415153503,
				3.7145624160767,
				4.0358543395996,
				3.247270822525
			}
		},
		pwh_gameplay_seeing_a_skaven_ratling_gun_no_drunk = {
			face_animations_n = 7,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
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
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
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
		pwh_crawl_drunk_buff_begins_from_sick = {
			face_animations_n = 6,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_buff_begins_from_sick_01",
				"pwh_crawl_drunk_buff_begins_from_sick_02",
				"pwh_crawl_drunk_buff_begins_from_sick_03",
				"pwh_crawl_drunk_buff_begins_from_sick_04",
				"pwh_crawl_drunk_buff_begins_from_sick_05",
				"pwh_crawl_drunk_buff_begins_from_sick_06"
			},
			sound_events = {
				"pwh_crawl_drunk_buff_begins_from_sick_01",
				"pwh_crawl_drunk_buff_begins_from_sick_02",
				"pwh_crawl_drunk_buff_begins_from_sick_03",
				"pwh_crawl_drunk_buff_begins_from_sick_04",
				"pwh_crawl_drunk_buff_begins_from_sick_05",
				"pwh_crawl_drunk_buff_begins_from_sick_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.4860208034515,
				8.5809164047241,
				4.6809582710266,
				5.0203123092651,
				6.0902915000916,
				4.5539164543152
			}
		},
		pwh_gameplay_spots_potion_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_spotted_liquid_01",
				"pwh_crawl_drunk_spotted_liquid_02",
				"pwh_crawl_drunk_spotted_liquid_03",
				"pwh_crawl_drunk_spotted_liquid_04"
			},
			sound_events = {
				"pwh_crawl_drunk_spotted_liquid_01",
				"pwh_crawl_drunk_spotted_liquid_02",
				"pwh_crawl_drunk_spotted_liquid_03",
				"pwh_crawl_drunk_spotted_liquid_04"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.8119168281555,
				3.3932707309723,
				2.6729791164398,
				3.9593541622162
			}
		},
		pwh_gameplay_using_potion_drunk = {
			face_animations_n = 1,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 1,
			category = "player_feedback",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_drank"
			},
			sound_events = {
				[1.0] = "pwh_drank"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.0114442408085
			}
		},
		pwh_gameplay_hearing_a_stormfiend_drunk = {
			face_animations_n = 4,
			database = "witch_hunter_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwh_crawl_drunk_incoming_threat_01",
				"pwh_crawl_drunk_incoming_threat_02",
				"pwh_crawl_drunk_incoming_threat_03",
				"pwh_crawl_drunk_incoming_threat_04"
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
				2.8193333148956,
				5.4000000953674,
				3.6448750495911,
				2.5153124332428
			}
		}
	})
end
