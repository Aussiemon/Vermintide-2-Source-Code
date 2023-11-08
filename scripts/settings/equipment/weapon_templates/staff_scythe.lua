local push_radius = 2.5
local time_mod = 0.9
local STATE_STAFF = "staff"
local STATE_SCYTHE = "scythe"
local STAFF_DURATION = 0.5
local TRANSITION_BACK_ANIM_EVENT = "to_quarter_staff_auto"
local weapon_template = {
	actions = {
		action_one = {
			default = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				anim_event = "attack_swing_charge_left",
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
						sub_action = "light_attack_01",
						start_time = 0,
						action = "action_one",
						end_time = 0.35,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_01",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.3,
						blocker = true,
						end_time = 2,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_01",
						start_time = 1.6,
						action = "action_one",
						auto_chain = true
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end
			},
			default_02 = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
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
						sub_action = "light_attack_02",
						start_time = 0,
						action = "action_one",
						end_time = 0.39,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_02",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						start_time = 0.3,
						blocker = true,
						end_time = 2,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_02",
						start_time = 1.6,
						action = "action_one",
						auto_chain = true
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end
			},
			default_03 = {
				kind = "melee_start",
				anim_end_event = "attack_finished",
				anim_event = "attack_swing_charge_left_diagonal",
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
						sub_action = "light_attack_03",
						start_time = 0,
						action = "action_one",
						end_time = 0.35,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_03",
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
						start_time = 0.3,
						blocker = true,
						end_time = 2,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_03",
						start_time = 1.6,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_04 = {
				kind = "melee_start",
				anim_end_event = "attack_finished",
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
						sub_action = "light_attack_04",
						start_time = 0,
						action = "action_one",
						end_time = 0.35,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_02",
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
						start_time = 0.3,
						blocker = true,
						end_time = 2,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_02",
						start_time = 1.6,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			light_attack_01 = {
				damage_window_start = 0.43333333333333335,
				kind = "sweep",
				hit_stop_anim = "attack_hit_alt_effect",
				damage_profile = "medium_smiter_depowered",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 30,
				use_precision_sweep = true,
				additional_critical_strike_chance = 0,
				range_mod = 1.3,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				damage_window_end = 0.5333333333333333,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2.85,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_left_diagonal",
				height_mod = 10,
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.55,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.8,
						action = "action_one",
						end_time = 1.5,
						input = "action_one"
					},
					{
						sub_action = "default_02",
						start_time = 1.5,
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
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.75,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.45,
						action = "action_three",
						input = "action_three"
					}
				},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						additional_critical_strike_chance = 0,
						impact_sound_event = "axe_2h_hit",
						use_precision_sweep = true,
						no_damage_impact_sound_event = "blunt_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit",
						damage_profile = "medium_slashing_smiter_2h"
					}
				},
				baked_sweep = {
					{
						0.4,
						0.30054664611816406,
						0.5219593048095703,
						0.042963504791259766,
						-0.4971965551376343,
						-0.24019616842269897,
						-0.14090164005756378,
						-0.8217348456382751
					},
					{
						0.4277777777777778,
						0.23145675659179688,
						0.6864261627197266,
						-0.026688098907470703,
						-0.3198228180408478,
						-0.2581840455532074,
						-0.21674084663391113,
						-0.8854816555976868
					},
					{
						0.45555555555555555,
						0.12834835052490234,
						0.7814979553222656,
						-0.11328458786010742,
						0.08230207860469818,
						-0.28318578004837036,
						-0.14443394541740417,
						-0.9445480704307556
					},
					{
						0.48333333333333334,
						-0.08359241485595703,
						0.7521762847900391,
						-0.1735396385192871,
						0.3662749230861664,
						-0.3625516891479492,
						-0.19328907132148743,
						-0.834888219833374
					},
					{
						0.5111111111111111,
						-0.29885292053222656,
						0.4400367736816406,
						-0.32950878143310547,
						0.7148647904396057,
						-0.3062986135482788,
						-0.46994462609291077,
						-0.41749444603919983
					},
					{
						0.5388888888888889,
						-0.3806486129760742,
						0.081512451171875,
						-0.3639845848083496,
						0.7654362916946411,
						-0.3114038109779358,
						-0.561683177947998,
						-0.04058277979493141
					},
					{
						0.5666666666666667,
						-0.32607078552246094,
						0.05596351623535156,
						-0.3336052894592285,
						-0.5299474596977234,
						0.5229137539863586,
						0.6015715003013611,
						-0.2895318865776062
					}
				}
			},
			light_attack_02 = {
				damage_window_start = 0.21666666666666667,
				kind = "sweep",
				hit_stop_anim = "attack_hit_alt_effect",
				damage_profile = "medium_blunt_tank",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 30,
				use_precision_sweep = true,
				additional_critical_strike_chance = 0.05,
				range_mod = 1.3,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				damage_window_end = 0.2833333333333333,
				impact_sound_event = "hammer_2h_hit",
				aim_assist_max_ramp_multiplier = 0.8,
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2.85,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_up_right",
				height_mod = 10,
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_03",
						start_time = 0.36,
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
						start_time = 0.6,
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
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.9,
						action = "action_three",
						input = "action_three"
					}
				},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						additional_critical_strike_chance = 0,
						impact_sound_event = "slashing_hit",
						use_precision_sweep = true,
						no_damage_impact_sound_event = "blunt_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit",
						damage_profile = "medium_slashing_axe_linesman_burning"
					}
				},
				baked_sweep = {
					{
						0.18333333333333335,
						-0.16759061813354492,
						0.6618995666503906,
						-0.5492229461669922,
						-0.10948411375284195,
						0.9778963923454285,
						-0.03849861025810242,
						-0.17392461001873016
					},
					{
						0.20555555555555557,
						-0.11287260055541992,
						0.8520717620849609,
						-0.3899364471435547,
						-0.03387569636106491,
						0.9538710117340088,
						0.2283870428800583,
						-0.1918903887271881
					},
					{
						0.22777777777777777,
						-0.009514331817626953,
						0.8974781036376953,
						-0.16458415985107422,
						0.014378730207681656,
						0.8983216881752014,
						0.3934813439846039,
						-0.19489461183547974
					},
					{
						0.25,
						0.17293119430541992,
						0.8235015869140625,
						0.14958810806274414,
						0.05875703692436218,
						0.7648909091949463,
						0.5971611738204956,
						-0.23428203165531158
					},
					{
						0.2722222222222222,
						0.43770551681518555,
						0.6122283935546875,
						0.4152412414550781,
						0.24411386251449585,
						0.5688019394874573,
						0.7345988154411316,
						-0.2779160737991333
					},
					{
						0.2944444444444444,
						0.5197091102600098,
						0.33924102783203125,
						0.4206123352050781,
						0.38893553614616394,
						0.4366249740123749,
						0.7104510068893433,
						-0.3915957808494568
					},
					{
						0.31666666666666665,
						0.5424580574035645,
						0.14911651611328125,
						0.29849863052368164,
						0.41556650400161743,
						0.3742249310016632,
						0.6971681714057922,
						-0.4485718607902527
					}
				}
			},
			light_attack_03 = {
				damage_window_start = 0.4666666666666667,
				kind = "sweep",
				hit_stop_anim = "attack_hit_alt_effect",
				damage_profile = "medium_blunt_tank",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 30,
				use_precision_sweep = false,
				additional_critical_strike_chance = 0,
				range_mod = 1.3,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				damage_window_end = 0.55,
				impact_sound_event = "hammer_2h_hit",
				aim_assist_max_ramp_multiplier = 0.8,
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_left",
				height_mod = 10,
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_04",
						start_time = 0.67,
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
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.9,
						action = "action_three",
						input = "action_three"
					}
				},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						additional_critical_strike_chance = 0,
						impact_sound_event = "slashing_hit",
						use_precision_sweep = false,
						no_damage_impact_sound_event = "slashing_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit",
						damage_profile = "medium_slashing_scythe_linesman"
					}
				},
				baked_sweep = {
					{
						0.43333333333333335,
						0.5095835328102112,
						0.2583599090576172,
						-0.07055902481079102,
						-0.4663357138633728,
						-0.4413534700870514,
						0.0839603990316391,
						-0.7620294094085693
					},
					{
						0.45833333333333337,
						0.47576242685317993,
						0.4109649658203125,
						-0.06348466873168945,
						-0.33022674918174744,
						-0.6013615727424622,
						0.07653167843818665,
						-0.723503589630127
					},
					{
						0.48333333333333334,
						0.1491900086402893,
						0.7077369689941406,
						-0.05251312255859375,
						0.07444854080677032,
						-0.6893954873085022,
						-0.14616090059280396,
						-0.7055695056915283
					},
					{
						0.5083333333333333,
						-0.10131257772445679,
						0.7217540740966797,
						-0.06398963928222656,
						0.30982330441474915,
						-0.6063351631164551,
						-0.3436896800994873,
						-0.6467183232307434
					},
					{
						0.5333333333333333,
						-0.39280790090560913,
						0.5119361877441406,
						-0.11132287979125977,
						-0.5214712619781494,
						0.3985695540904999,
						0.6073830723762512,
						0.4475441873073578
					},
					{
						0.5583333333333333,
						-0.4421204924583435,
						0.15189743041992188,
						-0.11224126815795898,
						-0.6256924867630005,
						0.24814537167549133,
						0.7008963227272034,
						0.23596012592315674
					},
					{
						0.5833333333333334,
						-0.4043816924095154,
						0.03955268859863281,
						-0.0994114875793457,
						-0.6868243217468262,
						0.03827366605401039,
						0.7237198352813721,
						0.055110134184360504
					}
				}
			},
			light_attack_04 = {
				damage_window_start = 0.36666666666666664,
				kind = "sweep",
				hit_stop_anim = "attack_hit_alt_effect",
				damage_profile = "medium_blunt_tank",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 30,
				use_precision_sweep = false,
				additional_critical_strike_chance = 0,
				range_mod = 1.3,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				damage_window_end = 0.4666666666666667,
				impact_sound_event = "hammer_2h_hit",
				aim_assist_max_ramp_multiplier = 0.8,
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_right",
				height_mod = 10,
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.75,
						action = "action_one",
						end_time = 1.5,
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
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.9,
						action = "action_three",
						input = "action_three"
					}
				},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						additional_critical_strike_chance = 0,
						impact_sound_event = "slashing_hit",
						use_precision_sweep = false,
						no_damage_impact_sound_event = "slashing_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit",
						damage_profile = "medium_slashing_scythe_linesman"
					}
				},
				baked_sweep = {
					{
						0.3333333333333333,
						-0.693317174911499,
						0.16170310974121094,
						-0.0628962516784668,
						-0.458098828792572,
						0.5248879790306091,
						0.009194445796310902,
						-0.717323899269104
					},
					{
						0.3611111111111111,
						-0.6412150859832764,
						0.16611671447753906,
						-0.1127924919128418,
						-0.45636865496635437,
						0.5643148422241211,
						-0.05643096938729286,
						-0.6856325268745422
					},
					{
						0.3888888888888889,
						-0.5353372097015381,
						0.6200637817382812,
						-0.10993289947509766,
						-0.09685789048671722,
						0.7034581303596497,
						0.11434821039438248,
						-0.6947587728500366
					},
					{
						0.41666666666666663,
						-0.03949427604675293,
						0.9825458526611328,
						-0.06416893005371094,
						0.31060951948165894,
						0.5987669229507446,
						0.38492491841316223,
						-0.6299467086791992
					},
					{
						0.4444444444444444,
						0.4594748020172119,
						0.9300060272216797,
						-0.06968832015991211,
						0.5064276456832886,
						0.4631931781768799,
						0.5447549223899841,
						-0.4818975329399109
					},
					{
						0.4722222222222222,
						0.7370684146881104,
						0.5147609710693359,
						-0.0946798324584961,
						0.6237006783485413,
						0.3521563410758972,
						0.6433971524238586,
						-0.27022886276245117
					},
					{
						0.5,
						0.5954325199127197,
						0.11525917053222656,
						-0.5572061538696289,
						0.7209942936897278,
						0.16597847640514374,
						0.30307236313819885,
						-0.6006374955177307
					}
				}
			},
			heavy_attack_01 = {
				damage_window_start = 0.3,
				push_radius = 3,
				range_mod = 1.3,
				kind = "sweep",
				damage_profile = "heavy_slashing_linesman_scythe",
				sweep_z_offset = 0.05,
				width_mod = 30,
				slide_armour_hit = true,
				no_damage_impact_sound_event = "blunt_hit_armour",
				hit_effect = "melee_hit_axes_2h",
				hit_stop_anim = "attack_hit",
				damage_window_end = 0.4,
				impact_sound_event = "slashing_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_heavy",
				height_mod = 10,
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.4,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.6,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default_02",
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
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.26666666666666666,
						0.4152097702026367,
						0.6086196899414062,
						-0.05331239104270935,
						-0.13105513155460358,
						-0.7314476370811462,
						0.10592913627624512,
						-0.6607480645179749
					},
					{
						0.29444444444444445,
						0.1332073211669922,
						0.7630805969238281,
						-0.047780841588974,
						0.08247946947813034,
						-0.6969559192657471,
						-0.12603609263896942,
						-0.7011165618896484
					},
					{
						0.32222222222222224,
						-0.16298151016235352,
						0.7812271118164062,
						-0.046770185232162476,
						0.3037611246109009,
						-0.6025699973106384,
						-0.3698791563510895,
						-0.6386141777038574
					},
					{
						0.35,
						-0.37711381912231445,
						0.6492233276367188,
						-0.042201608419418335,
						0.4348963797092438,
						-0.5114820599555969,
						-0.49399256706237793,
						-0.5524697303771973
					},
					{
						0.37777777777777777,
						-0.501737117767334,
						0.39977359771728516,
						-0.01581248641014099,
						-0.5739884376525879,
						0.38484492897987366,
						0.6154848337173462,
						0.3789590895175934
					},
					{
						0.40555555555555556,
						-0.5307803153991699,
						0.1589527130126953,
						-0.025302261114120483,
						0.6919363141059875,
						-0.20763114094734192,
						-0.6684946417808533,
						-0.17671582102775574
					},
					{
						0.43333333333333335,
						-0.5166339874267578,
						0.04032611846923828,
						-0.11622151732444763,
						0.7478496432304382,
						-0.07818465679883957,
						-0.6510701775550842,
						-0.1035168319940567
					}
				}
			},
			heavy_attack_02 = {
				damage_window_start = 0.23,
				push_radius = 3,
				range_mod = 1.3,
				kind = "sweep",
				damage_profile = "heavy_slashing_linesman_scythe",
				sweep_z_offset = 0.1,
				width_mod = 30,
				no_damage_impact_sound_event = "blunt_hit_armour",
				additional_critical_strike_chance = 0,
				hit_effect = "melee_hit_axes_2h",
				hit_stop_anim = "attack_hit",
				slide_armour_hit = true,
				damage_window_end = 0.4,
				impact_sound_event = "slashing_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_right",
				height_mod = 10,
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.4,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_03",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
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
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				critical_strike = {},
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.19666666666666668,
						-0.4505634307861328,
						0.16849327087402344,
						-0.12175804376602173,
						-0.6404093503952026,
						0.3629157841205597,
						-0.1982496827840805,
						-0.647197961807251
					},
					{
						0.23611111111111113,
						-0.3035697937011719,
						0.5601034164428711,
						-0.07732045650482178,
						-0.1968754678964615,
						0.6977168321609497,
						-0.014487086795270443,
						-0.688637375831604
					},
					{
						0.27555555555555555,
						0.22207355499267578,
						0.9111900329589844,
						-0.05649673938751221,
						0.40968161821365356,
						0.5340631604194641,
						0.44253361225128174,
						-0.5925381779670715
					},
					{
						0.315,
						0.5190346240997314,
						0.8491950035095215,
						-0.10255640745162964,
						0.5005622506141663,
						0.4225209951400757,
						0.5265942811965942,
						-0.5418595671653748
					},
					{
						0.35444444444444445,
						0.6253247261047363,
						0.7309832572937012,
						-0.08622962236404419,
						0.5475370287895203,
						0.3628223240375519,
						0.556235134601593,
						-0.5090831518173218
					},
					{
						0.3938888888888889,
						0.7597126960754395,
						0.45589637756347656,
						-0.12383407354354858,
						0.6193920969963074,
						0.28836894035339355,
						0.6393374800682068,
						-0.35276681184768677
					},
					{
						0.43333333333333335,
						0.5665428638458252,
						-0.0071563720703125,
						-0.34968554973602295,
						0.7318960428237915,
						-0.012426198460161686,
						0.5661217570304871,
						-0.3790513575077057
					}
				}
			},
			heavy_attack_03 = {
				damage_window_start = 0.32,
				push_radius = 3,
				range_mod = 1.3,
				kind = "sweep",
				damage_profile = "heavy_slashing_linesman_scythe_diagonal",
				sweep_z_offset = 0.1,
				width_mod = 30,
				no_damage_impact_sound_event = "blunt_hit_armour",
				use_precision_sweep = true,
				hit_stop_anim = "attack_hit",
				hit_effect = "melee_hit_axes_2h",
				damage_window_end = 0.44,
				impact_sound_event = "slashing_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_left_diagonal",
				height_mod = 10,
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.4,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_04",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
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
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				critical_strike = {}
			},
			heavy_attack_04 = {
				damage_window_start = 0.32,
				push_radius = 3,
				kind = "sweep",
				hit_stop_anim = "attack_hit_alt_effect",
				sweep_z_offset = 0.1,
				width_mod = 30,
				damage_profile = "scythe_blunt_smiter",
				no_damage_impact_sound_event = "blunt_hit_armour",
				range_mod = 1.3,
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.44,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_left_diagonal",
				height_mod = 10,
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.4,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
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
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				critical_strike = {},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						damage_profile = "heavy_slashing_smiter_executioner",
						impact_sound_event = "slashing_hit",
						use_precision_sweep = true,
						no_damage_impact_sound_event = "blunt_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit"
					}
				},
				baked_sweep = {
					{
						0.2866666666666667,
						0.3104248046875,
						0.5562276840209961,
						0.1757810115814209,
						-0.3655743896961212,
						-0.3674497902393341,
						-0.01815829984843731,
						-0.8549890518188477
					},
					{
						0.31777777777777777,
						0.17102861404418945,
						0.7108621597290039,
						0.06741392612457275,
						-0.0522516705095768,
						-0.29817894101142883,
						-0.12182193994522095,
						-0.9452610611915588
					},
					{
						0.3488888888888889,
						0.052559733390808105,
						0.7940549850463867,
						-0.10201036930084229,
						0.2614489495754242,
						-0.29416969418525696,
						-0.1595599204301834,
						-0.9053448438644409
					},
					{
						0.38,
						-0.19650793075561523,
						0.7215518951416016,
						-0.3597773313522339,
						0.5550665855407715,
						-0.3068503439426422,
						-0.2958104908466339,
						-0.714310884475708
					},
					{
						0.4111111111111111,
						-0.2650707960128784,
						0.368865966796875,
						-0.5326212644577026,
						0.7866489887237549,
						-0.3067893385887146,
						-0.4433578550815582,
						-0.3008280396461487
					},
					{
						0.4422222222222222,
						-0.15202689170837402,
						0.16031455993652344,
						-0.5822280645370483,
						0.8591891527175903,
						-0.41852259635925293,
						-0.2887459993362427,
						0.0570848174393177
					},
					{
						0.47333333333333333,
						-0.10843932628631592,
						0.015852928161621094,
						-0.5366179943084717,
						0.8244459629058838,
						-0.39896419644355774,
						-0.2714940905570984,
						0.2956475019454956
					}
				}
			},
			light_attack_bopp = {
				damage_window_start = 0.21666666666666667,
				kind = "sweep",
				charge_value = "light_attack",
				damage_profile = "medium_blunt_tank",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 30,
				use_precision_sweep = false,
				additional_critical_strike_chance = 0,
				range_mod = 1.6,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				damage_window_end = 0.3,
				impact_sound_event = "hammer_2h_hit",
				hit_stop_kill_anim = "hit_right_shake",
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_left_diagonal_last",
				hit_stop_anim = "attack_hit_alt_effect",
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.65,
						action = "action_one",
						end_time = 1.8,
						input = "action_one"
					},
					{
						sub_action = "default_02",
						start_time = 1.8,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.45,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_three",
						input = "action_three"
					}
				},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						additional_critical_strike_chance = 0,
						impact_sound_event = "slashing_hit",
						use_precision_sweep = false,
						no_damage_impact_sound_event = "slashing_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit",
						damage_profile = "medium_slashing_axe_linesman_burning"
					}
				},
				baked_sweep = {
					{
						0.18333333333333335,
						0.31371915340423584,
						0.5413756370544434,
						0.07262134552001953,
						-0.4966428279876709,
						-0.16589108109474182,
						-0.10229622572660446,
						-0.8457905054092407
					},
					{
						0.20833333333333334,
						0.24690043926239014,
						0.678889274597168,
						-0.008594512939453125,
						-0.34349238872528076,
						-0.23335771262645721,
						-0.1888810396194458,
						-0.8898770213127136
					},
					{
						0.23333333333333334,
						0.14380168914794922,
						0.7687478065490723,
						-0.09970283508300781,
						0.025148391723632812,
						-0.2808650732040405,
						-0.21731889247894287,
						-0.9344810843467712
					},
					{
						0.2583333333333333,
						0.013918399810791016,
						0.7663822174072266,
						-0.15150046348571777,
						0.33097928762435913,
						-0.33594992756843567,
						-0.16506728529930115,
						-0.8662235140800476
					},
					{
						0.2833333333333333,
						-0.20756900310516357,
						0.684699535369873,
						-0.264678955078125,
						0.48989400267601013,
						-0.3731260299682617,
						-0.22438403964042664,
						-0.7552699446678162
					},
					{
						0.30833333333333335,
						-0.3908705711364746,
						0.23055648803710938,
						-0.37360095977783203,
						0.7879198789596558,
						-0.2602076828479767,
						-0.5099837779998779,
						-0.2266954779624939
					},
					{
						0.3333333333333333,
						-0.35590028762817383,
						0.07958698272705078,
						-0.3390374183654785,
						0.629177987575531,
						-0.4757614731788635,
						-0.5987846851348877,
						0.13871967792510986
					}
				}
			},
			light_attack_bopp_02 = {
				damage_window_start = 0.23,
				kind = "sweep",
				charge_value = "light_attack",
				damage_profile = "medium_blunt_tank",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 30,
				use_precision_sweep = true,
				additional_critical_strike_chance = 0,
				range_mod = 1.6,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				damage_window_end = 0.35,
				impact_sound_event = "hammer_2h_hit",
				hit_stop_kill_anim = "hit_left_shake",
				anim_end_event = "attack_finished",
				weapon_mode_key = "scythe_state",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_up_right",
				hit_stop_anim = "attack_hit_alt_effect",
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_03",
						start_time = 0.65,
						action = "action_one",
						end_time = 1.8,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.8,
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
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_three",
						input = "action_three"
					}
				},
				weapon_mode_overrides = {
					[STATE_SCYTHE] = {
						additional_critical_strike_chance = 0,
						impact_sound_event = "slashing_hit",
						use_precision_sweep = true,
						no_damage_impact_sound_event = "blunt_hit_armour",
						hit_effect = "melee_hit_axes_2h",
						hit_stop_anim = "attack_hit",
						damage_profile = "medium_slashing_axe_linesman_burning"
					}
				},
				baked_sweep = {
					{
						0.19666666666666668,
						-0.11637759208679199,
						0.30611515045166016,
						-0.5725600719451904,
						-0.227874293923378,
						0.8696979284286499,
						-0.43025484681129456,
						-0.08111460506916046
					},
					{
						0.2277777777777778,
						-0.16224896907806396,
						0.577244758605957,
						-0.5723600387573242,
						-0.13550345599651337,
						0.9687548875808716,
						-0.13941590487957,
						-0.15400005877017975
					},
					{
						0.2588888888888889,
						-0.10174977779388428,
						0.8665046691894531,
						-0.36533164978027344,
						-0.026148129254579544,
						0.9469031691551208,
						0.2568690776824951,
						-0.19159576296806335
					},
					{
						0.29,
						0.06849563121795654,
						0.8661661148071289,
						-0.012212753295898438,
						0.03236248344182968,
						0.8422188758850098,
						0.48955094814300537,
						-0.22351710498332977
					},
					{
						0.3211111111111111,
						0.4204641580581665,
						0.6323270797729492,
						0.40378332138061523,
						0.22658267617225647,
						0.5842970609664917,
						0.7309736013412476,
						-0.27006447315216064
					},
					{
						0.3522222222222222,
						0.5265094041824341,
						0.2710990905761719,
						0.39212822914123535,
						0.40265029668807983,
						0.41186636686325073,
						0.7051479816436768,
						-0.4135277569293976
					},
					{
						0.3833333333333333,
						0.5472701787948608,
						0.03551006317138672,
						0.17334699630737305,
						0.400155633687973,
						0.3519469201564789,
						0.6968945860862732,
						-0.4799445867538452
					}
				}
			},
			push = {
				damage_window_start = 0.05,
				anim_end_event = "attack_finished",
				outer_push_angle = 180,
				kind = "push_stagger",
				damage_profile_outer = "light_push",
				weapon_action_hand = "right",
				push_angle = 100,
				hit_effect = "melee_hit_sword_1h",
				damage_window_end = 0.2,
				impact_sound_event = "slashing_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				dedicated_target_range = 2,
				anim_event = "attack_push",
				damage_profile_inner = "medium_push",
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
						start_time = 0.3,
						action = "action_one",
						release_required = "action_two_hold",
						doubleclick_window = 0,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.3,
						action = "action_one",
						release_required = "action_two_hold",
						doubleclick_window = 0,
						input = "action_one_hold"
					},
					{
						sub_action = "light_attack_bopp",
						start_time = 0.35,
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
						start_time = 0.45,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.4,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.3,
						action = "action_three",
						input = "action_three"
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
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_three",
						input = "action_three"
					}
				}
			}
		},
		action_three = {
			default = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_three_hold",
				anim_event = "special_action",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.9,
						end_time = 1,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 1,
						external_multiplier = 0.6,
						end_time = 1.4,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "special_action_attack",
						start_time = 0.7,
						action = "action_three",
						input = "action_three_release"
					},
					{
						start_time = 0.1,
						blocker = true,
						end_time = 1.4,
						input = "action_three_hold"
					},
					{
						sub_action = "special_action_attack",
						action = "action_three",
						auto_chain = true,
						release_required = "action_three",
						start_time = 0.7
					}
				},
				enter_function = function (attacker_unit, input_extension, _, weapon_extension)
					return input_extension:reset_release_input()
				end,
				condition_func = function (player_unit, input_extension, ammo_extension, weapon_extension)
					if weapon_extension then
						return weapon_extension:get_custom_data("scythe_state") == STATE_SCYTHE
					end

					return false
				end,
				chain_condition_func = function (player_unit, input_extension, ammo_extension, weapon_extension)
					if weapon_extension then
						return weapon_extension:get_custom_data("scythe_state") == STATE_SCYTHE
					end

					return false
				end
			},
			special_action_attack = {
				damage_window_start = 0.2,
				forward_offset = 1,
				anim_end_event = "attack_finished",
				push_radius = 3,
				kind = "shield_slam",
				damage_profile_target = "scythe_discharge",
				additional_critical_strike_chance = 0,
				armor_impact_sound_event = "shield_hit_armour",
				hit_time = 0.2,
				weapon_action_hand = "right",
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				damage_window_end = 0.35,
				impact_sound_event = "shield_hit",
				charge_value = "heavy_attack",
				no_damage_impact_sound_event = "shield_hit_armour",
				damage_profile_aoe = "scythe_discharge",
				aim_assist_ramp_decay_delay = 0.2,
				dedicated_target_range = 4,
				damage_profile = "scythe_discharge",
				uninterruptible = true,
				anim_event = "special_action_02",
				total_time = 0.8,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.1,
						end_time = 0.1,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.1,
						external_multiplier = 0.2,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.55,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.3,
						action = "action_one",
						end_time = 1.5,
						input = "action_one"
					},
					{
						sub_action = "default_02",
						start_time = 1.5,
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
						start_time = 0,
						action = "action_wield",
						end_time = 0.1,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.75,
						action = "action_wield",
						input = "action_wield"
					}
				},
				finish_function = function (attacker_unit, reason, weapon_extension)
					if weapon_extension then
						weapon_extension:set_custom_data("activation_t", Managers.time:time("game"))
						weapon_extension:set_custom_data("scythe_state", STATE_STAFF)
						Unit.flow_event(weapon_extension.unit, "close")
					end
				end,
				enter_function = function (attacker_unit, input_extension, remaining_time, weapon_extension)
					return
				end
			}
		},
		action_inspect = ActionTemplates.action_inspect,
		action_wield = ActionTemplates.wield
	},
	update = function (weapon_extension, dt, t)
		if not weapon_extension then
			return
		end

		local current_state = weapon_extension:get_custom_data("scythe_state")

		if current_state == STATE_STAFF then
			local activation_t = weapon_extension:get_custom_data("activation_t")

			if t > activation_t + STAFF_DURATION and (not weapon_extension:has_current_action() or weapon_extension:is_after_damage_window() or weapon_extension:get_current_action_settings().kind == "melee_start") then
				Unit.flow_event(weapon_extension.unit, "open")
				weapon_extension:set_custom_data("scythe_state", STATE_SCYTHE)
				weapon_extension:trigger_anim_event(TRANSITION_BACK_ANIM_EVENT)
			end
		end
	end,
	on_wield = function (weapon_extension, hand_name)
		if not weapon_extension then
			return
		end

		local current_state = weapon_extension:get_custom_data("scythe_state")

		if not current_state or current_state == STATE_STAFF then
			Unit.flow_event(weapon_extension.unit, "close")
			weapon_extension:set_custom_data("scythe_state", STATE_STAFF)
		else
			Unit.flow_event(weapon_extension.unit, "open")
		end
	end,
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.ghost_scythe,
	display_unit = "units/weapons/weapon_display/display_2h_hammers",
	wield_anim = "to_quarter_staff_wield",
	state_machine = "units/beings/player/first_person_base/state_machines/melee/ghost_scythe",
	buff_type = "MELEE_2H",
	weapon_type = "MACE_2H",
	max_fatigue_points = 6,
	dodge_count = 2,
	block_angle = 90,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.5,
	outer_block_fatigue_point_multiplier = 2,
	sound_event_block_within_arc = "weapon_foley_blunt_2h_block_wood",
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	custom_data = {
		activation_t = 0,
		scythe_state = STATE_SCYTHE
	},
	attack_meta_data = {
		tap_attack = {
			max_range = 2.75,
			arc = 0,
			penetrating = true
		},
		hold_attack = {
			max_range = 3,
			arc = 2,
			penetrating = true
		}
	},
	aim_assist_settings = {
		max_range = 5,
		no_aim_input_multiplier = 0,
		base_multiplier = 0,
		effective_max_range = 4,
		breed_scalars = {
			skaven_storm_vermin = 1,
			skaven_clan_rat = 0.5,
			skaven_slave = 0.5
		}
	},
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 3,
			[DamageTypes.CLEAVE] = 3,
			[DamageTypes.SPEED] = 2,
			[DamageTypes.STAGGER] = 3,
			[DamageTypes.DAMAGE] = 4
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 3,
			[DamageTypes.CLEAVE] = 7,
			[DamageTypes.SPEED] = 2,
			[DamageTypes.STAGGER] = 4,
			[DamageTypes.DAMAGE] = 4
		}
	},
	tooltip_keywords = {
		"weapon_keyword_wide_sweeps",
		"weapon_keyword_crowd_control",
		"weapon_keyword_damage_over_time"
	},
	tooltip_compare = {
		light = {
			action_name = "action_one",
			sub_action_name = "light_attack_01"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "heavy_attack_01"
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
		"wwise/two_handed_hammers"
	}
}

return {
	staff_scythe = table.clone(weapon_template)
}
