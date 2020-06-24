local push_radius = 2.25
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			stop_action_on_leave_for_bot = true,
			blocking_charge_start_time = 0.3,
			aim_assist_max_ramp_multiplier = 0.3,
			blocking_charge = true,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_left_diagonal",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
					end_time = 0.3,
					buff_name = "planted_charging_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.4,
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
					sub_action = "heavy_attack_left",
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_right = {
			blocking_charge = true,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			blocking_charge_start_time = 0.3,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_right",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
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
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_right_pose = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			blocking_charge = true,
			aim_assist_max_ramp_multiplier = 0.3,
			blocking_charge_start_time = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_right_diagonal_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			custom_start_anim_data = {
				variable_name = "holding_right_charge",
				variable_value = 1,
				anim_event = "swap_charge_stance"
			},
			custom_finish_anim_data = {
				variable_name = "holding_right_charge",
				variable_value = 0,
				anim_event = "swap_charge_stance"
			},
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
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
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_left_down = {
			blocking_charge = true,
			anim_event = "attack_swing_charge_down",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			blocking_charge_start_time = 0.3,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
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
					sub_action = "heavy_attack_down",
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_left_down_pose = {
			blocking_charge = true,
			anim_event = "attack_swing_charge_down_pose",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			blocking_charge_start_time = 0.3,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
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
					sub_action = "heavy_attack_down",
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_left_uppercut = {
			blocking_charge = true,
			anim_event = "attack_swing_charge_left_diagonal_pose",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			blocking_charge_start_time = 0.3,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_uppercut",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_down",
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_left_last = {
			blocking_charge = true,
			anim_event = "attack_swing_charge_left_diagonal_pose",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			blocking_charge_start_time = 0.3,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_bopp",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		default_left_pose = {
			blocking_charge = true,
			anim_event = "attack_swing_charge_left_diagonal_pose",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			blocking_charge_start_time = 0.3,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
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
					sub_action = "heavy_attack_down",
					start_time = 0.65,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				}
			},
			weapon_sway_settings = {
				look_sensitivity = 0.5,
				sway_range = 1,
				recentering_lerp_speed = 2,
				lerp_speed = math.huge
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.15,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.65,
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_shield_stop_anim = "attack_hit_shield",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			slide_armour_hit = true,
			damage_window_end = 0.35,
			impact_sound_event = "slashing_hit",
			damage_profile = "heavy_slashing_axe_linesman",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.06,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right_pose",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right_pose",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
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
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = HEAVY_LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.11666666666666667,
					0.3791685104370117,
					0.4685783386230469,
					0.10753250122070312,
					-0.29659613966941833,
					-0.2202712744474411,
					-0.2715435028076172,
					-0.88869309425354
				},
				{
					0.1611111111111111,
					0.2947731018066406,
					0.3842887878417969,
					0.09287738800048828,
					-0.2634832561016083,
					-0.30120742321014404,
					-0.14100953936576843,
					-0.9055202603340149
				},
				{
					0.20555555555555555,
					0.041419029235839844,
					0.47562408447265625,
					-0.014042854309082031,
					0.344860702753067,
					-0.4112718999385834,
					-0.19103001058101654,
					-0.8218479752540588
				},
				{
					0.24999999999999997,
					-0.27964305877685547,
					0.5121498107910156,
					-0.19674110412597656,
					0.6699513792991638,
					-0.3247097134590149,
					-0.3400876820087433,
					-0.5745164155960083
				},
				{
					0.2944444444444444,
					-0.5088367462158203,
					0.2795143127441406,
					-0.41633081436157227,
					0.8197423219680786,
					-0.20597819983959198,
					-0.3777957558631897,
					-0.3779759407043457
				},
				{
					0.3388888888888888,
					-0.5700826644897461,
					0.09931564331054688,
					-0.4598073959350586,
					0.8482469916343689,
					-0.17180202901363373,
					-0.4430026113986969,
					-0.2339012622833252
				},
				{
					0.3833333333333333,
					-0.45741939544677734,
					0.052516937255859375,
					-0.5478572845458984,
					0.8671284317970276,
					-0.15251770615577698,
					-0.4449205994606018,
					-0.1639275848865509
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.13,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.65,
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_shield_stop_anim = "attack_hit_shield",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			slide_armour_hit = true,
			damage_window_end = 0.25,
			impact_sound_event = "slashing_hit",
			damage_profile = "heavy_slashing_axe_linesman",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.06,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_down_pose",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left_down_pose",
					start_time = 0.8,
					action = "action_one",
					release_required = "action_one_hold",
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
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = HEAVY_LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.09666666666666668,
					-0.17305660247802734,
					0.5285797119140625,
					0.11372661590576172,
					-0.3365972340106964,
					-0.10666239261627197,
					-0.5264724493026733,
					-0.773402988910675
				},
				{
					0.1277777777777778,
					-0.1597576141357422,
					0.5225639343261719,
					0.06473207473754883,
					-0.27134498953819275,
					0.11955821514129639,
					-0.4204733371734619,
					-0.8574846386909485
				},
				{
					0.15888888888888889,
					-0.1230611801147461,
					0.5180511474609375,
					-0.019272327423095703,
					-0.19440074265003204,
					0.33313047885894775,
					-0.24650388956069946,
					-0.8890828490257263
				},
				{
					0.19,
					0.1053152084350586,
					0.5530166625976562,
					-0.12035179138183594,
					0.48335766792297363,
					0.3899962306022644,
					0.28262197971343994,
					-0.7310220003128052
				},
				{
					0.2211111111111111,
					0.1949472427368164,
					0.5465927124023438,
					-0.15764999389648438,
					0.6533540487289429,
					0.2984386384487152,
					0.3385098874568939,
					-0.6078436970710754
				},
				{
					0.25222222222222224,
					0.4065084457397461,
					0.4430885314941406,
					-0.2220292091369629,
					0.8139487504959106,
					0.18887977302074432,
					0.4025731682777405,
					-0.37382712960243225
				},
				{
					0.2833333333333333,
					0.5651302337646484,
					0.21613693237304688,
					-0.2733330726623535,
					0.8480215668678284,
					0.10863828659057617,
					0.49671393632888794,
					-0.14944058656692505
				}
			}
		},
		heavy_attack_down = {
			damage_window_start = 0.22,
			range_mod = 1.65,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "heavy_slashing_smiter",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.31,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.06,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_last",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_one",
					release_required = "action_one_hold",
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
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.18666666666666668,
					0.2686805725097656,
					0.4469757080078125,
					0.16346216201782227,
					-0.3662959635257721,
					-0.10649275034666061,
					-0.19191807508468628,
					-0.904242217540741
				},
				{
					0.2127777777777778,
					0.14287471771240234,
					0.49118804931640625,
					0.15268802642822266,
					-0.3346877694129944,
					-0.19829656183719635,
					-0.19696855545043945,
					-0.8999255299568176
				},
				{
					0.2388888888888889,
					0.0927734375,
					0.5483818054199219,
					0.13570737838745117,
					-0.16469894349575043,
					-0.2379312813282013,
					-0.11417537927627563,
					-0.9503825306892395
				},
				{
					0.265,
					0.07805919647216797,
					0.6670112609863281,
					0.02240276336669922,
					0.2100827991962433,
					-0.2535308003425598,
					-0.15655076503753662,
					-0.9311708807945251
				},
				{
					0.2911111111111111,
					0.013705253601074219,
					0.7236404418945312,
					-0.22794294357299805,
					0.5700648427009583,
					-0.1474035233259201,
					-0.10682392865419388,
					-0.8011784553527832
				},
				{
					0.3172222222222222,
					-0.06187248229980469,
					0.66131591796875,
					-0.49976634979248047,
					0.8095784783363342,
					-0.04902859404683113,
					-0.12122426927089691,
					-0.5722619295120239
				},
				{
					0.3433333333333333,
					-0.08884906768798828,
					0.4658203125,
					-0.6930079460144043,
					0.9455931782722473,
					-0.014193644747138023,
					-0.1423637419939041,
					-0.29220667481422424
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.23,
			anim_end_event = "attack_finished",
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			impact_sound_event = "slashing_hit",
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_shield_stop_anim = "attack_hit_shield",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman_uppercut",
			damage_window_end = 0.39,
			forced_interpolation = 0.008333333333333333,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_up_left",
			hit_stop_anim = "attack_hit",
			total_time = 1.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right_pose",
					start_time = 0.65,
					action = "action_one",
					end_time = 1.3,
					input = "action_one"
				},
				{
					sub_action = "default_right_pose",
					start_time = 1.3,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.19666666666666668,
					0.6324968338012695,
					0.39414215087890625,
					-0.29136180877685547,
					-0.17036713659763336,
					-0.8051277995109558,
					0.20315328240394592,
					-0.5305401682853699
				},
				{
					0.23444444444444446,
					0.4885101318359375,
					0.5797958374023438,
					-0.19304656982421875,
					-0.10054460912942886,
					-0.8221648335456848,
					-0.07711196690797806,
					-0.554967999458313
				},
				{
					0.27222222222222225,
					0.15990829467773438,
					0.6854705810546875,
					-0.12764453887939453,
					-0.13804928958415985,
					0.7240502834320068,
					0.5067001581192017,
					0.44715598225593567
				},
				{
					0.31000000000000005,
					-0.041756629943847656,
					0.66473388671875,
					-0.04866838455200195,
					-0.2234836369752884,
					0.6101587414741516,
					0.6814810633659363,
					0.33666738867759705
				},
				{
					0.3477777777777778,
					-0.2986278533935547,
					0.4053306579589844,
					0.1051173210144043,
					-0.32538193464279175,
					0.42937982082366943,
					0.8180671334266663,
					0.20131006836891174
				},
				{
					0.38555555555555554,
					-0.35166454315185547,
					0.11352920532226562,
					0.08267021179199219,
					-0.39755722880363464,
					0.19390363991260529,
					0.8794819712638855,
					0.17567318677902222
				},
				{
					0.42333333333333334,
					-0.33434295654296875,
					-0.08533096313476562,
					-0.02586984634399414,
					-0.4573375880718231,
					0.017842303961515427,
					0.8637237548828125,
					0.21096265316009521
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.35,
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "medium_slashing_linesman",
			damage_window_end = 0.48,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.86,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_uppercut",
					start_time = 0.75,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default_left_uppercut",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.31666666666666665,
					-0.41110992431640625,
					0.498809814453125,
					-0.10012197494506836,
					-0.4414274990558624,
					0.5649124979972839,
					-0.2636089622974396,
					-0.6453882455825806
				},
				{
					0.34944444444444445,
					-0.33631038665771484,
					0.5909347534179688,
					-0.1012425422668457,
					-0.34809088706970215,
					0.6184917688369751,
					-0.20716291666030884,
					-0.6733381152153015
				},
				{
					0.3822222222222222,
					-0.20609760284423828,
					0.6815719604492188,
					-0.10542440414428711,
					-0.20450764894485474,
					0.6643735766410828,
					-0.09943855553865433,
					-0.7119665145874023
				},
				{
					0.415,
					0.12944698333740234,
					0.6800689697265625,
					-0.13768577575683594,
					0.21445079147815704,
					0.6070753335952759,
					0.3228779435157776,
					-0.6937004327774048
				},
				{
					0.4477777777777777,
					0.3520040512084961,
					0.5871086120605469,
					-0.14858722686767578,
					0.4407956004142761,
					0.423312783241272,
					0.5611967444419861,
					-0.5581790208816528
				},
				{
					0.4805555555555555,
					0.5737638473510742,
					0.38516998291015625,
					-0.16262006759643555,
					0.5879000425338745,
					0.23448874056339264,
					0.7074586153030396,
					-0.31446924805641174
				},
				{
					0.5133333333333333,
					0.6588678359985352,
					0.24283599853515625,
					-0.1809992790222168,
					0.6212498545646667,
					0.21237988770008087,
					0.738985538482666,
					-0.15114142000675201
				}
			}
		},
		light_attack_uppercut = {
			damage_window_start = 0.42,
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "medium_slashing_smiter",
			damage_window_end = 0.47,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.86,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		light_attack_last = {
			damage_window_start = 0.42,
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "medium_slashing_linesman",
			damage_window_end = 0.47,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.86,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.9,
					action = "action_one",
					end_time = 1.15,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.15,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.38666666666666666,
					0.7363805770874023,
					-0.12593460083007812,
					-0.16643333435058594,
					0.646999716758728,
					0.06959909945726395,
					0.7300966382026672,
					-0.20858150720596313
				},
				{
					0.4061111111111111,
					0.7226371765136719,
					-0.18195343017578125,
					-0.1648697853088379,
					0.6556800007820129,
					0.03715409338474274,
					0.7311436533927917,
					-0.1847490519285202
				},
				{
					0.4255555555555555,
					0.7039918899536133,
					-0.22101974487304688,
					-0.15987396240234375,
					0.6618350148200989,
					0.025907710194587708,
					0.7245027422904968,
					-0.1907852739095688
				},
				{
					0.44499999999999995,
					0.6799631118774414,
					-0.2535667419433594,
					-0.1553788185119629,
					0.6823193430900574,
					0.008463210426270962,
					0.7022818922996521,
					-0.202901229262352
				},
				{
					0.46444444444444444,
					0.6761760711669922,
					-0.2562713623046875,
					-0.15721893310546875,
					0.6949613690376282,
					0.00021030032075941563,
					0.689202606678009,
					-0.20500867068767548
				},
				{
					0.48388888888888887,
					0.6740503311157227,
					-0.2562065124511719,
					-0.16286325454711914,
					0.7086345553398132,
					-0.007128794211894274,
					0.6742121577262878,
					-0.20790429413318634
				},
				{
					0.5033333333333333,
					0.6674938201904297,
					-0.2597198486328125,
					-0.18433618545532227,
					0.737693190574646,
					-0.023704154416918755,
					0.6398330330848694,
					-0.21415092051029205
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.42,
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			sweep_z_offset = 0.1,
			width_mod = 30,
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_sword_2h",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_window_end = 0.49,
			impact_sound_event = "slashing_hit",
			damage_profile = "medium_slashing_smiter_2h",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.86,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_down_pose",
					start_time = 0.85,
					action = "action_one",
					release_required = "action_two_hold",
					end_time = 1.15,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.15,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.38666666666666666,
					-0.1989583969116211,
					0.3680992126464844,
					0.20868587493896484,
					-0.7004067301750183,
					0.10822300612926483,
					-0.12767815589904785,
					-0.6938418745994568
				},
				{
					0.40944444444444444,
					-0.14293670654296875,
					0.5453529357910156,
					0.17929506301879883,
					-0.47393956780433655,
					0.12509943544864655,
					-0.06049124151468277,
					-0.8695241808891296
				},
				{
					0.43222222222222223,
					-0.06854534149169922,
					0.6937599182128906,
					0.022417545318603516,
					0.06724625080823898,
					0.20529258251190186,
					0.05751008912920952,
					-0.9746925234794617
				},
				{
					0.45499999999999996,
					-0.020898818969726562,
					0.7313575744628906,
					-0.059223175048828125,
					0.32851389050483704,
					0.2107037454843521,
					0.1267097443342209,
					-0.9119359254837036
				},
				{
					0.47777777777777775,
					0.27248096466064453,
					0.5130996704101562,
					-0.6549301147460938,
					0.5334184765815735,
					0.1688423603773117,
					0.046616293489933014,
					-0.8275167346000671
				},
				{
					0.5005555555555555,
					0.5260906219482422,
					0.2521820068359375,
					-0.7745108604431152,
					0.7251260280609131,
					0.43020734190940857,
					0.09046074002981186,
					-0.5300289392471313
				},
				{
					0.5233333333333333,
					0.641444206237793,
					0.2848548889160156,
					-0.6921453475952148,
					0.7524265646934509,
					0.5359736084938049,
					0.22942394018173218,
					-0.306514710187912
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			no_damage_impact_sound_event = "slashing_hit_armour",
			damage_profile_outer = "light_push",
			weapon_action_hand = "right",
			push_angle = 100,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.2,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			damage_profile_inner = "medium_push",
			total_time = 1.2,
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
					start_time = 0.4,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_one",
					release_required = "action_two_hold",
					doubleclick_window = 0,
					input = "action_one_hold"
				},
				{
					sub_action = "light_attack_bopp",
					start_time = 0.4,
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
					start_time = 0.4,
					action = "action_two",
					send_buffer = true,
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
			end,
			push_radius = push_radius,
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end
		}
	},
	action_two = {
		default = {
			cooldown = 0.15,
			minimum_hold_time = 0.2,
			anim_end_event = "parry_finished",
			kind = "block",
			hold_input = "action_two_hold",
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
					external_multiplier = 0.5,
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
	action_wield = ActionTemplates.wield,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_greatsword/wpn_greatsword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords"
weapon_template.wield_anim = "to_bastard_sword"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 3
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "SWORD_2H"
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2
	}
}
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
		arc = 1
	},
	hold_attack = {
		penetrating = true,
		arc = 2
	}
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	vertical_only = true,
	base_multiplier = 0.025,
	effective_max_range = 3,
	breed_scalars = {
		skaven_storm_vermin = 0.25,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_left"
	}
}
weapon_template.tooltip_detail = {
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
}
weapon_template.wwise_dep_right_hand = {
	"wwise/two_handed_swords"
}

return {
	bastard_sword_template = table.clone(weapon_template)
}
