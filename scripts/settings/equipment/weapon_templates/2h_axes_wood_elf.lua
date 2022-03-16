local push_radius = 2.25
local time_mod = 0.95
local weapon_template = {
	actions = {
		action_one = {
			default = {
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_left",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.75,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_left_upward",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_down_first",
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
						start_time = 0.85,
						blocker = true,
						end_time = 1.5,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_down_first",
						start_time = 0.95,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_left = {
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_down",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.75,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_right_upward",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_down_first",
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
						start_time = 0.85,
						blocker = true,
						end_time = 1.5,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_down_first",
						start_time = 0.95,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_right = {
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_down",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.75,
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
						sub_action = "heavy_attack_down_first",
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
						start_time = 0.85,
						blocker = true,
						end_time = 1.5,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_down_first",
						start_time = 0.95,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			light_attack_right_upward = {
				damage_window_start = 0.3,
				range_mod = 1.35,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				sweep_z_offset = 0.1,
				width_mod = 25,
				hit_shield_stop_anim = "attack_hit_shield",
				additional_critical_strike_chance = 0,
				hit_effect = "melee_hit_axes_2h",
				use_precision_sweep = false,
				damage_profile = "medium_slashing_axe_linesman",
				damage_window_end = 0.55,
				impact_sound_event = "axe_1h_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_right",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.7,
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
						start_time = 0.35,
						external_multiplier = 0.8,
						end_time = 0.5,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.1,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.55,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default_right",
						start_time = 0.6,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default_right",
						start_time = 0.6,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_wield",
						input = "action_wield"
					}
				},
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.26666666666666666,
						-0.2519645690917969,
						0.21381592750549316,
						-0.1287294626235962,
						-0.49228277802467346,
						0.5668255090713501,
						-0.4201350808143616,
						-0.5097577571868896
					},
					{
						0.3194444444444444,
						-0.17285680770874023,
						0.33025169372558594,
						-0.14535939693450928,
						-0.48574090003967285,
						0.589264452457428,
						-0.4352126121520996,
						-0.47687870264053345
					},
					{
						0.37222222222222223,
						-0.05878257751464844,
						0.4440760612487793,
						-0.08815896511077881,
						-0.3331000506877899,
						0.7465447187423706,
						-0.1727561056613922,
						-0.5494276285171509
					},
					{
						0.42500000000000004,
						0.09631776809692383,
						0.48827433586120605,
						-0.04587090015411377,
						-0.04536755755543709,
						0.7719566226005554,
						0.173418328166008,
						-0.6098777055740356
					},
					{
						0.4777777777777778,
						0.19304752349853516,
						0.37222719192504883,
						-0.05244874954223633,
						0.328951895236969,
						0.5726898312568665,
						0.5848132371902466,
						-0.47096753120422363
					},
					{
						0.5305555555555557,
						0.45762109756469727,
						0.09347248077392578,
						0.020168423652648926,
						0.4965287744998932,
						0.3838891386985779,
						0.7582054138183594,
						-0.17667174339294434
					},
					{
						0.5833333333333334,
						0.5199065208435059,
						0.07477843761444092,
						-0.015959739685058594,
						0.437167763710022,
						0.3676284849643707,
						0.8134577870368958,
						-0.10963603109121323
					}
				}
			},
			light_attack_left_upward = {
				damage_window_start = 0.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.35,
				sweep_z_offset = 0.1,
				width_mod = 25,
				no_damage_impact_sound_event = "blunt_hit_armour",
				hit_shield_stop_anim = "attack_hit_shield",
				hit_effect = "melee_hit_axes_2h",
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				damage_window_end = 0.5,
				impact_sound_event = "axe_1h_hit",
				damage_profile = "medium_slashing_axe_linesman",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_left",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.7,
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
						start_time = 0.35,
						external_multiplier = 0.8,
						end_time = 0.5,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.15,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.55,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default_left",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default_left",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one_hold"
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
						0.26666666666666666,
						0.4827331304550171,
						0.43497610092163086,
						-0.11728551983833313,
						0.5563161969184875,
						0.626956045627594,
						-0.3457670509815216,
						0.4217624068260193
					},
					{
						0.3111111111111111,
						0.35600554943084717,
						0.574549674987793,
						-0.14839044213294983,
						-0.36715397238731384,
						-0.7176500558853149,
						0.2907981276512146,
						-0.5153765678405762
					},
					{
						0.35555555555555557,
						0.1853393316268921,
						0.6309256553649902,
						-0.13607564568519592,
						-0.15311214327812195,
						-0.784234344959259,
						0.14028891921043396,
						-0.5846813321113586
					},
					{
						0.4,
						0.013399064540863037,
						0.5689449310302734,
						-0.06229236721992493,
						0.10154084861278534,
						-0.7549822926521301,
						-0.32097139954566956,
						-0.562732994556427
					},
					{
						0.4444444444444444,
						-0.24883979558944702,
						0.324185848236084,
						-0.009989053010940552,
						-0.33148956298828125,
						0.565287172794342,
						0.6744373440742493,
						0.34014594554901123
					},
					{
						0.48888888888888893,
						-0.2024109959602356,
						0.15990972518920898,
						-0.11632600426673889,
						-0.44535520672798157,
						0.30784663558006287,
						0.8407555222511292,
						0.004393451847136021
					},
					{
						0.5333333333333333,
						-0.1470099687576294,
						0.17701339721679688,
						-0.2546711266040802,
						-0.5016821026802063,
						0.04431980848312378,
						0.8296424150466919,
						-0.2409239411354065
					}
				}
			},
			light_attack_left = {
				damage_window_start = 0.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.35,
				sweep_z_offset = 0.1,
				width_mod = 25,
				no_damage_impact_sound_event = "blunt_hit_armour",
				hit_shield_stop_anim = "attack_hit_shield",
				hit_effect = "melee_hit_axes_2h",
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				damage_window_end = 0.5,
				impact_sound_event = "axe_1h_hit",
				damage_profile = "medium_slashing_axe_linesman",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_left_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.25,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.7,
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
						start_time = 0.35,
						external_multiplier = 0.8,
						end_time = 0.5,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.15,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.55,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.8,
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
						0.26666666666666666,
						0.36079883575439453,
						0.44127655029296875,
						-0.01651012897491455,
						-0.5330999493598938,
						-0.3472145199775696,
						0.3358485698699951,
						-0.6945878267288208
					},
					{
						0.3111111111111111,
						0.2561516761779785,
						0.5311307907104492,
						-0.0702810287475586,
						-0.4199899733066559,
						-0.3932686150074005,
						0.27992141246795654,
						-0.7684999108314514
					},
					{
						0.35555555555555557,
						0.12045431137084961,
						0.5984153747558594,
						-0.13571906089782715,
						-0.24350130558013916,
						-0.4333626925945282,
						0.17312203347682953,
						-0.850254476070404
					},
					{
						0.4,
						0.030129432678222656,
						0.6271700859069824,
						-0.19096708297729492,
						0.05767456814646721,
						-0.4532512128353119,
						-0.028800619766116142,
						-0.88904869556427
					},
					{
						0.4444444444444444,
						-0.1252424716949463,
						0.3370485305786133,
						-0.25216078758239746,
						0.7223472595214844,
						-0.1262403279542923,
						-0.4558243453502655,
						-0.5044819712638855
					},
					{
						0.48888888888888893,
						-0.2174898386001587,
						0.24360084533691406,
						-0.27171993255615234,
						0.8039695620536804,
						-0.0074045173823833466,
						-0.5190113186836243,
						-0.29018160700798035
					},
					{
						0.5333333333333333,
						-0.235573410987854,
						0.11566305160522461,
						-0.2991445064544678,
						0.7950853705406189,
						-0.03836781531572342,
						-0.5294830799102783,
						-0.2932828962802887
					}
				}
			},
			heavy_attack_down_first = {
				damage_window_start = 0.35,
				range_mod = 1.2,
				kind = "sweep",
				first_person_hit_anim = "attack_hit_alt_effect",
				no_damage_impact_sound_event = "slashing_hit_armour",
				sweep_z_offset = 0,
				width_mod = 25,
				hit_shield_stop_anim = "attack_hit_shield",
				additional_critical_strike_chance = 0,
				hit_effect = "melee_hit_axes_2h",
				use_precision_sweep = true,
				damage_profile = "medium_slashing_smiter_upper",
				damage_window_end = 0.45,
				impact_sound_event = "slashing_hit",
				aim_assist_ramp_multiplier = 0.3,
				anim_end_event = "attack_finished",
				aim_assist_max_ramp_multiplier = 0.6,
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_left",
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 0.95,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.25,
						end_time = 0.25,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.8,
						end_time = 0.7,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.15,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "heavy_attack_down_second",
						start_time = 0.5,
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
						start_time = 1,
						action = "action_one",
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_wield",
						input = "action_wield"
					}
				},
				hit_mass_count = LINESMAN_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.31666666666666665,
						0.19611883163452148,
						0.5184721946716309,
						-0.19701969623565674,
						0.17710578441619873,
						0.7886306643486023,
						-0.38957783579826355,
						0.4415023922920227
					},
					{
						0.34444444444444444,
						0.10736799240112305,
						0.5998744964599609,
						-0.1414731740951538,
						0.11110125482082367,
						0.8485910296440125,
						-0.18718262016773224,
						0.48219552636146545
					},
					{
						0.37222222222222223,
						-0.008784770965576172,
						0.6250276565551758,
						-0.041373372077941895,
						0.021947843953967094,
						0.8795396685600281,
						0.1546199470758438,
						0.44946739077568054
					},
					{
						0.4,
						-0.17848873138427734,
						0.46354174613952637,
						0.09782290458679199,
						-0.0885271206498146,
						0.7746349573135376,
						0.5340449810028076,
						0.32695508003234863
					},
					{
						0.42777777777777776,
						-0.21059656143188477,
						0.28152036666870117,
						0.10556173324584961,
						-0.16834542155265808,
						0.5494337677955627,
						0.7918164134025574,
						0.20690391957759857
					},
					{
						0.45555555555555555,
						-0.18645000457763672,
						0.12404966354370117,
						0.02402675151824951,
						-0.22172272205352783,
						0.3194182217121124,
						0.9184633493423462,
						0.07236079126596451
					},
					{
						0.48333333333333334,
						-0.18043136596679688,
						-0.19847488403320312,
						0.013289213180541992,
						-0.28457802534103394,
						0.1528778374195099,
						0.9463171362876892,
						-0.011296814307570457
					}
				}
			},
			heavy_attack_down_second = {
				damage_window_start = 0.4,
				range_mod = 1.2,
				kind = "sweep",
				first_person_hit_anim = "attack_hit_alt_effect",
				no_damage_impact_sound_event = "slashing_hit_armour",
				sweep_z_offset = 0,
				width_mod = 25,
				additional_critical_strike_chance = 0,
				hit_shield_stop_anim = "attack_hit_shield",
				use_precision_sweep = true,
				hit_effect = "melee_hit_axes_2h",
				damage_profile = "heavy_slashing_smiter_glaive",
				aim_assist_ramp_multiplier = 0.3,
				damage_window_end = 0.5,
				impact_sound_event = "slashing_hit",
				aim_assist_max_ramp_multiplier = 0.8,
				anim_end_event = "attack_finished",
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_down",
				total_time = 2.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.25,
						end_time = 0.25,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.8,
						end_time = 0.7,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default_right",
						start_time = 0.75,
						action = "action_one",
						end_time = 1.8,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.5,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_wield",
						input = "action_wield"
					}
				},
				baked_sweep = {
					{
						0.3666666666666667,
						-0.14838123321533203,
						0.29773497581481934,
						0.11085736751556396,
						-0.5348933339118958,
						0.26004379987716675,
						-0.055722180753946304,
						-0.8019734621047974
					},
					{
						0.3944444444444445,
						-0.11351251602172852,
						0.3775925636291504,
						0.06735289096832275,
						-0.41782963275909424,
						0.3527318239212036,
						-0.09798228740692139,
						-0.8315035700798035
					},
					{
						0.4222222222222222,
						-0.0695352554321289,
						0.4410243034362793,
						0.011928796768188477,
						-0.27926331758499146,
						0.34860172867774963,
						-0.04903234541416168,
						-0.8933558464050293
					},
					{
						0.45,
						0.012660980224609375,
						0.5002915859222412,
						-0.10267150402069092,
						0.18109063804149628,
						0.2604965269565582,
						0.0886174738407135,
						-0.9441900253295898
					},
					{
						0.4777777777777778,
						0.12349653244018555,
						0.36565494537353516,
						-0.3359518051147461,
						0.7791434526443481,
						0.10488156974315643,
						0.09453941881656647,
						-0.610735297203064
					},
					{
						0.5055555555555555,
						0.16841650009155273,
						0.2187180519104004,
						-0.4404071569442749,
						0.919868528842926,
						0.042233657091856,
						0.049136932939291,
						-0.3868381679058075
					},
					{
						0.5333333333333333,
						0.18946313858032227,
						0.1355912685394287,
						-0.49615442752838135,
						0.9677000045776367,
						0.0014040670357644558,
						0.017038220539689064,
						-0.2515241801738739
					}
				}
			},
			light_attack_bopp = {
				damage_window_start = 0.25,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.35,
				sweep_z_offset = 0.1,
				width_mod = 25,
				no_damage_impact_sound_event = "blunt_hit_armour",
				hit_shield_stop_anim = "attack_hit_shield",
				additional_critical_strike_chance = 0,
				hit_effect = "melee_hit_axes_2h",
				use_precision_sweep = false,
				damage_profile = "medium_slashing_axe_linesman",
				damage_window_end = 0.5,
				impact_sound_event = "axe_1h_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_left_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.15,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.7,
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
						start_time = 0.35,
						external_multiplier = 0.8,
						end_time = 0.5,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_left",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_two_hold",
						end_time = 1.2,
						input = "action_one"
					},
					{
						sub_action = "default_left",
						start_time = 1.2,
						action = "action_one",
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
						start_time = 0.65,
						action = "action_wield",
						input = "action_wield"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				baked_sweep = {
					{
						0.21666666666666667,
						0.4078245162963867,
						0.4013824462890625,
						0.00018346309661865234,
						-0.5578729510307312,
						-0.30669981241226196,
						0.37760797142982483,
						-0.6724026799201965
					},
					{
						0.26944444444444443,
						0.35484743118286133,
						0.4467639923095703,
						-0.019459247589111328,
						-0.5273258090019226,
						-0.3509572148323059,
						0.33259373903274536,
						-0.6986687183380127
					},
					{
						0.32222222222222224,
						0.22312688827514648,
						0.5523233413696289,
						-0.08545267581939697,
						-0.38261646032333374,
						-0.4042827785015106,
						0.25846463441848755,
						-0.7895290851593018
					},
					{
						0.375,
						0.0769197940826416,
						0.6212854385375977,
						-0.1595364809036255,
						-0.13295450806617737,
						-0.4518011510372162,
						0.09826374799013138,
						-0.8766658902168274
					},
					{
						0.4277777777777778,
						-0.06937551498413086,
						0.4678382873535156,
						-0.24853789806365967,
						0.43734773993492126,
						-0.33699244260787964,
						-0.29216518998146057,
						-0.7808985710144043
					},
					{
						0.48055555555555557,
						-0.20573830604553223,
						0.2664785385131836,
						-0.26642143726348877,
						0.8017241358757019,
						-0.011959453113377094,
						-0.5135608315467834,
						-0.3055335283279419
					},
					{
						0.5333333333333333,
						-0.23548221588134766,
						0.11690616607666016,
						-0.2989116907119751,
						0.7951470017433167,
						-0.03807833418250084,
						-0.5294004678726196,
						-0.2933027148246765
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
				charge_value = "action_push",
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
						start_time = 0.3,
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
						external_multiplier = 0.75,
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
	right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon,
	display_unit = "units/weapons/weapon_display/display_2h_axes",
	wield_anim = "to_2h_axe_we",
	buff_type = "MELEE_2H",
	weapon_type = "AXE_2H",
	max_fatigue_points = 6,
	dodge_count = 3,
	block_angle = 90,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.5,
	outer_block_fatigue_point_multiplier = 2,
	block_angle = 90,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.5,
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
			penetrating = true,
			arc = 2
		},
		hold_attack = {
			penetrating = true,
			arc = 0
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
	wwise_dep_right_hand = {
		"wwise/two_handed_axes"
	},
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 3,
			[DamageTypes.CLEAVE] = 5,
			[DamageTypes.SPEED] = 3,
			[DamageTypes.STAGGER] = 2,
			[DamageTypes.DAMAGE] = 4
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 6,
			[DamageTypes.CLEAVE] = 1,
			[DamageTypes.SPEED] = 1,
			[DamageTypes.STAGGER] = 3,
			[DamageTypes.DAMAGE] = 6
		}
	},
	tooltip_keywords = {
		"weapon_keyword_high_damage",
		"weapon_keyword_armour_piercing",
		"weapon_keyword_fast_attacks"
	},
	tooltip_compare = {
		light = {
			action_name = "action_one",
			sub_action_name = "light_attack_left_upward"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "heavy_attack_down_first"
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
	}
}

return {
	two_handed_axes_template_2 = weapon_template
}
