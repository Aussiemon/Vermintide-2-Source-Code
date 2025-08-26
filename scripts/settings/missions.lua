-- chunkname: @scripts/settings/missions.lua

Missions = {}
Missions.test_collect_01 = {
	collect_amount = 1,
	hidden = true,
	mission_template_name = "collect",
	text = "test_collect_01_mission_text",
}
Missions.test_defend_01 = {
	defend_amount = 1,
	mission_template_name = "defend",
	text = "test_defend_01_mission_text",
}
Missions.test_timed_01 = {
	duration = 18,
	mission_template_name = "timed",
	text = "test_timed_01_mission_text",
}
Missions.escape_ferry = {
	mission_template_name = "simple",
	text = "generic_escape_ferry",
}
Missions.escape_wagon = {
	mission_template_name = "simple",
	text = "generic_escape_wagon",
}
Missions.escape_elevator = {
	mission_template_name = "simple",
	text = "generic_escape_elevator",
}
Missions.magnus_door_bombing_01 = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "magnus_door_bombing_01_mission_text",
}
Missions.magnus_alert_guards = {
	mission_template_name = "goal",
	text = "magnus_alert_guards_mission_text",
}
Missions.magnus_reach_tower = {
	mission_template_name = "goal",
	text = "magnus_reach_tower_mission_text",
}
Missions.magnus_sound_horn = {
	mission_template_name = "goal",
	text = "magnus_sound_horn_mission_text",
}
Missions.magnus_reach_top = {
	mission_template_name = "goal",
	text = "magnus_reach_top_mission_text",
}
Missions.mission_goal_magnus_survive_attack = {
	mission_template_name = "goal",
	text = "mission_goal_magnus_survive",
}
Missions.mission_goal_magnus_escape = {
	mission_template_name = "goal",
	text = "mission_goal_magnus_escape",
}
Missions.mission_goal_magnus_elevator = {
	mission_template_name = "goal",
	text = "mission_goal_magnus_elevator",
}
Missions.farm_gathering_event = {
	collect_amount = 6,
	mission_template_name = "collect",
	text = "farm_gathering_event",
}
Missions.beer_collection = {
	collect_amount = 4,
	mission_template_name = "collect",
	text = "collect_beer_mission_text",
}
Missions.forest_ambush_doomwheel_bombing = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "forest_ambush_doomwheel_bombing_mission_text",
}
Missions.dlc_castle_enter_castle = {
	mission_template_name = "goal",
	text = "dlc1_4_castle_enter_castle_mission_text",
}
Missions.dlc_castle_find_chalice = {
	mission_template_name = "goal",
	text = "dlc1_4_castle_find_chalice_mission_text",
}
Missions.dlc_castle_get_chalice = {
	mission_template_name = "goal",
	text = "dlc1_4_castle_get_chalice_mission_text",
}
Missions.dlc_castle_escape = {
	mission_template_name = "goal",
	text = "dlc1_4_castle_escape_mission_text",
}
Missions.dlc_castle_statuettes = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "dlc1_4_castle_statuettes_mission_text",
}
Missions.whitebox_tutorial_sidemission_1 = {
	collect_amount = 3,
	is_side_mission = true,
	mission_template_name = "collect",
	text = "magnus_door_bombing_01_mission_text",
}
Missions.tome_bonus_mission = {
	collect_amount = 3,
	dice_per_amount = 1,
	dice_type = "gold",
	evaluate_at_level_end = true,
	evaluation_type = "amount",
	experience_per_amount = 50,
	is_side_mission = true,
	mission_template_name = "collect_uncompletable",
	text = "tome_bonus_mission_text",
}
Missions.grimoire_hidden_mission = {
	collect_amount = 2,
	dice_per_amount = 1,
	dice_type = "warpstone",
	evaluate_at_level_end = true,
	evaluation_type = "amount",
	experience_per_amount = 100,
	hidden = true,
	is_side_mission = true,
	mission_template_name = "collect_uncompletable",
	text = "grimoire_hidden_mission_text",
}
Missions.bonus_dice_hidden_mission = {
	collect_amount = 2,
	dice_per_amount = 1,
	dice_type = "metal",
	evaluate_at_level_end = true,
	evaluation_type = "amount",
	experience_per_amount = 10,
	hidden = true,
	is_side_mission = true,
	mission_template_name = "collect_uncompletable",
	text = "bonus_dice_hidden_mission_text",
}
Missions.painting_scrap_hidden_mission = {
	collect_amount = 1,
	evaluate_at_level_end = true,
	evaluation_type = "amount",
	experience_per_amount = 25,
	hidden = true,
	is_side_mission = true,
	mission_template_name = "collect_uncompletable",
	text = "bonus_painting_scrap_hidden_mission_text",
}
Missions.players_alive_mission = {
	evaluate_at_level_end = true,
	evaluation_type = "amount",
	experience_per_amount = 50,
	hidden = true,
	is_side_mission = true,
	mission_template_name = "players_alive",
	text = "players_alive_mission_text",
}
Missions.whitebox_tutorial_goal_1 = {
	mission_template_name = "goal",
	text = "forest_ambush_call_boat_mission_text",
}
Missions.whitebox_tutorial_goal_2 = {
	mission_template_name = "goal",
	text = "forest_ambush_escape_boat_mission_text",
}
Missions.mission_sewers_short_open_door_1 = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_sewers_short_open_door_1",
}
Missions.mission_sewers_short_open_door_2 = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_sewers_short_open_door_2",
}
Missions.mission_sewers_short_clear_path = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_sewers_short_clear_path",
}
Missions.mission_sewers_short_leave_sewer = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_sewers_short_leave_sewer",
}
Missions.mission_sewers_short_escape = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_sewers_short_escape",
}
Missions.bridge_reach_bridge = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_goal_bridge_reach_bridge",
}
Missions.bridge_escape = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_goal_bridge_escape",
}
Missions.merchant_find_district = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_goal_merchant_find_district",
}
Missions.merchant_reach_square = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_goal_merchant_reach_square",
}
Missions.merchant_escape = {
	collect_amount = 1,
	mission_template_name = "goal",
	text = "mission_goal_merchant_escape",
}
Missions.mission_city_walls_up = {
	mission_template_name = "goal",
	text = "mission_city_walls_up",
}
Missions.mission_city_walls_find_bell = {
	mission_template_name = "goal",
	text = "mission_city_walls_find_bell",
}
Missions.mission_city_walls_destroy_bell = {
	mission_template_name = "goal",
	text = "mission_city_walls_destroy_bell",
}
Missions.mission_city_walls_destroy_support = {
	mission_template_name = "goal",
	text = "mission_city_walls_destroy_support",
}
Missions.mission_city_walls_escape = {
	mission_template_name = "goal",
	text = "mission_city_walls_escape",
}
Missions.forest_ambush_find_camp = {
	mission_template_name = "goal",
	text = "forest_ambush_find_camp_mission_text",
}
Missions.forest_ambush_leave_camp = {
	mission_template_name = "goal",
	text = "forest_ambush_leave_camp_mission_text",
}
Missions.forest_ambush_get_to_the_river = {
	mission_template_name = "goal",
	text = "forest_ambush_get_to_the_river_mission_text",
}
Missions.forest_ambush_call_boat = {
	mission_template_name = "goal",
	text = "forest_ambush_call_boat_mission_text",
}
Missions.forest_ambush_wait_for_boat = {
	mission_template_name = "goal",
	text = "forest_ambush_wait_for_boat_mission_text",
}
Missions.forest_ambush_escape_boat = {
	mission_template_name = "goal",
	text = "forest_ambush_escape_boat_mission_text",
}
Missions.tunnels_start = {
	mission_template_name = "goal",
	text = "tunnels_start_mission_text",
}
Missions.tunnels_investigate_tunnels = {
	mission_template_name = "goal",
	text = "tunnels_investigate_tunnels_mission_text",
}
Missions.tunnels_escape = {
	mission_template_name = "goal",
	text = "tunnels_escape_mission_text",
}
Missions.tunnels_to_ferry_lady = {
	mission_template_name = "goal",
	text = "tunnels_to_ferry_lady_mission_text",
}
Missions.mission_goal_cemetery_wall = {
	mission_template_name = "goal",
	text = "mission_goal_cemetery_wall",
}
Missions.mission_goal_cemetery_source = {
	mission_template_name = "goal",
	text = "mission_goal_cemetery_source",
}
Missions.mission_goal_cemetery_entrance = {
	mission_template_name = "goal",
	text = "mission_goal_cemetery_entrance",
}
Missions.mission_goal_cemetery_cut_down = {
	mission_template_name = "goal",
	text = "mission_goal_cemetery_cut_down",
}
Missions.mission_goal_cemetery_get_back = {
	mission_template_name = "goal",
	text = "mission_goal_cemetery_get_back",
}
Missions.docks_start_goal = {
	mission_template_name = "goal",
	text = "docks_start_goal_mission_text",
}
Missions.docks_next_warehouse = {
	mission_template_name = "goal",
	text = "docks_next_warehouse_mission_text",
}
Missions.docks_back_to_boat = {
	mission_template_name = "goal",
	text = "docks_back_to_boat_mission_text",
}
Missions.docks_escape_house = {
	mission_template_name = "goal",
	text = "docks_escape_house_mission_text",
}
Missions.end_boss_find_lair = {
	mission_template_name = "goal",
	text = "mission_goal_end_boss_find_lair",
}
Missions.end_boss_enter_lair = {
	mission_template_name = "goal",
	text = "mission_goal_end_boss_enter_lair",
}
Missions.end_boss_open_door = {
	mission_template_name = "goal",
	text = "mission_objective_end_boss_open_door",
}
Missions.end_boss_proceed_upwards_1 = {
	mission_template_name = "goal",
	text = "mission_objective_end_boss_proceed_up",
}
Missions.end_boss_proceed_upwards_2 = {
	mission_template_name = "goal",
	text = "mission_objective_end_boss_proceed_up",
}
Missions.end_boss_destroy_bell = {
	mission_template_name = "goal",
	text = "mission_goal_end_boss_destroy_bell",
}
Missions.end_boss_stop_seer = {
	mission_template_name = "goal",
	text = "mission_goal_end_boss_stop_seer",
}
Missions.end_boss_escape = {
	mission_template_name = "goal",
	text = "mission_goal_end_boss_escape",
}
Missions.survival_wave = {
	evaluate_at_level_end = true,
	experience_per_percent = 1.4,
	mission_template_name = "survival",
	text = "dlc1_2_survival_mission_waves_completed",
	wave_completed_text = "dlc1_2_survival_mission_wave_completed",
	wave_prepare_text = "dlc1_2_survival_mission_prepare",
	wave_text = "dlc1_2_survival_mission_wave",
}
Missions.dlc1_4_portals_find_camp = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_find_camp",
}
Missions.dlc1_4_portals_portal_a = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_portal_a",
}
Missions.dlc1_4_portals_portal_b = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_portal_b",
}
Missions.dlc1_4_portals_portal_c = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_portal_c",
}
Missions.dlc1_4_portals_escape = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_escape",
}
Missions.dlc1_4_portals_overheat_a = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_overheat_a",
}
Missions.dlc1_4_portals_overheat_b = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_overheat_b",
}
Missions.dlc1_4_portals_overheat_c = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_goal_portals_overheat_c",
}
Missions.mission_dlc_castle_dungeon_search_dungeon = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_search_dungeon",
}
Missions.mission_dlc_castle_dungeon_push_through = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_push_through",
}
Missions.mission_dlc_castle_dungeon_grab_artifact1 = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_grab_artifact1",
}
Missions.mission_dlc_castle_dungeon_continue_search = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_continue_search",
}
Missions.mission_dlc_castle_dungeon_descend_darkness_with_torch = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_descend_darkness_with_torch",
}
Missions.mission_dlc_castle_dungeon_grab_artifact2 = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_grab_artifact2",
}
Missions.mission_dlc_castle_dungeon_survive_until_way_out = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_survive_until_way_out",
}
Missions.mission_dlc_castle_dungeon_escape_up = {
	mission_template_name = "goal",
	text = "dlc1_4_mission_dungeon_escape_up",
}
Missions.tutorial_movement = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_movement",
	tooltip_text = "tutorial_tooltip_move",
	tooltip_inputs = {
		{
			action = "move_forward",
			prefix = "",
			suffix = "",
		},
		{
			action = "move_left_pressed",
			prefix = "",
			suffix = "",
		},
		{
			action = "move_back_pressed",
			prefix = "",
			suffix = "",
		},
		{
			action = "move_right_pressed",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "move_forward",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_jumping = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_jumping",
	tooltip_text = "tutorial_tooltip_jump",
	tooltip_inputs = {
		{
			action = "dodge",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_dodge_left = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_dodge_left",
	tooltip_text = "mission_objective_tutorial_dodge_left",
	tooltip_inputs = {
		{
			action = "move_left",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "dodge",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_dodge_back = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_dodge_back",
	tooltip_text = "mission_objective_tutorial_dodge_back",
	tooltip_inputs = {
		{
			action = "move_back",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "dodge",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_dodge_right = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_dodge_right",
	tooltip_text = "mission_objective_tutorial_dodge_right",
	tooltip_inputs = {
		{
			action = "move_right",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "dodge",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_light_attack = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_objective_tutorial_light_attack",
	tooltip_text = "tutorial_tooltip_light_attack",
	tooltip_inputs = {
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_heavy_attack = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_heavy_attack",
	tooltip_text = "tutorial_tooltip_heavy_attack",
	tooltip_inputs = {
		{
			action = "action_one_hold",
			prefix = "input_hold",
			suffix = "",
		},
	},
}
Missions.tutorial_switch_weapon = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_switch_weapon",
	tooltip_text = "tutorial_tooltip_switch_weapon",
	tooltip_inputs = {
		{
			action = "wield_switch",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_no_damage = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_no_damage",
	tooltip_text = "tutorial_tooltip_no_damage",
	tooltip_inputs = {
		{
			action = "wield_switch",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_ranged_normal_attack = {
	collect_amount = 5,
	mission_template_name = "collect",
	text = "mission_objective_tutorial_ranged_normal_attack",
	tooltip_text = "tutorial_tooltip_normal_attack",
	tooltip_inputs = {
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_ranged_alternative_attack = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_objective_tutorial_ranged_alternative_attack",
	tooltip_text = "tutorial_tooltip_alternative_attack",
	tooltip_inputs = {
		{
			action = "action_two_hold",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_blocking = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_objective_tutorial_blocking",
	tooltip_text = "tutorial_tooltip_block",
	tooltip_inputs = {
		{
			action = "action_two_hold",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_pushing = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_objective_tutorial_pushing",
	tooltip_text = "tutorial_tooltip_push",
	tooltip_inputs = {
		{
			action = "action_two_hold",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_pickup_grenade = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_pickup_grenade",
}
Missions.tutorial_pickup_ammo = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_pickup_ammo",
}
Missions.tutorial_throw_grenade = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_throw_grenade",
	tooltip_text = "tutorial_tooltip_throw_grenade",
	tooltip_inputs = {
		{
			action = "wield_5",
			prefix = "",
			suffix = "->",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "wield_5",
			prefix = "",
			suffix = "->",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_pickup_potion = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_pickup_potion",
}
Missions.tutorial_use_potion = {
	dont_show_mission_end_tooltip = true,
	hidden = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_use_potion",
	tooltip_text = "tutorial_tooltip_use_potion",
	tooltip_inputs = {
		{
			action = "wield_4",
			prefix = "",
			suffix = "->",
		},
		{
			action = "action_one_hold",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "wield_4",
			prefix = "",
			suffix = "->",
		},
		{
			action = "action_one_hold",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_pickup_barrel = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_pickup_barrel",
}
Missions.tutorial_place_barrel = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_place_barrel",
	tooltip_text = "tutorial_tooltip_place_barrel",
	tooltip_inputs = {
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_pickup_draught = {
	mission_template_name = "simple",
	text = "mission_objective_tutorial_pickup_draught",
}
Missions.tutorial_use_draught = {
	mission_template_name = "simple",
	text = "mission_objective_tutorial_use_draught",
}
Missions.tutorial_pickup_healthkit = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_pickup_healthkit",
}
Missions.tutorial_heal_ally = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_heal_ally",
	tooltip_text = "tutorial_tooltip_heal_ally",
	tooltip_inputs = {
		{
			action = "wield_3",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "wield_3",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.tutorial_continue = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_continue",
}
Missions.tutorial_survive_attack = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_survive_attack",
}
Missions.tutorial_go_to_end = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_go_to_end",
}
Missions.tutorial_kill_remaining = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_tutorial_kill_remaining",
}
Missions.tutorial = {
	hidden = true,
	mission_template_name = "tutorial",
}
Missions.escape_into_portal = {
	mission_template_name = "goal",
	text = "mission_escape_into_portal",
}
Missions.catacombs_search_building = {
	mission_template_name = "goal",
	text = "mission_catacombs_search_building",
}
Missions.catacombs_follow_trail = {
	mission_template_name = "goal",
	text = "mission_catacombs_follow_trail",
}
Missions.catacombs_open_door = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_catacombs_open_door",
}
Missions.catacombs_find_ritual = {
	mission_template_name = "goal",
	text = "mission_catacombs_find_ritual",
}
Missions.catacombs_disrupt_ritual = {
	mission_template_name = "goal",
	text = "mission_catacombs_disrupt_ritual",
}
Missions.catacombs_stay_inside_circle = {
	mission_template_name = "goal",
	text = "mission_catacombs_stay_inside_circle",
}
Missions.catacombs_escape = {
	mission_template_name = "goal",
	text = "mission_catacombs_escape",
}
Missions.chamber_inn = {
	mission_template_name = "goal",
	text = "mission_chamber_defend",
}
Missions.chamber_cellar = {
	mission_template_name = "goal",
	text = "mission_chamber_cellar",
}
Missions.chamber_sewer = {
	mission_template_name = "goal",
	text = "mission_chamber_sewer_hunt",
}
Missions.chamber_machine = {
	mission_template_name = "goal",
	text = "mission_chamber_stop_machine",
}
Missions.elven_ruins_get_to_ruins = {
	mission_template_name = "goal",
	text = "mission_elven_ruins_get_to_ruins",
}
Missions.elven_ruins_proceed_through_woods = {
	mission_template_name = "goal",
	text = "mission_elven_ruins_proceed_through_woods",
}
Missions.elven_ruins_break_through_maze = {
	mission_template_name = "goal",
	text = "mission_elven_ruins_break_through_maze",
}
Missions.elven_ruins_make_way_to_puzzle = {
	mission_template_name = "goal",
	text = "mission_elven_ruins_make_way_to_puzzle",
}
Missions.elven_ruins_realign_leylines = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_elven_ruins_realign_leylines",
}
Missions.elven_ruins_survive_until_alignment = {
	mission_template_name = "goal",
	text = "mission_elven_ruins_survive_until_alignment",
}
Missions.elven_ruins_escape_into_portal = {
	mission_template_name = "goal",
	text = "mission_elven_ruins_escape_into_portal",
}
Missions.fort_follow_road = {
	mission_template_name = "goal",
	text = "mission_fort_follow_road",
}
Missions.fort_reach_fort = {
	mission_template_name = "goal",
	text = "mission_fort_reach_fort",
}
Missions.fort_reach_inner_courtyard = {
	mission_template_name = "goal",
	text = "mission_fort_reach_inner_courtyard",
}
Missions.fort_reach_outer_courtyard = {
	mission_template_name = "goal",
	text = "mission_fort_reach_outer_courtyard",
}
Missions.fort_reach_gate = {
	mission_template_name = "goal",
	text = "mission_fort_reach_gate",
}
Missions.fort_talk_to_survivors = {
	mission_template_name = "goal",
	text = "mission_fort_talk_to_survivors",
}
Missions.fort_defend_the_gate = {
	mission_template_name = "goal",
	text = "mission_fort_defend_the_gate",
}
Missions.fort_use_cannon_01 = {
	mission_template_name = "goal",
	text = "mission_fort_use_cannon_01",
}
Missions.fort_use_cannon_02 = {
	mission_template_name = "goal",
	text = "mission_fort_use_cannon_02",
}
Missions.fort_use_cannon_03 = {
	mission_template_name = "goal",
	text = "mission_fort_use_cannon_03",
}
Missions.fort_use_cannon_04 = {
	mission_template_name = "goal",
	text = "mission_fort_use_cannon_04",
}
Missions.fort_load_cannon = {
	mission_template_name = "goal",
	text = "mission_fort_load_cannon",
}
Missions.fort_rescue_prisoners = {
	mission_template_name = "goal",
	text = "mission_fort_rescue_prisoners",
}
Missions.fort_break_siege = {
	mission_template_name = "goal",
	text = "mission_fort_break_siege",
}
Missions.fort_escape_into_portal = {
	mission_template_name = "goal",
	text = "mission_fort_escape_into_portal",
}
Missions.farmlands_reach_first_farm = {
	mission_template_name = "goal",
	text = "mission_farmlands_reach_first_farm",
}
Missions.farmlands_find_and_free_the_prisoners = {
	collect_amount = 4,
	mission_template_name = "collect",
	text = "mission_farmlands_find_and_free_the_prisoners",
}
Missions.farmlands_reach_second_farm = {
	mission_template_name = "goal",
	text = "mission_farmlands_reach_second_farm",
}
Missions.farmlands_get_key_for_barn = {
	mission_template_name = "goal",
	text = "mission_farmlands_get_the_key_for_the_barn",
}
Missions.farmlands_unlock_and_find_a_way_through_barn = {
	mission_template_name = "goal",
	text = "mission_farmlands_unlock_and_find_a_way_through_the_barn",
}
Missions.farmlands_reach_third_farm = {
	mission_template_name = "goal",
	text = "mission_farmlands_reach_third_farm",
}
Missions.farmlands_free_the_prisoners_and_clear_the_area = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_farmlands_free_the_prisoners_and_clear_the_area",
}
Missions.farmlands_free_prisoners_01 = {
	mission_template_name = "goal",
	text = "mission_farmlands_free_prisoners_01",
}
Missions.farmlands_free_prisoners_02 = {
	collect_amount = 4,
	mission_template_name = "collect",
	text = "mission_farmlands_free_prisoners_02",
}
Missions.farmlands_free_prisoners_03 = {
	collect_amount = 2,
	mission_template_name = "collect",
	text = "mission_farmlands_free_prisoners_03",
}
Missions.farmlands_free_prisoners_04 = {
	collect_amount = 4,
	mission_template_name = "collect",
	text = "mission_farmlands_free_prisoners_04",
}
Missions.farmlands_escape = {
	mission_template_name = "goal",
	text = "mission_farmlands_escape",
}
Missions.ussingen_enter_ussingen = {
	mission_template_name = "goal",
	text = "mission_ussingen_enter_ussingen",
}
Missions.ussingen_reach_mansion = {
	mission_template_name = "goal",
	text = "mission_ussingen_reach_mansion",
}
Missions.ussingen_find_explosive = {
	mission_template_name = "goal",
	text = "mission_ussingen_find_explosive",
}
Missions.ussingen_event = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_ussingen_event",
}
Missions.ussingen_deliver = {
	mission_template_name = "goal",
	text = "mission_ussingen_deliver",
}
Missions.ussingen_light_push = {
	mission_template_name = "goal",
	text = "mission_ussingen_light_push",
}
Missions.ussingen_escape = {
	mission_template_name = "goal",
	text = "mission_ussingen_escape",
}
Missions.ussingen_use_portal = {
	mission_template_name = "goal",
	text = "mission_ussingen_use_portal",
}
Missions.ground_zero_city_center = {
	mission_template_name = "goal",
	text = "mission_ground_zero_city_center",
}
Missions.ground_zero_down_terraces = {
	mission_template_name = "goal",
	text = "mission_ground_zero_down_terraces",
}
Missions.ground_zero_elevator = {
	mission_template_name = "goal",
	text = "mission_ground_zero_elevator",
}
Missions.ground_zero_locate_device = {
	mission_template_name = "goal",
	text = "mission_ground_zero_locate_device",
}
Missions.ground_zero_cross_hole = {
	mission_template_name = "goal",
	text = "mission_ground_zero_cross_hole",
}
Missions.ground_zero_kill_boss = {
	mission_template_name = "goal",
	text = "mission_ground_zero_kill_boss",
}
Missions.ground_zero_escape = {
	mission_template_name = "goal",
	text = "mission_ground_zero_escape",
}
Missions.mines_find_explosives = {
	mission_template_name = "goal",
	text = "mission_mines_find_explosives",
}
Missions.mines_push_cart = {
	mission_template_name = "goal",
	text = "mission_mines_push_cart",
}
Missions.mines_collect_explosives = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_mines_collect_explosives",
}
Missions.mines_find_cart = {
	mission_template_name = "goal",
	text = "mission_mines_find_cart",
}
Missions.mines_transport_explosives = {
	mission_template_name = "goal",
	text = "mission_mines_transport_explosives",
}
Missions.mines_find_cart_again = {
	mission_template_name = "goal",
	text = "mission_mines_find_cart_again",
}
Missions.mines_destroy_altar = {
	mission_template_name = "goal",
	text = "mission_mines_destroy_altar",
}
Missions.mines_ring_bell = {
	mission_template_name = "goal",
	text = "mission_mines_ring_bell",
}
Missions.mines_over_the_bridge = {
	mission_template_name = "goal",
	text = "mission_mines_over_the_bridge",
}
Missions.mines_escape_portal = {
	mission_template_name = "goal",
	text = "mission_mines_escape_portal",
}
Missions.stronghold_find_the_rail_tracks = {
	mission_template_name = "goal",
	text = "mission_stronghold_find_the_rail_tracks",
}
Missions.stronghold_follow_the_tracks_to_the_foundry = {
	mission_template_name = "goal",
	text = "mission_stronghold_follow_the_tracks_to_the_foundry",
}
Missions.stronghold_find_another_way_to_the_foundry = {
	mission_template_name = "goal",
	text = "mission_stronghold_find_another_way_to_the_foundry",
}
Missions.stronghold_continue_to_the_city = {
	mission_template_name = "goal",
	text = "mission_stronghold_continue_to_the_city",
}
Missions.stronghold_reach_the_temple = {
	mission_template_name = "goal",
	text = "mission_stronghold_reach_the_temple",
}
Missions.stronghold_get_up_on_the_aqueduct = {
	mission_template_name = "goal",
	text = "mission_stronghold_get_up_on_the_aqueduct",
}
Missions.stronghold_enter_the_temple = {
	mission_template_name = "goal",
	text = "mission_stronghold_enter_the_temple",
}
Missions.stronghold_kill_the_warlord = {
	mission_template_name = "goal",
	text = "mission_stronghold_kill_the_warlord",
}
Missions.stronghold_escape_the_stronghold = {
	mission_template_name = "goal",
	text = "mission_stronghold_escape_the_stronghold",
}
Missions.skittergate_reach_skittergate = {
	mission_template_name = "goal",
	text = "mission_skittergate_reach_skittergate",
}
Missions.skittergate_open_gate = {
	mission_template_name = "goal",
	text = "mission_skittergate_open_gate",
}
Missions.skittergate_go_through_gate = {
	mission_template_name = "goal",
	text = "mission_skittergate_go_through_gate",
}
Missions.skittergate_find_camp_backdoor = {
	mission_template_name = "goal",
	text = "mission_skittergate_find_camp_backdoor",
}
Missions.skittergate_reach_docks = {
	mission_template_name = "goal",
	text = "mission_skittergate_reach_docks",
}
Missions.skittergate_enter_camp = {
	mission_template_name = "goal",
	text = "mission_skittergate_enter_camp",
}
Missions.skittergate_find_key = {
	mission_template_name = "goal",
	text = "mission_skittergate_find_key",
}
Missions.skittergate_kill_gatekeeper = {
	mission_template_name = "goal",
	text = "mission_skittergate_kill_gatekeeper",
}
Missions.skittergate_get_key = {
	mission_template_name = "goal",
	text = "mission_skittergate_get_key",
}
Missions.skittergate_get_back_to_gate = {
	mission_template_name = "goal",
	text = "mission_skittergate_get_back_to_gate",
}
Missions.skittergate_turn_on_gate = {
	mission_template_name = "goal",
	text = "mission_skittergate_turn_on_gate",
}
Missions.skittergate_destroy_generators = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_skittergate_destroy_generators",
}
Missions.skittergate_hurry_through_gate = {
	mission_template_name = "goal",
	text = "mission_skittergate_hurry_through_gate",
}
Missions.skittergate_kill_rasknitt = {
	mission_template_name = "goal",
	text = "mission_skittergate_kill_rasknitt",
}
Missions.skittergate_hurry_to_the_elevator = {
	mission_template_name = "goal",
	text = "mission_skittergate_hurry_to_the_elevator",
}
Missions.military_enter_fort = {
	mission_template_name = "goal",
	text = "mission_military_enter_fort",
}
Missions.military_open_portcullis = {
	mission_template_name = "goal",
	text = "mission_military_open_portcullis",
}
Missions.military_arena_survive = {
	mission_template_name = "goal",
	text = "mission_military_arena_survive",
}
Missions.military_ride_elevator = {
	mission_template_name = "goal",
	text = "mission_military_ride_elevator",
}
Missions.military_ascend_wall = {
	mission_template_name = "goal",
	text = "mission_military_ascend_wall",
}
Missions.military_move_along_wall = {
	mission_template_name = "goal",
	text = "mission_military_move_along_wall",
}
Missions.military_open_gate = {
	mission_template_name = "goal",
	text = "mission_military_open_gate",
}
Missions.military_enter_temple = {
	mission_template_name = "goal",
	text = "mission_military_enter_temple",
}
Missions.military_ring_bell = {
	mission_template_name = "goal",
	text = "mission_military_ring_bell",
}
Missions.military_survive_temple = {
	mission_template_name = "goal",
	text = "mission_military_survive_temple",
}
Missions.military_escape_portal = {
	mission_template_name = "goal",
	text = "mission_military_escape_portal",
}
Missions.bell_reach_bell = {
	mission_template_name = "goal",
	text = "mission_bell_reach_bell",
}
Missions.bell_destroy_bell = {
	mission_template_name = "goal",
	text = "mission_bell_chop_down_bell",
}
Missions.bell_escape_to_portal = {
	mission_template_name = "goal",
	text = "mission_bell_escape_to_portal",
}
Missions.prologue_escape = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_escape",
}
Missions.prologue_movement = {
	dont_show_mission_end_tooltip = true,
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_movement",
	tooltip_text = "tutorial_tooltip_move",
	tooltip_inputs = {
		{
			action = "move_forward",
			prefix = "",
			suffix = "",
		},
		{
			action = "move_left_pressed",
			prefix = "",
			suffix = "",
		},
		{
			action = "move_back_pressed",
			prefix = "",
			suffix = "",
		},
		{
			action = "move_right_pressed",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "move_controller",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_jumping = {
	dont_show_mission_end_tooltip = true,
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_jumping",
	tooltip_text = "tutorial_tooltip_jump",
	tooltip_inputs = {
		{
			action = "jump_1",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_light_attack = {
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_light_attack",
	tooltip_text = "tutorial_tooltip_light_attack",
	tooltip_inputs = {
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_blocking = {
	input_service_fallback = "Tutorial",
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_blocking",
	tooltip_text = "tutorial_tooltip_block",
	tooltip_inputs = {
		{
			action = "action_two_hold",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_dodge = {
	dont_show_mission_end_tooltip = true,
	input_service_fallback = "Tutorial",
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_dodge",
	tooltip_text = "mission_objective_tutorial_dodge_left",
	tooltip_inputs = {
		{
			action = "move_left_pressed",
			prefix = "",
			suffix = "/",
		},
		{
			action = "move_right_pressed",
			prefix = "",
			suffix = "+",
		},
		{
			action = "dodge_hold",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "move_controller",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "dodge_1",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_heavy_attack = {
	dont_show_mission_end_tooltip = true,
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_heavy_attack",
	tooltip_text = "tutorial_tooltip_heavy_attack",
	tooltip_inputs = {
		{
			action = "action_one_hold",
			prefix = "input_hold",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "action_one_hold",
			prefix = "input_hold",
			suffix = "",
		},
	},
}
Missions.prologue_find_allies = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_find_allies",
}
Missions.prologue_use_special_ability = {
	input_service_fallback = "Tutorial",
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_special_ability",
	tooltip_text = "tutorial_tooltip_special_ability",
	tooltip_inputs = {
		{
			action = "action_career",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "ability",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_ranged_normal_attack = {
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_ranged_normal_attack",
	tooltip_text = "tutorial_tooltip_normal_attack",
	tooltip_inputs = {
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_ranged_alternative_attack = {
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_ranged_alternative_attack",
	tooltip_text = "tutorial_tooltip_alternative_attack",
	tooltip_inputs = {
		{
			action = "action_two_hold",
			prefix = "input_hold",
			suffix = "",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "action_two_hold",
			prefix = "input_hold",
			suffix = "",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_save_ally = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_save_ally",
}
Missions.prologue_heal_ally = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_heal_ally",
}
Missions.prologue_heal_equip_medical = {
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_heal_equip_medical",
	tooltip_text = "tutorial_tooltip_heal_ally",
	tooltip_inputs = {
		{
			action = "wield_3",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "wield_3",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_find_way_out = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_find_way_out",
}
Missions.prologue_escape_in_portal = {
	dont_show_mission_end_tooltip = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_escape_in_portal",
}
Missions.prologue_pushing = {
	input_service_fallback = "Tutorial",
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_pushing",
	tooltip_text = "tutorial_tooltip_push",
	tooltip_inputs = {
		{
			action = "action_two_hold",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "action_two_hold",
			prefix = "input_hold",
			suffix = "+",
		},
		{
			action = "action_one",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_switch_weapon = {
	dont_show_mission_end_tooltip = true,
	is_tutorial_input = true,
	mission_template_name = "simple",
	text = "mission_objective_prologue_switch_weapon",
	tooltip_text = "tutorial_tooltip_switch_weapon",
	tooltip_inputs = {
		{
			action = "wield_switch",
			prefix = "",
			suffix = "",
		},
	},
	tooltip_gamepad_inputs = {
		{
			action = "wield_switch_1",
			prefix = "",
			suffix = "",
		},
	},
}
Missions.prologue_no_damage = {
	dont_show_mission_end_tooltip = true,
	is_tutorial_input = true,
	mission_template_name = "simple",
	sub_text = "mission_objective_prologue_no_damage_subtext",
	text = "mission_objective_prologue_no_damage",
	tooltip_text = "tutorial_tooltip_no_damage",
}
Missions.warcamp_progress_swamp = {
	mission_template_name = "goal",
	text = "mission_warcamp_swamp",
}
Missions.warcamp_find_encampment = {
	mission_template_name = "goal",
	text = "mission_warcamp_find_encampment",
}
Missions.warcamp_escort_payload = {
	mission_template_name = "goal",
	text = "mission_warcamp_escort_payload",
}
Missions.warcamp_reach_top_of_camp = {
	mission_template_name = "goal",
	text = "mission_warcamp_reach_top_of_camp",
}
Missions.warcamp_elect_duelist = {
	mission_template_name = "goal",
	text = "mission_warcamp_elect_duelist",
}
Missions.warcamp_kill_chieftain = {
	mission_template_name = "goal",
	text = "mission_warcamp_kill_chieftain",
}
Missions.warcamp_escape = {
	mission_template_name = "goal",
	text = "mission_warcamp_escape",
}
Missions.nurgle_locate_excavation_site = {
	mission_template_name = "goal",
	text = "mission_nurgle_locate_excavation_site",
}
Missions.nurgle_traverse_bandit_hideout = {
	mission_template_name = "goal",
	text = "mission_nurgle_traverse_bandit_hideout",
}
Missions.nurgle_traverse_cave_system = {
	mission_template_name = "goal",
	text = "mission_nurgle_traverse_cave_system",
}
Missions.nurgle_cross_canyon = {
	mission_template_name = "goal",
	text = "mission_nurgle_cross_canyon",
}
Missions.nurgle_traverse_manifestation = {
	mission_template_name = "goal",
	text = "mission_nurgle_traverse_manifestation",
}
Missions.nurgle_find_ruins = {
	mission_template_name = "goal",
	text = "mission_nurgle_find_ruins",
}
Missions.nurgle_find_entrance = {
	mission_template_name = "goal",
	text = "mission_nurgle_find_the_entrance",
}
Missions.nurgle_destroy_excavation_site = {
	mission_template_name = "goal",
	text = "mission_nurgle_destroy_excavation_site",
}
Missions.nurgle_destroy_nurgle_clusters = {
	collect_amount = 3,
	mission_template_name = "collect",
	text = "mission_nurgle_destroy_nurgle_clusters",
}
Missions.nurgle_destroy_cluster_01 = {
	collect_amount = 9,
	mission_template_name = "collect",
	text = "mission_nurgle_destroy_cluster_01",
}
Missions.nurgle_destroy_cluster_02 = {
	collect_amount = 13,
	mission_template_name = "collect",
	text = "mission_nurgle_destroy_cluster_02",
}
Missions.nurgle_destroy_cluster_03 = {
	collect_amount = 7,
	mission_template_name = "collect",
	text = "mission_nurgle_destroy_cluster_03",
}
Missions.nurgle_to_the_surface = {
	mission_template_name = "goal",
	text = "mission_nurgle_to_the_surface",
}
Missions.nurgle_escape_through_the_portal = {
	mission_template_name = "goal",
	text = "mission_nurgle_escape",
}
Missions.crawl_find_more_beer = {
	mission_template_name = "goal",
	text = "mission_crawl_find_more_beer",
}
Missions.crawl_go_to_first_pub = {
	mission_template_name = "goal",
	text = "mission_crawl_go_to_first_pub",
}
Missions.crawl_enter_first_pub = {
	mission_template_name = "goal",
	text = "mission_crawl_enter_first_pub",
}
Missions.crawl_survive_the_attack = {
	mission_template_name = "goal",
	text = "mission_crawl_survive_the_attack",
}
Missions.crawl_go_to_second_pub = {
	mission_template_name = "goal",
	text = "mission_crawl_go_to_second_pub",
}
Missions.crawl_have_a_drink = {
	mission_template_name = "goal",
	text = "mission_crawl_have_a_drink",
}
Missions.crawl_go_to_third_pub = {
	mission_template_name = "goal",
	text = "mission_crawl_go_to_third_pub",
}
Missions.crawl_find_way_in = {
	mission_template_name = "goal",
	text = "mission_crawl_find_way_in",
}
Missions.crawl_find_good_beer = {
	mission_template_name = "goal",
	text = "mission_crawl_find_good_beer",
}
Missions.crawl_survive_bar_fight = {
	mission_template_name = "goal",
	text = "mission_crawl_survive_bar_fight",
}
Missions.crawl_escape_bar_fight = {
	mission_template_name = "goal",
	text = "mission_crawl_escape_bar_fight",
}
Missions.crawl_into_the_portal = {
	mission_template_name = "goal",
	text = "mission_crawl_into_the_portal",
}
Missions.keep_enter_portal = {
	mission_template_name = "goal",
	text = "mission_keep_enter_portal",
}
Missions.weave_collect_limited_item_objective = {
	collect_amount = 1,
	hidden = true,
	mission_template_name = "collect",
	text = "",
}

DLCUtils.merge("missions", Missions)

for name, data in pairs(Missions) do
	assert(data.mission_template_name, "mission_template_name not specified")

	data.name = name
end
