return function ()
	define_rule({
		name = "pes_hiccup",
		response = "pes_hiccup",
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
		name = "pes_crawl_drunk_buff_wears_off",
		response = "pes_crawl_drunk_buff_wears_off",
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
		name = "pes_crawl_drunk_buff_begins",
		response = "pes_crawl_drunk_buff_begins",
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
		name = "pes_crawl_drunk_buff_begins_from_sick",
		response = "pes_crawl_drunk_buff_begins_from_sick",
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
		name = "pes_gameplay_healing_draught_drunk",
		response = "pes_gameplay_healing_draught_drunk",
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
				"empire_soldier"
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
		name = "pes_gameplay_spots_potion_drunk",
		response = "pes_gameplay_spots_potion_drunk",
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
				17
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
		name = "pes_gameplay_using_potion_drunk",
		response = "pes_gameplay_using_potion_drunk",
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
		name = "pes_gameplay_tips_wizard_wind_drunk",
		response = "pes_gameplay_tips_wizard_wind_drunk",
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
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_crawl_drank",
		name = "pes_crawl_drank",
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
		name = "pes_burp",
		response = "pes_burp",
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
		response = "pes_gameplay_witch_hunter_being_helped_up_drunk",
		name = "pes_gameplay_witch_hunter_being_helped_up_drunk",
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
		response = "pes_gameplay_bright_wizard_being_helped_up_drunk",
		name = "pes_gameplay_bright_wizard_being_helped_up_drunk",
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
		response = "pes_gameplay_wood_elf_being_helped_up_drunk",
		name = "pes_gameplay_wood_elf_being_helped_up_drunk",
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
		response = "pes_gameplay_dwarf_ranger_being_helped_drunk",
		name = "pes_gameplay_dwarf_ranger_being_helped_drunk",
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
		name = "pes_gameplay_healing_witch_hunter_drunk",
		response = "pes_gameplay_healing_witch_hunter_drunk",
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
		name = "pes_gameplay_healing_bright_wizard_drunk",
		response = "pes_gameplay_healing_bright_wizard_drunk",
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
		name = "pes_gameplay_healing_wood_elf_drunk",
		response = "pes_gameplay_healing_wood_elf_drunk",
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
		name = "pes_gameplay_healing_dwarf_ranger_drunk",
		response = "pes_gameplay_healing_dwarf_ranger_drunk",
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
		name = "pes_gameplay_helped_by_witch_hunter_drunk",
		response = "pes_gameplay_helped_by_witch_hunter_drunk",
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
		name = "pes_gameplay_helped_by_bright_wizard_drunk",
		response = "pes_gameplay_helped_by_bright_wizard_drunk",
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
		name = "pes_gameplay_helped_by_wood_elf_drunk",
		response = "pes_gameplay_helped_by_wood_elf_drunk",
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
		name = "pes_gameplay_helped_by_dwarf_ranger_drunk",
		response = "pes_gameplay_helped_by_dwarf_ranger_drunk",
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
		name = "pes_gameplay_low_on_health_drunk",
		response = "pes_gameplay_low_on_health_drunk",
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
		name = "pes_gameplay_witch_hunter_low_on_health_drunk",
		response = "pes_gameplay_witch_hunter_low_on_health_drunk",
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
		name = "pes_gameplay_bright_wizard_low_on_health_drunk",
		response = "pes_gameplay_bright_wizard_low_on_health_drunk",
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
		name = "pes_gameplay_wood_elf_low_on_health_drunk",
		response = "pes_gameplay_wood_elf_low_on_health_drunk",
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
		name = "pes_gameplay_dwarf_ranger_low_on_health_drunk",
		response = "pes_gameplay_dwarf_ranger_low_on_health_drunk",
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
		name = "pes_gameplay_spots_ammo_drunk",
		response = "pes_gameplay_spots_ammo_drunk",
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
		name = "pes_gameplay_spots_health_drunk",
		response = "pes_gameplay_spots_health_drunk",
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
				17
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
		name = "pes_gameplay_spots_bomb_drunk",
		response = "pes_gameplay_spots_bomb_drunk",
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
				17
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
		name = "pes_gameplay_out_of_ammo_drunk",
		response = "pes_gameplay_out_of_ammo_drunk",
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
		name = "pes_gameplay_self_heal_drunk",
		response = "pes_gameplay_self_heal_drunk",
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
		name = "pes_gameplay_throwing_bomb_drunk",
		response = "pes_gameplay_throwing_bomb_drunk",
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
		name = "pes_gameplay_friendly_fire_witch_hunter_drunk",
		response = "pes_gameplay_friendly_fire_witch_hunter_drunk",
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
		name = "pes_gameplay_friendly_fire_bright_wizard_drunk",
		response = "pes_gameplay_friendly_fire_bright_wizard_drunk",
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
		name = "pes_gameplay_friendly_fire_wood_elf_drunk",
		response = "pes_gameplay_friendly_fire_wood_elf_drunk",
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
		name = "pes_gameplay_friendly_fire_dwarf_ranger_drunk",
		response = "pes_gameplay_friendly_fire_dwarf_ranger_drunk",
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
		response = "pes_activate_ability_knight_non_drunk",
		name = "pes_activate_ability_knight_non_drunk",
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
		response = "pes_activate_ability_mercenary_non_drunk",
		name = "pes_activate_ability_mercenary_non_drunk",
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
		response = "pes_activate_ability_huntsman_non_drunk",
		name = "pes_activate_ability_huntsman_non_drunk",
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
		response = "pes_activate_ability_grail_knight_non_drunk",
		name = "pes_activate_ability_grail_knight_non_drunk",
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
				"es_questingknight"
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
		name = "pes_gameplay_knocked_down_drunk",
		response = "pes_gameplay_knocked_down_drunk",
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
		name = "pes_gameplay_player_pounced_drunk",
		response = "pes_gameplay_player_pounced_drunk",
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
		name = "pes_gameplay_hearing_a_gutter_runner_drunk",
		response = "pes_gameplay_hearing_a_gutter_runner_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_globadier_drunk",
		response = "pes_gameplay_hearing_a_globadier_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_incoming_skaven_rat_ogre_drunk",
		response = "pes_gameplay_incoming_skaven_rat_ogre_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
		response = "pes_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_ratling_gun_drunk",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
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
		name = "pes_gameplay_hearing_a_gutter_runner_combat_drunk",
		response = "pes_gameplay_hearing_a_gutter_runner_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_globadier_combat_drunk",
		response = "pes_gameplay_hearing_a_globadier_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_spawn_combat_drunk",
		response = "pes_gameplay_hearing_a_chaos_spawn_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_spawn_drunk",
		response = "pes_gameplay_hearing_a_chaos_spawn_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_wind_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_stormfiend_drunk",
		response = "pes_gameplay_hearing_a_stormfiend_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_stormfiend_combat_drunk",
		response = "pes_gameplay_hearing_a_stormfiend_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_troll_drunk",
		response = "pes_gameplay_hearing_a_troll_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_troll_combat_drunk",
		response = "pes_gameplay_hearing_a_troll_combat_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_rat_ogre_drunk",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre_drunk",
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
				"user_memory",
				"incoming_threat_kruber",
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
				"incoming_threat_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hears_incoming_horde_drunk",
		response = "pes_gameplay_hears_incoming_horde_drunk",
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
		name = "pes_gameplay_ambush_horde_spawned_drunk",
		response = "pes_gameplay_ambush_horde_spawned_drunk",
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
		name = "pes_gameplay_seeing_a_pm_no_drunk",
		response = "pes_gameplay_seeing_a_pm_no_drunk",
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
		name = "pes_gameplay_seeing_a_scr_no_drunk",
		response = "pes_gameplay_seeing_a_scr_no_drunk",
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
		name = "pes_gameplay_hearing_a_pm_no_drunk",
		response = "pes_gameplay_hearing_a_pm_no_drunk",
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
		name = "pes_gameplay_hearing_a_pm_in_combat_no_drunk",
		response = "pes_gameplay_hearing_a_pm_in_combat_no_drunk",
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
				"empire_soldier"
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
				"empire_soldier"
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
		name = "pes_gameplay_hearing_a_chaos_spawn_combat_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_spawn_combat_no_drunk",
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
		name = "pes_gameplay_seeing_a_chaos_spawn_no_drunk",
		response = "pes_gameplay_seeing_a_chaos_spawn_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_spawn_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_spawn_no_drunk",
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
		name = "pes_gameplay_killing_a_stormfiend_no_drunk",
		response = "pes_gameplay_killing_a_stormfiend_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_warrior_combat_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_warrior_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_plague_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_plague_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_wind_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk",
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
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_stormfiend_no_drunk",
		response = "pes_gameplay_hearing_a_stormfiend_no_drunk",
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
		name = "pes_gameplay_hearing_a_stormfiend_combat_no_drunk",
		response = "pes_gameplay_hearing_a_stormfiend_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_troll_no_drunk",
		response = "pes_gameplay_hearing_a_troll_no_drunk",
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
		name = "pes_gameplay_hearing_a_troll_combat_no_drunk",
		response = "pes_gameplay_hearing_a_troll_combat_no_drunk",
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
		name = "pes_gameplay_hearing_marauder_berserker_combat_no_drunk",
		response = "pes_gameplay_hearing_marauder_berserker_combat_no_drunk",
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
		name = "pes_gameplay_killing_a_chaos_warrior_no_drunk",
		response = "pes_gameplay_killing_a_chaos_warrior_no_drunk",
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
		name = "pes_gameplay_killing_a_chaos_warrior_champion_no_drunk",
		response = "pes_gameplay_killing_a_chaos_warrior_champion_no_drunk",
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
		name = "pes_gameplay_killing_a_chaos_wizard_plague_no_drunk",
		response = "pes_gameplay_killing_a_chaos_wizard_plague_no_drunk",
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
		name = "pes_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
		response = "pes_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
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
		name = "pes_gameplay_killing_a_chaos_wizard_wind_no_drunk",
		response = "pes_gameplay_killing_a_chaos_wizard_wind_no_drunk",
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
		name = "pes_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
		response = "pes_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
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
		name = "pes_gameplay_seeing_a_chaos_warrior_no_drunk",
		response = "pes_gameplay_seeing_a_chaos_warrior_no_drunk",
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
		name = "pes_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
		response = "pes_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
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
		name = "pes_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
		response = "pes_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
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
		name = "pes_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
		response = "pes_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
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
		name = "pes_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
		response = "pes_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
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
		name = "pes_gameplay_seeing_a_shield_stormvermin_no_drunk",
		response = "pes_gameplay_seeing_a_shield_stormvermin_no_drunk",
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
		name = "pes_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pes_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
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
		name = "pes_gameplay_seeing_a_stormfiend_no_drunk",
		response = "pes_gameplay_seeing_a_stormfiend_no_drunk",
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
		name = "pes_gameplay_seeing_a_troll_no_drunk",
		response = "pes_gameplay_seeing_a_troll_no_drunk",
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
		name = "pes_gameplay_hearing_a_chaos_wizard_leech_no_drunk",
		response = "pes_gameplay_hearing_a_chaos_wizard_leech_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pes_gameplay_killing_a_chaos_wizard_leech_no_drunk",
		response = "pes_gameplay_killing_a_chaos_wizard_leech_no_drunk",
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
		name = "pes_gameplay_hearing_a_gutter_runner_combat_no_drunk",
		response = "pes_gameplay_hearing_a_gutter_runner_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_globadier_combat_no_drunk",
		response = "pes_gameplay_hearing_a_globadier_combat_no_drunk",
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
		name = "pes_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk",
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
		name = "pes_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk",
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
		name = "pes_gameplay_seeing_a_stormvermin_no_drunk",
		response = "pes_gameplay_seeing_a_stormvermin_no_drunk",
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
		name = "pes_gameplay_seeing_a_gutter_runner_no_drunk",
		response = "pes_gameplay_seeing_a_gutter_runner_no_drunk",
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
		name = "pes_gameplay_hearing_a_gutter_runner_no_drunk",
		response = "pes_gameplay_hearing_a_gutter_runner_no_drunk",
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
		name = "pes_gameplay_seeing_a_globadier_no_drunk",
		response = "pes_gameplay_seeing_a_globadier_no_drunk",
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
		name = "pes_gameplay_hearing_a_globadier_no_drunk",
		response = "pes_gameplay_hearing_a_globadier_no_drunk",
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
		name = "pes_gameplay_seeing_a_skaven_rat_ogre_no_drunk",
		response = "pes_gameplay_seeing_a_skaven_rat_ogre_no_drunk",
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
		name = "pes_gameplay_hearing_a_skaven_rat_ogre_no_drunk",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre_no_drunk",
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
		name = "pes_gameplay_incoming_skaven_rat_ogre_no_drunk",
		response = "pes_gameplay_incoming_skaven_rat_ogre_no_drunk",
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
		name = "pes_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk",
		response = "pes_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk",
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
		name = "pes_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk",
		response = "pes_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk",
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
		name = "pes_gameplay_seeing_a_skaven_slaver_no_drunk",
		response = "pes_gameplay_seeing_a_skaven_slaver_no_drunk",
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
		name = "pes_gameplay_seeing_a_skaven_ratling_gun_no_drunk",
		response = "pes_gameplay_seeing_a_skaven_ratling_gun_no_drunk",
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
		name = "pes_gameplay_hearing_a_skaven_ratling_gun_no_drunk",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun_no_drunk",
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
		pes_gameplay_bright_wizard_being_helped_up_drunk = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events_duration = {
				1.3002083301544,
				1.4221458435059,
				1.8824167251587,
				2.1931457519531,
				2.5976667404175,
				1.8385000228882,
				2.1156666278839,
				1.9369167089462,
				1.1509791612625
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
			randomize_indexes = {},
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
			}
		},
		pes_gameplay_hearing_a_troll_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_witch_hunter_low_on_health_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.0624687373638,
				1.1834062337875,
				2.1568124890327,
				1.1668437719345,
				1.8022395968437
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_low_on_health_01",
				"pes_gameplay_witch_hunter_low_on_health_05",
				"pes_gameplay_witch_hunter_low_on_health_06",
				"pes_gameplay_witch_hunter_low_on_health_07",
				"pes_gameplay_witch_hunter_low_on_health_09"
			},
			sound_events = {
				"pes_gameplay_witch_hunter_low_on_health_01",
				"pes_gameplay_witch_hunter_low_on_health_05",
				"pes_gameplay_witch_hunter_low_on_health_06",
				"pes_gameplay_witch_hunter_low_on_health_07",
				"pes_gameplay_witch_hunter_low_on_health_09"
			}
		},
		pes_gameplay_hearing_a_troll_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				0.97335416078568,
				1.3664166927338,
				1.3004167079925,
				2.2612083554268,
				1.2836666107178,
				1.3773332834244,
				1.7371666431427,
				1.7669583559036
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_troll_combat_01",
				"pes_gameplay_hearing_a_troll_combat_02",
				"pes_gameplay_hearing_a_troll_combat_03",
				"pes_gameplay_hearing_a_troll_combat_04",
				"pes_gameplay_hearing_a_troll_combat_05",
				"pes_gameplay_hearing_a_troll_combat_06",
				"pes_gameplay_hearing_a_troll_combat_07",
				"pes_gameplay_hearing_a_troll_combat_08"
			}
		},
		pes_gameplay_hearing_a_skaven_patrol_stormvermin_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_crawl_drank = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_game_play_crawl",
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.5532708466053
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			localization_strings = {
				[1.0] = "pes_drank_drunk"
			},
			sound_events = {
				[1.0] = "pes_drank_drunk"
			}
		},
		pes_gameplay_spots_bomb_drunk = {
			sound_events_n = 14,
			face_animations_n = 14,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 14,
			sound_events_duration = {
				0.59333330392838,
				3.1451041698456,
				2.477395772934,
				1.4434374570847,
				1.6692708730698,
				2.6242709159851,
				1.2113749980927,
				1.9523124694824,
				1.2056875228882,
				2.5682709217072,
				1.3494374752045,
				3.270604133606,
				1.9287707805634,
				1.3463541269302
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
			randomize_indexes = {},
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
			}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun_no_drunk = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events_duration = {
				0.625,
				1.6941041946411,
				1.6342083215714,
				2.7681250572205,
				1.3431458473206,
				3.3235623836517,
				2.6470832824707
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
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_04",
				"pes_gameplay_hearing_a_skaven_ratling_gun_05",
				"pes_gameplay_hearing_a_skaven_ratling_gun_06",
				"pes_gameplay_hearing_a_skaven_ratling_gun_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_07"
			},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_04",
				"pes_gameplay_hearing_a_skaven_ratling_gun_05",
				"pes_gameplay_hearing_a_skaven_ratling_gun_06",
				"pes_gameplay_hearing_a_skaven_ratling_gun_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_07"
			}
		},
		pes_gameplay_healing_witch_hunter_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.4707812070847,
				1.3158228993416,
				1.2450729012489,
				1.5641041994095
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_healing_witch_hunter_01",
				"pes_gameplay_healing_witch_hunter_02",
				"pes_gameplay_healing_witch_hunter_03",
				"pes_gameplay_healing_witch_hunter_04"
			},
			sound_events = {
				"pes_gameplay_healing_witch_hunter_01",
				"pes_gameplay_healing_witch_hunter_02",
				"pes_gameplay_healing_witch_hunter_03",
				"pes_gameplay_healing_witch_hunter_04"
			}
		},
		pes_gameplay_seeing_a_troll_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.1530001163483,
				1.3343333005905,
				4.0587501525879,
				5.7707915306091,
				4.5772290229797,
				5.556104183197,
				3.772020816803,
				3.4877707958221
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_troll_01",
				"pes_gameplay_seeing_a_troll_02",
				"pes_gameplay_seeing_a_troll_03",
				"pes_gameplay_seeing_a_troll_04",
				"pes_gameplay_seeing_a_troll_05",
				"pes_gameplay_seeing_a_troll_06",
				"pes_gameplay_seeing_a_troll_07",
				"pes_gameplay_seeing_a_troll_08"
			}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.7920416593552,
				1.1099166870117,
				2.7284063100815,
				1.7465624809265,
				2.9546041488648,
				1.2632291316986
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_contempt",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_01",
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_03",
				"pes_gameplay_first_time_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_first_time_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_hearing_a_skaven_rat_ogre_01"
			},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_01",
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_03",
				"pes_gameplay_first_time_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_first_time_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_hearing_a_skaven_rat_ogre_01"
			}
		},
		pes_gameplay_hearing_a_gutter_runner_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_activate_ability_knight_non_drunk = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			sound_events_duration = {
				1.9961667060852,
				2.4541249275208,
				1.118083357811,
				1.5277500152588,
				1.3519166707993,
				1.6802916526794,
				3.6310625076294,
				1.7254375219345,
				2.9519374370575,
				3.6905000209808,
				2.5241665840149,
				2.1462082862854
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_activate_ability_knight_01",
				"pes_activate_ability_knight_02",
				"pes_activate_ability_knight_03",
				"pes_activate_ability_knight_04",
				"pes_activate_ability_knight_05",
				"pes_activate_ability_knight_06",
				"pes_activate_ability_knight_07",
				"pes_activate_ability_knight_08",
				"pes_activate_ability_knight_09",
				"pes_activate_ability_knight_10",
				"pes_activate_ability_knight_11",
				"pes_activate_ability_knight_12"
			},
			sound_events = {
				"pes_activate_ability_knight_01",
				"pes_activate_ability_knight_02",
				"pes_activate_ability_knight_03",
				"pes_activate_ability_knight_04",
				"pes_activate_ability_knight_05",
				"pes_activate_ability_knight_06",
				"pes_activate_ability_knight_07",
				"pes_activate_ability_knight_08",
				"pes_activate_ability_knight_09",
				"pes_activate_ability_knight_10",
				"pes_activate_ability_knight_11",
				"pes_activate_ability_knight_12"
			}
		},
		pes_gameplay_hearing_a_troll_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				2.9682188034058,
				4.4051666259766,
				3.7769582271576,
				3.2501873970032,
				2.1605207920074,
				3.7060625553131
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_troll_01",
				"pes_gameplay_hearing_a_troll_02",
				"pes_gameplay_hearing_a_troll_03",
				"pes_gameplay_hearing_a_troll_04",
				"pes_gameplay_hearing_a_troll_05",
				"pes_gameplay_hearing_a_troll_06"
			},
			sound_events = {
				"pes_gameplay_hearing_a_troll_01",
				"pes_gameplay_hearing_a_troll_02",
				"pes_gameplay_hearing_a_troll_03",
				"pes_gameplay_hearing_a_troll_04",
				"pes_gameplay_hearing_a_troll_05",
				"pes_gameplay_hearing_a_troll_06"
			}
		},
		pes_gameplay_hearing_a_chaos_spawn_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				4.2102084159851,
				5.580020904541,
				4.0981874465942,
				3.6888542175293,
				1.9125624895096,
				1.8865000009537,
				1.6497083902359,
				2.068416595459
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_spawn_01",
				"pes_gameplay_hearing_a_chaos_spawn_02",
				"pes_gameplay_hearing_a_chaos_spawn_03",
				"pes_gameplay_hearing_a_chaos_spawn_04",
				"pes_gameplay_hearing_a_chaos_spawn_05",
				"pes_gameplay_hearing_a_chaos_spawn_06",
				"pes_gameplay_hearing_a_chaos_spawn_07",
				"pes_gameplay_hearing_a_chaos_spawn_08"
			}
		},
		pes_gameplay_hears_incoming_horde_drunk = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events_duration = {
				2.3610000610352,
				2.193416595459,
				1.3713229298592,
				1.8708332777023,
				2.0458854436874,
				2.3609583377838,
				2.0683958530426
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
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hears_incoming_horde_11",
				"pes_gameplay_hears_incoming_horde_12",
				"pes_gameplay_hears_incoming_horde_13",
				"pes_gameplay_hears_incoming_horde_14",
				"pes_gameplay_hears_incoming_horde_15",
				"pes_gameplay_hears_incoming_horde_16",
				"pes_gameplay_hears_incoming_horde_17"
			},
			sound_events = {
				"pes_gameplay_hears_incoming_horde_11",
				"pes_gameplay_hears_incoming_horde_12",
				"pes_gameplay_hears_incoming_horde_13",
				"pes_gameplay_hears_incoming_horde_14",
				"pes_gameplay_hears_incoming_horde_15",
				"pes_gameplay_hears_incoming_horde_16",
				"pes_gameplay_hears_incoming_horde_17"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_chaos_spawn_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_seeing_a_skaven_ratling_gun_no_drunk = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events_duration = {
				1.0576041936874,
				1.2963750362396,
				1.5645208358765,
				1.8267291784286,
				1.8766458034515,
				1.2735208272934,
				2.3948957920074
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
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
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
			sound_events = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
			}
		},
		pes_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				3.1081874370575,
				4.5991561412811,
				2.9146873950958,
				3.3966875076294,
				3.1701874732971,
				4.0842084884644,
				3.5552916526794,
				4.2286667823792
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			}
		},
		pes_gameplay_hearing_a_gutter_runner_combat_no_drunk = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 3,
			sound_events_duration = {
				0.76243752241135,
				1.0981458425522,
				1.6357707977295
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_gutter_runner_combat_01",
				"pes_gameplay_hearing_a_gutter_runner_combat_02",
				"pes_gameplay_hearing_a_gutter_runner_03"
			},
			sound_events = {
				"pes_gameplay_hearing_a_gutter_runner_combat_01",
				"pes_gameplay_hearing_a_gutter_runner_combat_02",
				"pes_gameplay_hearing_a_gutter_runner_03"
			}
		},
		pes_gameplay_seeing_a_skaven_slaver_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				0.88443750143051,
				0.94454169273376,
				1.0481250286102,
				1.186562538147,
				1.029000043869,
				1.6907708644867,
				1.5038958787918,
				2.1278958320618
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
			}
		},
		pes_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events_duration = {
				1.4509791135788,
				2.6708540916443,
				1.7882291078568,
				1.5687291622162,
				2.0784583091736,
				2.2767915725708,
				2
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
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
			sound_events = {
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			}
		},
		pes_gameplay_using_potion_drunk = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.0176354646683
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_drank"
			},
			sound_events = {
				[1.0] = "pes_drank"
			}
		},
		pes_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events_duration = {
				1.505083322525,
				1.0053541660309,
				1.9318541288376,
				2.0098333358765,
				1.526166677475,
				2.3296875953674,
				2.2557916641235
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
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			}
		},
		pes_gameplay_seeing_a_gutter_runner_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.5134791135788,
				1.676677107811,
				1.0027500391007,
				1.245020866394,
				1.3851875066757,
				1.2981666326523
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			}
		},
		pes_gameplay_healing_draught_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 4,
			sound_events_duration = {
				2.2309582233429,
				1.8664166927338,
				2.0337707996368,
				1.676854133606
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_spotted_liquid_01",
				"pes_crawl_drunk_spotted_liquid_02",
				"pes_crawl_drunk_spotted_liquid_03",
				"pes_crawl_drunk_spotted_liquid_04"
			},
			sound_events = {
				"pes_crawl_drunk_spotted_liquid_01",
				"pes_crawl_drunk_spotted_liquid_02",
				"pes_crawl_drunk_spotted_liquid_03",
				"pes_crawl_drunk_spotted_liquid_04"
			}
		},
		pes_gameplay_incoming_skaven_rat_ogre_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.3062916994095,
				0.84112501144409,
				1.7713333368301,
				1.7835416793823,
				2.2189583778381,
				1.8093750476837,
				1.3349167108536,
				2.2363229393959
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_gameplay_incoming_skaven_rat_ogre_01",
				"pes_gameplay_incoming_skaven_rat_ogre_05",
				"pes_gameplay_incoming_skaven_rat_ogre_06",
				"pes_gameplay_incoming_skaven_rat_ogre_02",
				"pes_gameplay_incoming_skaven_rat_ogre_03",
				"pes_gameplay_incoming_skaven_rat_ogre_04",
				"pes_gameplay_incoming_skaven_rat_ogre_07",
				"pes_gameplay_incoming_skaven_rat_ogre_08"
			},
			sound_events = {
				"pes_gameplay_incoming_skaven_rat_ogre_01",
				"pes_gameplay_incoming_skaven_rat_ogre_05",
				"pes_gameplay_incoming_skaven_rat_ogre_06",
				"pes_gameplay_incoming_skaven_rat_ogre_02",
				"pes_gameplay_incoming_skaven_rat_ogre_03",
				"pes_gameplay_incoming_skaven_rat_ogre_04",
				"pes_gameplay_incoming_skaven_rat_ogre_07",
				"pes_gameplay_incoming_skaven_rat_ogre_08"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.4063124656677,
				2.429229259491,
				3.9542708396912,
				3.6744375228882,
				1.2816041707993,
				1.9255625009537,
				1.3128957748413,
				1.1866874694824
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_08"
			}
		},
		pes_gameplay_seeing_a_skaven_rat_ogre_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.1322083473206,
				1.6407187581062,
				1.6288541555405,
				2.2949166297913,
				1.6217082738876,
				1.6924583315849
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_seeing_a_globadier_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.0624375343323,
				1.2897291183472,
				0.86418747901917,
				2.052791595459,
				1.7604999542236,
				1.0809999704361
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_03",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_02",
				"pes_gameplay_seeing_a_globadier_05",
				"pes_gameplay_seeing_a_globadier_06"
			},
			sound_events = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_03",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_02",
				"pes_gameplay_seeing_a_globadier_05",
				"pes_gameplay_seeing_a_globadier_06"
			}
		},
		pes_gameplay_incoming_skaven_rat_ogre_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_killing_a_chaos_warrior_champion_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				3.7217707633972,
				2.9558228254318,
				3.2511250972748,
				1.8682708740234,
				3.5334792137146,
				4.1793541908264,
				2.6062083244324,
				2.3493750095367
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_killing_a_chaos_warrior_champion_01",
				"pes_gameplay_killing_a_chaos_warrior_champion_02",
				"pes_gameplay_killing_a_chaos_warrior_champion_03",
				"pes_gameplay_killing_a_chaos_warrior_champion_04",
				"pes_gameplay_killing_a_chaos_warrior_champion_05",
				"pes_gameplay_killing_a_chaos_warrior_champion_06",
				"pes_gameplay_killing_a_chaos_warrior_champion_07",
				"pes_gameplay_killing_a_chaos_warrior_champion_08"
			}
		},
		pes_gameplay_seeing_a_stormvermin_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.8007292747498,
				1.3295208215714,
				1.1208958625793,
				1.6428542137146,
				1.8358124494553,
				1.5434583425522,
				1.5376875400543,
				2.2200417518616
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
			}
		},
		pes_gameplay_hearing_a_stormfiend_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_dwarf_ranger_being_helped_drunk = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events_duration = {
				1.1185417175293,
				1.2692500352859,
				1.9630625247955,
				1.5223958492279,
				2.3047499656677,
				3.4669165611267,
				2.3089792728424,
				2.7057082653046,
				1.8933750391007
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
			randomize_indexes = {},
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
			}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_hiccup = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_game_play_crawl",
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 0.66241250932217
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_hiccup"
			},
			sound_events = {
				[1.0] = "pes_hiccup"
			}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.2875833511352,
				0.87272918224335,
				1.274854183197,
				1.0438541173935
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_04"
			},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_04"
			}
		},
		pes_activate_ability_mercenary_non_drunk = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 15,
			sound_events_duration = {
				6.9235625267029,
				4.1105833053589,
				5.1145000457764,
				4.2063331604004,
				5.0917916297913,
				4.7221665382385,
				4.2292914390564,
				4.079062461853,
				3.319000005722,
				2.9270625114441,
				3.8017292022705,
				1.2831041812897,
				1.4261041879654,
				1.1333541870117,
				1.9232292175293
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
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
			localization_strings = {
				"pes_activate_ability_mercenary_01",
				"pes_activate_ability_mercenary_02",
				"pes_activate_ability_mercenary_04",
				"pes_activate_ability_mercenary_05",
				"pes_activate_ability_mercenary_06",
				"pes_activate_ability_mercenary_07",
				"pes_activate_ability_mercenary_08",
				"pes_activate_ability_mercenary_09",
				"pes_activate_ability_mercenary_10",
				"pes_activate_ability_mercenary_11",
				"pes_activate_ability_mercenary_12",
				"pes_activate_ability_mercenary_13",
				"pes_activate_ability_mercenary_14",
				"pes_activate_ability_mercenary_15",
				"pes_activate_ability_mercenary_16"
			},
			sound_events = {
				"pes_activate_ability_mercenary_01",
				"pes_activate_ability_mercenary_02",
				"pes_activate_ability_mercenary_04",
				"pes_activate_ability_mercenary_05",
				"pes_activate_ability_mercenary_06",
				"pes_activate_ability_mercenary_07",
				"pes_activate_ability_mercenary_08",
				"pes_activate_ability_mercenary_09",
				"pes_activate_ability_mercenary_10",
				"pes_activate_ability_mercenary_11",
				"pes_activate_ability_mercenary_12",
				"pes_activate_ability_mercenary_13",
				"pes_activate_ability_mercenary_14",
				"pes_activate_ability_mercenary_15",
				"pes_activate_ability_mercenary_16"
			}
		},
		pes_gameplay_hearing_a_troll_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_globadier_combat_no_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.7543958425522,
				1.2000000476837,
				0.71872913837433,
				1.1677082777023,
				2.0359375476837
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_globadier_combat_01",
				"pes_gameplay_hearing_a_globadier_combat_02",
				"pes_gameplay_hearing_a_globadier_combat_03",
				"pes_gameplay_hearing_a_globadier_combat_04",
				"pes_gameplay_hearing_a_globadier_combat_05"
			},
			sound_events = {
				"pes_gameplay_hearing_a_globadier_combat_01",
				"pes_gameplay_hearing_a_globadier_combat_02",
				"pes_gameplay_hearing_a_globadier_combat_03",
				"pes_gameplay_hearing_a_globadier_combat_04",
				"pes_gameplay_hearing_a_globadier_combat_05"
			}
		},
		pes_gameplay_killing_a_chaos_wizard_leech_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.0725833177566,
				1.4505833387375,
				2.294041633606,
				1.9979583621025,
				1.4899791479111,
				2.0367708206177
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_leech_01",
				"pes_gameplay_killing_a_chaos_wizard_leech_02",
				"pes_gameplay_killing_a_chaos_wizard_leech_03",
				"pes_gameplay_killing_a_chaos_wizard_leech_04",
				"pes_gameplay_killing_a_chaos_wizard_leech_05",
				"pes_gameplay_killing_a_chaos_wizard_leech_06"
			},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_leech_01",
				"pes_gameplay_killing_a_chaos_wizard_leech_02",
				"pes_gameplay_killing_a_chaos_wizard_leech_03",
				"pes_gameplay_killing_a_chaos_wizard_leech_04",
				"pes_gameplay_killing_a_chaos_wizard_leech_05",
				"pes_gameplay_killing_a_chaos_wizard_leech_06"
			}
		},
		pes_gameplay_hearing_a_globadier_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_leech_no_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				3.161468744278,
				2.608416557312,
				2.0324583053589,
				3.1651666164398
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_chaos_wizard_leech_01",
				"pes_gameplay_hearing_a_chaos_wizard_leech_02",
				"pes_gameplay_hearing_a_chaos_wizard_leech_03",
				"pes_gameplay_hearing_a_chaos_wizard_leech_04"
			},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_leech_01",
				"pes_gameplay_hearing_a_chaos_wizard_leech_02",
				"pes_gameplay_hearing_a_chaos_wizard_leech_03",
				"pes_gameplay_hearing_a_chaos_wizard_leech_04"
			}
		},
		pes_gameplay_witch_hunter_being_helped_up_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.1166249811649,
				1.125,
				2.1772916913033,
				2.4727084040642,
				1.2745104432106,
				1.9975103735924,
				1.247250020504,
				3.5901770591736
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_witch_hunter_being_helped_up_01",
				"pes_gameplay_witch_hunter_being_helped_up_04",
				"pes_gameplay_witch_hunter_being_helped_up_05",
				"pes_gameplay_witch_hunter_being_helped_up_06",
				"pes_gameplay_witch_hunter_being_helped_up_07",
				"pes_gameplay_witch_hunter_being_helped_up_08",
				"pes_gameplay_witch_hunter_being_helped_up_09",
				"pes_gameplay_witch_hunter_being_helped_up_10"
			}
		},
		pes_gameplay_seeing_a_scr_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.7016667127609,
				1.9116041660309,
				0.83649998903275,
				1.4907499551773,
				1.6280208826065,
				1.0646874904633,
				2.3352916240692,
				3.1080832481384
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_gameplay_seeing_a_shield_clanrat_01",
				"pes_gameplay_seeing_a_shield_clanrat_02",
				"pes_gameplay_seeing_a_shield_clanrat_03",
				"pes_gameplay_seeing_a_shield_clanrat_04",
				"pes_gameplay_seeing_a_shield_clanrat_05",
				"pes_gameplay_seeing_a_shield_clanrat_06",
				"pes_gameplay_seeing_a_shield_clanrat_07",
				"pes_gameplay_seeing_a_shield_clanrat_08"
			},
			sound_events = {
				"pes_gameplay_seeing_a_shield_clanrat_01",
				"pes_gameplay_seeing_a_shield_clanrat_02",
				"pes_gameplay_seeing_a_shield_clanrat_03",
				"pes_gameplay_seeing_a_shield_clanrat_04",
				"pes_gameplay_seeing_a_shield_clanrat_05",
				"pes_gameplay_seeing_a_shield_clanrat_06",
				"pes_gameplay_seeing_a_shield_clanrat_07",
				"pes_gameplay_seeing_a_shield_clanrat_08"
			}
		},
		pes_gameplay_seeing_a_chaos_wizard_wind_no_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				2.7060832977295,
				3.1529166698456,
				3.6873958110809,
				2.5999999046326
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_chaos_wizard_wind_01",
				"pes_gameplay_seeing_a_chaos_wizard_wind_02",
				"pes_gameplay_seeing_a_chaos_wizard_wind_03",
				"pes_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_wind_01",
				"pes_gameplay_seeing_a_chaos_wizard_wind_02",
				"pes_gameplay_seeing_a_chaos_wizard_wind_03",
				"pes_gameplay_seeing_a_chaos_wizard_wind_04"
			}
		},
		pes_gameplay_seeing_a_stormfiend_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.2115833759308,
				4.2078334093094,
				2.6422083377838,
				2.4455416202545,
				2.5981457233429,
				2.7933332920074,
				2.470624923706,
				3.7116665840149
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_stormfiend_01",
				"pes_gameplay_seeing_a_stormfiend_02",
				"pes_gameplay_seeing_a_stormfiend_03",
				"pes_gameplay_seeing_a_stormfiend_04",
				"pes_gameplay_seeing_a_stormfiend_05",
				"pes_gameplay_seeing_a_stormfiend_06",
				"pes_gameplay_seeing_a_stormfiend_07",
				"pes_gameplay_seeing_a_stormfiend_08"
			}
		},
		pes_gameplay_hearing_a_globadier_no_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.2363749742508,
				1.2633957862854,
				1.2277916669846,
				2.2371459007263,
				1.9596874713898
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_globadier_02",
				"pes_gameplay_hearing_a_globadier_05",
				"pes_gameplay_hearing_a_globadier_06",
				"pes_gameplay_hearing_a_globadier_01",
				"pes_gameplay_hearing_a_globadier_04"
			},
			sound_events = {
				"pes_gameplay_hearing_a_globadier_02",
				"pes_gameplay_hearing_a_globadier_05",
				"pes_gameplay_hearing_a_globadier_06",
				"pes_gameplay_hearing_a_globadier_01",
				"pes_gameplay_hearing_a_globadier_04"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.4699167013168,
				1.893458366394,
				2.2542917728424,
				1.8599375486374,
				3.1629583835602,
				2.499062538147,
				2.5678749084473,
				2.8775625228882
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events_duration = {
				2.5845415592194,
				4.754979133606,
				2.586874961853,
				3.0988750457764,
				1.8821666240692,
				1.3387916088104
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			}
		},
		pes_gameplay_seeing_a_pm_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.4447500705719,
				2.0614583492279,
				2.8597812652588,
				2.9318749904633,
				2.209041595459,
				2.6277499198914,
				1.7398542165756,
				2.3909686803818
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_gameplay_seeing_a_plague_monk_01",
				"pes_gameplay_seeing_a_plague_monk_02",
				"pes_gameplay_seeing_a_plague_monk_03",
				"pes_gameplay_seeing_a_plague_monk_04",
				"pes_gameplay_seeing_a_plague_monk_05",
				"pes_gameplay_seeing_a_plague_monk_06",
				"pes_gameplay_seeing_a_plague_monk_07",
				"pes_gameplay_seeing_a_plague_monk_08"
			},
			sound_events = {
				"pes_gameplay_seeing_a_plague_monk_01",
				"pes_gameplay_seeing_a_plague_monk_02",
				"pes_gameplay_seeing_a_plague_monk_03",
				"pes_gameplay_seeing_a_plague_monk_04",
				"pes_gameplay_seeing_a_plague_monk_05",
				"pes_gameplay_seeing_a_plague_monk_06",
				"pes_gameplay_seeing_a_plague_monk_07",
				"pes_gameplay_seeing_a_plague_monk_08"
			}
		},
		pes_gameplay_killing_a_stormfiend_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.3641458749771,
				1.6720416545868,
				2.7783124446869,
				2.6464583873749,
				2.9873332977295,
				2.1358957290649,
				3.4507501125336,
				1.8140208721161
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_killing_a_stormfiend_01",
				"pes_gameplay_killing_a_stormfiend_02",
				"pes_gameplay_killing_a_stormfiend_03",
				"pes_gameplay_killing_a_stormfiend_04",
				"pes_gameplay_killing_a_stormfiend_05",
				"pes_gameplay_killing_a_stormfiend_06",
				"pes_gameplay_killing_a_stormfiend_07",
				"pes_gameplay_killing_a_stormfiend_08"
			}
		},
		pes_crawl_drunk_buff_begins = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events_duration = {
				2.9882500171661,
				1.4497708082199,
				4.2527289390564,
				3.6542291641235,
				2.5132291316986,
				3.9973125457764
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_buff_begins_01",
				"pes_crawl_drunk_buff_begins_02",
				"pes_crawl_drunk_buff_begins_03",
				"pes_crawl_drunk_buff_begins_04",
				"pes_crawl_drunk_buff_begins_05",
				"pes_crawl_drunk_buff_begins_06"
			},
			sound_events = {
				"pes_crawl_drunk_buff_begins_01",
				"pes_crawl_drunk_buff_begins_02",
				"pes_crawl_drunk_buff_begins_03",
				"pes_crawl_drunk_buff_begins_04",
				"pes_crawl_drunk_buff_begins_05",
				"pes_crawl_drunk_buff_begins_06"
			}
		},
		pes_gameplay_hearing_a_pm_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.1063542366028,
				4.2329168319702,
				2.8080625534058,
				2.8716666698456,
				1.2773958444595,
				1.7499582767487,
				2.4377708435059,
				1.7516458034515
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_gameplay_hearing_a_plague_monk_01",
				"pes_gameplay_hearing_a_plague_monk_02",
				"pes_gameplay_hearing_a_plague_monk_03",
				"pes_gameplay_hearing_a_plague_monk_04",
				"pes_gameplay_hearing_a_plague_monk_05",
				"pes_gameplay_hearing_a_plague_monk_06",
				"pes_gameplay_hearing_a_plague_monk_07",
				"pes_gameplay_hearing_a_plague_monk_08"
			},
			sound_events = {
				"pes_gameplay_hearing_a_plague_monk_01",
				"pes_gameplay_hearing_a_plague_monk_02",
				"pes_gameplay_hearing_a_plague_monk_03",
				"pes_gameplay_hearing_a_plague_monk_04",
				"pes_gameplay_hearing_a_plague_monk_05",
				"pes_gameplay_hearing_a_plague_monk_06",
				"pes_gameplay_hearing_a_plague_monk_07",
				"pes_gameplay_hearing_a_plague_monk_08"
			}
		},
		pes_gameplay_spots_potion_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 4,
			sound_events_duration = {
				2.2309582233429,
				1.8664166927338,
				2.0337707996368,
				1.676854133606
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_spotted_liquid_01",
				"pes_crawl_drunk_spotted_liquid_02",
				"pes_crawl_drunk_spotted_liquid_03",
				"pes_crawl_drunk_spotted_liquid_04"
			},
			sound_events = {
				"pes_crawl_drunk_spotted_liquid_01",
				"pes_crawl_drunk_spotted_liquid_02",
				"pes_crawl_drunk_spotted_liquid_03",
				"pes_crawl_drunk_spotted_liquid_04"
			}
		},
		pes_gameplay_helped_by_wood_elf_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.2000000476837,
				1.1828541755676,
				2.0490521192551,
				2.6001040935516
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_helped_by_wood_elf_02",
				"pes_gameplay_helped_by_wood_elf_05",
				"pes_gameplay_helped_by_wood_elf_06",
				"pes_gameplay_helped_by_wood_elf_07"
			},
			sound_events = {
				"pes_gameplay_helped_by_wood_elf_02",
				"pes_gameplay_helped_by_wood_elf_05",
				"pes_gameplay_helped_by_wood_elf_06",
				"pes_gameplay_helped_by_wood_elf_07"
			}
		},
		pes_gameplay_seeing_a_chaos_warrior_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				3.319854259491,
				2.9505208730698,
				1.4906041622162,
				2.0340416431427,
				3.7763125896454,
				2.6143124103546,
				2.7025208473206,
				2.3324792385101
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_chaos_warrior_01",
				"pes_gameplay_seeing_a_chaos_warrior_02",
				"pes_gameplay_seeing_a_chaos_warrior_03",
				"pes_gameplay_seeing_a_chaos_warrior_04",
				"pes_gameplay_seeing_a_chaos_warrior_05",
				"pes_gameplay_seeing_a_chaos_warrior_06",
				"pes_gameplay_seeing_a_chaos_warrior_07",
				"pes_gameplay_seeing_a_chaos_warrior_08"
			}
		},
		pes_gameplay_killing_a_chaos_wizard_plague_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.4851458072662,
				2.7062292098999,
				2.0168333053589,
				1.7163541316986,
				1.0011041164398,
				0.91879165172577
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_plague_01",
				"pes_gameplay_killing_a_chaos_wizard_plague_02",
				"pes_gameplay_killing_a_chaos_wizard_plague_03",
				"pes_gameplay_killing_a_chaos_wizard_plague_04",
				"pes_gameplay_killing_a_chaos_wizard_plague_05",
				"pes_gameplay_killing_a_chaos_wizard_plague_06"
			},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_plague_01",
				"pes_gameplay_killing_a_chaos_wizard_plague_02",
				"pes_gameplay_killing_a_chaos_wizard_plague_03",
				"pes_gameplay_killing_a_chaos_wizard_plague_04",
				"pes_gameplay_killing_a_chaos_wizard_plague_05",
				"pes_gameplay_killing_a_chaos_wizard_plague_06"
			}
		},
		pes_gameplay_tips_wizard_wind_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_globadier_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_dwarf_ranger_low_on_health_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				2.5209999084473,
				2.1845834255219,
				2.240770816803,
				1.6283333301544
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_dwarf_ranger_low_on_health_05",
				"pes_gameplay_dwarf_ranger_low_on_health_06",
				"pes_gameplay_dwarf_ranger_low_on_health_07",
				"pes_gameplay_dwarf_ranger_low_on_health_08"
			},
			sound_events = {
				"pes_gameplay_dwarf_ranger_low_on_health_05",
				"pes_gameplay_dwarf_ranger_low_on_health_06",
				"pes_gameplay_dwarf_ranger_low_on_health_07",
				"pes_gameplay_dwarf_ranger_low_on_health_08"
			}
		},
		pes_gameplay_healing_wood_elf_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6994166374207,
				1.4035625457764,
				1.4770624637604,
				1.6429582834244
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_healing_wood_elf_01",
				"pes_gameplay_healing_wood_elf_02",
				"pes_gameplay_healing_wood_elf_03",
				"pes_gameplay_healing_wood_elf_04"
			},
			sound_events = {
				"pes_gameplay_healing_wood_elf_01",
				"pes_gameplay_healing_wood_elf_02",
				"pes_gameplay_healing_wood_elf_03",
				"pes_gameplay_healing_wood_elf_04"
			}
		},
		pes_gameplay_killing_a_skaven_warpfire_thrower_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.291375041008,
				1.1993124485016,
				2.6884167194366,
				1.4978125095367,
				1.9841250181198,
				2.9686979055405,
				2.8504374027252,
				2.067125082016
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_08"
			}
		},
		pes_gameplay_spots_health_drunk = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 12,
			sound_events_duration = {
				1.276270866394,
				1.0624582767487,
				1.145708322525,
				0.982541680336,
				1.4442917108536,
				1.8630833625793,
				1.7280000448227,
				1.418145775795,
				2.4351458549499,
				1.5250624418259,
				1.72756254673,
				2.0222916603088
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
			randomize_indexes = {},
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
			}
		},
		pes_gameplay_helped_by_bright_wizard_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6083958148956,
				1.1209583282471,
				0.97295835614204,
				2.2362291812897
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_helped_by_bright_wizard_05",
				"pes_gameplay_helped_by_bright_wizard_06",
				"pes_gameplay_helped_by_bright_wizard_07",
				"pes_gameplay_helped_by_bright_wizard_08"
			},
			sound_events = {
				"pes_gameplay_helped_by_bright_wizard_05",
				"pes_gameplay_helped_by_bright_wizard_06",
				"pes_gameplay_helped_by_bright_wizard_07",
				"pes_gameplay_helped_by_bright_wizard_08"
			}
		},
		pes_gameplay_killing_a_chaos_warrior_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.8720208406448,
				1.5387916564941,
				1.9371875524521,
				2.5409166812897,
				2.1196041107178,
				2.1526665687561,
				4.1780209541321,
				1.2760624885559
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_killing_a_chaos_warrior_01",
				"pes_gameplay_killing_a_chaos_warrior_02",
				"pes_gameplay_killing_a_chaos_warrior_03",
				"pes_gameplay_killing_a_chaos_warrior_04",
				"pes_gameplay_killing_a_chaos_warrior_05",
				"pes_gameplay_killing_a_chaos_warrior_06",
				"pes_gameplay_killing_a_chaos_warrior_07",
				"pes_gameplay_killing_a_chaos_warrior_08"
			}
		},
		pes_gameplay_seeing_a_shield_stormvermin_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.9320833683014,
				1.597895860672,
				1.7263333797455,
				2.1454374790192,
				2.3747498989105,
				2.7608542442322,
				3.3124792575836,
				3.8119790554047
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_shield_stormvermin_01",
				"pes_gameplay_seeing_a_shield_stormvermin_02",
				"pes_gameplay_seeing_a_shield_stormvermin_03",
				"pes_gameplay_seeing_a_shield_stormvermin_04",
				"pes_gameplay_seeing_a_shield_stormvermin_05",
				"pes_gameplay_seeing_a_shield_stormvermin_06",
				"pes_gameplay_seeing_a_shield_stormvermin_07",
				"pes_gameplay_seeing_a_shield_stormvermin_08"
			}
		},
		pes_gameplay_friendly_fire_witch_hunter_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.7199374437332,
				3.1616251468658,
				1.6965520977974,
				2.4497812986374,
				2.8824895620346
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_witch_hunter_05",
				"pes_gameplay_friendly_fire_witch_hunter_06",
				"pes_gameplay_friendly_fire_witch_hunter_07",
				"pes_gameplay_friendly_fire_witch_hunter_08",
				"pes_gameplay_friendly_fire_witch_hunter_13"
			},
			sound_events = {
				"pes_gameplay_friendly_fire_witch_hunter_05",
				"pes_gameplay_friendly_fire_witch_hunter_06",
				"pes_gameplay_friendly_fire_witch_hunter_07",
				"pes_gameplay_friendly_fire_witch_hunter_08",
				"pes_gameplay_friendly_fire_witch_hunter_13"
			}
		},
		pes_gameplay_ambush_horde_spawned_drunk = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events_duration = {
				0.77812498807907,
				1.0866249799728,
				0.6659791469574,
				1.795041680336,
				2.5153748989105,
				1.3851875066757,
				2.4151875972748
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
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_ambush_horde_spawned_02",
				"pes_gameplay_ambush_horde_spawned_03",
				"pes_gameplay_ambush_horde_spawned_05",
				"pes_gameplay_ambush_horde_spawned_07",
				"pes_gameplay_ambush_horde_spawned_08",
				"pes_gameplay_ambush_horde_spawned_09",
				"pes_gameplay_ambush_horde_spawned_10"
			},
			sound_events = {
				"pes_gameplay_ambush_horde_spawned_02",
				"pes_gameplay_ambush_horde_spawned_03",
				"pes_gameplay_ambush_horde_spawned_05",
				"pes_gameplay_ambush_horde_spawned_07",
				"pes_gameplay_ambush_horde_spawned_08",
				"pes_gameplay_ambush_horde_spawned_09",
				"pes_gameplay_ambush_horde_spawned_10"
			}
		},
		pes_gameplay_out_of_ammo_drunk = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events_duration = {
				1.4534167051315,
				1.5814791917801,
				1.2135416269302,
				1.1613124608993,
				1.1037708520889,
				0.73227083683014,
				2.3864374160767,
				1.8904374837875,
				1.6058541536331
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
			randomize_indexes = {},
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
			}
		},
		pes_gameplay_spots_ammo_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events_duration = {
				0.8832291662693,
				1.2390208244324,
				1.3858958482742,
				1.4178750514984,
				2.0729167461395,
				1.6746250391007,
				1.4186667203903,
				2.6123125553131
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_05",
				"pes_gameplay_spots_ammo_06",
				"pes_gameplay_spots_ammo_07",
				"pes_gameplay_spots_ammo_08",
				"pes_gameplay_spots_ammo_09",
				"pes_gameplay_spots_ammo_10"
			}
		},
		pes_gameplay_hearing_a_gutter_runner_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				2.1450624465942,
				2.2076458930969,
				1.6357707977295,
				2.3065209388733,
				1.5362499952316,
				1.7144999504089
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_gutter_runner_01",
				"pes_gameplay_hearing_a_gutter_runner_02",
				"pes_gameplay_hearing_a_gutter_runner_03",
				"pes_gameplay_hearing_a_gutter_runner_04",
				"pes_gameplay_hearing_a_gutter_runner_05",
				"pes_gameplay_hearing_a_gutter_runner_06"
			},
			sound_events = {
				"pes_gameplay_hearing_a_gutter_runner_01",
				"pes_gameplay_hearing_a_gutter_runner_02",
				"pes_gameplay_hearing_a_gutter_runner_03",
				"pes_gameplay_hearing_a_gutter_runner_04",
				"pes_gameplay_hearing_a_gutter_runner_05",
				"pes_gameplay_hearing_a_gutter_runner_06"
			}
		},
		pes_gameplay_self_heal_drunk = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 10,
			sound_events_duration = {
				1.4743958711624,
				1.947104215622,
				3.1814999580383,
				1.9716875553131,
				3.2748124599457,
				2.8253126144409,
				2.2543542385101,
				1.3730208873749,
				2.1986874341965,
				2.2281665802002
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
			randomize_indexes = {},
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
			}
		},
		pes_gameplay_hearing_marauder_berserker_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				0.90152084827423,
				1.717812538147,
				1.0566458702087,
				1.3105208873749,
				1.7610416412354,
				1.6983333826065,
				1.0968542098999,
				2.6166040897369
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_marauder_berserker_combat_01",
				"pes_gameplay_hearing_marauder_berserker_combat_02",
				"pes_gameplay_hearing_marauder_berserker_combat_03",
				"pes_gameplay_hearing_marauder_berserker_combat_04",
				"pes_gameplay_hearing_marauder_berserker_combat_05",
				"pes_gameplay_hearing_marauder_berserker_combat_06",
				"pes_gameplay_hearing_marauder_berserker_combat_07",
				"pes_gameplay_hearing_marauder_berserker_combat_08"
			}
		},
		pes_gameplay_hearing_a_stormfiend_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.3533749580383,
				1.5151666402817,
				1.3053333759308,
				1.7060208320618,
				1.8576041460037,
				2.1462292671204,
				3.3650624752045,
				1.2939791679382
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_stormfiend_combat_01",
				"pes_gameplay_hearing_a_stormfiend_combat_02",
				"pes_gameplay_hearing_a_stormfiend_combat_03",
				"pes_gameplay_hearing_a_stormfiend_combat_04",
				"pes_gameplay_hearing_a_stormfiend_combat_05",
				"pes_gameplay_hearing_a_stormfiend_combat_06",
				"pes_gameplay_hearing_a_stormfiend_combat_07",
				"pes_gameplay_hearing_a_stormfiend_combat_08"
			}
		},
		pes_gameplay_hearing_a_stormfiend_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.8164999485016,
				4.0240626335144,
				3.1698334217072,
				3.9937708377838,
				2.1451041698456,
				1.8535208106041
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_stormfiend_01",
				"pes_gameplay_hearing_a_stormfiend_02",
				"pes_gameplay_hearing_a_stormfiend_03",
				"pes_gameplay_hearing_a_stormfiend_04",
				"pes_gameplay_hearing_a_stormfiend_05",
				"pes_gameplay_hearing_a_stormfiend_06"
			},
			sound_events = {
				"pes_gameplay_hearing_a_stormfiend_01",
				"pes_gameplay_hearing_a_stormfiend_02",
				"pes_gameplay_hearing_a_stormfiend_03",
				"pes_gameplay_hearing_a_stormfiend_04",
				"pes_gameplay_hearing_a_stormfiend_05",
				"pes_gameplay_hearing_a_stormfiend_06"
			}
		},
		pes_gameplay_friendly_fire_wood_elf_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.4158124923706,
				2.3131041526794,
				1.8877708911896,
				5.7091250419617,
				2.1494166851044,
				4.8829998970032
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_wood_elf_03",
				"pes_gameplay_friendly_fire_wood_elf_05",
				"pes_gameplay_friendly_fire_wood_elf_06",
				"pes_gameplay_friendly_fire_wood_elf_07",
				"pes_gameplay_friendly_fire_wood_elf_08",
				"pes_gameplay_friendly_fire_wood_elf_09"
			},
			sound_events = {
				"pes_gameplay_friendly_fire_wood_elf_03",
				"pes_gameplay_friendly_fire_wood_elf_05",
				"pes_gameplay_friendly_fire_wood_elf_06",
				"pes_gameplay_friendly_fire_wood_elf_07",
				"pes_gameplay_friendly_fire_wood_elf_08",
				"pes_gameplay_friendly_fire_wood_elf_09"
			}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				0.92299997806549,
				1.010645866394,
				1.2624167203903,
				2.3858124017715,
				2.1128125190735,
				1.5776666402817
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.2632291316986,
				1.7474166154861,
				2.5326042175293,
				2.2905833721161,
				2.7921042442322,
				2.3123958110809
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_contempt",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_rat_ogre_01",
				"pes_gameplay_hearing_a_skaven_rat_ogre_04",
				"pes_gameplay_hearing_a_skaven_rat_ogre_05",
				"pes_gameplay_hearing_a_skaven_rat_ogre_02",
				"pes_gameplay_hearing_a_skaven_rat_ogre_03",
				"pes_gameplay_hearing_a_skaven_rat_ogre_06"
			},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_rat_ogre_01",
				"pes_gameplay_hearing_a_skaven_rat_ogre_04",
				"pes_gameplay_hearing_a_skaven_rat_ogre_05",
				"pes_gameplay_hearing_a_skaven_rat_ogre_02",
				"pes_gameplay_hearing_a_skaven_rat_ogre_03",
				"pes_gameplay_hearing_a_skaven_rat_ogre_06"
			}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_gutter_runner_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_burp = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_game_play_crawl",
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 0.5538541674614
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_burp"
			},
			sound_events = {
				[1.0] = "pes_burp"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.7492291927338,
				3.3764998912811,
				2.8633332252502,
				3.8016457557678,
				1.4635624885559,
				1.5411458015442,
				1.6314791440964,
				1.8511250019074
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_07",
				"pes_gameplay_hearing_a_chaos_wizard_wind_08"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.1859999895096,
				1.8530000448227,
				1.3426666259766,
				2.2252707481384,
				2.0570833683014,
				2.3985209465027,
				2.3434791564941,
				2.5833957195282
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			sound_events_duration = {
				2.6115000247955,
				2.1483957767487,
				2.7521667480469,
				2.0632083415985,
				1.2982292175293
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_low_on_health_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events_duration = {
				2.2957916259766,
				2.2180833816528,
				3.2766873836517,
				1.8077708482742,
				3.6779375076294,
				2.3515000343323,
				2.0228333473206,
				1.5894792079925
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_low_on_health_01",
				"pes_gameplay_low_on_health_09",
				"pes_gameplay_low_on_health_10",
				"pes_gameplay_low_on_health_11",
				"pes_gameplay_low_on_health_12",
				"pes_gameplay_low_on_health_13",
				"pes_gameplay_low_on_health_14",
				"pes_gameplay_low_on_health_15"
			}
		},
		pes_gameplay_friendly_fire_bright_wizard_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.9725416898727,
				2.5274999141693,
				1.6631875038147,
				1.7563333511352,
				3.0621042251587
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_bright_wizard_05",
				"pes_gameplay_friendly_fire_bright_wizard_06",
				"pes_gameplay_friendly_fire_bright_wizard_07",
				"pes_gameplay_friendly_fire_bright_wizard_08",
				"pes_gameplay_friendly_fire_bright_wizard_09"
			},
			sound_events = {
				"pes_gameplay_friendly_fire_bright_wizard_05",
				"pes_gameplay_friendly_fire_bright_wizard_06",
				"pes_gameplay_friendly_fire_bright_wizard_07",
				"pes_gameplay_friendly_fire_bright_wizard_08",
				"pes_gameplay_friendly_fire_bright_wizard_09"
			}
		},
		pes_gameplay_hearing_a_chaos_warrior_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.1238541603088,
				0.93924999237061,
				1.6641666889191,
				2.3556666374206,
				2.0205729603767,
				1.5402708053589,
				1.5673542022705,
				2.2484583854675
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_warrior_combat_01",
				"pes_gameplay_hearing_a_chaos_warrior_combat_02",
				"pes_gameplay_hearing_a_chaos_warrior_combat_03",
				"pes_gameplay_hearing_a_chaos_warrior_combat_04",
				"pes_gameplay_hearing_a_chaos_warrior_combat_05",
				"pes_gameplay_hearing_a_chaos_warrior_combat_06",
				"pes_gameplay_hearing_a_chaos_warrior_combat_07",
				"pes_gameplay_hearing_a_chaos_warrior_combat_08"
			}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_activate_ability_huntsman_non_drunk = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			sound_events_duration = {
				3.4831666946411,
				2.8919792175293,
				2.3422501087189,
				2.9697291851044,
				2.1768958568573,
				3.663583278656,
				2.0214791297913,
				3.0589165687561,
				2.4418542385101,
				2.4608125686645,
				2.9036042690277,
				3.18004155159
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_activate_ability_huntsman_01",
				"pes_activate_ability_huntsman_02",
				"pes_activate_ability_huntsman_03",
				"pes_activate_ability_huntsman_04",
				"pes_activate_ability_huntsman_05",
				"pes_activate_ability_huntsman_06",
				"pes_activate_ability_huntsman_07",
				"pes_activate_ability_huntsman_08",
				"pes_activate_ability_huntsman_09",
				"pes_activate_ability_huntsman_10",
				"pes_activate_ability_huntsman_11",
				"pes_activate_ability_huntsman_12"
			},
			sound_events = {
				"pes_activate_ability_huntsman_01",
				"pes_activate_ability_huntsman_02",
				"pes_activate_ability_huntsman_03",
				"pes_activate_ability_huntsman_04",
				"pes_activate_ability_huntsman_05",
				"pes_activate_ability_huntsman_06",
				"pes_activate_ability_huntsman_07",
				"pes_activate_ability_huntsman_08",
				"pes_activate_ability_huntsman_09",
				"pes_activate_ability_huntsman_10",
				"pes_activate_ability_huntsman_11",
				"pes_activate_ability_huntsman_12"
			}
		},
		pes_gameplay_hearing_a_chaos_spawn_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.3194583654404,
				0.90866667032242,
				1.4846667051315,
				1.168729186058,
				1.5741875171661,
				1.4272708892822,
				1.423187494278,
				2.8595833778381
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_spawn_combat_01",
				"pes_gameplay_hearing_a_chaos_spawn_combat_02",
				"pes_gameplay_hearing_a_chaos_spawn_combat_03",
				"pes_gameplay_hearing_a_chaos_spawn_combat_04",
				"pes_gameplay_hearing_a_chaos_spawn_combat_05",
				"pes_gameplay_hearing_a_chaos_spawn_combat_06",
				"pes_gameplay_hearing_a_chaos_spawn_combat_07",
				"pes_gameplay_hearing_a_chaos_spawn_combat_08"
			}
		},
		pes_gameplay_hearing_a_pm_in_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				0.86360418796539,
				0.91787499189377,
				1.2286458015442,
				1.0827292203903,
				2.2430416345596,
				1.3619166612625,
				1.6432917118073,
				2.2044167518616
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_gameplay_hearing_a_plague_monk_combat_01",
				"pes_gameplay_hearing_a_plague_monk_combat_02",
				"pes_gameplay_hearing_a_plague_monk_combat_03",
				"pes_gameplay_hearing_a_plague_monk_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_05",
				"pes_gameplay_hearing_a_plague_monk_combat_06",
				"pes_gameplay_hearing_a_plague_monk_combat_07",
				"pes_gameplay_hearing_a_plague_monk_combat_08"
			},
			sound_events = {
				"pes_gameplay_hearing_a_plague_monk_combat_01",
				"pes_gameplay_hearing_a_plague_monk_combat_02",
				"pes_gameplay_hearing_a_plague_monk_combat_03",
				"pes_gameplay_hearing_a_plague_monk_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_05",
				"pes_gameplay_hearing_a_plague_monk_combat_06",
				"pes_gameplay_hearing_a_plague_monk_combat_07",
				"pes_gameplay_hearing_a_plague_monk_combat_08"
			}
		},
		pes_gameplay_seeing_a_chaos_wizard_plague_no_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				3.6139166355133,
				3.447083234787,
				1.9325416088104,
				1.6720833778381
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_chaos_wizard_plague_01",
				"pes_gameplay_seeing_a_chaos_wizard_plague_02",
				"pes_gameplay_seeing_a_chaos_wizard_plague_03",
				"pes_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_plague_01",
				"pes_gameplay_seeing_a_chaos_wizard_plague_02",
				"pes_gameplay_seeing_a_chaos_wizard_plague_03",
				"pes_gameplay_seeing_a_chaos_wizard_plague_04"
			}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_hearing_a_chaos_spawn_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_wood_elf_low_on_health_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				3.0590417385101,
				1.786291718483,
				1.6073958873749,
				3.2092082500458
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_low_on_health_05",
				"pes_gameplay_wood_elf_low_on_health_06",
				"pes_gameplay_wood_elf_low_on_health_07",
				"pes_gameplay_wood_elf_low_on_health_08"
			},
			sound_events = {
				"pes_gameplay_wood_elf_low_on_health_05",
				"pes_gameplay_wood_elf_low_on_health_06",
				"pes_gameplay_wood_elf_low_on_health_07",
				"pes_gameplay_wood_elf_low_on_health_08"
			}
		},
		pes_gameplay_knocked_down_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				3.8985624313355,
				3.250760436058,
				3.4814813137054,
				3.6090624332428
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_knocked_down_01",
				"pes_crawl_drunk_knocked_down_02",
				"pes_crawl_drunk_knocked_down_03",
				"pes_crawl_drunk_knocked_down_04"
			},
			sound_events = {
				"pes_crawl_drunk_knocked_down_01",
				"pes_crawl_drunk_knocked_down_02",
				"pes_crawl_drunk_knocked_down_03",
				"pes_crawl_drunk_knocked_down_04"
			}
		},
		pes_gameplay_helped_by_dwarf_ranger_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				0.99989581108093,
				1.1915208101273,
				2.7005624771118,
				1.3275624513626
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_helped_by_dwarf_ranger_05",
				"pes_gameplay_helped_by_dwarf_ranger_06",
				"pes_gameplay_helped_by_dwarf_ranger_07",
				"pes_gameplay_helped_by_dwarf_ranger_08"
			},
			sound_events = {
				"pes_gameplay_helped_by_dwarf_ranger_05",
				"pes_gameplay_helped_by_dwarf_ranger_06",
				"pes_gameplay_helped_by_dwarf_ranger_07",
				"pes_gameplay_helped_by_dwarf_ranger_08"
			}
		},
		pes_crawl_drunk_buff_wears_off = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events_duration = {
				3.2560207843781,
				3.0604791641235,
				1.392874956131,
				1.8339791297913,
				3.0889375209808,
				4.0957083702087,
				3.3976354598999,
				3.5801458358765
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
			randomize_indexes = {},
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
			localization_strings = {
				"pes_crawl_drunk_buff_wears_off_01",
				"pes_crawl_drunk_buff_wears_off_02",
				"pes_crawl_drunk_buff_wears_off_03",
				"pes_crawl_drunk_buff_wears_off_04",
				"pes_crawl_drunk_buff_wears_off_05",
				"pes_crawl_drunk_buff_wears_off_06",
				"pes_crawl_drunk_buff_wears_off_07",
				"pes_crawl_drunk_buff_wears_off_08"
			},
			sound_events = {
				"pes_crawl_drunk_buff_wears_off_01",
				"pes_crawl_drunk_buff_wears_off_02",
				"pes_crawl_drunk_buff_wears_off_03",
				"pes_crawl_drunk_buff_wears_off_04",
				"pes_crawl_drunk_buff_wears_off_05",
				"pes_crawl_drunk_buff_wears_off_06",
				"pes_crawl_drunk_buff_wears_off_07",
				"pes_crawl_drunk_buff_wears_off_08"
			}
		},
		pes_gameplay_hearing_a_stormfiend_combat_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.6029374599457,
				4.1897292137146,
				2.4868333339691,
				4.4993124008179
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pes_crawl_drunk_incoming_threat_01",
				"pes_crawl_drunk_incoming_threat_02",
				"pes_crawl_drunk_incoming_threat_03",
				"pes_crawl_drunk_incoming_threat_04"
			}
		},
		pes_gameplay_healing_dwarf_ranger_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.6958333253861,
				1.7903333902359,
				2.2813541889191,
				2.7509999275208,
				3.4129374027252
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_healing_dwarf_ranger_03",
				"pes_gameplay_healing_dwarf_ranger_04",
				"pes_gameplay_healing_dwarf_ranger_05",
				"pes_gameplay_healing_dwarf_ranger_06",
				"pes_gameplay_healing_dwarf_ranger_08"
			},
			sound_events = {
				"pes_gameplay_healing_dwarf_ranger_03",
				"pes_gameplay_healing_dwarf_ranger_04",
				"pes_gameplay_healing_dwarf_ranger_05",
				"pes_gameplay_healing_dwarf_ranger_06",
				"pes_gameplay_healing_dwarf_ranger_08"
			}
		},
		pes_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				3.4119791984558,
				3.8653957843781,
				4.2404999732971,
				3.362687587738,
				3.1817708015442,
				2.8816874027252,
				3.77308344841,
				4.5625
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			}
		},
		pes_gameplay_killing_a_chaos_wizard_tentacle_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events_duration = {
				2.2999999523163,
				1.6017916202545,
				2.5575625896454,
				3.1151041984558,
				3.4077498912811,
				1.9730833768845
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_06"
			}
		},
		pes_gameplay_healing_bright_wizard_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events_duration = {
				1.4577499628067,
				2.1049375534058,
				2.218291759491,
				2.6545832157135,
				4.4468955993652
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_healing_bright_wizard_04",
				"pes_gameplay_healing_bright_wizard_05",
				"pes_gameplay_healing_bright_wizard_06",
				"pes_gameplay_healing_bright_wizard_07",
				"pes_gameplay_healing_bright_wizard_08"
			},
			sound_events = {
				"pes_gameplay_healing_bright_wizard_04",
				"pes_gameplay_healing_bright_wizard_05",
				"pes_gameplay_healing_bright_wizard_06",
				"pes_gameplay_healing_bright_wizard_07",
				"pes_gameplay_healing_bright_wizard_08"
			}
		},
		pes_gameplay_wood_elf_being_helped_up_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events_duration = {
				1.0759999752045,
				0.84172916412354,
				1.7598541975021,
				2.6215207576752,
				2.9243957996368,
				2.8300623893738,
				1.1249375343323,
				1.6879374980927
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_wood_elf_being_helped_up_01",
				"pes_gameplay_wood_elf_being_helped_up_02",
				"pes_gameplay_wood_elf_being_helped_up_05",
				"pes_gameplay_wood_elf_being_helped_up_06",
				"pes_gameplay_wood_elf_being_helped_up_07",
				"pes_gameplay_wood_elf_being_helped_up_08",
				"pes_gameplay_wood_elf_being_helped_up_09",
				"pes_gameplay_wood_elf_being_helped_up_10"
			}
		},
		pes_activate_ability_grail_knight_non_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 8,
			sound_events_duration = {
				0.96162497997284,
				1.1160833835602,
				1.2789583206177,
				1.3204791545868,
				1.78806245327,
				1.8778749704361,
				1.2822707891464,
				0.94466668367386
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			randomize_indexes = {},
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
			localization_strings = {
				"pes_activate_ability_grail_knight_01",
				"pes_activate_ability_grail_knight_02",
				"pes_activate_ability_grail_knight_03",
				"pes_activate_ability_grail_knight_04",
				"pes_activate_ability_grail_knight_05",
				"pes_activate_ability_grail_knight_06",
				"pes_activate_ability_grail_knight_07",
				"pes_activate_ability_grail_knight_08"
			},
			sound_events = {
				"pes_activate_ability_grail_knight_01",
				"pes_activate_ability_grail_knight_02",
				"pes_activate_ability_grail_knight_03",
				"pes_activate_ability_grail_knight_04",
				"pes_activate_ability_grail_knight_05",
				"pes_activate_ability_grail_knight_06",
				"pes_activate_ability_grail_knight_07",
				"pes_activate_ability_grail_knight_08"
			}
		},
		pes_gameplay_killing_a_chaos_wizard_wind_no_drunk = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events_duration = {
				1.6732708215714,
				2.4189584255219,
				1.4757708311081,
				3.0437083244324,
				2.903520822525,
				2.4785416126251
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_wind_01",
				"pes_gameplay_killing_a_chaos_wizard_wind_02",
				"pes_gameplay_killing_a_chaos_wizard_wind_03",
				"pes_gameplay_killing_a_chaos_wizard_wind_04",
				"pes_gameplay_killing_a_chaos_wizard_wind_05",
				"pes_gameplay_killing_a_chaos_wizard_wind_06"
			},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_wind_01",
				"pes_gameplay_killing_a_chaos_wizard_wind_02",
				"pes_gameplay_killing_a_chaos_wizard_wind_03",
				"pes_gameplay_killing_a_chaos_wizard_wind_04",
				"pes_gameplay_killing_a_chaos_wizard_wind_05",
				"pes_gameplay_killing_a_chaos_wizard_wind_06"
			}
		},
		pes_gameplay_throwing_bomb_drunk = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events_duration = {
				0.97354167699814,
				0.86779165267944,
				1.5438541173935,
				1.3927083015442,
				1.0770000219345
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_throwing_bomb_01",
				"pes_gameplay_throwing_bomb_03",
				"pes_gameplay_throwing_bomb_06",
				"pes_gameplay_throwing_bomb_07",
				"pes_gameplay_throwing_bomb_08"
			},
			sound_events = {
				"pes_gameplay_throwing_bomb_01",
				"pes_gameplay_throwing_bomb_03",
				"pes_gameplay_throwing_bomb_06",
				"pes_gameplay_throwing_bomb_07",
				"pes_gameplay_throwing_bomb_08"
			}
		},
		pes_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.8580833673477,
				2.8627500534058,
				3.1139376163483,
				2.7561249732971
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_04"
			}
		},
		pes_crawl_drunk_buff_begins_from_sick = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events_duration = {
				2.1672065258026,
				2.318097114563,
				3.5150983333588,
				4.8492498397827,
				7.0049166679382,
				3.2052083015442
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_buff_begins_from_sick_01",
				"pes_crawl_drunk_buff_begins_from_sick_02",
				"pes_crawl_drunk_buff_begins_from_sick_03",
				"pes_crawl_drunk_buff_begins_from_sick_04",
				"pes_crawl_drunk_buff_begins_from_sick_05",
				"pes_crawl_drunk_buff_begins_from_sick_06"
			},
			sound_events = {
				"pes_crawl_drunk_buff_begins_from_sick_01",
				"pes_crawl_drunk_buff_begins_from_sick_02",
				"pes_crawl_drunk_buff_begins_from_sick_03",
				"pes_crawl_drunk_buff_begins_from_sick_04",
				"pes_crawl_drunk_buff_begins_from_sick_05",
				"pes_crawl_drunk_buff_begins_from_sick_06"
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_plague_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events_duration = {
				4.1688749790192,
				4.4007081985474,
				6.6871252059936,
				1.8782708644867,
				1.2085624933243,
				1.5510833263397,
				1.8734375238419,
				3.707270860672
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_plague_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_08"
			}
		},
		pes_gameplay_helped_by_witch_hunter_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				0.73257291316986,
				1.0046562552452,
				0.72977083921432,
				1.5409582853317
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_gameplay_helped_by_witch_hunter_01",
				"pes_gameplay_helped_by_witch_hunter_02",
				"pes_gameplay_helped_by_witch_hunter_03",
				"pes_gameplay_helped_by_witch_hunter_04"
			},
			sound_events = {
				"pes_gameplay_helped_by_witch_hunter_01",
				"pes_gameplay_helped_by_witch_hunter_02",
				"pes_gameplay_helped_by_witch_hunter_03",
				"pes_gameplay_helped_by_witch_hunter_04"
			}
		},
		pes_gameplay_bright_wizard_low_on_health_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				3.1317915916443,
				1.7292499542236,
				2.1368124485016,
				2.0660624504089
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_bright_wizard_low_on_health_05",
				"pes_gameplay_bright_wizard_low_on_health_06",
				"pes_gameplay_bright_wizard_low_on_health_07",
				"pes_gameplay_bright_wizard_low_on_health_08"
			},
			sound_events = {
				"pes_gameplay_bright_wizard_low_on_health_05",
				"pes_gameplay_bright_wizard_low_on_health_06",
				"pes_gameplay_bright_wizard_low_on_health_07",
				"pes_gameplay_bright_wizard_low_on_health_08"
			}
		},
		pes_gameplay_seeing_a_chaos_spawn_no_drunk = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events_duration = {
				4.6962289810181,
				2.3624167442322,
				3.4473541975021,
				3.0198540687561,
				3.6132500171661,
				3.6184582710266,
				2.7463126182556,
				2.4739375114441
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
			randomize_indexes = {},
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
			sound_events = {
				"pes_gameplay_seeing_a_chaos_spawn_01",
				"pes_gameplay_seeing_a_chaos_spawn_02",
				"pes_gameplay_seeing_a_chaos_spawn_03",
				"pes_gameplay_seeing_a_chaos_spawn_04",
				"pes_gameplay_seeing_a_chaos_spawn_05",
				"pes_gameplay_seeing_a_chaos_spawn_06",
				"pes_gameplay_seeing_a_chaos_spawn_07",
				"pes_gameplay_seeing_a_chaos_spawn_08"
			}
		},
		pes_gameplay_friendly_fire_dwarf_ranger_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events_duration = {
				1.2092916965485,
				2.9716458320618,
				2.2016041278839,
				1.0587916374207
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_dwarf_ranger_01",
				"pes_gameplay_friendly_fire_dwarf_ranger_02",
				"pes_gameplay_friendly_fire_dwarf_ranger_03",
				"pes_gameplay_friendly_fire_dwarf_ranger_04"
			},
			sound_events = {
				"pes_gameplay_friendly_fire_dwarf_ranger_01",
				"pes_gameplay_friendly_fire_dwarf_ranger_02",
				"pes_gameplay_friendly_fire_dwarf_ranger_03",
				"pes_gameplay_friendly_fire_dwarf_ranger_04"
			}
		},
		pes_gameplay_player_pounced_drunk = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_game_play_crawl",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events_duration = {
				3.8985624313355,
				3.250760436058,
				3.4814813137054,
				3.6090624332428
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			localization_strings = {
				"pes_crawl_drunk_knocked_down_01",
				"pes_crawl_drunk_knocked_down_02",
				"pes_crawl_drunk_knocked_down_03",
				"pes_crawl_drunk_knocked_down_04"
			},
			sound_events = {
				"pes_crawl_drunk_knocked_down_01",
				"pes_crawl_drunk_knocked_down_02",
				"pes_crawl_drunk_knocked_down_03",
				"pes_crawl_drunk_knocked_down_04"
			}
		}
	})
end
