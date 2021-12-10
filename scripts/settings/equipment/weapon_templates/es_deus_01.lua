local push_radius = 3
local time_mod = 0.8
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_max_ramp_multiplier = 0.4,
			uninterruptible = true,
			anim_event = "attack_swing_charge_left",
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
					sub_action = "light_attack_left",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.4,
					action = "action_one",
					force_release_input = "action_one_hold",
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
					start_time = 1,
					action = "action_one",
					force_release_input = "action_one_hold",
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
		default_left_heavy = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			uninterruptible = true,
			anim_event = "attack_swing_charge_right_diagonal_pose",
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
					force_release_input = "action_one_hold",
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
					start_time = 1,
					action = "action_one",
					force_release_input = "action_one_hold",
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
			damage_window_start = 0.28,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = 0.05,
			width_mod = 35,
			no_damage_impact_sound_event = "slashing_hit_armour",
			invert_attack_direction = true,
			hit_effect = "melee_hit_sword_1h",
			use_precision_sweep = false,
			damage_window_end = 0.43,
			impact_sound_event = "slashing_hit",
			damage_profile = "medium_slashing_tank_es_01",
			anim_end_event = "attack_finished",
			additional_critical_strike_chance = 0,
			dedicated_target_range = 2,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.8,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_heavy",
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default_left_heavy",
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_two",
					doubleclick_window = 0,
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0.5,
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
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			impact_axis = Vector3Box(0, 0, -1),
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.2466666666666667,
					0.8481674194335938,
					-0.10765933990478516,
					-0.20754414796829224,
					0.4826394021511078,
					-0.5212758183479309,
					0.46281129121780396,
					-0.5302230715751648
				},
				{
					0.2827777777777778,
					0.8585577011108398,
					0.26488733291625977,
					-0.20527946949005127,
					0.6319555640220642,
					-0.36937788128852844,
					0.32199686765670776,
					-0.6004248857498169
				},
				{
					0.3188888888888889,
					0.6014680862426758,
					0.7387833595275879,
					-0.15025246143341064,
					0.6992065906524658,
					-0.13304929435253143,
					0.16318976879119873,
					-0.6832109093666077
				},
				{
					0.355,
					-0.0148162841796875,
					0.9403946399688721,
					-0.1473289132118225,
					0.6735708117485046,
					0.0876287892460823,
					-0.0059226141311228275,
					-0.7338859438896179
				},
				{
					0.3911111111111111,
					-0.5091276168823242,
					0.7216956615447998,
					-0.18042176961898804,
					0.5820369124412537,
					0.33827102184295654,
					-0.19743135571479797,
					-0.7126196026802063
				},
				{
					0.42722222222222217,
					-0.7534818649291992,
					0.418043851852417,
					-0.2583085894584656,
					0.40503209829330444,
					0.5593182444572449,
					-0.40102019906044006,
					-0.6019095778465271
				},
				{
					0.4633333333333333,
					0.025651931762695312,
					0.21631574630737305,
					-0.8495690822601318,
					0.7278453707695007,
					-0.3012484014034271,
					-0.24588492512702942,
					-0.5648283958435059
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.3,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = 0.05,
			width_mod = 35,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "medium_slashing_tank_es_01",
			damage_window_end = 0.38,
			impact_sound_event = "slashing_hit",
			dedicated_target_range = 2.5,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.6,
					end_time = 0.35,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_stab_heavy",
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default_stab_heavy",
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.05,
					action = "action_one",
					doubleclick_window = 0,
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
					0.26666666666666666,
					-0.21895790100097656,
					0.11526107788085938,
					0.15563392639160156,
					-0.6984267830848694,
					0.22516123950481415,
					-0.1596071720123291,
					-0.6603241562843323
				},
				{
					0.2911111111111111,
					-0.2259044647216797,
					0.3726844787597656,
					0.29427099227905273,
					-0.36037781834602356,
					0.25068724155426025,
					-0.09310238063335419,
					-0.8936530351638794
				},
				{
					0.31555555555555553,
					-0.08983993530273438,
					0.8228368759155273,
					0.15589356422424316,
					0.19784392416477203,
					0.15410447120666504,
					0.005756710190325975,
					-0.9680271148681641
				},
				{
					0.33999999999999997,
					0.11115264892578125,
					0.9163446426391602,
					-0.26224637031555176,
					0.5842611789703369,
					0.12894073128700256,
					0.07257296144962311,
					-0.7979638576507568
				},
				{
					0.36444444444444446,
					0.2857847213745117,
					0.6575870513916016,
					-0.7646775245666504,
					0.849442720413208,
					0.13708895444869995,
					0.08929070830345154,
					-0.5016781687736511
				},
				{
					0.3888888888888889,
					0.40459251403808594,
					0.34636735916137695,
					-0.9054334163665771,
					0.9154361486434937,
					0.17865405976772308,
					0.10376108437776566,
					-0.345388263463974
				},
				{
					0.41333333333333333,
					0.38057422637939453,
					0.3634829521179199,
					-0.8851473331451416,
					0.909425675868988,
					0.14736054837703705,
					0.09400830417871475,
					-0.377348929643631
				}
			}
		},
		heavy_attack_stab = {
			damage_window_start = 0.25,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = 0.05,
			width_mod = 25,
			no_damage_impact_sound_event = "stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "medium_stab_es_01",
			damage_window_end = 0.33,
			impact_sound_event = "stab_hit",
			dedicated_target_range = 2.75,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 2,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.4,
					external_multiplier = 0.6,
					end_time = 0.6,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.55,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.55,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.05,
					action = "action_one",
					doubleclick_window = 0,
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
					0.21666666666666667,
					0.37902069091796875,
					-1.4750046730041504,
					-0.06269210577011108,
					0.22026298940181732,
					0.6558993458747864,
					0.642512857913971,
					-0.32932907342910767
				},
				{
					0.2411111111111111,
					0.41851139068603516,
					-1.6096830368041992,
					-0.05162292718887329,
					0.21957795321941376,
					0.6612789630889893,
					0.6347355842590332,
					-0.3340757191181183
				},
				{
					0.26555555555555554,
					0.4754295349121094,
					-1.2165961265563965,
					-0.0334354043006897,
					0.2238517850637436,
					0.6622756123542786,
					0.622538685798645,
					-0.35174861550331116
				},
				{
					0.29000000000000004,
					0.38170909881591797,
					0.05249524116516113,
					-0.016184508800506592,
					0.23339329659938812,
					0.6675761938095093,
					0.5985477566719055,
					-0.37631142139434814
				},
				{
					0.31444444444444447,
					0.24193668365478516,
					0.540560245513916,
					-0.013505697250366211,
					0.24898973107337952,
					0.6520776748657227,
					0.6066932082176208,
					-0.380423903465271
				},
				{
					0.3388888888888889,
					0.19093990325927734,
					0.7350668907165527,
					-0.035760343074798584,
					0.268057644367218,
					0.6581366658210754,
					0.5886135697364807,
					-0.38540297746658325
				},
				{
					0.36333333333333334,
					0.20786380767822266,
					0.7252731323242188,
					-0.02448064088821411,
					0.26417556405067444,
					0.6487610936164856,
					0.5935956835746765,
					-0.3961874842643738
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.28,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = 0.05,
			width_mod = 35,
			no_damage_impact_sound_event = "slashing_hit_armour",
			invert_attack_direction = true,
			hit_effect = "melee_hit_sword_1h",
			use_precision_sweep = false,
			damage_window_end = 0.43,
			impact_sound_event = "slashing_hit",
			damage_profile = "medium_slashing_linesman_spear_es_01",
			anim_end_event = "attack_finished",
			additional_critical_strike_chance = 0,
			dedicated_target_range = 2,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.6,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_heavy",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left_heavy",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			impact_axis = Vector3Box(0, 0, -1),
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.2466666666666667,
					0.8463411331176758,
					-0.11351704597473145,
					-0.20776182413101196,
					0.4799545705318451,
					-0.523966372013092,
					0.46462851762771606,
					-0.5284156203269958
				},
				{
					0.2827777777777778,
					0.8588619232177734,
					0.2627708911895752,
					-0.2051185965538025,
					0.6310396194458008,
					-0.3702182471752167,
					0.322862446308136,
					-0.6004059910774231
				},
				{
					0.3188888888888889,
					0.5982685089111328,
					0.7413530349731445,
					-0.14955240488052368,
					0.6985636353492737,
					-0.1316533386707306,
					0.1622193306684494,
					-0.6843692064285278
				},
				{
					0.355,
					0.029001235961914062,
					0.9359166622161865,
					-0.1455945372581482,
					0.676491379737854,
					0.06696722656488419,
					0.0058189393021166325,
					-0.7333763837814331
				},
				{
					0.3911111111111111,
					-0.5111722946166992,
					0.7196919918060303,
					-0.1804797649383545,
					0.581235408782959,
					0.3394211232662201,
					-0.19847822189331055,
					-0.7124360799789429
				},
				{
					0.42722222222222217,
					-0.7505664825439453,
					0.42374372482299805,
					-0.2585408091545105,
					0.4119667112827301,
					0.5527673363685608,
					-0.39824458956718445,
					-0.6050893068313599
				},
				{
					0.4633333333333333,
					0.02600860595703125,
					0.22224807739257812,
					-0.8476734161376953,
					0.7248932719230652,
					-0.2973615527153015,
					-0.2416881024837494,
					-0.5724445581436157
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.33,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = 0.05,
			width_mod = 35,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "medium_slashing_linesman_spear_es_01",
			damage_window_end = 0.47,
			impact_sound_event = "slashing_hit",
			dedicated_target_range = 2.5,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_up",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.6,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.43,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.43,
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
					0.2966666666666667,
					-0.6069021224975586,
					0.40149974822998047,
					-0.3463141918182373,
					-0.5297349095344543,
					0.6274950504302979,
					0.13246557116508484,
					-0.5550529956817627
				},
				{
					0.33111111111111113,
					-0.47780704498291016,
					0.6917076110839844,
					-0.2482318878173828,
					0.12731346487998962,
					0.8041661381721497,
					0.012413541786372662,
					-0.5804774165153503
				},
				{
					0.3655555555555556,
					-0.07558631896972656,
					0.9681973457336426,
					-0.06409120559692383,
					0.571546196937561,
					0.3999144434928894,
					0.10060828179121017,
					-0.7094232439994812
				},
				{
					0.4,
					0.3022613525390625,
					0.9835915565490723,
					0.08729970455169678,
					0.5838332772254944,
					0.11313144862651825,
					0.2736157774925232,
					-0.7559592127799988
				},
				{
					0.4344444444444444,
					0.6545877456665039,
					0.8015000820159912,
					0.2060222625732422,
					0.5475032925605774,
					-0.09208259731531143,
					0.32170698046684265,
					-0.766984760761261
				},
				{
					0.4688888888888889,
					1.0476293563842773,
					0.24525117874145508,
					0.08831620216369629,
					0.640425443649292,
					-0.15314507484436035,
					0.5856018662452698,
					-0.47272852063179016
				},
				{
					0.5033333333333333,
					0.9474411010742188,
					-0.23317933082580566,
					-0.05443716049194336,
					0.6209182739257812,
					-0.3256509304046631,
					0.5538483262062073,
					-0.44907012581825256
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.28,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = true,
			hit_effect = "melee_hit_hammers_2h",
			damage_profile = "light_slash_stab_es_01",
			damage_window_end = 0.42,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			range_mod_add = 0.5,
			weapon_up_offset_mod = -0.25,
			anim_event = "attack_swing_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.6,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
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
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
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
			baked_sweep = {
				{
					0.2466666666666667,
					0.3045673370361328,
					0.6866500377655029,
					-0.10605055093765259,
					0.6290478706359863,
					0.2673751711845398,
					0.1767760068178177,
					-0.7082087397575378
				},
				{
					0.28111111111111114,
					0.15892314910888672,
					0.8539009094238281,
					-0.10122615098953247,
					0.6496372818946838,
					0.18432587385177612,
					0.11865314096212387,
					-0.7279539108276367
				},
				{
					0.3155555555555556,
					0.149261474609375,
					0.8606319427490234,
					-0.09716534614562988,
					0.6537732481956482,
					0.17135392129421234,
					0.09943803399801254,
					-0.7302948236465454
				},
				{
					0.35,
					0.14928054809570312,
					0.8605344295501709,
					-0.09726840257644653,
					0.6507267355918884,
					0.17911216616630554,
					0.11024989932775497,
					-0.7296016216278076
				},
				{
					0.3844444444444445,
					0.1492605209350586,
					0.8606021404266357,
					-0.09725511074066162,
					0.6454718112945557,
					0.18999792635440826,
					0.1240837424993515,
					-0.7292943000793457
				},
				{
					0.41888888888888887,
					0.14850807189941406,
					0.8620123863220215,
					-0.09798687696456909,
					0.6420650482177734,
					0.20294398069381714,
					0.13239461183547974,
					-0.7273499369621277
				},
				{
					0.4533333333333333,
					0.14632606506347656,
					0.8658967018127441,
					-0.10363471508026123,
					0.6494554877281189,
					0.1894325315952301,
					0.10258472710847855,
					-0.7292457818984985
				}
			}
		},
		light_attack_stab_postpush = {
			damage_window_start = 0.25,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = true,
			hit_effect = "melee_hit_hammers_2h",
			damage_profile = "light_slash_stab_es_01",
			attack_direction = "up",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			weapon_up_offset_mod = 0.25,
			anim_event = "push_stab",
			hit_stop_anim = "attack_hit",
			total_time = 1.1,
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
					start_time = 0.4,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left_heavy",
					start_time = 0.4,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			baked_sweep = {
				{
					0.21666666666666667,
					0.2723350524902344,
					-1.4242901802062988,
					0.470081090927124,
					0.36571961641311646,
					0.6804249882698059,
					0.5457020998001099,
					-0.3247770369052887
				},
				{
					0.25277777777777777,
					0.29923152923583984,
					-1.4806170463562012,
					0.3933737277984619,
					0.4074326753616333,
					0.6428639888763428,
					0.556913435459137,
					-0.33252355456352234
				},
				{
					0.2888888888888889,
					0.495330810546875,
					-0.21086359024047852,
					0.26223015785217285,
					0.27958551049232483,
					0.6775707006454468,
					0.5497443675994873,
					-0.4006381630897522
				},
				{
					0.325,
					0.18340682983398438,
					0.7353363037109375,
					0.10910534858703613,
					0.2854025959968567,
					0.6817827820777893,
					0.5615207552909851,
					-0.3720378577709198
				},
				{
					0.36111111111111116,
					0.21943092346191406,
					0.7297945022583008,
					0.042621612548828125,
					0.277598112821579,
					0.6659989953041077,
					0.5751744508743286,
					-0.3854335844516754
				},
				{
					0.39722222222222225,
					0.22710704803466797,
					0.7120680809020996,
					0.03645730018615723,
					0.2756649851799011,
					0.6620834469795227,
					0.5763586163520813,
					-0.39174607396125793
				},
				{
					0.43333333333333335,
					0.22180747985839844,
					0.7129220962524414,
					0.02926468849182129,
					0.27351775765419006,
					0.6637547016143799,
					0.5748099684715271,
					-0.3926975131034851
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			outer_push_angle = 180,
			kind = "push_stagger",
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "slashing_hit_armour",
			damage_profile_outer = "medium_push",
			weapon_action_hand = "right",
			push_angle = 100,
			hit_effect = "melee_hit_sword_1h",
			fatigue_regen_delay = 0.75,
			damage_window_end = 0.2,
			impact_sound_event = "slashing_hit",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			damage_profile_inner = "shield_push",
			total_time = 0.4,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 0.9,
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
			cooldown = 0.15,
			minimum_hold_time = 0.2,
			anim_end_event = "parry_finished",
			kind = "block",
			weapon_action_hand = "left",
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
					sub_action = "parry_stab",
					start_time = 0.2,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				}
			}
		}
	},
	action_three = {
		default = {
			kind = "dummy",
			total_time = 0,
			allowed_chain_actions = {}
		},
		parry_stab = {
			damage_window_start = 0.18,
			anim_end_event = "attack_finished",
			fatigue_cost = "action_stun_push",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			keep_block = true,
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_hammers_2h",
			damage_profile = "light_slash_stab_es_01",
			use_precision_sweep = true,
			damage_window_end = 0.38,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
			add_fatigue_on_hit = true,
			range_mod = 1.35,
			weapon_action_hand = "right",
			dedicated_target_range = 2.5,
			range_mod_add = 0.5,
			weapon_up_offset_mod = -0.25,
			anim_event = "parry_stab",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
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
					sub_action = "parry_stab_02",
					start_time = 0.5,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end,
			baked_sweep = {
				{
					0.14666666666666667,
					0.39907169342041016,
					-1.061765193939209,
					0.0005323886871337891,
					0.26957789063453674,
					0.676841676235199,
					0.6439840197563171,
					-0.23344726860523224
				},
				{
					0.19111111111111112,
					0.5769729614257812,
					-0.3908543586730957,
					0.04037785530090332,
					0.2197238802909851,
					0.6910976767539978,
					0.623090922832489,
					-0.29302406311035156
				},
				{
					0.23555555555555557,
					0.24826908111572266,
					0.6974635124206543,
					-0.017516374588012695,
					0.2712305784225464,
					0.6384264230728149,
					0.5922515392303467,
					-0.4099801480770111
				},
				{
					0.28,
					0.22136402130126953,
					0.7127475738525391,
					-0.01810479164123535,
					0.26309746503829956,
					0.6502934098243713,
					0.5927720665931702,
					-0.39562541246414185
				},
				{
					0.3244444444444444,
					0.21855735778808594,
					0.7109761238098145,
					-0.02050185203552246,
					0.2589230537414551,
					0.6463744044303894,
					0.5929133296012878,
					-0.4044908583164215
				},
				{
					0.36888888888888893,
					0.2146129608154297,
					0.7062129974365234,
					-0.02724146842956543,
					0.25401440262794495,
					0.6433561444282532,
					0.5932517647743225,
					-0.4118518531322479
				},
				{
					0.41333333333333333,
					0.21536636352539062,
					0.7029528617858887,
					-0.03229784965515137,
					0.252244234085083,
					0.6412175893783569,
					0.5954651236534119,
					-0.41307878494262695
				}
			}
		},
		parry_stab_02 = {
			damage_window_start = 0.31,
			anim_end_event = "attack_finished",
			fatigue_cost = "action_stun_push",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			keep_block = true,
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_hammers_2h",
			damage_profile = "light_slash_stab_es_01",
			use_precision_sweep = true,
			damage_window_end = 0.53,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
			add_fatigue_on_hit = true,
			range_mod = 1.35,
			weapon_action_hand = "right",
			dedicated_target_range = 2.5,
			range_mod_add = 0.5,
			weapon_up_offset_mod = -0.25,
			anim_event = "parry_stab_02",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.4,
					external_multiplier = 0.4,
					end_time = 0.8,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "parry_stab",
					start_time = 0.8,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 1.2,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.9,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end,
			baked_sweep = {
				{
					0.27666666666666667,
					0.36040782928466797,
					-0.819242000579834,
					0.40488338470458984,
					0.512812614440918,
					0.628240168094635,
					0.5451871156692505,
					-0.2123878449201584
				},
				{
					0.3244444444444444,
					0.43871402740478516,
					-0.23366546630859375,
					0.22466254234313965,
					0.4567553699016571,
					0.5742567181587219,
					0.6471295952796936,
					-0.20694683492183685
				},
				{
					0.37222222222222223,
					0.31446266174316406,
					0.6159200668334961,
					0.15463566780090332,
					0.23103636503219604,
					0.7156341075897217,
					0.5535199046134949,
					-0.35791850090026855
				},
				{
					0.42000000000000004,
					0.31215667724609375,
					0.5870680809020996,
					0.15763163566589355,
					0.2794119119644165,
					0.69120192527771,
					0.5292873978614807,
					-0.4049984812736511
				},
				{
					0.4677777777777778,
					0.3143959045410156,
					0.5670394897460938,
					0.16568422317504883,
					0.28122836351394653,
					0.6858335733413696,
					0.527849555015564,
					-0.4146296977996826
				},
				{
					0.5155555555555555,
					0.3113231658935547,
					0.5651073455810547,
					0.16559123992919922,
					0.2842657268047333,
					0.6816337704658508,
					0.5252355933189392,
					-0.4227244257926941
				},
				{
					0.5633333333333334,
					0.30489540100097656,
					0.566251277923584,
					0.16609859466552734,
					0.28221914172172546,
					0.6804654002189636,
					0.5249077081680298,
					-0.42636963725090027
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
weapon_template.right_hand_unit = "units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_es_deus_shield_01/wpn_es_deus_shield_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.shield
weapon_template.display_unit = "units/weapons/weapon_display/display_shield_spear"
weapon_template.wield_anim = "to_es_deus_01"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "SWORD_1H_SHIELD"
weapon_template.max_fatigue_points = 10
weapon_template.dodge_count = 3
weapon_template.can_block_ranged_attacks = true
weapon_template.block_angle = 120
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.2
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.05
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.05
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
weapon_template.defense_meta_data = {
	push = "heavy"
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	base_multiplier = 0,
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_powerful_blocks"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack"
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
	"wwise/es_deus_01"
}

return {
	es_deus_01_template = table.clone(weapon_template)
}
