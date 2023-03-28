Missions = {
	test_collect_01 = {
		text = "test_collect_01_mission_text",
		mission_template_name = "collect",
		collect_amount = 1,
		hidden = true
	},
	test_defend_01 = {
		text = "test_defend_01_mission_text",
		defend_amount = 1,
		mission_template_name = "defend"
	},
	test_timed_01 = {
		text = "test_timed_01_mission_text",
		duration = 18,
		mission_template_name = "timed"
	},
	escape_ferry = {
		mission_template_name = "simple",
		text = "generic_escape_ferry"
	},
	escape_wagon = {
		mission_template_name = "simple",
		text = "generic_escape_wagon"
	},
	escape_elevator = {
		mission_template_name = "simple",
		text = "generic_escape_elevator"
	},
	magnus_door_bombing_01 = {
		text = "magnus_door_bombing_01_mission_text",
		mission_template_name = "collect",
		collect_amount = 3
	},
	magnus_alert_guards = {
		mission_template_name = "goal",
		text = "magnus_alert_guards_mission_text"
	},
	magnus_reach_tower = {
		mission_template_name = "goal",
		text = "magnus_reach_tower_mission_text"
	},
	magnus_sound_horn = {
		mission_template_name = "goal",
		text = "magnus_sound_horn_mission_text"
	},
	magnus_reach_top = {
		mission_template_name = "goal",
		text = "magnus_reach_top_mission_text"
	},
	mission_goal_magnus_survive_attack = {
		mission_template_name = "goal",
		text = "mission_goal_magnus_survive"
	},
	mission_goal_magnus_escape = {
		mission_template_name = "goal",
		text = "mission_goal_magnus_escape"
	},
	mission_goal_magnus_elevator = {
		mission_template_name = "goal",
		text = "mission_goal_magnus_elevator"
	},
	farm_gathering_event = {
		text = "farm_gathering_event",
		mission_template_name = "collect",
		collect_amount = 6
	},
	courtyard_defend = {
		mission_template_name = "goal",
		text = "courtyard_defend_mission_text"
	},
	courtyard_defend_well_a = {
		text = "courtyard_well_a_mission_text",
		defend_amount = 1,
		mission_template_name = "defend"
	},
	courtyard_defend_well_b = {
		text = "courtyard_well_b_mission_text",
		defend_amount = 1,
		mission_template_name = "defend"
	},
	beer_collection = {
		text = "collect_beer_mission_text",
		mission_template_name = "collect",
		collect_amount = 4
	},
	forest_ambush_doomwheel_bombing = {
		text = "forest_ambush_doomwheel_bombing_mission_text",
		mission_template_name = "collect",
		collect_amount = 3
	},
	docks_destroy_pillars = {
		text = "docks_destroy_pillars_mission_text",
		mission_template_name = "collect",
		collect_amount = 4
	},
	docks_bomb_event = {
		text = "docks_bomb_event_mission_text",
		mission_template_name = "collect",
		collect_amount = 5
	},
	bridge_gathering_event = {
		text = "mission_objective_bridge_gathering_event",
		mission_template_name = "collect",
		collect_amount = 8
	},
	mission_objective_city_walls_destroy_chains = {
		text = "mission_objective_city_walls_destroy_chains",
		mission_template_name = "collect",
		collect_amount = 4
	},
	tunnels_bomb_pillar = {
		text = "tunnels_bomb_pillar_mission_text",
		mission_template_name = "collect",
		collect_amount = 3
	},
	mission_objective_cemetery_cut_down_all = {
		text = "mission_objective_cemetery_cut_chains",
		mission_template_name = "collect",
		collect_amount = 4
	},
	end_boss_destroy_supports = {
		text = "mission_objective_end_boss_destroy_supports",
		mission_template_name = "collect",
		collect_amount = 3
	},
	end_boss_destroy_chains = {
		text = "mission_objective_end_boss_destroy_chains",
		mission_template_name = "collect",
		collect_amount = 4
	},
	merchant_gathering_event = {
		text = "merchant_gathering_event_mission_text",
		mission_template_name = "collect",
		collect_amount = 5
	},
	dlc_castle_enter_castle = {
		mission_template_name = "goal",
		text = "dlc1_4_castle_enter_castle_mission_text"
	},
	dlc_castle_find_chalice = {
		mission_template_name = "goal",
		text = "dlc1_4_castle_find_chalice_mission_text"
	},
	dlc_castle_get_chalice = {
		mission_template_name = "goal",
		text = "dlc1_4_castle_get_chalice_mission_text"
	},
	dlc_castle_escape = {
		mission_template_name = "goal",
		text = "dlc1_4_castle_escape_mission_text"
	},
	dlc_castle_statuettes = {
		text = "dlc1_4_castle_statuettes_mission_text",
		mission_template_name = "collect",
		collect_amount = 3
	},
	whitebox_tutorial_sidemission_1 = {
		is_side_mission = true,
		collect_amount = 3,
		mission_template_name = "collect",
		text = "magnus_door_bombing_01_mission_text"
	},
	tome_bonus_mission = {
		is_side_mission = true,
		evaluation_type = "amount",
		mission_template_name = "collect_uncompletable",
		experience_per_amount = 20,
		evaluate_at_level_end = true,
		collect_amount = 3,
		dice_type = "gold",
		text = "tome_bonus_mission_text",
		dice_per_amount = 1
	},
	grimoire_hidden_mission = {
		is_side_mission = true,
		evaluation_type = "amount",
		mission_template_name = "collect_uncompletable",
		experience_per_amount = 50,
		evaluate_at_level_end = true,
		collect_amount = 2,
		dice_type = "warpstone",
		hidden = true,
		text = "grimoire_hidden_mission_text",
		dice_per_amount = 1
	},
	bonus_dice_hidden_mission = {
		is_side_mission = true,
		evaluation_type = "amount",
		mission_template_name = "collect_uncompletable",
		experience_per_amount = 5,
		evaluate_at_level_end = true,
		collect_amount = 2,
		dice_type = "metal",
		hidden = true,
		text = "bonus_dice_hidden_mission_text",
		dice_per_amount = 1
	},
	painting_scrap_hidden_mission = {
		text = "bonus_painting_scrap_hidden_mission_text",
		collect_amount = 1,
		mission_template_name = "collect_uncompletable",
		experience_per_amount = 5,
		evaluation_type = "amount",
		evaluate_at_level_end = true,
		is_side_mission = true,
		hidden = true
	},
	players_alive_mission = {
		text = "players_alive_mission_text",
		is_side_mission = true,
		mission_template_name = "players_alive",
		experience_per_amount = 25,
		evaluation_type = "amount",
		evaluate_at_level_end = true,
		hidden = true
	},
	whitebox_tutorial_goal_1 = {
		mission_template_name = "goal",
		text = "forest_ambush_call_boat_mission_text"
	},
	whitebox_tutorial_goal_2 = {
		mission_template_name = "goal",
		text = "forest_ambush_escape_boat_mission_text"
	},
	mission_sewers_short_open_door_1 = {
		text = "mission_sewers_short_open_door_1",
		mission_template_name = "goal",
		collect_amount = 1
	},
	mission_sewers_short_open_door_2 = {
		text = "mission_sewers_short_open_door_2",
		mission_template_name = "goal",
		collect_amount = 1
	},
	mission_sewers_short_clear_path = {
		text = "mission_sewers_short_clear_path",
		mission_template_name = "goal",
		collect_amount = 1
	},
	mission_sewers_short_leave_sewer = {
		text = "mission_sewers_short_leave_sewer",
		mission_template_name = "goal",
		collect_amount = 1
	},
	mission_sewers_short_escape = {
		text = "mission_sewers_short_escape",
		mission_template_name = "goal",
		collect_amount = 1
	},
	bridge_reach_bridge = {
		text = "mission_goal_bridge_reach_bridge",
		mission_template_name = "goal",
		collect_amount = 1
	},
	bridge_escape = {
		text = "mission_goal_bridge_escape",
		mission_template_name = "goal",
		collect_amount = 1
	},
	merchant_find_district = {
		text = "mission_goal_merchant_find_district",
		mission_template_name = "goal",
		collect_amount = 1
	},
	merchant_reach_square = {
		text = "mission_goal_merchant_reach_square",
		mission_template_name = "goal",
		collect_amount = 1
	},
	merchant_escape = {
		text = "mission_goal_merchant_escape",
		mission_template_name = "goal",
		collect_amount = 1
	},
	mission_city_walls_up = {
		mission_template_name = "goal",
		text = "mission_city_walls_up"
	},
	mission_city_walls_find_bell = {
		mission_template_name = "goal",
		text = "mission_city_walls_find_bell"
	},
	mission_city_walls_destroy_bell = {
		mission_template_name = "goal",
		text = "mission_city_walls_destroy_bell"
	},
	mission_city_walls_destroy_support = {
		mission_template_name = "goal",
		text = "mission_city_walls_destroy_support"
	},
	mission_city_walls_escape = {
		mission_template_name = "goal",
		text = "mission_city_walls_escape"
	},
	forest_ambush_find_camp = {
		mission_template_name = "goal",
		text = "forest_ambush_find_camp_mission_text"
	},
	forest_ambush_leave_camp = {
		mission_template_name = "goal",
		text = "forest_ambush_leave_camp_mission_text"
	},
	forest_ambush_get_to_the_river = {
		mission_template_name = "goal",
		text = "forest_ambush_get_to_the_river_mission_text"
	},
	forest_ambush_call_boat = {
		mission_template_name = "goal",
		text = "forest_ambush_call_boat_mission_text"
	},
	forest_ambush_wait_for_boat = {
		mission_template_name = "goal",
		text = "forest_ambush_wait_for_boat_mission_text"
	},
	forest_ambush_escape_boat = {
		mission_template_name = "goal",
		text = "forest_ambush_escape_boat_mission_text"
	},
	tunnels_start = {
		mission_template_name = "goal",
		text = "tunnels_start_mission_text"
	},
	tunnels_investigate_tunnels = {
		mission_template_name = "goal",
		text = "tunnels_investigate_tunnels_mission_text"
	},
	tunnels_escape = {
		mission_template_name = "goal",
		text = "tunnels_escape_mission_text"
	},
	tunnels_to_ferry_lady = {
		mission_template_name = "goal",
		text = "tunnels_to_ferry_lady_mission_text"
	},
	mission_goal_cemetery_wall = {
		mission_template_name = "goal",
		text = "mission_goal_cemetery_wall"
	},
	mission_goal_cemetery_source = {
		mission_template_name = "goal",
		text = "mission_goal_cemetery_source"
	},
	mission_goal_cemetery_entrance = {
		mission_template_name = "goal",
		text = "mission_goal_cemetery_entrance"
	},
	mission_goal_cemetery_cut_down = {
		mission_template_name = "goal",
		text = "mission_goal_cemetery_cut_down"
	},
	mission_goal_cemetery_get_back = {
		mission_template_name = "goal",
		text = "mission_goal_cemetery_get_back"
	},
	docks_start_goal = {
		mission_template_name = "goal",
		text = "docks_start_goal_mission_text"
	},
	docks_next_warehouse = {
		mission_template_name = "goal",
		text = "docks_next_warehouse_mission_text"
	},
	docks_back_to_boat = {
		mission_template_name = "goal",
		text = "docks_back_to_boat_mission_text"
	},
	docks_escape_house = {
		mission_template_name = "goal",
		text = "docks_escape_house_mission_text"
	},
	end_boss_find_lair = {
		mission_template_name = "goal",
		text = "mission_goal_end_boss_find_lair"
	},
	end_boss_enter_lair = {
		mission_template_name = "goal",
		text = "mission_goal_end_boss_enter_lair"
	},
	end_boss_open_door = {
		mission_template_name = "goal",
		text = "mission_objective_end_boss_open_door"
	},
	end_boss_proceed_upwards_1 = {
		mission_template_name = "goal",
		text = "mission_objective_end_boss_proceed_up"
	},
	end_boss_proceed_upwards_2 = {
		mission_template_name = "goal",
		text = "mission_objective_end_boss_proceed_up"
	},
	end_boss_destroy_bell = {
		mission_template_name = "goal",
		text = "mission_goal_end_boss_destroy_bell"
	},
	end_boss_stop_seer = {
		mission_template_name = "goal",
		text = "mission_goal_end_boss_stop_seer"
	},
	end_boss_escape = {
		mission_template_name = "goal",
		text = "mission_goal_end_boss_escape"
	},
	survival_wave = {
		text = "dlc1_2_survival_mission_waves_completed",
		wave_prepare_text = "dlc1_2_survival_mission_prepare",
		mission_template_name = "survival",
		evaluate_at_level_end = true,
		wave_completed_text = "dlc1_2_survival_mission_wave_completed",
		experience_per_percent = 0.7,
		wave_text = "dlc1_2_survival_mission_wave"
	},
	dlc1_4_portals_find_camp = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_find_camp"
	},
	dlc1_4_portals_portal_a = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_portal_a"
	},
	dlc1_4_portals_portal_b = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_portal_b"
	},
	dlc1_4_portals_portal_c = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_portal_c"
	},
	dlc1_4_portals_escape = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_escape"
	},
	dlc1_4_portals_overheat_a = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_overheat_a"
	},
	dlc1_4_portals_overheat_b = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_overheat_b"
	},
	dlc1_4_portals_overheat_c = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_goal_portals_overheat_c"
	},
	mission_dlc_castle_dungeon_search_dungeon = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_search_dungeon"
	},
	mission_dlc_castle_dungeon_push_through = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_push_through"
	},
	mission_dlc_castle_dungeon_grab_artifact1 = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_grab_artifact1"
	},
	mission_dlc_castle_dungeon_continue_search = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_continue_search"
	},
	mission_dlc_castle_dungeon_descend_darkness_with_torch = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_descend_darkness_with_torch"
	},
	mission_dlc_castle_dungeon_grab_artifact2 = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_grab_artifact2"
	},
	mission_dlc_castle_dungeon_survive_until_way_out = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_survive_until_way_out"
	},
	mission_dlc_castle_dungeon_escape_up = {
		mission_template_name = "goal",
		text = "dlc1_4_mission_dungeon_escape_up"
	},
	tutorial_movement = {
		text = "mission_objective_tutorial_movement",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_move",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "move_forward"
			},
			{
				suffix = "",
				prefix = "",
				action = "move_left_pressed"
			},
			{
				suffix = "",
				prefix = "",
				action = "move_back_pressed"
			},
			{
				suffix = "",
				prefix = "",
				action = "move_right_pressed"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "move_forward"
			}
		}
	},
	tutorial_jumping = {
		text = "mission_objective_tutorial_jumping",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_jump",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "dodge"
			}
		}
	},
	tutorial_dodge_left = {
		text = "mission_objective_tutorial_dodge_left",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "mission_objective_tutorial_dodge_left",
		tooltip_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "move_left"
			},
			{
				suffix = "",
				prefix = "",
				action = "dodge"
			}
		}
	},
	tutorial_dodge_back = {
		text = "mission_objective_tutorial_dodge_back",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "mission_objective_tutorial_dodge_back",
		tooltip_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "move_back"
			},
			{
				suffix = "",
				prefix = "",
				action = "dodge"
			}
		}
	},
	tutorial_dodge_right = {
		text = "mission_objective_tutorial_dodge_right",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "mission_objective_tutorial_dodge_right",
		tooltip_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "move_right"
			},
			{
				suffix = "",
				prefix = "",
				action = "dodge"
			}
		}
	},
	tutorial_light_attack = {
		text = "mission_objective_tutorial_light_attack",
		collect_amount = 3,
		mission_template_name = "collect",
		tooltip_text = "tutorial_tooltip_light_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	tutorial_heavy_attack = {
		text = "mission_objective_tutorial_heavy_attack",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_heavy_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "input_hold",
				action = "action_one_hold"
			}
		}
	},
	tutorial_switch_weapon = {
		text = "mission_objective_tutorial_switch_weapon",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_switch_weapon",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_switch"
			}
		}
	},
	tutorial_no_damage = {
		text = "mission_objective_tutorial_no_damage",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_no_damage",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_switch"
			}
		}
	},
	tutorial_ranged_normal_attack = {
		text = "mission_objective_tutorial_ranged_normal_attack",
		collect_amount = 5,
		mission_template_name = "collect",
		tooltip_text = "tutorial_tooltip_normal_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	tutorial_ranged_alternative_attack = {
		text = "mission_objective_tutorial_ranged_alternative_attack",
		collect_amount = 3,
		mission_template_name = "collect",
		tooltip_text = "tutorial_tooltip_alternative_attack",
		tooltip_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "action_two_hold"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	tutorial_blocking = {
		text = "mission_objective_tutorial_blocking",
		collect_amount = 3,
		mission_template_name = "collect",
		tooltip_text = "tutorial_tooltip_block",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_two_hold"
			}
		}
	},
	tutorial_pushing = {
		text = "mission_objective_tutorial_pushing",
		collect_amount = 3,
		mission_template_name = "collect",
		tooltip_text = "tutorial_tooltip_push",
		tooltip_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "action_two_hold"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	tutorial_pickup_grenade = {
		text = "mission_objective_tutorial_pickup_grenade",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_pickup_ammo = {
		text = "mission_objective_tutorial_pickup_ammo",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_throw_grenade = {
		text = "mission_objective_tutorial_throw_grenade",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_throw_grenade",
		tooltip_inputs = {
			{
				suffix = "->",
				prefix = "",
				action = "wield_5"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "->",
				prefix = "",
				action = "wield_5"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	tutorial_pickup_potion = {
		text = "mission_objective_tutorial_pickup_potion",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_use_potion = {
		text = "mission_objective_tutorial_use_potion",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		hidden = true,
		tooltip_text = "tutorial_tooltip_use_potion",
		tooltip_inputs = {
			{
				suffix = "->",
				prefix = "",
				action = "wield_4"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one_hold"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "->",
				prefix = "",
				action = "wield_4"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one_hold"
			}
		}
	},
	tutorial_pickup_barrel = {
		text = "mission_objective_tutorial_pickup_barrel",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_place_barrel = {
		text = "mission_objective_tutorial_place_barrel",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_place_barrel",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	tutorial_pickup_draught = {
		mission_template_name = "simple",
		text = "mission_objective_tutorial_pickup_draught"
	},
	tutorial_use_draught = {
		mission_template_name = "simple",
		text = "mission_objective_tutorial_use_draught"
	},
	tutorial_pickup_healthkit = {
		text = "mission_objective_tutorial_pickup_healthkit",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_heal_ally = {
		text = "mission_objective_tutorial_heal_ally",
		mission_template_name = "simple",
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_heal_ally",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_3"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_3"
			}
		}
	},
	tutorial_continue = {
		text = "mission_objective_tutorial_continue",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_survive_attack = {
		text = "mission_objective_tutorial_survive_attack",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_go_to_end = {
		text = "mission_objective_tutorial_go_to_end",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial_kill_remaining = {
		text = "mission_objective_tutorial_kill_remaining",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	tutorial = {
		mission_template_name = "tutorial",
		hidden = true
	},
	escape_into_portal = {
		mission_template_name = "goal",
		text = "mission_escape_into_portal"
	},
	catacombs_search_building = {
		mission_template_name = "goal",
		text = "mission_catacombs_search_building"
	},
	catacombs_follow_trail = {
		mission_template_name = "goal",
		text = "mission_catacombs_follow_trail"
	},
	catacombs_open_door = {
		text = "mission_catacombs_open_door",
		mission_template_name = "collect",
		collect_amount = 3
	},
	catacombs_find_ritual = {
		mission_template_name = "goal",
		text = "mission_catacombs_find_ritual"
	},
	catacombs_disrupt_ritual = {
		mission_template_name = "goal",
		text = "mission_catacombs_disrupt_ritual"
	},
	catacombs_stay_inside_circle = {
		mission_template_name = "goal",
		text = "mission_catacombs_stay_inside_circle"
	},
	catacombs_escape = {
		mission_template_name = "goal",
		text = "mission_catacombs_escape"
	},
	chamber_inn = {
		mission_template_name = "goal",
		text = "mission_chamber_defend"
	},
	chamber_cellar = {
		mission_template_name = "goal",
		text = "mission_chamber_cellar"
	},
	chamber_sewer = {
		mission_template_name = "goal",
		text = "mission_chamber_sewer_hunt"
	},
	chamber_machine = {
		mission_template_name = "goal",
		text = "mission_chamber_stop_machine"
	},
	elven_ruins_get_to_ruins = {
		mission_template_name = "goal",
		text = "mission_elven_ruins_get_to_ruins"
	},
	elven_ruins_proceed_through_woods = {
		mission_template_name = "goal",
		text = "mission_elven_ruins_proceed_through_woods"
	},
	elven_ruins_break_through_maze = {
		mission_template_name = "goal",
		text = "mission_elven_ruins_break_through_maze"
	},
	elven_ruins_make_way_to_puzzle = {
		mission_template_name = "goal",
		text = "mission_elven_ruins_make_way_to_puzzle"
	},
	elven_ruins_realign_leylines = {
		text = "mission_elven_ruins_realign_leylines",
		mission_template_name = "collect",
		collect_amount = 3
	},
	elven_ruins_survive_until_alignment = {
		mission_template_name = "goal",
		text = "mission_elven_ruins_survive_until_alignment"
	},
	elven_ruins_escape_into_portal = {
		mission_template_name = "goal",
		text = "mission_elven_ruins_escape_into_portal"
	},
	fort_follow_road = {
		mission_template_name = "goal",
		text = "mission_fort_follow_road"
	},
	fort_reach_fort = {
		mission_template_name = "goal",
		text = "mission_fort_reach_fort"
	},
	fort_reach_inner_courtyard = {
		mission_template_name = "goal",
		text = "mission_fort_reach_inner_courtyard"
	},
	fort_reach_outer_courtyard = {
		mission_template_name = "goal",
		text = "mission_fort_reach_outer_courtyard"
	},
	fort_reach_gate = {
		mission_template_name = "goal",
		text = "mission_fort_reach_gate"
	},
	fort_talk_to_survivors = {
		mission_template_name = "goal",
		text = "mission_fort_talk_to_survivors"
	},
	fort_defend_the_gate = {
		mission_template_name = "goal",
		text = "mission_fort_defend_the_gate"
	},
	fort_use_cannon_01 = {
		mission_template_name = "goal",
		text = "mission_fort_use_cannon_01"
	},
	fort_use_cannon_02 = {
		mission_template_name = "goal",
		text = "mission_fort_use_cannon_02"
	},
	fort_use_cannon_03 = {
		mission_template_name = "goal",
		text = "mission_fort_use_cannon_03"
	},
	fort_use_cannon_04 = {
		mission_template_name = "goal",
		text = "mission_fort_use_cannon_04"
	},
	fort_load_cannon = {
		mission_template_name = "goal",
		text = "mission_fort_load_cannon"
	},
	fort_rescue_prisoners = {
		mission_template_name = "goal",
		text = "mission_fort_rescue_prisoners"
	},
	fort_break_siege = {
		mission_template_name = "goal",
		text = "mission_fort_break_siege"
	},
	fort_escape_into_portal = {
		mission_template_name = "goal",
		text = "mission_fort_escape_into_portal"
	},
	farmlands_reach_first_farm = {
		mission_template_name = "goal",
		text = "mission_farmlands_reach_first_farm"
	},
	farmlands_find_and_free_the_prisoners = {
		text = "mission_farmlands_find_and_free_the_prisoners",
		mission_template_name = "collect",
		collect_amount = 4
	},
	farmlands_reach_second_farm = {
		mission_template_name = "goal",
		text = "mission_farmlands_reach_second_farm"
	},
	farmlands_get_key_for_barn = {
		mission_template_name = "goal",
		text = "mission_farmlands_get_the_key_for_the_barn"
	},
	farmlands_unlock_and_find_a_way_through_barn = {
		mission_template_name = "goal",
		text = "mission_farmlands_unlock_and_find_a_way_through_the_barn"
	},
	farmlands_reach_third_farm = {
		mission_template_name = "goal",
		text = "mission_farmlands_reach_third_farm"
	},
	farmlands_free_the_prisoners_and_clear_the_area = {
		text = "mission_farmlands_free_the_prisoners_and_clear_the_area",
		mission_template_name = "collect",
		collect_amount = 3
	},
	farmlands_free_prisoners_01 = {
		mission_template_name = "goal",
		text = "mission_farmlands_free_prisoners_01"
	},
	farmlands_free_prisoners_02 = {
		text = "mission_farmlands_free_prisoners_02",
		mission_template_name = "collect",
		collect_amount = 4
	},
	farmlands_free_prisoners_03 = {
		text = "mission_farmlands_free_prisoners_03",
		mission_template_name = "collect",
		collect_amount = 2
	},
	farmlands_free_prisoners_04 = {
		text = "mission_farmlands_free_prisoners_04",
		mission_template_name = "collect",
		collect_amount = 4
	},
	farmlands_escape = {
		mission_template_name = "goal",
		text = "mission_farmlands_escape"
	},
	ussingen_enter_ussingen = {
		mission_template_name = "goal",
		text = "mission_ussingen_enter_ussingen"
	},
	ussingen_reach_mansion = {
		mission_template_name = "goal",
		text = "mission_ussingen_reach_mansion"
	},
	ussingen_find_explosive = {
		mission_template_name = "goal",
		text = "mission_ussingen_find_explosive"
	},
	ussingen_event = {
		text = "mission_ussingen_event",
		mission_template_name = "collect",
		collect_amount = 3
	},
	ussingen_deliver = {
		mission_template_name = "goal",
		text = "mission_ussingen_deliver"
	},
	ussingen_light_push = {
		mission_template_name = "goal",
		text = "mission_ussingen_light_push"
	},
	ussingen_escape = {
		mission_template_name = "goal",
		text = "mission_ussingen_escape"
	},
	ussingen_use_portal = {
		mission_template_name = "goal",
		text = "mission_ussingen_use_portal"
	},
	ground_zero_city_center = {
		mission_template_name = "goal",
		text = "mission_ground_zero_city_center"
	},
	ground_zero_down_terraces = {
		mission_template_name = "goal",
		text = "mission_ground_zero_down_terraces"
	},
	ground_zero_elevator = {
		mission_template_name = "goal",
		text = "mission_ground_zero_elevator"
	},
	ground_zero_locate_device = {
		mission_template_name = "goal",
		text = "mission_ground_zero_locate_device"
	},
	ground_zero_cross_hole = {
		mission_template_name = "goal",
		text = "mission_ground_zero_cross_hole"
	},
	ground_zero_kill_boss = {
		mission_template_name = "goal",
		text = "mission_ground_zero_kill_boss"
	},
	ground_zero_escape = {
		mission_template_name = "goal",
		text = "mission_ground_zero_escape"
	},
	mines_find_explosives = {
		mission_template_name = "goal",
		text = "mission_mines_find_explosives"
	},
	mines_push_cart = {
		mission_template_name = "goal",
		text = "mission_mines_push_cart"
	},
	mines_collect_explosives = {
		text = "mission_mines_collect_explosives",
		mission_template_name = "collect",
		collect_amount = 3
	},
	mines_find_cart = {
		mission_template_name = "goal",
		text = "mission_mines_find_cart"
	},
	mines_transport_explosives = {
		mission_template_name = "goal",
		text = "mission_mines_transport_explosives"
	},
	mines_find_cart_again = {
		mission_template_name = "goal",
		text = "mission_mines_find_cart_again"
	},
	mines_destroy_altar = {
		mission_template_name = "goal",
		text = "mission_mines_destroy_altar"
	},
	mines_ring_bell = {
		mission_template_name = "goal",
		text = "mission_mines_ring_bell"
	},
	mines_over_the_bridge = {
		mission_template_name = "goal",
		text = "mission_mines_over_the_bridge"
	},
	mines_escape_portal = {
		mission_template_name = "goal",
		text = "mission_mines_escape_portal"
	},
	stronghold_find_the_rail_tracks = {
		mission_template_name = "goal",
		text = "mission_stronghold_find_the_rail_tracks"
	},
	stronghold_follow_the_tracks_to_the_foundry = {
		mission_template_name = "goal",
		text = "mission_stronghold_follow_the_tracks_to_the_foundry"
	},
	stronghold_find_another_way_to_the_foundry = {
		mission_template_name = "goal",
		text = "mission_stronghold_find_another_way_to_the_foundry"
	},
	stronghold_continue_to_the_city = {
		mission_template_name = "goal",
		text = "mission_stronghold_continue_to_the_city"
	},
	stronghold_reach_the_temple = {
		mission_template_name = "goal",
		text = "mission_stronghold_reach_the_temple"
	},
	stronghold_get_up_on_the_aqueduct = {
		mission_template_name = "goal",
		text = "mission_stronghold_get_up_on_the_aqueduct"
	},
	stronghold_enter_the_temple = {
		mission_template_name = "goal",
		text = "mission_stronghold_enter_the_temple"
	},
	stronghold_kill_the_warlord = {
		mission_template_name = "goal",
		text = "mission_stronghold_kill_the_warlord"
	},
	stronghold_escape_the_stronghold = {
		mission_template_name = "goal",
		text = "mission_stronghold_escape_the_stronghold"
	},
	skittergate_reach_skittergate = {
		mission_template_name = "goal",
		text = "mission_skittergate_reach_skittergate"
	},
	skittergate_open_gate = {
		mission_template_name = "goal",
		text = "mission_skittergate_open_gate"
	},
	skittergate_go_through_gate = {
		mission_template_name = "goal",
		text = "mission_skittergate_go_through_gate"
	},
	skittergate_find_camp_backdoor = {
		mission_template_name = "goal",
		text = "mission_skittergate_find_camp_backdoor"
	},
	skittergate_reach_docks = {
		mission_template_name = "goal",
		text = "mission_skittergate_reach_docks"
	},
	skittergate_enter_camp = {
		mission_template_name = "goal",
		text = "mission_skittergate_enter_camp"
	},
	skittergate_find_key = {
		mission_template_name = "goal",
		text = "mission_skittergate_find_key"
	},
	skittergate_kill_gatekeeper = {
		mission_template_name = "goal",
		text = "mission_skittergate_kill_gatekeeper"
	},
	skittergate_get_key = {
		mission_template_name = "goal",
		text = "mission_skittergate_get_key"
	},
	skittergate_get_back_to_gate = {
		mission_template_name = "goal",
		text = "mission_skittergate_get_back_to_gate"
	},
	skittergate_turn_on_gate = {
		mission_template_name = "goal",
		text = "mission_skittergate_turn_on_gate"
	},
	skittergate_destroy_generators = {
		text = "mission_skittergate_destroy_generators",
		mission_template_name = "collect",
		collect_amount = 3
	},
	skittergate_hurry_through_gate = {
		mission_template_name = "goal",
		text = "mission_skittergate_hurry_through_gate"
	},
	skittergate_kill_rasknitt = {
		mission_template_name = "goal",
		text = "mission_skittergate_kill_rasknitt"
	},
	skittergate_hurry_to_the_elevator = {
		mission_template_name = "goal",
		text = "mission_skittergate_hurry_to_the_elevator"
	},
	military_enter_fort = {
		mission_template_name = "goal",
		text = "mission_military_enter_fort"
	},
	military_open_portcullis = {
		mission_template_name = "goal",
		text = "mission_military_open_portcullis"
	},
	military_arena_survive = {
		mission_template_name = "goal",
		text = "mission_military_arena_survive"
	},
	military_ride_elevator = {
		mission_template_name = "goal",
		text = "mission_military_ride_elevator"
	},
	military_ascend_wall = {
		mission_template_name = "goal",
		text = "mission_military_ascend_wall"
	},
	military_move_along_wall = {
		mission_template_name = "goal",
		text = "mission_military_move_along_wall"
	},
	military_open_gate = {
		mission_template_name = "goal",
		text = "mission_military_open_gate"
	},
	military_enter_temple = {
		mission_template_name = "goal",
		text = "mission_military_enter_temple"
	},
	military_ring_bell = {
		mission_template_name = "goal",
		text = "mission_military_ring_bell"
	},
	military_survive_temple = {
		mission_template_name = "goal",
		text = "mission_military_survive_temple"
	},
	military_escape_portal = {
		mission_template_name = "goal",
		text = "mission_military_escape_portal"
	},
	bell_reach_bell = {
		mission_template_name = "goal",
		text = "mission_bell_reach_bell"
	},
	bell_destroy_bell = {
		mission_template_name = "goal",
		text = "mission_bell_chop_down_bell"
	},
	bell_escape_to_portal = {
		mission_template_name = "goal",
		text = "mission_bell_escape_to_portal"
	},
	prologue_escape = {
		text = "mission_objective_prologue_escape",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	prologue_movement = {
		text = "mission_objective_prologue_movement",
		mission_template_name = "simple",
		is_tutorial_input = true,
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_move",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "move_forward"
			},
			{
				suffix = "",
				prefix = "",
				action = "move_left_pressed"
			},
			{
				suffix = "",
				prefix = "",
				action = "move_back_pressed"
			},
			{
				suffix = "",
				prefix = "",
				action = "move_right_pressed"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "move_controller"
			}
		}
	},
	prologue_jumping = {
		text = "mission_objective_prologue_jumping",
		mission_template_name = "simple",
		is_tutorial_input = true,
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_jump",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "jump_1"
			}
		}
	},
	prologue_light_attack = {
		text = "mission_objective_prologue_light_attack",
		mission_template_name = "simple",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_light_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	prologue_blocking = {
		text = "mission_objective_prologue_blocking",
		mission_template_name = "simple",
		input_service_fallback = "Tutorial",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_block",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_two_hold"
			}
		}
	},
	prologue_dodge = {
		text = "mission_objective_prologue_dodge",
		mission_template_name = "simple",
		input_service_fallback = "Tutorial",
		dont_show_mission_end_tooltip = true,
		is_tutorial_input = true,
		tooltip_text = "mission_objective_tutorial_dodge_left",
		tooltip_inputs = {
			{
				suffix = "/",
				prefix = "",
				action = "move_left_pressed"
			},
			{
				suffix = "+",
				prefix = "",
				action = "move_right_pressed"
			},
			{
				suffix = "",
				prefix = "",
				action = "dodge_hold"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "move_controller"
			},
			{
				suffix = "",
				prefix = "",
				action = "dodge_1"
			}
		}
	},
	prologue_heavy_attack = {
		text = "mission_objective_prologue_heavy_attack",
		mission_template_name = "simple",
		is_tutorial_input = true,
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_heavy_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "input_hold",
				action = "action_one_hold"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "input_hold",
				action = "action_one_hold"
			}
		}
	},
	prologue_find_allies = {
		text = "mission_objective_prologue_find_allies",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	prologue_use_special_ability = {
		text = "mission_objective_prologue_special_ability",
		mission_template_name = "simple",
		input_service_fallback = "Tutorial",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_special_ability",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_career"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "ability"
			}
		}
	},
	prologue_ranged_normal_attack = {
		text = "mission_objective_prologue_ranged_normal_attack",
		mission_template_name = "simple",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_normal_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	prologue_ranged_alternative_attack = {
		text = "mission_objective_prologue_ranged_alternative_attack",
		mission_template_name = "simple",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_alternative_attack",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "input_hold",
				action = "action_two_hold"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "input_hold",
				action = "action_two_hold"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	prologue_save_ally = {
		text = "mission_objective_prologue_save_ally",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	prologue_heal_ally = {
		text = "mission_objective_prologue_heal_ally",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	prologue_heal_equip_medical = {
		text = "mission_objective_prologue_heal_equip_medical",
		mission_template_name = "simple",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_heal_ally",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_3"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_3"
			}
		}
	},
	prologue_find_way_out = {
		text = "mission_objective_prologue_find_way_out",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	prologue_escape_in_portal = {
		text = "mission_objective_prologue_escape_in_portal",
		dont_show_mission_end_tooltip = true,
		mission_template_name = "simple"
	},
	prologue_pushing = {
		text = "mission_objective_prologue_pushing",
		mission_template_name = "simple",
		input_service_fallback = "Tutorial",
		is_tutorial_input = true,
		tooltip_text = "tutorial_tooltip_push",
		tooltip_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "action_two_hold"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "+",
				prefix = "input_hold",
				action = "action_two_hold"
			},
			{
				suffix = "",
				prefix = "",
				action = "action_one"
			}
		}
	},
	prologue_switch_weapon = {
		text = "mission_objective_prologue_switch_weapon",
		mission_template_name = "simple",
		is_tutorial_input = true,
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_switch_weapon",
		tooltip_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_switch"
			}
		},
		tooltip_gamepad_inputs = {
			{
				suffix = "",
				prefix = "",
				action = "wield_switch_1"
			}
		}
	},
	prologue_no_damage = {
		text = "mission_objective_prologue_no_damage",
		sub_text = "mission_objective_prologue_no_damage_subtext",
		mission_template_name = "simple",
		is_tutorial_input = true,
		dont_show_mission_end_tooltip = true,
		tooltip_text = "tutorial_tooltip_no_damage"
	},
	warcamp_progress_swamp = {
		mission_template_name = "goal",
		text = "mission_warcamp_swamp"
	},
	warcamp_find_encampment = {
		mission_template_name = "goal",
		text = "mission_warcamp_find_encampment"
	},
	warcamp_escort_payload = {
		mission_template_name = "goal",
		text = "mission_warcamp_escort_payload"
	},
	warcamp_reach_top_of_camp = {
		mission_template_name = "goal",
		text = "mission_warcamp_reach_top_of_camp"
	},
	warcamp_elect_duelist = {
		mission_template_name = "goal",
		text = "mission_warcamp_elect_duelist"
	},
	warcamp_kill_chieftain = {
		mission_template_name = "goal",
		text = "mission_warcamp_kill_chieftain"
	},
	warcamp_escape = {
		mission_template_name = "goal",
		text = "mission_warcamp_escape"
	},
	nurgle_locate_excavation_site = {
		mission_template_name = "goal",
		text = "mission_nurgle_locate_excavation_site"
	},
	nurgle_traverse_bandit_hideout = {
		mission_template_name = "goal",
		text = "mission_nurgle_traverse_bandit_hideout"
	},
	nurgle_traverse_cave_system = {
		mission_template_name = "goal",
		text = "mission_nurgle_traverse_cave_system"
	},
	nurgle_cross_canyon = {
		mission_template_name = "goal",
		text = "mission_nurgle_cross_canyon"
	},
	nurgle_traverse_manifestation = {
		mission_template_name = "goal",
		text = "mission_nurgle_traverse_manifestation"
	},
	nurgle_find_ruins = {
		mission_template_name = "goal",
		text = "mission_nurgle_find_ruins"
	},
	nurgle_find_entrance = {
		mission_template_name = "goal",
		text = "mission_nurgle_find_the_entrance"
	},
	nurgle_destroy_excavation_site = {
		mission_template_name = "goal",
		text = "mission_nurgle_destroy_excavation_site"
	},
	nurgle_destroy_nurgle_clusters = {
		text = "mission_nurgle_destroy_nurgle_clusters",
		mission_template_name = "collect",
		collect_amount = 3
	},
	nurgle_destroy_cluster_01 = {
		text = "mission_nurgle_destroy_cluster_01",
		mission_template_name = "collect",
		collect_amount = 9
	},
	nurgle_destroy_cluster_02 = {
		text = "mission_nurgle_destroy_cluster_02",
		mission_template_name = "collect",
		collect_amount = 13
	},
	nurgle_destroy_cluster_03 = {
		text = "mission_nurgle_destroy_cluster_03",
		mission_template_name = "collect",
		collect_amount = 7
	},
	nurgle_to_the_surface = {
		mission_template_name = "goal",
		text = "mission_nurgle_to_the_surface"
	},
	nurgle_escape_through_the_portal = {
		mission_template_name = "goal",
		text = "mission_nurgle_escape"
	},
	crawl_find_more_beer = {
		mission_template_name = "goal",
		text = "mission_crawl_find_more_beer"
	},
	crawl_go_to_first_pub = {
		mission_template_name = "goal",
		text = "mission_crawl_go_to_first_pub"
	},
	crawl_enter_first_pub = {
		mission_template_name = "goal",
		text = "mission_crawl_enter_first_pub"
	},
	crawl_survive_the_attack = {
		mission_template_name = "goal",
		text = "mission_crawl_survive_the_attack"
	},
	crawl_go_to_second_pub = {
		mission_template_name = "goal",
		text = "mission_crawl_go_to_second_pub"
	},
	crawl_have_a_drink = {
		mission_template_name = "goal",
		text = "mission_crawl_have_a_drink"
	},
	crawl_go_to_third_pub = {
		mission_template_name = "goal",
		text = "mission_crawl_go_to_third_pub"
	},
	crawl_find_way_in = {
		mission_template_name = "goal",
		text = "mission_crawl_find_way_in"
	},
	crawl_find_good_beer = {
		mission_template_name = "goal",
		text = "mission_crawl_find_good_beer"
	},
	crawl_survive_bar_fight = {
		mission_template_name = "goal",
		text = "mission_crawl_survive_bar_fight"
	},
	crawl_escape_bar_fight = {
		mission_template_name = "goal",
		text = "mission_crawl_escape_bar_fight"
	},
	crawl_into_the_portal = {
		mission_template_name = "goal",
		text = "mission_crawl_into_the_portal"
	},
	keep_enter_portal = {
		mission_template_name = "goal",
		text = "mission_keep_enter_portal"
	},
	weave_collect_limited_item_objective = {
		text = "",
		mission_template_name = "collect",
		collect_amount = 1,
		hidden = true
	}
}

DLCUtils.merge("missions", Missions)

for name, data in pairs(Missions) do
	assert(data.mission_template_name, "mission_template_name not specified")

	data.name = name
end
