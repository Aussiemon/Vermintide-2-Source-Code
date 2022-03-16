local push_radius = 3
local time_mod = 0.9
local weapon_template = {
	actions = {
		action_one = {
			default = {
				aim_assist_ramp_multiplier = 0.2,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.5,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_left",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.5,
						blocker = true,
						end_time = 1,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack",
						start_time = 0.7,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_right = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_stab",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.5,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_last",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_stab",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.5,
						blocker = true,
						end_time = 1,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_stab",
						start_time = 0.7,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_left = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_right_pose",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.3,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_right",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_right",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.5,
						blocker = true,
						end_time = 1,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_right",
						start_time = 0.7,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_left_heavy = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_right_pose",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.3,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_right",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_right",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.5,
						blocker = true,
						end_time = 1,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_right",
						start_time = 0.7,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_stab_heavy = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_stab",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.6,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_left",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_stab",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.5,
						blocker = true,
						end_time = 1,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_stab",
						start_time = 0.7,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			heavy_attack = {
				damage_window_start = 0.2,
				forward_offset = 0.75,
				push_radius = 2.5,
				kind = "shield_slam",
				damage_profile_target = "shield_slam_target",
				no_damage_impact_sound_event = "shield_hit_armour",
				armor_impact_sound_event = "shield_hit_armour",
				damage_profile = "shield_slam",
				additional_critical_strike_chance = 0,
				hit_effect = "melee_hit_hammers_2h",
				hit_time = 0.2,
				weapon_action_hand = "left",
				damage_window_end = 0.25,
				impact_sound_event = "shield_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				damage_profile_aoe = "shield_slam_aoe",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				dedicated_target_range = 3.5,
				aim_assist_ramp_decay_delay = 0.1,
				uninterruptible = true,
				anim_event = "attack_swing_heavy",
				total_time = 1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.1,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_stab_heavy",
						start_time = 0.4,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default_stab_heavy",
						start_time = 0.4,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0.4,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.4,
						action = "action_wield",
						input = "action_wield"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end
			},
			heavy_attack_right = {
				damage_window_start = 0.15,
				range_mod = 1.35,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				damage_profile = "medium_slashing_linesman_1h",
				hit_effect = "melee_hit_sword_1h",
				damage_window_end = 0.3,
				impact_sound_event = "slashing_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.5,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_right",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.25,
						end_time = 0.25,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_one",
						release_required = "action_one_hold",
						end_time = 1.05,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_one",
						release_required = "action_one_hold",
						end_time = 1.05,
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 1.05,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.4,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					}
				},
				chain_condition_func = function (attacker_unit, input_extension)
					input_extension:reset_release_input()

					return true
				end,
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.11666666666666667,
						-0.3208252489566803,
						0.3478555679321289,
						-0.1498551368713379,
						-0.46664953231811523,
						0.6107223033905029,
						-0.27594611048698425,
						-0.5771570205688477
					},
					{
						0.1527777777777778,
						-0.26038768887519836,
						0.4603157043457031,
						-0.13486433029174805,
						-0.36738601326942444,
						0.6571846604347229,
						-0.17090967297554016,
						-0.6355515122413635
					},
					{
						0.18888888888888888,
						0.000899970531463623,
						0.6705179214477539,
						-0.09433174133300781,
						0.13344594836235046,
						0.6726330518722534,
						0.3288255035877228,
						-0.6493310332298279
					},
					{
						0.22499999999999998,
						0.6280646920204163,
						0.3781852722167969,
						-0.10424613952636719,
						0.5623488426208496,
						0.29114651679992676,
						0.7244940996170044,
						-0.27222374081611633
					},
					{
						0.26111111111111107,
						0.8125902414321899,
						-0.028603553771972656,
						-0.1255779266357422,
						0.6482107043266296,
						0.08107113093137741,
						0.7465570569038391,
						-0.12610675394535065
					},
					{
						0.29722222222222217,
						0.8411153554916382,
						-0.15735149383544922,
						-0.13607454299926758,
						0.6734144687652588,
						0.035691794008016586,
						0.7254765629768372,
						-0.13756026327610016
					},
					{
						0.3333333333333333,
						0.8508321046829224,
						-0.20702457427978516,
						-0.14632081985473633,
						0.6878039836883545,
						0.05070263519883156,
						0.690765917301178,
						-0.21724973618984222
					}
				}
			},
			heavy_attack_stab = {
				damage_window_start = 0.22,
				anim_end_event = "attack_finished",
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.4,
				no_damage_impact_sound_event = "stab_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = true,
				damage_profile = "medium_slashing_smiter_stab_1h",
				hit_effect = "melee_hit_sword_1h",
				damage_window_end = 0.32,
				impact_sound_event = "stab_hit",
				dedicated_target_range = 2.75,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_stab",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.15,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.5,
						end_time = 0.3,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.3,
						external_multiplier = 0.75,
						end_time = 0.5,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_left_heavy",
						start_time = 0.5,
						action = "action_one",
						release_required = "action_one_hold",
						end_time = 1.05,
						input = "action_one"
					},
					{
						sub_action = "default_left_heavy",
						start_time = 0.5,
						action = "action_one",
						release_required = "action_one_hold",
						end_time = 1.05,
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 1.05,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.4,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					}
				},
				chain_condition_func = function (attacker_unit, input_extension)
					input_extension:reset_release_input()

					return true
				end,
				baked_sweep = {
					{
						0.18666666666666668,
						0.290363073348999,
						-0.6218452453613281,
						-0.0649576187133789,
						0.2863747775554657,
						0.6988771557807922,
						0.5777120590209961,
						-0.3095303475856781
					},
					{
						0.21444444444444444,
						0.28753629326820374,
						-0.5933799743652344,
						-0.05324554443359375,
						0.2623692750930786,
						0.6915067434310913,
						0.5934900641441345,
						-0.31741201877593994
					},
					{
						0.24222222222222223,
						0.3164164423942566,
						-0.5839834213256836,
						-0.04255485534667969,
						0.24284090101718903,
						0.6852792501449585,
						0.6049222350120544,
						-0.324791818857193
					},
					{
						0.27,
						0.3594815731048584,
						-0.5321426391601562,
						-0.0278167724609375,
						0.22719457745552063,
						0.6622879505157471,
						0.6232197284698486,
						-0.34835970401763916
					},
					{
						0.2977777777777778,
						0.3249143958091736,
						0.14609622955322266,
						-0.02324676513671875,
						0.2298300564289093,
						0.6248672604560852,
						0.619152843952179,
						-0.4163760542869568
					},
					{
						0.3255555555555556,
						0.09115293622016907,
						0.5467300415039062,
						-0.010390758514404297,
						0.2613280117511749,
						0.6371338963508606,
						0.604698896408081,
						-0.4001340866088867
					},
					{
						0.35333333333333333,
						0.11415636539459229,
						0.5745782852172852,
						-0.015202522277832031,
						0.2614330053329468,
						0.6427664756774902,
						0.6028912663459778,
						-0.39373359084129333
					}
				}
			},
			light_attack_left = {
				damage_window_start = 0.38,
				range_mod = 1.2,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				hit_shield_stop_anim = "attack_hit_shield",
				damage_profile = "light_slashing_linesman",
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.52,
				impact_sound_event = "slashing_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.5,
				anim_event = "attack_swing_left_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 2.1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.25,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.6,
						end_time = 0.5,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_left",
						start_time = 0.55,
						action = "action_one",
						end_time = 1.2,
						input = "action_one"
					},
					{
						sub_action = "default_left",
						start_time = 0.55,
						action = "action_one",
						end_time = 1.2,
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 1.2,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.2,
						action = "action_one",
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					}
				},
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.3466666666666667,
						0.48905032873153687,
						0.46721935272216797,
						0.0647120475769043,
						-0.6745875477790833,
						-0.26477181911468506,
						0.13738501071929932,
						-0.6752429008483887
					},
					{
						0.3811111111111111,
						0.3937329053878784,
						0.5815963745117188,
						0.05918169021606445,
						-0.502887487411499,
						-0.3442993462085724,
						0.13763104379177094,
						-0.7807815670967102
					},
					{
						0.41555555555555557,
						0.2192510962486267,
						0.7007341384887695,
						-0.015008926391601562,
						-0.20527523756027222,
						-0.3996013104915619,
						0.053154002875089645,
						-0.8918271064758301
					},
					{
						0.45,
						-0.1432136595249176,
						0.724609375,
						-0.2028360366821289,
						0.4215248227119446,
						-0.3261718153953552,
						-0.2262042909860611,
						-0.8153284192085266
					},
					{
						0.48444444444444446,
						-0.38017502427101135,
						0.42287731170654297,
						-0.3929738998413086,
						0.877770721912384,
						-0.10491940379142761,
						-0.36883461475372314,
						-0.28717857599258423
					},
					{
						0.518888888888889,
						-0.38174882531166077,
						0.10524272918701172,
						-0.5102829933166504,
						0.9383512139320374,
						-0.05470586195588112,
						-0.31591731309890747,
						0.1292305588722229
					},
					{
						0.5533333333333333,
						-0.35169729590415955,
						-0.008626937866210938,
						-0.49230384826660156,
						0.9260607957839966,
						-0.044381286948919296,
						-0.27854278683662415,
						0.25071027874946594
					}
				}
			},
			light_attack_right = {
				damage_window_start = 0.38,
				range_mod = 1.2,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				hit_shield_stop_anim = "attack_hit_shield",
				damage_profile = "light_slashing_linesman",
				hit_effect = "melee_hit_sword_1h",
				damage_window_end = 0.52,
				impact_sound_event = "slashing_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.5,
				anim_event = "attack_swing_right_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 2.1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.6,
						end_time = 0.5,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_right",
						start_time = 0.6,
						action = "action_one",
						end_time = 1.2,
						input = "action_one"
					},
					{
						sub_action = "default_right",
						start_time = 0.6,
						action = "action_one",
						end_time = 1.2,
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 1.2,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.2,
						action = "action_one",
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					}
				},
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.3466666666666667,
						-0.2839936912059784,
						0.2570161819458008,
						0.0697183609008789,
						0.8124752044677734,
						-0.14461937546730042,
						0.28346237540245056,
						0.48848581314086914
					},
					{
						0.3811111111111111,
						-0.19568243622779846,
						0.4652385711669922,
						0.056174278259277344,
						-0.6493186950683594,
						0.3006965219974518,
						-0.1380620300769806,
						-0.684766948223114
					},
					{
						0.41555555555555557,
						-0.024214565753936768,
						0.66607666015625,
						-0.049497127532958984,
						-0.17537879943847656,
						0.43004435300827026,
						0.026085669174790382,
						-0.885225236415863
					},
					{
						0.45,
						0.5154554843902588,
						0.6182632446289062,
						-0.38611555099487305,
						0.6664193868637085,
						0.25685083866119385,
						0.3853805661201477,
						-0.5842899680137634
					},
					{
						0.48444444444444446,
						0.8252131938934326,
						0.3104982376098633,
						-0.5499081611633301,
						0.6222912669181824,
						0.38725194334983826,
						0.5371921062469482,
						-0.41738978028297424
					},
					{
						0.518888888888889,
						0.8305795788764954,
						0.06638145446777344,
						-0.6380338668823242,
						0.7082502245903015,
						0.42626646161079407,
						0.489833801984787,
						-0.27702242136001587
					},
					{
						0.5533333333333333,
						0.7022123336791992,
						-0.10740184783935547,
						-0.6544322967529297,
						0.8858251571655273,
						0.2980952560901642,
						0.33926233649253845,
						-0.1065555065870285
					}
				}
			},
			light_attack_stab_postpush = {
				damage_window_start = 0.18,
				range_mod = 1.2,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = true,
				damage_profile = "light_slashing_smiter_stab",
				hit_shield_stop_anim = "attack_hit_shield",
				ignore_armour_hit = true,
				hit_effect = "melee_hit_hammers_2h",
				attack_direction = "up",
				damage_window_end = 0.28,
				impact_sound_event = "slashing_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.5,
				anim_event = "attack_swing_stab",
				hit_stop_anim = "attack_hit",
				total_time = 1.1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.25,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.5,
						end_time = 0.3,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.3,
						external_multiplier = 0.75,
						end_time = 0.5,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_stab_heavy",
						start_time = 0.45,
						action = "action_one",
						release_required = "action_two_hold",
						input = "action_one"
					},
					{
						sub_action = "default_stab_heavy",
						start_time = 0.45,
						action = "action_one",
						release_required = "action_two_hold",
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.45,
						action = "action_wield",
						input = "action_wield"
					}
				},
				baked_sweep = {
					{
						0.14666666666666667,
						0.4138058125972748,
						-0.7535610198974609,
						-0.23134326934814453,
						0.4791877269744873,
						0.4094158411026001,
						0.7471742630004883,
						-0.21092265844345093
					},
					{
						0.17444444444444446,
						0.44203031063079834,
						-0.7992029190063477,
						-0.0855402946472168,
						0.41981473565101624,
						0.621273398399353,
						0.5972919464111328,
						-0.2846354842185974
					},
					{
						0.20222222222222222,
						0.48705312609672546,
						-0.7165937423706055,
						-0.019828319549560547,
						0.3168947398662567,
						0.6729007959365845,
						0.5487927794456482,
						-0.38158726692199707
					},
					{
						0.23,
						0.44419699907302856,
						-0.30637359619140625,
						0.0032472610473632812,
						0.2890855371952057,
						0.631405770778656,
						0.5466992259025574,
						-0.4678422212600708
					},
					{
						0.2577777777777778,
						0.26958173513412476,
						0.31725311279296875,
						0.008486747741699219,
						0.32415902614593506,
						0.5721301436424255,
						0.5776580572128296,
						-0.48363134264945984
					},
					{
						0.28555555555555556,
						0.1014677882194519,
						0.6388177871704102,
						-0.0385589599609375,
						0.30459797382354736,
						0.6182401776313782,
						0.5816394090652466,
						-0.4320819675922394
					},
					{
						0.31333333333333335,
						0.11796984076499939,
						0.5901260375976562,
						-0.04314136505126953,
						0.30605998635292053,
						0.6162253022193909,
						0.5804847478866577,
						-0.4354664385318756
					}
				}
			},
			light_attack_last = {
				damage_window_start = 0.38,
				range_mod = 1.2,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				damage_profile = "light_slashing_linesman_flat",
				hit_shield_stop_anim = "attack_hit_shield",
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.47,
				impact_sound_event = "slashing_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.5,
				anim_event = "attack_swing_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.25,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.6,
						end_time = 0.5,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.75,
						action = "action_one",
						end_time = 1.2,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.2,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					}
				},
				baked_sweep = {
					{
						0.3466666666666667,
						0.47069698572158813,
						0.5233821868896484,
						0.020588397979736328,
						-0.3636873960494995,
						-0.5445886850357056,
						0.33107203245162964,
						-0.6793718338012695
					},
					{
						0.37277777777777776,
						0.3921804130077362,
						0.5806436538696289,
						0.011724472045898438,
						-0.29193615913391113,
						-0.5825536847114563,
						0.26964372396469116,
						-0.7090111374855042
					},
					{
						0.3988888888888889,
						0.25563544034957886,
						0.6517276763916016,
						-0.0041790008544921875,
						-0.13786914944648743,
						-0.6217384934425354,
						0.1297885924577713,
						-0.7599923014640808
					},
					{
						0.425,
						0.08113536238670349,
						0.7066574096679688,
						-0.03598594665527344,
						0.09439843893051147,
						-0.6190259456634521,
						-0.0762161836028099,
						-0.7759426236152649
					},
					{
						0.4511111111111111,
						-0.20910564064979553,
						0.6462726593017578,
						-0.11395645141601562,
						0.4375883638858795,
						-0.45505666732788086,
						-0.4436973035335541,
						-0.6360601782798767
					},
					{
						0.4772222222222222,
						-0.37667116522789,
						0.4791393280029297,
						-0.2032012939453125,
						-0.6302875280380249,
						0.22755634784698486,
						0.6402571797370911,
						0.37553492188453674
					},
					{
						0.5033333333333333,
						-0.4269550144672394,
						0.35831737518310547,
						-0.2867441177368164,
						-0.6537651419639587,
						0.09862134605646133,
						0.7035896182060242,
						0.26043546199798584
					}
				}
			},
			push = {
				damage_window_start = 0.05,
				anim_end_event = "attack_finished",
				outer_push_angle = 180,
				kind = "push_stagger",
				damage_profile_outer = "medium_push",
				weapon_action_hand = "right",
				push_angle = 100,
				hit_effect = "melee_hit_sword_1h",
				fatigue_regen_delay = 0.75,
				damage_window_end = 0.2,
				impact_sound_event = "slashing_hit",
				charge_value = "action_push",
				no_damage_impact_sound_event = "slashing_hit_armour",
				dedicated_target_range = 2,
				anim_event = "attack_push",
				damage_profile_inner = "shield_push",
				total_time = 0.8,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.25,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_one",
						release_required = "action_two_hold",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_one",
						release_required = "action_two_hold",
						doubleclick_window = 0,
						input = "action_one_hold"
					},
					{
						sub_action = "light_attack_stab_postpush",
						start_time = 0.2,
						action = "action_one",
						doubleclick_window = 0,
						end_time = 0.8,
						input = "action_one_hold",
						hold_required = {
							"action_two_hold",
							"action_one_hold"
						}
					},
					{
						sub_action = "default",
						start_time = 0.3,
						action = "action_two",
						send_buffer = true,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_wield",
						input = "action_wield"
					}
				},
				push_radius = push_radius,
				chain_condition_func = function (attacker_unit, input_extension)
					local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

					return not status_extension:fatigued()
				end
			}
		},
		action_two = {
			default = {
				minimum_hold_time = 0.2,
				hold_input = "action_two_hold",
				kind = "block",
				anim_end_event = "parry_finished",
				cooldown = 0.15,
				weapon_action_hand = "left",
				anim_event_3p = "parry_pose",
				anim_event = "parry_pose",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				total_time = math.huge,
				enter_function = function (attacker_unit, input_extension, remaining_time)
					return input_extension:reset_release_input_with_delay(remaining_time)
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.6,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "push",
						start_time = 0.2,
						action = "action_one",
						doubleclick_window = 0,
						input = "action_one",
						hold_required = {
							"action_two_hold"
						}
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_one",
						release_required = "action_two_hold",
						doubleclick_window = 0,
						input = "action_one"
					}
				}
			}
		},
		action_inspect = ActionTemplates.action_inspect,
		action_wield = ActionTemplates.wield
	},
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right,
	left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1",
	left_hand_attachment_node_linking = AttachmentNodeLinking.shield,
	display_unit = "units/weapons/weapon_display/display_shield_sword",
	wield_anim = "to_1h_sword_shield",
	buff_type = "MELEE_1H",
	weapon_type = "SWORD_1H_SHIELD",
	shield_block = true,
	max_fatigue_points = 10,
	dodge_count = 2,
	can_block_ranged_attacks = true,
	block_angle = 120,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.2,
	outer_block_fatigue_point_multiplier = 2,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	attack_meta_data = {
		tap_attack = {
			penetrating = false,
			arc = 2
		},
		hold_attack = {
			penetrating = true,
			arc = 1
		}
	},
	defense_meta_data = {
		push = "heavy"
	},
	aim_assist_settings = {
		max_range = 5,
		no_aim_input_multiplier = 0,
		base_multiplier = 0,
		effective_max_range = 4,
		breed_scalars = {
			skaven_storm_vermin = 1,
			skaven_clan_rat = 1,
			skaven_slave = 1
		}
	},
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 1,
			[DamageTypes.CLEAVE] = 4,
			[DamageTypes.SPEED] = 4,
			[DamageTypes.STAGGER] = 1,
			[DamageTypes.DAMAGE] = 2
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 3,
			[DamageTypes.CLEAVE] = 3,
			[DamageTypes.SPEED] = 2,
			[DamageTypes.STAGGER] = 4,
			[DamageTypes.DAMAGE] = 3
		}
	},
	tooltip_keywords = {
		"weapon_keyword_fast_attacks",
		"weapon_keyword_wide_sweeps",
		"weapon_keyword_powerful_blocks"
	},
	tooltip_compare = {
		light = {
			action_name = "action_one",
			sub_action_name = "light_attack_left"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "heavy_attack"
		}
	},
	tooltip_detail = {
		light = {
			action_name = "action_one",
			sub_action_name = "default"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "default"
		},
		push = {
			action_name = "action_one",
			sub_action_name = "push"
		}
	},
	wwise_dep_right_hand = {
		"wwise/one_handed_swords"
	},
	wwise_dep_left_hand = {
		"wwise/two_handed_hammers"
	}
}

return {
	one_handed_sword_shield_template_1 = weapon_template
}
