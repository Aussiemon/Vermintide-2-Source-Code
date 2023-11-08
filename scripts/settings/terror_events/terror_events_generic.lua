local function count_bosses_alive()
	return #Managers.state.conflict:alive_bosses()
end

GenericTerrorEvents = {
	encampment = {
		{
			"spawn_encampment",
			unit_compositions_id = 1,
			encampment_id = 1,
			optional_pos = {
				0,
				0,
				0
			}
		}
	},
	encampment2 = {
		{
			"spawn_encampment",
			unit_compositions_id = 1,
			encampment_id = 6,
			optional_pos = {
				0,
				0,
				0
			}
		}
	},
	encampment3 = {
		{
			"spawn_encampment",
			unit_compositions_id = 1,
			encampment_id = 7,
			optional_pos = {
				0,
				0,
				0
			}
		}
	},
	encampment4 = {
		{
			"spawn_encampment",
			unit_compositions_id = 1,
			encampment_id = 8,
			optional_pos = {
				0,
				0,
				0
			}
		}
	},
	boss_event_rat_ogre = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"close_boss_doors",
			breed_name = "skaven_rat_ogre"
		}
	},
	boss_event_storm_fiend = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "skaven_stormfiend"
		},
		{
			"close_boss_doors",
			breed_name = "skaven_stormfiend"
		}
	},
	boss_event_chaos_troll = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "chaos_troll"
		},
		{
			"close_boss_doors",
			breed_name = "chaos_troll"
		}
	},
	boss_event_chaos_spawn = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "chaos_spawn"
		},
		{
			"close_boss_doors",
			breed_name = "chaos_spawn"
		}
	},
	boss_event_minotaur = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "beastmen_minotaur"
		},
		{
			"close_boss_doors",
			breed_name = "beastmen_minotaur"
		}
	},
	boss_event_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"storm_vermin_shields_infront",
				"storm_vermin_two_column",
				"chaos_warrior_default"
			}
		}
	},
	boss_event_skaven_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"storm_vermin_shields_infront",
				"storm_vermin_two_column"
			}
		}
	},
	boss_event_chaos_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"chaos_warrior_default"
			}
		}
	},
	boss_event_beastmen_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"beastmen_standard",
				"beastmen_archers"
			}
		}
	},
	boss_event_skaven_beastmen_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"beastmen_standard",
				"storm_vermin_shields_infront"
			}
		}
	},
	boss_event_chaos_beastmen_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"beastmen_standard",
				"chaos_warrior_default"
			}
		}
	},
	rare_event_loot_rat = {
		{
			"spawn",
			breed_name = "skaven_loot_rat"
		}
	},
	roaming_patrol = {
		{
			"roaming_patrol"
		}
	},
	generic_enable_pacing = {
		{
			"control_pacing",
			enable = true
		}
	},
	generic_disable_pacing = {
		{
			"control_pacing",
			enable = false
		}
	},
	generic_disable_specials = {
		{
			"control_specials",
			enable = false
		}
	},
	generic_enable_specials = {
		{
			"control_specials",
			enable = true
		}
	},
	boss_event_dual_spawn = {
		{
			"spawn",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			},
			optional_data = {
				max_health_modifier = 0.5
			}
		},
		{
			"spawn",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			},
			optional_data = {
				max_health_modifier = 0.5
			}
		}
	}
}

DLCUtils.require_list("generic_terror_event_files")
