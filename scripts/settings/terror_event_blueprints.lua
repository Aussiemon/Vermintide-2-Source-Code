local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function current_intensity()
	return Managers.state.conflict.pacing:get_intensity()
end

local function current_difficulty()
	return Managers.state.difficulty.difficulty
end

WeightedRandomTerrorEvents = {
	roger_and_friends = {
		"roger_mayhem",
		10,
		"lonely_roger",
		1
	},
	chunk_cemetery_alt_objective_1 = {
		"cemetery_alt_objective_1_v1",
		1,
		"cemetery_alt_objective_1_v2",
		1
	},
	forest_end = {
		"forest_end_event_a",
		5,
		"forest_end_event_b",
		5,
		"forest_end_event_c",
		3
	},
	forest_skaven_camp = {
		"forest_skaven_camp_a",
		1,
		"forest_skaven_camp_b",
		1,
		"forest_skaven_camp_c",
		1
	},
	farm_larger_events = {
		"farm_event_larger",
		1,
		"farm_event_larger_vermin",
		0.5
	},
	farm_larger_2ndevents = {
		"farm_event_larger_second",
		1,
		"farm_event_larger_second_vermin",
		0.5
	},
	farm_larger_3rdevents = {
		"farm_event_larger_third",
		1,
		"farm_event_larger_third_vermin",
		0.5
	},
	magnus_door = {
		"magnus_door_a",
		1,
		"magnus_door_b",
		1
	},
	tunnels_elevator_event_random = {
		"tunnels_elevator_event_a",
		1,
		"tunnels_elevator_event_b",
		1,
		"tunnels_elevator_event_c",
		1
	},
	tunnels_elevator_event_random_start = {
		"tunnels_elevator_event_a",
		1,
		"tunnels_elevator_event_b",
		1
	},
	tunnels_end_room_random = {
		"random_skaven_end_event_smaller",
		1,
		"random_skaven_end_event_small",
		1,
		"random_skaven_end_event_medium",
		1
	},
	courtyard_events = {
		"courtyard_rolling_event",
		1
	},
	courtyard_special_fun = {
		"generic_specials_fun_a",
		1,
		"generic_specials_fun_b",
		1
	},
	cemetery_plague_brew_event_1 = {
		"cemetery_plague_brew_event_1_a",
		1,
		"cemetery_plague_brew_event_1_b",
		1
	},
	cemetery_plague_brew_event_2 = {
		"cemetery_plague_brew_event_2_a",
		1,
		"cemetery_plague_brew_event_2_b",
		1
	},
	cemetery_plague_brew_event_3 = {
		"cemetery_plague_brew_event_3_a",
		1,
		"cemetery_plague_brew_event_3_b",
		1
	},
	cemetery_plague_brew_event_4 = {
		"cemetery_plague_brew_event_4_a",
		1,
		"cemetery_plague_brew_event_4_b",
		1
	},
	end_boss_terror_c = {
		"end_boss_terror_c1",
		1,
		"end_boss_terror_c2",
		1
	},
	city_wall_a = {
		"city_wall_a",
		1
	},
	city_wall_b = {
		"city_wall_b",
		1
	},
	city_wall_c = {
		"city_wall_c",
		1
	},
	city_wall_d = {
		"city_wall_d",
		1
	},
	city_wall_end = {
		"city_wall_end",
		1
	},
	generic_special_fun = {
		"generic_specials_fun_a",
		1,
		"generic_specials_fun_b",
		1
	},
	merchant_market_event = {
		"merchant_market_event_a",
		1,
		"merchant_market_event_b",
		1,
		"merchant_market_event_c",
		1
	},
	merchant_market_event_no_b = {
		"merchant_market_event_a",
		1,
		"merchant_market_event_c",
		1
	},
	walls_gate_guards = {
		"walls_gate_guards_a",
		1,
		"walls_gate_guards_b",
		1
	},
	dlc_portals_a = {
		"dlc_portals_a",
		1
	},
	dlc_portals_b = {
		"dlc_portals_b",
		1
	},
	dlc_portals_c = {
		"dlc_portals_c",
		1
	},
	end_event_statuette_guards = {
		"end_event_statuette_guards_01",
		1,
		"end_event_statuette_guards_02",
		1,
		"end_event_statuette_guards_03",
		1,
		"end_event_statuette_guards_04",
		1
	},
	dungeon_random_stormvermin_addition = {
		"dungeon_random_stormvermin_addition_a",
		1,
		"dungeon_random_stormvermin_addition_b",
		1,
		"dungeon_random_stormvermin_addition_c",
		1
	},
	dwarf_interior_brewery_random = {
		"dwarf_interior_brewery_a",
		1,
		"dwarf_interior_brewery_b",
		1,
		"dwarf_interior_brewery_c",
		1
	},
	gz_elevator_guards = {
		"gz_elevator_guards_a",
		1
	},
	military_end_event_survival_02 = {
		"military_end_event_survival_02_right",
		1,
		"military_end_event_survival_02_left",
		1,
		"military_end_event_survival_02_middle",
		1
	},
	military_end_event_survival_03 = {
		"military_end_event_survival_03_right",
		1,
		"military_end_event_survival_03_left",
		1,
		"military_end_event_survival_03_middle",
		1,
		"military_end_event_survival_03_back",
		1
	},
	military_end_event_survival_04 = {
		"military_end_event_survival_04_right",
		1,
		"military_end_event_survival_04_left",
		1,
		"military_end_event_survival_04_middle",
		1,
		"military_end_event_survival_04_back",
		1
	},
	military_end_event_survival_05 = {
		"military_end_event_survival_05_right",
		1,
		"military_end_event_survival_05_left",
		1,
		"military_end_event_survival_05_middle",
		1,
		"military_end_event_survival_05_back",
		1
	},
	military_end_event_survival_06 = {
		"military_end_event_survival_06_right",
		1,
		"military_end_event_survival_06_left",
		1,
		"military_end_event_survival_06_middle",
		1,
		"military_end_event_survival_06_back",
		1
	},
	military_end_event_survival_07 = {
		"military_end_event_survival_07_right",
		1,
		"military_end_event_survival_07_left",
		1,
		"military_end_event_survival_07_middle",
		1,
		"military_end_event_survival_07_back",
		1
	},
	military_end_event_specials = {
		"military_end_event_specials_01",
		1,
		"military_end_event_specials_02",
		1,
		"military_end_event_specials_03",
		1,
		"military_end_event_specials_04",
		1,
		"military_end_event_specials_05",
		1,
		"military_end_event_specials_06",
		1
	},
	military_courtyard_event_specials = {
		"military_courtyard_event_specials_01",
		1,
		"military_courtyard_event_specials_02",
		1,
		"military_courtyard_event_specials_03",
		1,
		"military_courtyard_event_specials_04",
		1,
		"military_courtyard_event_specials_05",
		1
	},
	catacombs_end_event_specials = {
		"catacombs_end_event_specials_01",
		1,
		"catacombs_end_event_specials_02",
		1,
		"catacombs_end_event_specials_03",
		1
	},
	nurgle_end_event_specials = {
		"nurgle_end_event_specials_01",
		1,
		"nurgle_end_event_specials_02",
		1,
		"nurgle_end_event_specials_03",
		1
	},
	mines_end_event_specials = {
		"mines_end_event_specials_01",
		1,
		"mines_end_event_specials_02",
		1,
		"mines_end_event_specials_03",
		1
	},
	survival_wave_initial = {
		"survival_wave_abd",
		1
	},
	survival_wave_a = {
		"survival_wave_bac",
		1
	},
	survival_wave_b = {
		"survival_wave_cad",
		1
	},
	survival_wave_c = {
		"survival_wave_dba",
		1
	},
	survival_wave_d = {
		"survival_wave_cdb",
		1
	},
	survival_wave_e = {
		"survival_wave_acd",
		1
	},
	survival_wave_f = {
		"survival_wave_dab",
		1
	},
	survival_wave_easy_a = {
		"survival_wave_easy_a_1",
		1,
		"survival_wave_easy_a_2",
		1
	},
	survival_wave_easy_b = {
		"survival_wave_easy_b_1",
		1,
		"survival_wave_easy_b_2",
		1
	},
	survival_wave_flush_a = {
		"survival_flush_in",
		1
	},
	survival_wave_flush_b = {
		"survival_flush_out",
		1
	},
	survival_wave_extra_spice_round_2 = {
		"survival_esr2_a",
		1
	},
	survival_wave_extra_spice_round_3 = {
		"survival_esr3_a",
		1
	},
	survival_wave_specials_a = {
		"survival_specials_a",
		1
	},
	survival_wave_specials_b = {
		"survival_specials_b",
		1
	},
	survival_wave_specials_c = {
		"survival_specials_c",
		1
	},
	survival_wave_specials_d = {
		"survival_specials_d",
		1
	},
	survival_wave_boss_a = {
		"survival_boss_a",
		1
	},
	survival_wave_boss_13 = {
		"survival_13_a",
		1
	},
	survival_nightmare_wave_easy_a = {
		"survival_nightmare_wave_easy_a_1",
		1,
		"survival_nightmare_wave_easy_a_2",
		1
	},
	survival_nightmare_wave_easy_b = {
		"survival_nightmare_wave_easy_b_1",
		1,
		"survival_nightmare_wave_easy_b_2",
		1
	},
	survival_nightmare_wave_specials_a = {
		"survival_nightmare_specials_a",
		1
	},
	survival_nightmare_wave_specials_b = {
		"survival_nightmare_specials_b",
		1
	},
	survival_nightmare_wave_specials_c = {
		"survival_nightmare_specials_c",
		1
	},
	survival_nightmare_wave_boss_a = {
		"survival_nightmare_boss_a",
		1
	},
	survival_nightmare_wave_boss_13 = {
		"survival_nightmare_13_a",
		1
	},
	survival_cataclysm_wave_a = {
		"survival_cataclysm_wave_bac",
		1
	},
	survival_cataclysm_wave_b = {
		"survival_cataclysm_wave_cad",
		1
	},
	survival_cataclysm_wave_c = {
		"survival_cataclysm_wave_dba",
		1
	},
	survival_cataclysm_wave_d = {
		"survival_cataclysm_wave_cdb",
		1
	},
	survival_cataclysm_wave_e = {
		"survival_cataclysm_wave_acd",
		1
	},
	survival_cataclysm_wave_f = {
		"survival_cataclysm_wave_dab",
		1
	},
	survival_cataclysm_wave_flush_a = {
		"survival_flush_in",
		1
	},
	survival_cataclysm_wave_flush_b = {
		"survival_flush_out",
		1
	},
	survival_cataclysm_wave_extra_spice_round_2 = {
		"survival_esr2_a",
		1
	},
	survival_cataclysm_wave_extra_spice_round_3 = {
		"survival_esr3_a",
		1
	},
	survival_cataclysm_wave_specials_a = {
		"survival_cataclysm_specials_a",
		1
	},
	survival_cataclysm_wave_specials_b = {
		"survival_cataclysm_specials_b",
		1
	},
	survival_cataclysm_wave_specials_c = {
		"survival_cataclysm_specials_c",
		1
	},
	survival_cataclysm_wave_specials_d = {
		"survival_cataclysm_specials_d",
		1
	},
	survival_cataclysm_wave_specials_e = {
		"survival_cataclysm_specials_e",
		1
	},
	survival_cataclysm_wave_specials_f = {
		"survival_cataclysm_specials_f",
		1
	},
	survival_cataclysm_wave_specials_g = {
		"survival_cataclysm_specials_g",
		1
	},
	survival_cataclysm_wave_specials_h = {
		"survival_cataclysm_specials_h",
		1
	},
	survival_cataclysm_wave_specials_i = {
		"survival_cataclysm_specials_i",
		1
	},
	survival_cataclysm_wave_boss_a = {
		"survival_cataclysm_boss_a",
		1,
		"survival_cataclysm_boss_b",
		1
	},
	survival_cataclysm_wave_boss_b = {
		"survival_cataclysm_boss_c",
		1,
		"survival_cataclysm_boss_d",
		1
	},
	survival_cataclysm_wave_boss_13_a = {
		"survival_cataclysm_13_a",
		1,
		"survival_cataclysm_13_b",
		1
	},
	survival_cataclysm_wave_boss_13_b = {
		"survival_cataclysm_13_c",
		1,
		"survival_cataclysm_13_d",
		1
	},
	survival_cataclysm_wave_boss_13_c = {
		"survival_cataclysm_13_e",
		1,
		"survival_cataclysm_13_f",
		1
	},
	survival_magnus_wave_initial = {
		"survival_magnus_wave_intro",
		1
	},
	survival_magnus_wave_a = {
		"survival_magnus_wave_bac",
		1
	},
	survival_magnus_wave_b = {
		"survival_magnus_wave_cad",
		1
	},
	survival_magnus_wave_c = {
		"survival_magnus_wave_dba",
		1
	},
	survival_magnus_wave_d = {
		"survival_magnus_wave_cdb",
		1
	},
	survival_magnus_wave_e = {
		"survival_magnus_wave_acd",
		1
	},
	survival_magnus_wave_f = {
		"survival_magnus_wave_dab",
		1
	},
	survival_magnus_wave_easy_a = {
		"survival_magnus_wave_easy_a_1",
		1,
		"survival_magnus_wave_easy_a_2",
		1
	},
	survival_magnus_wave_easy_b = {
		"survival_magnus_wave_easy_b_1",
		1,
		"survival_magnus_wave_easy_b_2",
		1
	},
	survival_magnus_wave_flush_a = {
		"survival_magnus_flush_in",
		1
	},
	survival_magnus_wave_flush_b = {
		"survival_magnus_flush_out",
		1
	},
	survival_magnus_wave_extra_spice_round_2 = {
		"survival_magnus_esr2_a",
		1
	},
	survival_magnus_wave_extra_spice_round_3 = {
		"survival_magnus_esr3_a",
		1
	},
	survival_magnus_wave_specials_a = {
		"survival_magnus_specials_a",
		1
	},
	survival_magnus_wave_specials_b = {
		"survival_magnus_specials_b",
		1
	},
	survival_magnus_wave_specials_c = {
		"survival_magnus_specials_c",
		1
	},
	survival_magnus_wave_specials_d = {
		"survival_magnus_specials_d",
		1
	},
	survival_magnus_wave_boss_a = {
		"survival_magnus_boss_a",
		1
	},
	survival_magnus_wave_boss_13 = {
		"survival_magnus_13_a",
		1
	},
	survival_magnus_nightmare_wave_easy_a = {
		"survival_magnus_nightmare_wave_easy_a_1",
		1,
		"survival_magnus_nightmare_wave_easy_a_2",
		1
	},
	survival_magnus_nightmare_wave_easy_b = {
		"survival_magnus_nightmare_wave_easy_b_1",
		1,
		"survival_magnus_nightmare_wave_easy_b_1",
		1
	},
	survival_magnus_nightmare_wave_specials_a = {
		"survival_magnus_nightmare_specials_a",
		1
	},
	survival_magnus_nightmare_wave_specials_b = {
		"survival_magnus_nightmare_specials_b",
		1
	},
	survival_magnus_nightmare_wave_specials_c = {
		"survival_magnus_nightmare_specials_c",
		1
	},
	survival_magnus_nightmare_wave_boss_a = {
		"survival_magnus_nightmare_boss_a",
		1
	},
	survival_magnus_nightmare_wave_boss_13 = {
		"survival_magnus_nightmare_13_a",
		1
	},
	survival_magnus_cataclysm_wave_a = {
		"survival_magnus_cataclysm_wave_bac",
		1
	},
	survival_magnus_cataclysm_wave_b = {
		"survival_magnus_cataclysm_wave_cad",
		1
	},
	survival_magnus_cataclysm_wave_c = {
		"survival_magnus_cataclysm_wave_dba",
		1
	},
	survival_magnus_cataclysm_wave_d = {
		"survival_magnus_cataclysm_wave_cdb",
		1
	},
	survival_magnus_cataclysm_wave_e = {
		"survival_magnus_cataclysm_wave_acd",
		1
	},
	survival_magnus_cataclysm_wave_f = {
		"survival_magnus_cataclysm_wave_dab",
		1
	},
	survival_magnus_cataclysm_wave_specials_a = {
		"survival_magnus_cataclysm_specials_a",
		1
	},
	survival_magnus_cataclysm_wave_specials_b = {
		"survival_magnus_cataclysm_specials_b",
		1
	},
	survival_magnus_cataclysm_wave_specials_c = {
		"survival_magnus_cataclysm_specials_c",
		1
	},
	survival_magnus_cataclysm_wave_specials_d = {
		"survival_magnus_cataclysm_specials_d",
		1
	},
	survival_magnus_cataclysm_wave_specials_e = {
		"survival_magnus_cataclysm_specials_e",
		1
	},
	survival_magnus_cataclysm_wave_specials_f = {
		"survival_magnus_cataclysm_specials_f",
		1
	},
	survival_magnus_cataclysm_wave_specials_g = {
		"survival_magnus_cataclysm_specials_g",
		1
	},
	survival_magnus_cataclysm_wave_specials_h = {
		"survival_magnus_cataclysm_specials_h",
		1
	},
	survival_magnus_cataclysm_wave_specials_i = {
		"survival_magnus_cataclysm_specials_i",
		1
	},
	survival_magnus_cataclysm_wave_boss_a = {
		"survival_magnus_cataclysm_boss_a",
		1,
		"survival_magnus_cataclysm_boss_b",
		1
	},
	survival_magnus_cataclysm_wave_boss_b = {
		"survival_magnus_cataclysm_boss_c",
		1,
		"survival_magnus_cataclysm_boss_d",
		1
	},
	survival_magnus_cataclysm_wave_boss_13_a = {
		"survival_magnus_cataclysm_13_a",
		1,
		"survival_magnus_cataclysm_13_b",
		1
	},
	survival_magnus_cataclysm_wave_boss_13_b = {
		"survival_magnus_cataclysm_13_c",
		1,
		"survival_magnus_cataclysm_13_d",
		1
	},
	survival_magnus_cataclysm_wave_boss_13_c = {
		"survival_magnus_cataclysm_13_e",
		1,
		"survival_magnus_cataclysm_13_f",
		1
	},
	chamber_inn = {
		"chamber_inn_setup_a",
		1
	}
}
TerrorEventBlueprints = {
	boss_event_rat_ogre = {
		{
			"spawn",
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
			"spawn",
			breed_name = "chaos_spawn"
		}
	},
	boss_event_storm_vermin_patrol = {
		{
			"spawn_patrol",
			main_path_patrol = true,
			breed_name = "skaven_storm_vermin",
			patrol_template = "storm_vermin_formation_patrol"
		}
	},
	boss_event_chaos_warrior_patrol = {
		{
			"spawn_patrol",
			main_path_patrol = true,
			breed_name = "chaos_warrior",
			patrol_template = "storm_vermin_formation_patrol"
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
	escort_troll_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"escorted_troll"
			},
			splines = {
				"event_1",
				"event_2"
			}
		}
	},
	test_patrol = {
		{
			"spawn_patrol",
			spline_type = "event",
			patrol_template = "spline_patrol",
			formations = {
				"escorted_troll"
			},
			splines = {
				"event_1"
			}
		}
	},
	rare_event_loot_rat = {
		{
			"spawn",
			breed_name = "skaven_loot_rat"
		}
	},
	boss_event_encampment = {
		{
			"spawn_encampment"
		}
	},
	roaming_patrol = {
		{
			"roaming_patrol"
		}
	},
	generic_specials_fun_a = {
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		}
	},
	generic_specials_fun_b = {
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_ratling_gunner"
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
	roger_mayhem = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Event starts... can you beat it?",
			duration = 2
		},
		{
			"start_event",
			start_event_name = "lonely_roger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			duration = 40,
			min_amount = 30,
			peak_amount = 50
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5
			end
		},
		{
			"delay",
			duration = {
				20,
				30
			}
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 15
		},
		{
			"horde",
			duration = 40,
			min_amount = 30,
			peak_amount = 50
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5
			end
		},
		{
			"delay",
			duration = {
				20,
				30
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"text",
			text = "You beat the event",
			duration = 2
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"stop_event",
			stop_event_name = "roger_mayhem"
		},
		{
			"text",
			text = "This will never be shown.. since we run 'stop_event' element above",
			duration = 2
		}
	},
	lonely_roger = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Lonely Roger wants to be friends!",
			duration = {
				2,
				3
			}
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"text",
			text = "stops in 3 secs",
			duration = 3
		},
		{
			"stop_event",
			stop_event_name = "lonely_roger"
		},
		{
			"text",
			text = "XXXXXX Lonely Roger wants to be friends!",
			duration = {
				20,
				30
			}
		}
	},
	event_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_70_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 70
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_60_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 60
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_50_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 50
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_40_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 40
		},
		{
			"control_pacing",
			enable = true
		}
	},
	force_horde = {
		{
			"force_horde",
			horde_type = "random",
			duration = 5
		}
	},
	test_raw_spawn = {
		{
			"control_specials",
			enable = false
		},
		{
			"spawn_at_raw",
			spawner_id = "roger",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_specials",
			enable = true
		}
	},
	magnus_gdc_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "magnus_gdc_event",
			composition_type = "event_large"
		}
	},
	magnus_door_a = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 9
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_door_b = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_end_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "magnus_end_horde_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_end_horde_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 9
		},
		{
			"event_horde",
			spawner_id = "magnus_end_horde_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_door_event_stop = {
		{
			"stop_event",
			stop_event_name = "magnus_door_a"
		},
		{
			"stop_event",
			stop_event_name = "magnus_door_b"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		},
		{
			"disable_bots_in_carry_event"
		}
	},
	magnus_tower_tower_climb = {
		{
			"event_horde",
			spawner_id = "magnus_tower_tower_climb_spawners",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_end_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"flow_event",
			flow_event_name = "magnus_horn_crescendo_starting"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn_first",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 10 and count_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_magnus_horn_small"
		},
		{
			"disable_kick"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 10 and count_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 10 and count_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"control_specials",
			enable = true
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 7 and count_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "magnus_tower_horn",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_magnus_horn_small"
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "magnus_horn_event_done"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		}
	},
	magnus_disable_pacing = {
		{
			"control_pacing",
			enable = false
		}
	},
	bridge_event_horde_a = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "bridge"
		},
		{
			"flow_event",
			flow_event_name = "crescendo_start"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 20
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 12
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 20
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 16
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 18
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 23
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "bridge_event_a",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 20
		}
	},
	bridge_event_horde_b = {
		{
			"control_specials",
			enable = false
		}
	},
	bridge_event_horde_c = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "bridge_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 12
		},
		{
			"control_specials",
			enable = true
		}
	},
	bridge_event_horde_d = {
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = {
				4,
				5
			}
		},
		{
			"horde",
			duration = 20,
			min_amount = 12,
			peak_amount = 17
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3
			end
		},
		{
			"delay",
			duration = {
				5,
				8
			}
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		}
	},
	bridge_event_horde_e = {
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = {
				4,
				5
			}
		},
		{
			"horde",
			duration = 20,
			min_amount = 12,
			peak_amount = 17
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3
			end
		},
		{
			"delay",
			duration = {
				5,
				8
			}
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		}
	},
	tunnels_random_chance_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = {
				1,
				3
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "tunnels_random_chance_event",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_random_chance_event_done"
		}
	},
	skaven_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = {
				1,
				3
			}
		},
		{
			"event_horde",
			spawner_id = "tunnels_end_event_room",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "skaven_end_event_start_done"
		}
	},
	skaven_pillar = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "skaven_pillar",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "skaven_pillar_done"
		}
	},
	skaven_pillar_2 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "skaven_pillar_2",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "skaven_pillar_2_done"
		}
	},
	random_skaven_end_event_medium = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "tunnels_end_event_room",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "random_skaven_end_event_done"
		}
	},
	random_skaven_end_event_small = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "tunnels_end_event_room",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "random_skaven_end_event_done"
		}
	},
	random_skaven_end_event_smaller = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "tunnels_end_event_room",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "random_skaven_end_event_done"
		}
	},
	tunnels_end_event_loop = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "master_tunnels_end_event_loop"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "tunnels_end_event_room",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "tunnels_end_event_room",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 15,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 15
		},
		{
			"stop_master_event"
		},
		{
			"flow_event",
			flow_event_name = "tunnels_end_event_loop_restart"
		}
	},
	tunnels_skaven_bell = {
		{
			"spawn",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			breed_name = "skaven_gutter_runner"
		}
	},
	tunnels_end_room_stop_event = {
		{
			"stop_event",
			stop_event_name = "random_skaven_end_event_medium"
		},
		{
			"stop_event",
			stop_event_name = "random_skaven_end_event_small"
		},
		{
			"stop_event",
			stop_event_name = "random_skaven_end_event_smaller"
		},
		{
			"stop_event",
			stop_event_name = "skaven_pillar"
		},
		{
			"stop_event",
			stop_event_name = "skaven_end_event_start"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_end_event_loop"
		}
	},
	tunnels_end_event_escape = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			spawner_id = "tunnels_end_event_escape",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_end_event_escape_done"
		}
	},
	tunnels_escape_tunnels_1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "escape_tunnels_1",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_end_event_escape_done"
		}
	},
	tunnels_escape_tunnels_2_left = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "escape_tunnels_2_left",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_end_event_escape_done"
		}
	},
	tunnels_escape_tunnels_2_right = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "escape_tunnels_2_right",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_end_event_escape_done"
		}
	},
	tunnels_escape_tunnels_end = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "escape_tunnels_end",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_end_event_escape_done"
		}
	},
	tunnels_end_event_escape_stop_event = {
		{
			"stop_event",
			stop_event_name = "tunnels_end_event_escape"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_escape_tunnels_1"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_escape_tunnels_2_left"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_escape_tunnels_2_right"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_escape_tunnels_end"
		}
	},
	tunnels_elevator_event_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "tunnels_elevator_event_a",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 12
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_elevator_event_done"
		}
	},
	tunnels_elevator_event_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "tunnels_elevator_event_b",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 12
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_elevator_event_done"
		}
	},
	tunnels_elevator_event_c = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "tunnels_elevator_event_c",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 12
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnels_elevator_event_done"
		}
	},
	tunnels_elevator_stop_event = {
		{
			"stop_event",
			stop_event_name = "tunnels_elevator_event_a"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_elevator_event_b"
		},
		{
			"stop_event",
			stop_event_name = "tunnels_elevator_event_c"
		}
	},
	tunnels_pillar_guards = {
		{
			"spawn_at_raw",
			spawner_id = "bridge1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "bridge2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "bridge3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "bridge4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_1_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_1_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_2_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_2_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_3_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_3_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_magnus_horn_smaller"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_4_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_plague_brew_event_4_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_1_v1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde, v1...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			min_amount = 15,
			peak_amount = 25,
			duration = {
				15,
				25
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_1_v2 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde, v2...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = {
				10,
				25
			}
		},
		{
			"horde",
			duration = 10,
			min_amount = 5,
			peak_amount = 10
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_2 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			duration = 20,
			min_amount = 15,
			peak_amount = 25
		},
		{
			"delay",
			duration = 20
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_3 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			duration = 20,
			min_amount = 15,
			peak_amount = 25
		},
		{
			"delay",
			duration = 20
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "cemetery_alt_objective_3_end_event"
		}
	},
	cemetery_random_terror_event = {
		{
			"delay",
			duration = {
				5,
				40
			}
		},
		{
			"event_horde",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = {
				5,
				10
			}
		},
		{
			"event_horde",
			composition_type = "event_generic_short_level_extra_spice"
		}
	},
	courtyard_specials_off = {
		{
			"control_specials",
			enable = false
		},
		{
			"delay",
			duration = 40
		},
		{
			"control_specials",
			enable = true
		}
	},
	event_courtyard_extra_spice = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		}
	},
	courtyard_rolling_event = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "courtyard"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "c_wave_01"
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_starting"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_pause"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_a"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_b",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_b_ambush",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_c",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_b_ambush",
			composition_type = "event_small"
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_midway_specials"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_a_end"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_pause"
		},
		{
			"delay",
			duration = 15
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_midway_specials"
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_b"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_b_ambush",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_b_ambush",
			composition_type = "event_small"
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_midway_specials"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_b_end"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_pause"
		},
		{
			"delay",
			duration = 15
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_a"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_b",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_a_ambush",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_c",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_a_ambush",
			composition_type = "event_small"
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_midway_specials"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_a_end"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_pause"
		},
		{
			"delay",
			duration = 15
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"disable_kick"
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_close_to_ending"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_big_spice"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_b"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_b_ambush",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "courtyard_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "courtyard_b_ambush",
			composition_type = "event_small"
		},
		{
			"flow_event",
			flow_event_name = "courtyard_crescendo_midway_specials"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "courtyard_objective_b_end"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_vermin",
			composition_type = "event_courtyard_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "courtyard_end"
		},
		{
			"stop_master_event"
		}
	},
	docks_warehouse_event = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "docks_warehouse"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "docks_warehouse_event",
			composition_type = "event_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"event_horde",
			spawner_id = "docks_warehouse_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "docks_warehouse_end"
		}
	},
	docks_warehouse_extra_spice_event = {
		{
			"set_master_event_running",
			name = "docks_warehouse"
		},
		{
			"event_horde",
			spawner_id = "docks_warehouse_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "docks_warehouse_extra_spice_event_done"
		}
	},
	docks_warehouse_end_event = {
		{
			"set_master_event_running",
			name = "docks_warehouse"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "docks_warehouse_event_end",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"flow_event",
			flow_event_name = "docks_warehouse_end"
		}
	},
	docks_warehouse_stop_event = {
		{
			"stop_event",
			stop_event_name = "docks_warehouse_event"
		},
		{
			"stop_event",
			stop_event_name = "docks_warehouse_extra_spice_event"
		}
	},
	docks_warehouse_stop_end_event = {
		{
			"stop_event",
			stop_event_name = "docks_warehouse_end_event"
		},
		{
			"stop_master_event"
		}
	},
	docks_shipyard_event = {
		{
			"set_master_event_running",
			name = "docks_shipyard"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "docks_shipyard_event",
			composition_type = "event_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"event_horde",
			spawner_id = "docks_warehouse_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "docks_shipyard_end"
		}
	},
	docks_shipyard_extra_spice_event = {
		{
			"set_master_event_running",
			name = "docks_shipyard"
		},
		{
			"event_horde",
			spawner_id = "docks_shipyard_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "docks_shipyard_extra_spice_event_done"
		}
	},
	docks_shipyard_stop_event = {
		{
			"stop_event",
			stop_event_name = "docks_shipyard_event"
		},
		{
			"stop_event",
			stop_event_name = "docks_shipyard_extra_spice_event"
		},
		{
			"stop_master_event"
		}
	},
	docks_extra_spice_event = {
		{
			"event_horde",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "docks_extra_spice_event_done"
		}
	},
	docks_end_event = {
		{
			"set_master_event_running",
			name = "docks_ending"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "docks_end_event_done"
		}
	},
	docks_end_ogre_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_breed("skaven_rat_ogre") < 1 and count_breed("skaven_slave") < 8
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "docks_end_event_done"
		}
	},
	city_wall_running_event = {
		{
			"set_master_event_running",
			name = "wall"
		},
		{
			"delay",
			duration = {
				10,
				17
			}
		},
		{
			"event_horde",
			spawner_id = "city_wall_generic",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "city_wall_rolling_event_restart"
		}
	},
	city_wall_a = {
		{
			"set_master_event_running",
			name = "wall"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "city_wall_a",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "city_wall_b",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 2
			end
		}
	},
	city_wall_b = {
		{
			"set_master_event_running",
			name = "wall"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "city_wall_b",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "city_wall_c",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 2
			end
		}
	},
	city_wall_c = {
		{
			"set_master_event_running",
			name = "wall"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			spawner_id = "city_wall_c",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "city_wall_d",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 2
			end
		}
	},
	city_wall_d = {
		{
			"set_master_event_running",
			name = "wall"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			spawner_id = "city_wall_d",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "city_wall_b",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5 and count_breed("skaven_storm_vermin_commander") < 2
			end
		}
	},
	city_wall_end = {
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = 20
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			spawner_id = "city_wall_end",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "city_wall_b",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 20
		},
		{
			"stop_master_event"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	walls_gate_guards_a = {
		{
			"spawn_at_raw",
			spawner_id = "gateguard_a_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_a_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_a_3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_a_4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_a_5",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_a_6",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 5
		}
	},
	walls_gate_guards_b = {
		{
			"spawn_at_raw",
			spawner_id = "gateguard_b_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_b_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_b_3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_b_4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_b_5",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gateguard_b_6",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 5
		}
	},
	walls_attachment_guards = {
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_a_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_a_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_b_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_b_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_c_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_c_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_d_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "attachment_guard_d_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 5
		}
	},
	open_door = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "wizard_open_door"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "object_set_room_spawners",
			composition_type = "wizard_event_small_hard"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 70,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "object_set_room_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 70,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "object_set_room_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "object_set_room_spawners",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 70,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "object_set_room_spawners",
			composition_type = "event_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "object_set_room_spawners",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 70,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"stop_master_event"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	garden_mayhem = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "chaos_room_spawners",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "chaos_room_spawners",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "garden_done"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	endroom_mayhem = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = true
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wizard_endroom_done"
		}
	},
	wizard_disable_pacing = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	wizard_end_event = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"delay",
			duration = 5
		},
		{
			"set_master_event_running",
			name = "wizard_finale"
		},
		{
			"flow_event",
			flow_event_name = "wizard_crescendo_starting"
		},
		{
			"disable_kick"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners_side",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_small_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"flow_event",
			flow_event_name = "wizard_end_event_pause_a"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_small_hard"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners_side",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "wizard_alt_objectives"
		},
		{
			"delay",
			duration = 7
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"flow_event",
			flow_event_name = "wizard_end_event_pause_b"
		},
		{
			"delay",
			duration = 10
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners_side",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners",
			composition_type = "event_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_small_hard"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			{
				2,
				4
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"flow_event",
			flow_event_name = "wizard_end_event_pause_c"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners_side",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners_side",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "endroom_spawners_side",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"event_horde",
			spawner_id = "endroom_spawners",
			composition_type = "wizard_event_smaller_hard"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"flow_event",
			flow_event_name = "wizard_end_event_done"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"stop_master_event"
		}
	},
	sewers_alt_door_event_01 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sewers_alt_door_01",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewers_alt_door_01",
			composition_type = "sewers_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_smaller_hard"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_small_hard"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_small_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_small_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sewers_alt_door_event_01_stopped = {
		{
			"control_pacing",
			enable = true
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "sewers_alt_door_event_01_vo"
		}
	},
	sewers_alt_door_event_02 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sewers_alt_door_02",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewers_alt_door_02",
			composition_type = "sewers_event_small_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_small_hard"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_smaller_hard"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "sewers_event_smaller_hard"
		}
	},
	sewers_end_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "sewers_end_event_a",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewers_alt_door_02",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 12 and count_breed("skaven_slave") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 12 and count_breed("skaven_slave") < 8
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 12 and count_breed("skaven_slave") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 4
		},
		{
			"control_pacing",
			enable = true
		}
	},
	farm_event_larger = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin_larger",
			composition_type = "medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	farm_event_larger_vermin = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin_larger",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	farm_event_larger_second = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "farm_vermin_larger_second",
			composition_type = "medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	farm_event_larger_second_vermin = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "farm_vermin_larger_second",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	farm_event_larger_third = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "farm_vermin_larger_third",
			composition_type = "medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	farm_event_larger_third_vermin = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "farm_vermin_larger_third",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	farm_event_ogre = {
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"delay",
			duration = {
				5,
				40
			}
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return count_breed("skaven_rat_ogre") < 1 and count_breed("skaven_slave") < 12
			end
		},
		{
			"control_specials",
			enable = true
		}
	},
	farm_event = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "farm"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"disable_kick"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 12 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "farm_vermin",
			composition_type = "event_farm_extra_big_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "farm_event_ended"
		}
	},
	forest_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_start_debug"
		},
		{
			"disable_kick"
		}
	},
	forest_end_event_a = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = {
				15,
				17
			}
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_event_b = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_event_c = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_finale = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_finale",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_finale",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_event_loop = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "forest_end_event",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_loop_restart"
		}
	},
	forest_end_cutscene = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "forest_cutscene_a",
			composition_type = "event_smaller"
		}
	},
	forest_skaven_camp_loop = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "skaven_camp_loop",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_loop_restart"
		}
	},
	forest_skaven_camp_a = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_a_done"
		}
	},
	forest_skaven_camp_b = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_b_done"
		}
	},
	forest_skaven_camp_c = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_c_done"
		}
	},
	forest_skaven_camp_finale = {
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_door_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"stop_master_event"
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_finale_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	merchant_alley_ambush = {
		{
			"delay",
			duration = {
				1,
				2
			}
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "merchant_alley_ambush",
			composition_type = "event_merchant_ambush"
		}
	},
	merchant_granary_ambush = {
		{
			"delay",
			duration = {
				1,
				3
			}
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "merchant_granary_ambush",
			composition_type = "event_merchant_ambush"
		}
	},
	merchant_market_event_a = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = {
				20,
				24
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_restart"
		}
	},
	merchant_market_event_b = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = {
				20,
				23
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_restart"
		}
	},
	merchant_market_event_c = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = {
				22,
				23
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_restart"
		}
	},
	merchant_market_event_hard_a = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = {
				22,
				30
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_post_pause_start"
		}
	},
	merchant_market_event_hard_b = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = {
				13,
				17
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_post_pause_start"
		}
	},
	merchant_market_event_hard_c = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 7
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				13,
				16
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_post_pause_start"
		}
	},
	merchant_market_event_hard_d = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn",
			{
				6,
				8
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 2
			end
		},
		{
			"delay",
			duration = {
				14,
				18
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_post_pause_start"
		}
	},
	merchant_market_event_pre_pause = {
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 22
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_hard_start"
		}
	},
	merchant_market_event_post_pause = {
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "crescendo_pause"
		},
		{
			"delay",
			duration = 20
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_restart"
		}
	},
	merchant_market_event_finale = {
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_finale_restart"
		}
	},
	merchant_market_event_loop = {
		{
			"set_master_event_running",
			name = "merchant_event"
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "market_event",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "merchant_market_event_loop_restart"
		}
	},
	merchant_market_stop_event = {
		{
			"stop_event",
			stop_event_name = "merchant_market_event_a"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_b"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_c"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_hard_a"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_hard_b"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_hard_c"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_pre_pause"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_post_pause"
		}
	},
	merchant_market_stop_chunk_event = {
		{
			"stop_event",
			stop_event_name = "merchant_market_event_a"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_b"
		},
		{
			"stop_event",
			stop_event_name = "merchant_market_event_c"
		},
		{
			"text",
			text = "events stopped!",
			duration = 2
		}
	},
	end_boss_terror_a = {
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_boss_spawners_a",
			composition_type = "end_boss_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_boss_spawners_a",
			composition_type = "end_boss_event_small_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_boss_spawners_a",
			composition_type = "end_boss_event_smaller_hard"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		}
	},
	end_boss_guards = {
		{
			"spawn_at_raw",
			spawner_id = "guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "guard3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "guard4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 5
		}
	},
	end_boss_terror_b = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_b",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	end_boss_terror_c1 = {
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_c_1",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_specials",
			enable = false
		},
		{
			"delay",
			duration = 6
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_ogre1",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_specials",
			enable = true
		}
	},
	end_boss_terror_c2 = {
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_c_1",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_specials",
			enable = false
		},
		{
			"delay",
			duration = 6
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_ogre2",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_specials",
			enable = true
		}
	},
	end_boss_bell_a = {
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 20
		},
		{
			"flow_event",
			flow_event_name = "end_boss_bell_a_restart"
		}
	},
	end_boss_bell_a_gate = {
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_a",
			composition_type = "end_boss_event_stormvermin"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"delay",
			duration = 20
		}
	},
	end_boss_bell_b = {
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_b",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "end_boss_bell_b_restart"
		}
	},
	end_boss_bell_c = {
		{
			"set_master_event_running",
			name = "end_boss"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_c",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "end_boss_spawners_c",
			composition_type = "end_boss_event_rolling"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"delay",
			duration = 15
		},
		{
			"flow_event",
			flow_event_name = "end_boss_bell_c_restart"
		}
	},
	end_boss_bell_done = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	castle_inner_sanctum_extra_spice_loop = {
		{
			"set_master_event_running",
			name = "inner_sanctum"
		},
		{
			"event_horde",
			spawner_id = "inner_sanctum",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"flow_event",
			flow_event_name = "castle_inner_sanctum_extra_spice_loop_restart"
		}
	},
	castle_inner_sanctum_stop_pacing = {
		{
			"control_pacing",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		}
	},
	castle_inner_sanctum_event_loop = {
		{
			"set_master_event_running",
			name = "inner_sanctum"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "inner_sanctum",
			composition_type = "event_smaller"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"flow_event",
			flow_event_name = "castle_inner_sanctum_event_loop_restart"
		}
	},
	castle_inner_sanctum_stop_event = {
		{
			"stop_event",
			stop_event_name = "castle_inner_sanctum_event_loop"
		},
		{
			"stop_event",
			stop_event_name = "castle_inner_sanctum_extra_spice_loop"
		},
		{
			"disable_bots_in_carry_event"
		}
	},
	castle_catacombs_end_event_start = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		}
	},
	castle_catacombs_end_event_loop = {
		{
			"set_master_event_running",
			name = "escape_catacombs"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "escape_catacombs",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "castle_catacombs_end_event_loop_done"
		}
	},
	castle_catacombs_end_event_loop_extra_spice = {
		{
			"set_master_event_running",
			name = "escape_catacombs"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_escape_spice",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "castle_catacombs_end_event_loop_extra_spice_done"
		}
	},
	end_event_statuette_guards_01 = {
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard3",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	end_event_statuette_guards_02 = {
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard3",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	end_event_statuette_guards_03 = {
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard3",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	end_event_statuette_guards_04 = {
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette1_guard3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette2_guard3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_statuette3_guard3",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	castle_inner_sanctum_statuette_extra = {
		{
			"set_master_event_running",
			name = "inner_sanctum"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "inner_sanctum",
			composition_type = "event_smaller"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "castle_inner_sanctum_statuette_extra_done"
		}
	},
	whitebox_dummy_troll_test = {
		{
			"spawn_at_raw",
			spawner_id = "test_spawner_1",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "test_spawner_2",
			breed_name = "chaos_dummy_troll"
		}
	},
	morja_test_sorcerer_dummies = {
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_1",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_2",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_3",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_4",
			breed_name = "chaos_dummy_sorcerer"
		}
	},
	test_spawn_warcamp_exalted_champion = {
		{
			"spawn_at_raw",
			spawner_id = "exalted_champion_spawner",
			breed_name = "chaos_exalted_champion_warcamp"
		}
	},
	test_spawn_grey_seer_stormfiend = {
		{
			"spawn_at_raw",
			spawner_id = "grey_seer_stormfiend_spawner",
			breed_name = "skaven_grey_seer"
		}
	},
	test_spawn_exalted_sorcerer = {
		{
			"spawn_at_raw",
			spawner_id = "exalted_sorcerer_spawner",
			breed_name = "chaos_exalted_sorcerer"
		}
	},
	test_spawn_skaven_warlord = {
		{
			"spawn_at_raw",
			spawner_id = "skaven_warlord_spawner",
			breed_name = "skaven_storm_vermin_warlord"
		}
	},
	whitebox_combat_event_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Spawning horde",
			duration = 2
		},
		{
			"horde",
			duration = 20,
			min_amount = 15,
			peak_amount = 20
		},
		{
			"delay",
			duration = {
				5,
				7
			}
		},
		{
			"text",
			text = "Spawning Pack Master",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_pack_master"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"text",
			text = "Spawning Rat Ogre",
			duration = 2
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"horde",
			duration = 20,
			min_amount = 10,
			peak_amount = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"text",
			text = "Wave 2 incoming",
			duration = 2
		},
		{
			"horde",
			duration = 30,
			min_amount = 20,
			peak_amount = 25
		},
		{
			"text",
			text = "Spawning Globadier",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"delay",
			duration = {
				5,
				10
			}
		},
		{
			"text",
			text = "Wave 3 incoming",
			duration = 2
		},
		{
			"text",
			text = "Spawning Gutter Runner",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_gutter_runner"
		},
		{
			"horde",
			duration = 40,
			min_amount = 15,
			peak_amount = 20
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"text",
			text = "Event done",
			duration = 2
		},
		{
			"control_pacing",
			enable = true
		}
	},
	outpost_disable_pacing_a = {
		{
			"control_pacing",
			enable = false
		}
	},
	outpost_wave_event_climb_01 = {
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_medium"
		}
	},
	outpost_wave_01_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Hold out as long as possible!",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_storm_band"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_b",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_b",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_c",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_c",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_survival_high_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_survival_high_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_small"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_survival_high_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_horde"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_large"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_storm_band"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_b",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_b",
			composition_type = "event_survival_high_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_storm_band"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2 and count_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_medium_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_horde"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_survival_storm_band"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_survival_high_intensity"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_d",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_climb",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_storm_band"
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wait_for_next_horde"
		},
		{
			"delay",
			duration = 15
		},
		{
			"delay",
			duration = 30
		},
		{
			"text",
			text = "last stand",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "last_stand_start"
		}
	},
	outpost_death_wave_01 = {
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_tower",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_storm_band"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_storm_horde"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_small"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 4 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_horde"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_horde"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_f",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"flow_event",
			flow_event_name = "specials"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_band"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 11
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_b",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_survival_high_intensity"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_e",
			composition_type = "event_survival_storm_band"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_b",
			composition_type = "event_survival_storm_band"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_horde"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_survival_storm_horde"
		},
		{
			"event_horde",
			spawner_id = "outpost_wave_event_a",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8 and count_breed("skaven_slave") < 8 and count_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "last_stand_start"
		}
	},
	outpost_extra_spice_01 = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "outpost_wave_event_omni",
			composition_type = "event_courtyard_extra_spice"
		}
	},
	performance_test_1 = {
		{
			"event_horde",
			spawner_id = "performancetester",
			composition_type = "performance_test"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		}
	},
	military_benchmark_1 = {
		{
			"run_benchmark_func",
			portal_id = "benchmark_fight1",
			func_name = "story_teleport_party"
		},
		{
			"delay",
			duration = 0.3
		},
		{
			"event_horde",
			spawner_id = "benchmark_1_2",
			composition_type = "ai_benchmark_cycle_stormvermin"
		},
		{
			"delay",
			duration = 0.2
		},
		{
			"event_horde",
			spawner_id = "benchmark_1_3",
			composition_type = "ai_benchmark_cycle_chaos_berzerker"
		},
		{
			"delay",
			duration = 0.2
		},
		{
			"event_horde",
			spawner_id = "courtyard",
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"delay",
			duration = 30
		},
		{
			"run_benchmark_func",
			radius_squared = 900,
			func_name = "story_destroy_close_units"
		},
		{
			"run_benchmark_func",
			portal_id = "Start",
			func_name = "story_teleport_party"
		}
	},
	military_benchmark_2 = {
		{
			"run_benchmark_func",
			portal_id = "benchmark_fight2",
			func_name = "story_teleport_party"
		},
		{
			"event_horde",
			spawner_id = "benchmark_2_2",
			composition_type = "ai_benchmark_cycle_plague_monks"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"event_horde",
			spawner_id = "benchmark_2_3",
			composition_type = "ai_benchmark_cycle_chaos_marauder"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"event_horde",
			spawner_id = "benchmark_2_4",
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"delay",
			duration = 30
		},
		{
			"run_benchmark_func",
			radius_squared = 900,
			func_name = "story_destroy_close_units"
		},
		{
			"run_benchmark_func",
			portal_id = "Start",
			func_name = "story_teleport_party"
		}
	},
	military_benchmark_end = {
		{
			"run_benchmark_func",
			func_name = "story_end_benchmark"
		}
	},
	ai_benchmark_cycle = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"text",
			text = "Turned off pacing and specials",
			duration = 5
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"text",
			text = "Spawning 20 slaves (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_clanrat"
		},
		{
			"text",
			text = "Spawning 10 clanrats (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "Spawning 10 shield clanrats (wait 30 sec until wipe) REMOVED BECAUSE OF CRASH",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_stormvermin"
		},
		{
			"text",
			text = "Spawning 4 storm vermin (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_stormvermin_shield"
		},
		{
			"text",
			text = "Spawning 4 shield storm vermin (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_plague_monks"
		},
		{
			"text",
			text = "Spawning 6 plague monks (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			2,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"text",
			text = "Spawning 2 globadier",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"text",
			text = "Spawning 2 ratling gunner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_gutter_runner"
		},
		{
			"text",
			text = "Spawning 2 gutter runner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"text",
			text = "Spawning 2 gutter runner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_pack_master"
		},
		{
			"text",
			text = "Spawning 2 pack master (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "skaven_rat_ogre"
		},
		{
			"text",
			text = "Spawning 1 rat ogre (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "skaven_stormfiend"
		},
		{
			"text",
			text = "Spawning 1 stormfiend (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "TIME FOR CHAOS",
			duration = 5
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_marauder"
		},
		{
			"text",
			text = "Spawning 10 marauders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_marauder_shield"
		},
		{
			"text",
			text = "Spawning 10 shield marauders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_berzerker"
		},
		{
			"text",
			text = "Spawning 10 berzerkers (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_raider"
		},
		{
			"text",
			text = "Spawning 10 raiders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior1",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior2",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior3",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior4",
			breed_name = "chaos_warrior"
		},
		{
			"text",
			text = "Spawning 4 warriors (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			2,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"text",
			text = "Spawning 2 Vortex Sorcerers",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "chaos_plague_sorcerer"
		},
		{
			"text",
			text = "Spawning 2 Plague Sorcerers (wait 30sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "chaos_troll"
		},
		{
			"text",
			text = "Spawning 1 Troll (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "chaos_spawn"
		},
		{
			"text",
			text = "Spawning 1 Chaos Spawn (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "Restarting",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_cycle_restart"
		}
	},
	pathfind_test_climb = {
		{
			"event_horde",
			spawner_id = "pathfind_test_climb",
			composition_type = "pathfind_test_light"
		}
	},
	pathfind_test_straight = {
		{
			"event_horde",
			spawner_id = "pathfind_test_straight",
			composition_type = "pathfind_test_light"
		}
	},
	survival_control = {
		{
			"control_specials",
			enable = false
		},
		{
			"control_pacing",
			enable = false
		}
	},
	survival_wave_abd = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_west"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_north"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_east"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_south"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_wave_bac = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_wave_cad = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_wave_dba = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_wave_cdb = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_wave_acd = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_wave_dab = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_wave_easy_a_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_wave_easy_b_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_wave_easy_a_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_wave_easy_b_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_flush_in = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_flush_out = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_esr2_a = {
		{
			"delay",
			duration = {
				10,
				20
			}
		},
		{
			"event_horde",
			composition_type = "event_survival_extra"
		}
	},
	survival_esr3_a = {
		{
			"delay",
			duration = {
				10,
				20
			}
		},
		{
			"event_horde",
			composition_type = "event_survival_extra"
		}
	},
	survival_specials_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_specials_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_specials_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_specials_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_boss_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_13_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_wave_intro = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_east"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_south"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_west"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "survival_direction_north"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_wave_bac = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_wave_cad = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_wave_dba = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_wave_cdb = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_wave_acd = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_wave_dab = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_wave_easy_a_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_wave_easy_b_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_wave_easy_a_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_wave_easy_b_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_main"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_flush_in = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_flush_out = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_esr2_a = {
		{
			"delay",
			duration = {
				10,
				20
			}
		},
		{
			"event_horde",
			composition_type = "event_survival_extra"
		}
	},
	survival_magnus_esr3_a = {
		{
			"delay",
			duration = {
				10,
				20
			}
		},
		{
			"event_horde",
			composition_type = "event_survival_extra"
		}
	},
	survival_magnus_specials_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_specials_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_specials_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_specials_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_pinch"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_boss_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_13_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_wave_easy_a_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_wave_easy_b_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_wave_easy_a_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_wave_easy_b_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_specials_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_specials_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_specials_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_boss_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_nightmare_13_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_wave_easy_a_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_wave_easy_b_1 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_wave_easy_a_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_wave_easy_b_2 = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 8 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_specials_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_specials_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_specials_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_boss_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_nightmare_13_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_wave_bac = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_cataclysm_wave_cad = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_cataclysm_wave_dba = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_cataclysm_wave_cdb = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_cataclysm_wave_acd = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_magnus_cataclysm_wave_dab = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				70,
				30,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				85,
				-12,
				15
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-45,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				14,
				24,
				15
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_wave_bac = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_wave_cad = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_wave_dba = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_wave_cdb = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_wave_acd = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_wave_dab = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				25,
				-55,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 20 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		},
		{
			"control_specials",
			enable = false
		}
	},
	survival_cataclysm_specials_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_gutter_runner") < 2 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_e = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_f = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_g = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_h = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_specials_i = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_boss_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_boss_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_boss_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_boss_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_13_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_13_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_13_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_13_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_gutter_runner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_gutter_runner") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_13_e = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_cataclysm_13_f = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_d",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_gutter_runner") < 2 and count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_flush"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_e = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_a",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_f = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_g = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_h = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_specials_i = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = {
				12,
				18
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = {
				20,
				25
			}
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_boss_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_boss_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_boss_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_stormvermin_few"
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_boss_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 2
			end
		},
		{
			"delay",
			duration = 8
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_13_a = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_13_b = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_13_c = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_13_d = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_gutter_runner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_gutter_runner") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_13_e = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "event_survival_stormvermin"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_stormvermin"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	survival_magnus_cataclysm_13_f = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_special"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_b",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_at_raw",
			spawner_id = "boss_spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") == 0 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	tutorial_kill_remaining = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_kill_remaining_complete"
		}
	},
	tutorial_dodge_attack = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_a",
			breed_name = "skaven_slave"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_dodge_attack_complete"
		}
	},
	tutorial_light_attack = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_a",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_b",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_c",
			breed_name = "skaven_slave"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_light_attack_complete"
		}
	},
	tutorial_heavy_attack = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_a",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_heavy_attack_complete"
		}
	},
	tutorial_ranged_normal_attack = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_ranged_spawner_a",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_ranged_spawner_b",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_ranged_spawner_c",
			breed_name = "skaven_clan_rat"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_ranged_normal_attack_complete"
		}
	},
	tutorial_ranged_alternative_attack = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_long_ranged_spawner_a",
			breed_name = "skaven_clan_rat"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_ranged_alternative_attack_complete"
		}
	},
	tutorial_blocking = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_a",
			breed_name = "skaven_clan_rat"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_blocking_complete"
		}
	},
	tutorial_pushing = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_a",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_b",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_spawner_c",
			breed_name = "skaven_slave"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_pushing_complete"
		}
	},
	tutorial_throw_grenade = {
		{
			"set_master_event_running",
			name = "tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_grenade_spawner_a",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_grenade_spawner_b",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_grenade_spawner_c",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "tutorial_grenade_spawner_d",
			breed_name = "skaven_clan_rat"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_throw_grenade_complete"
		}
	},
	tutorial_end_horde = {
		{
			"event_horde",
			spawner_id = "tutorial_end_horde_a",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 9
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "tutorial_end_horde_complete"
		}
	},
	dlc_portals_control_pacing_disabled = {
		{
			"control_pacing",
			enable = false
		}
	},
	dlc_portals_control_pacing_enabled = {
		{
			"control_pacing",
			enable = true
		}
	},
	dlc_portals_a = {
		{
			"set_master_event_running",
			name = "dlc_portals_a"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 8
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_large"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"flow_event",
			flow_event_name = "portals_terror_event_a_complete"
		}
	},
	dlc_portals_b = {
		{
			"set_master_event_running",
			name = "dlc_portals_b"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 8
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 20
		},
		{
			"flow_event",
			flow_event_name = "event_portal_b_spawn_ogre"
		},
		{
			"delay",
			duration = 30
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_clanrats"
		},
		{
			"flow_event",
			flow_event_name = "portals_terror_event_b_complete"
		}
	},
	dlc_portals_c = {
		{
			"set_master_event_running",
			name = "dlc_portals_c"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_stormvermin"
		},
		{
			"delay",
			duration = 15
		},
		{
			"flow_event",
			flow_event_name = "event_portal_c_spawn_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_stormvermin"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_portals_flush"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_flank"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_flank"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
			composition_type = "event_portals_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "portals_terror_event_c_complete"
		}
	},
	dlc_portals_guards_cliff = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_1",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dlc_portals_guards_portal_a = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_8",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dlc_portals_guards_camp_a = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_7",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dlc_portals_guards_portal_b = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_2",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dlc_portals_guards_camp_b = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_6",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dlc_portals_guards_portal_c = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_stormvermin_guard_5",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dlc_portals_b_ogre = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_portal_b",
			breed_name = "skaven_rat_ogre"
		}
	},
	dlc_portals_c_ogre = {
		{
			"spawn_at_raw",
			spawner_id = "spawner_manual_event_portal_c_2",
			breed_name = "skaven_rat_ogre"
		}
	},
	dungeon_event_dark_end_ogre = {
		{
			"set_master_event_running",
			name = "dungeon"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = {
				1,
				3
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "dark_finale_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "dark_finale_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "dark_finale_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "dark_finale_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_specials",
			enable = false
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_at_raw",
			spawner_id = "dark_ogre1",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "dark_finale_spawn",
			composition_type = "medium"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			spawner_id = "dark_finale_spawn",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 140,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_slave") < 12
			end
		},
		{
			"control_specials",
			enable = true
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "dungeon_event_dark_doors"
		}
	},
	dungeon_escape_tunnels = {
		{
			"set_master_event_running",
			name = "dungeon"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "escape_tunnel",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "tunnel_end_event_escape_done"
		}
	},
	dungeon_artifact_defend = {
		{
			"set_master_event_running",
			name = "dungeon"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "dungeon1_artifactroom",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "dungeon_artifact_defend_done"
		}
	},
	dungeon_artifact_stormvermin = {
		{
			"set_master_event_running",
			name = "dungeon"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "dungeon1_artifactroom",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"delay",
			duration = 3
		}
	},
	dungeon_random_stormvermin_addition_a = {
		{
			"spawn_at_raw",
			spawner_id = "stormverminhaxA1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "stormverminhaxA2",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dungeon_random_stormvermin_addition_b = {
		{
			"spawn_at_raw",
			spawner_id = "stormverminhaxB1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "stormverminhaxB2",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dungeon_random_stormvermin_addition_c = {
		{
			"spawn_at_raw",
			spawner_id = "stormverminhaxC1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "stormverminhaxC2",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dwarf_interior_brewery_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		}
	},
	dwarf_interior_brewery_a = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart"
		}
	},
	dwarf_interior_brewery_b = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart"
		}
	},
	dwarf_interior_brewery_c = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart"
		}
	},
	dwarf_interior_brewery_hard_a = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start"
		}
	},
	dwarf_interior_brewery_hard_b = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "brewery_event",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start"
		}
	},
	dwarf_interior_brewery_hard_c = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 7
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start"
		}
	},
	dwarf_interior_brewery_hard_d = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start"
		}
	},
	dwarf_interior_brewery_pre_pause = {
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_hard_start"
		}
	},
	dwarf_interior_brewery_post_pause = {
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart"
		}
	},
	dwarf_interior_brewery_finale = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "brewery_event_finale",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"disable_bots_in_carry_event"
		}
	},
	dwarf_interior_brewery_loop = {
		{
			"set_master_event_running",
			name = "brewery_event"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "brewery_event",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_loop_restart"
		}
	},
	dwarf_interior_brewery_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_a"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_b"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_c"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_a"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_b"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_c"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_d"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_pre_pause"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_post_pause"
		}
	},
	dwarf_interior_brewery_stop_chunk = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_a"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_b"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_c"
		}
	},
	dwarf_interior_great_hall_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"enable_bots_in_carry_event"
		}
	},
	dwarf_interior_great_hall_tunnels = {
		{
			"set_master_event_running",
			name = "great_hall_spawn"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "tunnel_spawn",
			composition_type = "event_small"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				10,
				12
			}
		},
		{
			"event_horde",
			spawner_id = "tunnel_spawn",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_done"
		}
	},
	dwarf_interior_great_hall_extra_spice_event = {
		{
			"set_master_event_running",
			name = "great_hall_spawn"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "great_hall_extra_spice",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_extra_spice_done"
		}
	},
	dwarf_interior_great_hall_upstairs_tunnel_extra = {
		{
			"set_master_event_running",
			name = "great_hall_spawn"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "upstairs_tunnel_spawn",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_upstairs_tunnel_extra_done"
		}
	},
	dwarf_interior_great_hall_downstairs_tunnel_extra = {
		{
			"set_master_event_running",
			name = "great_hall_spawn"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "downstairs_tunnel_spawn",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_downstairs_tunnel_extra_done"
		}
	},
	dwarf_interior_great_hall_back_tunnel_extra = {
		{
			"set_master_event_running",
			name = "great_hall_spawn"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "back_tunnel_spawn",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_back_tunnel_extra_done"
		}
	},
	dwarf_interior_great_hall_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_tunnels"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_extra_spice_event"
		}
	},
	dwarf_interior_great_hall_upstairs_tunnel_extra_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_upstairs_tunnel_extra"
		}
	},
	dwarf_interior_great_hall_downstairs_tunnel_extra_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_downstairs_tunnel_extra"
		}
	},
	dwarf_interior_great_hall_back_tunnel_extra_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_back_tunnel_extra"
		}
	},
	dwarf_exterior_chamber_guards = {
		{
			"spawn_at_raw",
			spawner_id = "chamber_guards01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "chamber_guards02",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "chamber_guards03",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "chamber_guards04",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dwarf_exterior_escape_guards = {
		{
			"spawn_at_raw",
			spawner_id = "escape_guards01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "escape_guards02",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "escape_guards03",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "escape_guards04",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "escape_guards05",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "escape_guards06",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	dwarf_exterior_end_event_survival_globadiers = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival"
		},
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_globadiers_done"
		}
	},
	dwarf_exterior_end_event_survival_01 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "end_event_survival",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_slave") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_01_done"
		}
	},
	dwarf_exterior_end_event_survival_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_survival",
			composition_type = "event_dwarf_exterior_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_slave") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_02_done"
		}
	},
	dwarf_exterior_end_event_survival_end = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_survival",
			composition_type = "event_dwarf_exterior_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_end_done"
		}
	},
	dwarf_exterior_end_event_survival_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_01"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_02"
		},
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_end"
		}
	},
	dwarf_exterior_end_event_escape = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_escape"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
			composition_type = "event_dwarf_exterior_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_escape_done"
		}
	},
	dwarf_exterior_end_event_escape_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_escape"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
			composition_type = "event_dwarf_exterior_extra_spice_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_escape_02_done"
		}
	},
	dwarf_exterior_end_event_sound = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	dwarf_exterior_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"enable_bots_in_carry_event"
		}
	},
	dwarf_beacons_gate_part1 = {
		{
			"set_master_event_running",
			name = "beacons_gate"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gate_currentside",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"event_horde",
			spawner_id = "gate_currentside",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gate_currentside",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				5,
				6
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	dwarf_beacons_gate_part2 = {
		{
			"set_master_event_running",
			name = "beacons_gate"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gate_otherside",
			composition_type = "event_large"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"event_horde",
			spawner_id = "gate_currentside",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gate_otherside",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				5,
				6
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"control_pacing",
			enable = true
		}
	},
	dwarf_beacons_beacon = {
		{
			"set_master_event_running",
			name = "beacons_beacon"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "beacon",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"event_horde",
			spawner_id = "beacon",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_ratling_gunner"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "beacon",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				5,
				6
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "beacon",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	dwarf_beacons_barrier = {
		{
			"set_master_event_running",
			name = "beacons_barrier"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "beacon_barrier",
			composition_type = "event_small"
		}
	},
	catacombs_puzzle_event_start = {
		{
			"control_pacing",
			enable = false
		}
	},
	catacombs_puzzle_event_stinger = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	catacombs_puzzle_event_a = {
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "enemy_door",
			composition_type = "chaos_shields"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_a_done"
		}
	},
	catacombs_puzzle_event_b = {
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "enemy_door",
			composition_type = "event_small_chaos"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_b_done"
		}
	},
	catacombs_puzzle_event_c = {
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "enemy_door",
			composition_type = "chaos_berzerkers"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_c_done"
		}
	},
	catacombs_puzzle_event_loop = {
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event_loop"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "puzzle_event_loop",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "puzzle_event_loop",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_loop_done"
		}
	},
	catacombs_special_event_a = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = "skaven_ratling_gunner"
		}
	},
	catacombs_special_event_b = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_02",
			breed_name = "skaven_poison_wind_globadier"
		}
	},
	catacombs_special_event_c = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_03",
			breed_name = "skaven_warpfire_thrower"
		}
	},
	catacombs_puzzle_event_end = {
		{
			"control_pacing",
			enable = true
		}
	},
	catacombs_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		}
	},
	catacombs_end_event_zombies = {
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_01",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_02",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_03",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_04",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_05",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_06",
			breed_name = "chaos_zombie"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_zombies_done"
		}
	},
	catacombs_end_event_01 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 4 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_01_done"
		}
	},
	catacombs_end_event_02 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_02_done"
		}
	},
	catacombs_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_specials_done"
		}
	},
	catacombs_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_specials_done"
		}
	},
	catacombs_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_specials_done"
		}
	},
	catacombs_plague_wave = {
		{
			"set_master_event_running",
			name = "plague_wave"
		},
		{
			"spawn_at_raw",
			spawner_id = "wave",
			breed_name = "chaos_plague_wave_spawner"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_plague_wave_done"
		}
	},
	catacombs_sorcerers = {
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_1",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_2",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_3",
			breed_name = "chaos_dummy_sorcerer"
		}
	},
	catacombs_end_event_escape = {
		{
			"control_specials",
			enable = true
		}
	},
	elven_ruins_end_event = {
		{
			"set_master_event_running",
			name = "ruins_end_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"event_horde",
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				5,
				6
			}
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			1,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	elven_ruins_end_event_flush = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = {
				1,
				2
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"delay",
			duration = {
				1,
				2
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_generic_short_level_stormvermin"
		}
	},
	elven_ruins_end_event_device_fiddlers = {
		{
			"spawn_at_raw",
			spawner_id = "device_skaven_1",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "device_skaven_2",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "device_skaven_3",
			breed_name = "skaven_clan_rat"
		}
	},
	chamber_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	chamber_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	chamber_inn_setup_a = {
		{
			"set_master_event_running",
			name = "chamber_inn"
		},
		{
			"spawn_at_raw",
			spawner_id = "inn_floor_roger",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "inn_floor_spawn_a",
			composition_type = "event_chamber_slaves_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"event_horde",
			spawner_id = "inn_chimney_spawn_a",
			composition_type = "event_chamber_slaves_large"
		},
		{
			"flow_event",
			flow_event_name = "inn_chimney_event"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "inn_door_window_spawn_a",
			composition_type = "event_chamber_mixed_a"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "inn_door_window_spawn_b",
			composition_type = "event_chamber_mixed_c"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "inn_manual_spawn_window_b",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_ratling_gunner") < 1
			end
		},
		{
			"event_horde",
			spawner_id = "inn_roof_spawn_b",
			composition_type = "event_chamber_mixed_c"
		},
		{
			"delay",
			duration = 3
		},
		{
			"flow_event",
			flow_event_name = "inn_roof_destroy_c"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "inn_roof_spawn_c",
			composition_type = "event_chamber_slaves_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "inn_manual_spawn_roof_c",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"flow_event",
			flow_event_name = "inn_roof_destroy_a"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "inn_roof_spawn_a",
			composition_type = "event_chamber_clanrats"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "inn_room_spawn_b",
			composition_type = "event_chamber_slaves_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "inn_room_spawn_a",
			composition_type = "event_chamber_slaves_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "inn_manual_spawn_room_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			spawner_id = "inn_room_spawn_c",
			composition_type = "event_chamber_clanrats"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "inn_door_window_spawn_a",
			composition_type = "event_chamber_mixed_c"
		},
		{
			"event_horde",
			spawner_id = "inn_chimney_spawn_a",
			composition_type = "event_chamber_slaves_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "inn_roof_spawn_b",
			composition_type = "event_chamber_clanrats"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "inn_door_window_spawn_b",
			composition_type = "event_chamber_mixed_b"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") == 0 and count_event_breed("skaven_clan_rat") == 0 and count_event_breed("skaven_gutter_runner") == 0 and count_event_breed("skaven_ratling_gunner") == 0 and count_event_breed("skaven_poison_wind_globadier") == 0 and count_event_breed("skaven_storm_vermin_commander") == 0
			end
		},
		{
			"flow_event",
			flow_event_name = "chamber_inn_event_done"
		}
	},
	chamber_end_a = {
		{
			"set_master_event_running",
			name = "chamber_end"
		},
		{
			"event_horde",
			spawner_id = "chamber_end_a_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "chamber_end_a_done"
		}
	},
	chamber_end_b = {
		{
			"set_master_event_running",
			name = "chamber_end"
		},
		{
			"event_horde",
			spawner_id = "chamber_end_b_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "chamber_end_b_done"
		}
	},
	chamber_end_c = {
		{
			"set_master_event_running",
			name = "chamber_end"
		},
		{
			"event_horde",
			spawner_id = "chamber_end_c_spawn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "chamber_end_c_done"
		}
	},
	farmlands_rat_ogre = {
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre",
			breed_name = "skaven_rat_ogre"
		}
	},
	farmlands_spawn_guards = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"spawn_at_raw",
			spawner_id = "wall_guard_01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "wall_guard_02",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "wall_guard_03",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "windmill_guard",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	farmlands_prisoner_event_01 = {
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_01"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "square_front",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "square_center",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "sawmill_front",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "hay_barn_back",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_storm_vermin_commander") < 2
			end
		}
	},
	farmlands_hay_barn_guards = {
		{
			"spawn_at_raw",
			spawner_id = "hay_barn_guards",
			breed_name = "chaos_warrior"
		}
	},
	farmlands_prisoner_event_hay_barn = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_hay_barn"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "hay_barn_interior",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "hay_barn_interior",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "square_center",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		}
	},
	farmlands_saw_mill_guards = {
		{
			"spawn_at_raw",
			spawner_id = "saw_mill_guards",
			breed_name = "skaven_ratling_gunner"
		}
	},
	farmlands_prisoner_event_sawmill = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_sawmill"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sawmill_back",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "sawmill_back",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "square_back",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		}
	},
	farmlands_gate_open_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "farmlands_gate_open",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	ussingen_gate_guards = {
		{
			"spawn_at_raw",
			spawner_id = "gate_spawner_1",
			breed_name = "chaos_warrior"
		},
		{
			"delay",
			duration = 0.8
		},
		{
			"spawn_at_raw",
			spawner_id = "gate_spawner_2",
			breed_name = "chaos_warrior"
		}
	},
	ussingen_gate_open_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "ussingen_gate_open",
			composition_type = "event_ussingen_gate_group"
		},
		{
			"delay",
			duration = 15
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	ussingen_payload_event_01 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "ussingen_payload_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_start",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "ussingen_payload_start",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
			composition_type = "event_small_chaos"
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		}
	},
	ussingen_payload_event_02 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "ussingen_payload_event"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "ussingen_payload_square",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"control_specials",
			enable = true
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		}
	},
	ussingen_payload_event_03 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"event_horde",
			spawner_id = "ussingen_mansion_garden_payload",
			composition_type = "event_medium"
		}
	},
	ussingen_escape = {
		{
			"set_master_event_running",
			name = "ussingen_escape"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_escape_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "ussingen_escape_restart"
		}
	},
	demo_spawn_spawn = {
		{
			"set_master_event_running",
			name = "demo_spawn"
		},
		{
			"spawn_at_raw",
			spawner_id = "ussingen_demo_spawn",
			breed_name = "chaos_spawn"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 400,
			condition = function (t)
				return count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "ussingen_demo_spawn_dead"
		}
	},
	demo_spawn_fiend = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_demo_horde",
			composition_type = "end_boss_event_stormvermin"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "ussingen_demo_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 2.5
		},
		{
			"spawn_at_raw",
			spawner_id = "ussingen_demo_fiend",
			breed_name = "skaven_stormfiend_demo"
		}
	},
	fort_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	fort_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	fort_terror_event_climb = {
		{
			"set_master_event_running",
			name = "fort_terror_event_climb"
		},
		{
			"event_horde",
			spawner_id = "terror_event_climb",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_climb_done"
		}
	},
	fort_terror_event_inner_yard = {
		{
			"set_master_event_running",
			name = "fort_terror_event_inner_yard"
		},
		{
			"event_horde",
			spawner_id = "terror_event_inner_yard",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_inner_yard_done"
		}
	},
	fort_horde_gate = {
		{
			"set_master_event_running",
			name = "fort_horde_gate"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "fort_horde_gate",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_gate_done"
		}
	},
	fort_horde_basement = {
		{
			"set_master_event_running",
			name = "fort_horde_basement"
		},
		{
			"event_horde",
			spawner_id = "fort_horde_basement",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_basement_done"
		}
	},
	fort_horde_wall = {
		{
			"set_master_event_running",
			name = "fort_horde_wall"
		},
		{
			"event_horde",
			spawner_id = "fort_horde_wall",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_wall_done"
		}
	},
	fort_horde_cannon = {
		{
			"set_master_event_running",
			name = "fort_horde_cannon"
		},
		{
			"event_horde",
			spawner_id = "fort_horde_cannon",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_cannon_done"
		}
	},
	fort_horde_fleeing = {
		{
			"set_master_event_running",
			name = "fort_horde_fleeing"
		},
		{
			"event_horde",
			spawner_id = "fort_horde_fleeing",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_small_done"
		}
	},
	fort_siegers = {
		{
			"set_master_event_running",
			name = "fort_siegers"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_1",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_2",
			breed_name = "chaos_berzerker"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_3",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_4",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_5",
			breed_name = "chaos_berzerker"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_6",
			breed_name = "chaos_marauder"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "siege_broken"
		}
	},
	stronghold_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	stronghold_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	stronghold_horde_water_wheels = {
		{
			"set_master_event_running",
			name = "stronghold_horde_water_wheels"
		},
		{
			"event_horde",
			spawner_id = "stronghold_horde_water_wheels",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "stronghold_horde_water_wheels_done"
		}
	},
	stronghold_boss = {
		{
			"set_master_event_running",
			name = "stronghold_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "stronghold_boss",
			breed_name = "skaven_storm_vermin_warlord"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_warlord") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "stronghold_boss_killed"
		}
	},
	skittergate_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	skittergate_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	skittergate_spawn_guards = {
		{
			"spawn_at_raw",
			spawner_id = "gate_guard_01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gate_guard_02",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	skittergate_terror_event_01 = {
		{
			"set_master_event_running",
			name = "skittergate_terror_event_01"
		},
		{
			"event_horde",
			spawner_id = "terror_event_01",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_marauder") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_terror_event_01_done"
		}
	},
	skittergate_norsca_chaos_warrior = {
		{
			"spawn_at_raw",
			spawner_id = "skittergate_norsca_chaos_warrior",
			breed_name = "chaos_warrior"
		}
	},
	skittergate_chaos_boss = {
		{
			"set_master_event_running",
			name = "skittergate_chaos_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "skittergate_chaos_boss",
			breed_name = "chaos_exalted_champion_norsca"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_norsca") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_chaos_boss_killed"
		}
	},
	skittergate_terror_event_02 = {
		{
			"set_master_event_running",
			name = "skittergate_terror_event_02"
		},
		{
			"event_horde",
			spawner_id = "terror_event_02",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_terror_event_02_done"
		}
	},
	skittergate_rasknitt_boss = {
		{
			"set_master_event_running",
			name = "skittergate_rasknitt_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "skittergate_rasknitt_boss",
			breed_name = "skaven_grey_seer"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_stormfiend_boss") < 1 and count_event_breed("skaven_grey_seer") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_rasknitt_boss_killed"
		}
	},
	skittergate_crumble_escape_01 = {
		{
			"set_master_event_running",
			name = "skittergate_crumble_escape_01"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "skittergate_crumble_escape_01",
			composition_type = "event_prologue_well"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 10000,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1 and count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_crumble_escape_01_done"
		}
	},
	canyon_bell_event = {
		{
			"set_master_event_running",
			name = "canyon_bell_event"
		},
		{
			"event_horde",
			spawner_id = "canyon_bell_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "canyon_bell_event_done"
		}
	},
	canyon_ogre_boss = {
		{
			"spawn_at_raw",
			spawner_id = "canyon_ogre_boss",
			breed_name = "skaven_rat_ogre"
		}
	},
	canyon_escape_event = {
		{
			"set_master_event_running",
			name = "canyon_escape_event"
		},
		{
			"event_horde",
			spawner_id = "canyon_escape_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "canyon_escape_event_done"
		}
	},
	gz_end_event = {
		{
			"set_master_event_running",
			name = "gz_end_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gz_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"event_horde",
			spawner_id = "gz_end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gz_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				5,
				6
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	gz_chaos_boss = {
		{
			"set_master_event_running",
			name = "gz_chaos_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "warcamp_chaos_boss",
			breed_name = "chaos_exalted_sorcerer"
		},
		{
			"continue_when",
			duration = 600,
			condition = function (t)
				return count_event_breed("chaos_exalted_sorcerer") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "gz_chaos_boss_dead"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	gz_elevator_guards_a = {
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_5",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_6",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_1",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_2",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_3",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_4",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_5",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_6",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_7",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_8",
			breed_name = "skaven_clan_rat"
		},
		{
			"delay",
			duration = 5
		}
	},
	mines_enable_carry_bots = {
		{
			"enable_bots_in_carry_event"
		}
	},
	mines_disable_carry_bots = {
		{
			"disable_bots_in_carry_event"
		}
	},
	mines_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		}
	},
	mines_end_event_first_wave = {
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_first_wave_done"
		}
	},
	mines_end_event_loop = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "chaos_berzerkers"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_berzerker") < 2
			end
		},
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_mines_plague_monks"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stingers_plague_monk"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_loop_done"
		}
	},
	mines_end_event_loop_02 = {
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_loop_02_done"
		}
	},
	mines_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_specials_done"
		}
	},
	mines_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_specials_done"
		}
	},
	mines_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_specials_done"
		}
	},
	mines_end_event_stop = {
		{
			"stop_event",
			stop_event_name = "mines_end_event_loop"
		},
		{
			"stop_event",
			stop_event_name = "mines_end_event_loop_02"
		},
		{
			"disable_bots_in_carry_event"
		}
	},
	mines_end_event_intro_trolls = {
		{
			"spawn_at_raw",
			spawner_id = "troll_09",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_10",
			breed_name = "chaos_dummy_troll"
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_intro_trolls_done"
		}
	},
	mines_end_event_trolls = {
		{
			"spawn_at_raw",
			spawner_id = "troll_01",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_02",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_03",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_04",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_05",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_06",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_07",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_08",
			breed_name = "chaos_dummy_troll"
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_trolls_done"
		}
	},
	mines_enable_specials = {
		{
			"control_specials",
			enable = true
		}
	},
	mines_end_event_escape = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "escape",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "escape",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_escape_done"
		}
	},
	military_cannon_event_start = {
		{
			"control_pacing",
			enable = false
		}
	},
	military_cannon_event_end = {
		{
			"control_pacing",
			enable = true
		}
	},
	military_cannon_event_01 = {
		{
			"set_master_event_running",
			name = "military_cannon"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "cannon_event_02",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "cannon_event_02",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "cannon_event_02",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "cannon_event_02",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "military_cannon_event_01_done"
		}
	},
	military_cannon_event_specials = {
		{
			"set_master_event_running",
			name = "military_specials"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 25
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"flow_event",
			flow_event_name = "military_cannon_event_specials_done"
		}
	},
	military_cannon_event_02 = {
		{
			"set_master_event_running",
			name = "military_cannon"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "cannon_event_01",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "military_cannon_event_02_done"
		}
	},
	military_courtyard_event_start = {
		{
			"control_pacing",
			enable = false
		}
	},
	military_courtyard_event = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "military_courtyard"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerkers") < 3 and count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_marauder_with_shield") < 3 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "courtyard",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerkers") < 3 and count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_marauder_with_shield") < 3 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "courtyard",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_hidden",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3 and count_event_breed("event_mines_plague_monks") < 2
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_done"
		}
	},
	military_courtyard_event_specials_01 = {
		{
			"set_master_event_running",
			name = "military_courtyard_event_specials"
		},
		{
			"spawn",
			2,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_02 = {
		{
			"set_master_event_running",
			name = "military_courtyard_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_03 = {
		{
			"set_master_event_running",
			name = "military_courtyard_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_vortex_sorcerer") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_04 = {
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_05 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_temple_guards = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards01",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards03",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards05",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards06",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards07",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards08",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards09",
			breed_name = "chaos_warrior"
		}
	},
	military_end_event_survival_start = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "end_event_start",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "end_event_start",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_start_done"
		}
	},
	military_end_event_survival_01 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_01_done"
		}
	},
	military_end_event_survival_02_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_02_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_02_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_03_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_03_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_03_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_03_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_04_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left_hidden",
			composition_type = "chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_04_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right_hidden",
			composition_type = "chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_04_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back_hidden",
			composition_type = "chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_04_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back_hidden",
			composition_type = "chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_05_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_left",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_05_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_right",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_05_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_05_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_back",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_06_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_06_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_06_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_06_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_07_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_07_done"
		}
	},
	military_end_event_survival_07_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_07_done"
		}
	},
	military_end_event_survival_07_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_07_done"
		}
	},
	military_end_event_survival_07_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_07_done"
		}
	},
	military_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_04 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_05 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_06 = {
		{
			"set_master_event_running",
			name = "military_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_survival_escape = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_escape",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_escape_done"
		}
	},
	prologue_well_01 = {
		{
			"spawn_at_raw",
			spawner_id = "e01_r01",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r02",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r03",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r04",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r05",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r06",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r07",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r08",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r09",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r10",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r11",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r12",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"flow_event",
			flow_event_name = "prologue_well_01_done"
		}
	},
	prologue_well_02 = {
		{
			"spawn_at_raw",
			spawner_id = "e02_r01",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r02",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r03",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r04",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r05",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r06",
			breed_name = "skaven_dummy_slave"
		},
		{
			"flow_event",
			flow_event_name = "prologue_well_02_done"
		}
	},
	prologue_special_ability_event = {
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_01",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_02",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_03",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_sv",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"flow_event",
			flow_event_name = "prologue_special_ability_event_done"
		}
	},
	prologue_melee_pickup = {
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_melee_pickup",
			composition_type = "event_prologue_melee_pickup"
		}
	},
	prologue_ranged_roamers = {
		{
			"set_master_event_running",
			name = "prologue_ranged_roamers"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_01",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_02",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_03",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat_tutorial") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_roamers_done"
		}
	},
	prologue_ranged_event = {
		{
			"set_master_event_running",
			name = "prologue_ranged"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_ranged",
			composition_type = "event_prologue_ranged"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_event_done"
		}
	},
	prologue_nodamage_event = {
		{
			"spawn_at_raw",
			spawner_id = "nodamage_stormvermin",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_nodamage_event_done"
		}
	},
	prologue_push_event = {
		{
			"spawn_at_raw",
			spawner_id = "push_poor_rat",
			breed_name = "skaven_clan_rat_tutorial"
		}
	},
	prologue_block_event = {
		{
			"set_master_event_running",
			name = "prologue_block"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_a",
			composition_type = "event_prologue_block"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_marauder") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_block_event_done"
		}
	},
	prologue_dodge_event = {
		{
			"set_master_event_running",
			name = "prologue_dodge"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_b",
			composition_type = "event_prologue_dodge"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_raider") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_dodge_event_done"
		}
	},
	prologue_heavy_attack_event = {
		{
			"set_master_event_running",
			name = "prologue_heavy_attack"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "prologue_arena_c",
			composition_type = "event_prologue_practice_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_heavy_attack_event_done"
		}
	},
	prologue_practice_event_01 = {
		{
			"set_master_event_running",
			name = "prologue_practice_01"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_event_01_done"
		}
	},
	prologue_practice_event_02 = {
		{
			"set_master_event_running",
			name = "prologue_practice_02"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_event_02_done"
		}
	},
	prologue_practice_end = {
		{
			"set_master_event_running",
			name = "prologue_practice_end"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_end",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_end_done"
		}
	},
	prologue_clanrats_event = {
		{
			"spawn_at_raw",
			spawner_id = "light_melee_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "light_melee_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "light_melee_04",
			breed_name = "skaven_clan_rat"
		}
	},
	prologue_pre_ranged_event = {
		{
			"spawn_at_raw",
			spawner_id = "pre_ranged_01",
			breed_name = "chaos_marauder"
		}
	},
	prologue_roamers_event_01 = {
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_02",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_04",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_05",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_05",
			breed_name = "chaos_marauder"
		}
	},
	prologue_roamers_event_02 = {
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_05",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_07_roamer_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_07_roamer_02",
			breed_name = "skaven_clan_rat"
		}
	},
	prologue_roamers_event_03 = {
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_02",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_04",
			breed_name = "chaos_marauder"
		}
	},
	prologue_horde_event = {
		{
			"set_master_event_running",
			name = "prologue_horde"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
			composition_type = "event_prologue_horde"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
			composition_type = "event_prologue_horde"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1 and count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_horde_event_done"
		}
	},
	prologue_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"prologue_marauder"
			},
			splines = {
				"patrol"
			}
		}
	},
	prologue_elevator = {
		{
			"set_master_event_running",
			name = "prologue_elevator"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_01",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_02",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_03",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_04",
			composition_type = "event_smaller"
		},
		{
			"flow_event",
			flow_event_name = "prologue_helmgart_chase_done"
		}
	},
	prologue_helmgart_chase = {
		{
			"set_master_event_running",
			name = "prologue_helmgart_chase"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "helmgart_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_helmgart_chase_done"
		}
	},
	bell_event_dynspawn_middle01 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"flow_event",
			flow_event_name = "middledyn01_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn01",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn01_wave_complete"
		}
	},
	bell_event_dynspawn_middle02 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"flow_event",
			flow_event_name = "middledyn02_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn02",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn02_wave_complete"
		}
	},
	bell_event_dynspawn_middle03 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"flow_event",
			flow_event_name = "middledyn03_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn03",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn03_wave_complete"
		}
	},
	bell_event_dynspawn_middle04 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"flow_event",
			flow_event_name = "middledyn04_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn04",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn04_wave_complete"
		}
	},
	bell_event_dynspawn_last01 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_last"
		},
		{
			"flow_event",
			flow_event_name = "last01_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_last_spawner_dyn",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "last01_wave_complete"
		}
	},
	bell_event_dynspawn_last02 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_last"
		},
		{
			"flow_event",
			flow_event_name = "last02_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_last_spawner_dyn",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "last02_wave_complete"
		}
	},
	bell_spawn01 = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	bell_spawn02 = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d2",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_d2",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete02"
		}
	},
	bell_spawn02ending = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d3",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_d3",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete02ending"
		}
	},
	bell_spawn03 = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "spawner_e",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_e",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_e2",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_e2",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete03"
		}
	},
	bell_rat_ogre = {
		{
			"spawn_at_raw",
			spawner_id = "bell_rat_ogre",
			breed_name = "skaven_rat_ogre"
		}
	},
	bell_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	nurgle_spawn_zombies_test = {
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_01",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_02",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_03",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_04",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_05",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_06",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_07",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_08",
			breed_name = "chaos_zombie"
		},
		{
			"flow_event",
			flow_event_name = "nurgle_spawn_zombies_test_done"
		}
	},
	nurgle_end_event_start = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		}
	},
	nurgle_end_event_stinger = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	nurgle_end_event01 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event01"
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "nurgle_end_event_chaos",
			composition_type = "chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "nurgle_end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_monk",
			composition_type = "event_mines_plague_monks"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stingers_plague_monk"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event01_done"
		}
	},
	nurgle_end_event_escape = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_master_event_running",
			name = "nurgle_end_escape"
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event02",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_escape_done"
		}
	},
	nurgle_end_event_escape_02 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_master_event_running",
			name = "nurgle_end_escape"
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event02",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event02",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event02",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_escape_02_done"
		}
	},
	nurgle_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event_specials"
		},
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_specials_done"
		}
	},
	nurgle_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_specials_done"
		}
	},
	nurgle_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_specials_done"
		}
	},
	nurgle_end_event_enable_specials = {
		{
			"control_specials",
			enable = true
		}
	},
	warcamp_payload = {
		{
			"set_master_event_running",
			name = "warcamp_payload"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_l",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
			composition_type = "chaos_berzerkers"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
			composition_type = "chaos_berzerkers"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
			composition_type = "chaos_shields"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_l",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "warcamp_payload"
		}
	},
	warcamp_chaos_boss = {
		{
			"set_master_event_running",
			name = "warcamp_chaos_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "warcamp_chaos_boss",
			breed_name = "chaos_exalted_champion_warcamp"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_warcamp") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "warcamp_chaos_boss_dead"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	warcamp_door_guard = {
		{
			"spawn_at_raw",
			spawner_id = "wc_shield_dude_1",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_shield_dude_2",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_sword_dude_1",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_sword_dude_2",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_2h_dude_1",
			breed_name = "chaos_raider"
		}
	},
	warcamp_camp = {
		{
			"set_master_event_running",
			name = "warcamp_camp"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "camp_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "warcamp_camp_restart"
		}
	},
	warcamp_arena_chase = {
		{
			"set_master_event_running",
			name = "warcamp_chase"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_chase",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "warcamp_chase_restart"
		}
	}
}

for chunk_name, chunk in pairs(WeightedRandomTerrorEvents) do
	for i = 1, #chunk, 2 do
		local event_name = chunk[i]

		fassert(TerrorEventBlueprints[event_name], "TerrorEventChunk %s has a bad event: '%s'.", chunk_name, tostring(event_name))
	end

	chunk.loaded_probability_table = LoadedDice.create_from_mixed(chunk)
end

return 
