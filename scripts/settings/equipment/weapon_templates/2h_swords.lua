local push_radius = 2.25
local time_mod = 0.9
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_diagonal",
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
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.9,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_right = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_diagonal_right",
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
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.9,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_diagonal_left",
			kind = "melee_start",
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
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.9,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.18,
			range_mod = 1.65,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			slide_armour_hit = true,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "heavy_slashing_linesman",
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.33,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.65,
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
					0.14666666666666667,
					0.35219383239746094,
					0.3926534652709961,
					-0.0347975492477417,
					-0.1936408132314682,
					-0.5117003321647644,
					0.21216970682144165,
					-0.8097222447395325
				},
				{
					0.17777777777777778,
					0.2222576141357422,
					0.5063385963439941,
					-0.06470298767089844,
					0.10098171979188919,
					-0.5282957553863525,
					0.05195898190140724,
					-0.8414313197135925
				},
				{
					0.20888888888888887,
					0.011560440063476562,
					0.6051650047302246,
					-0.12985646724700928,
					0.30119702219963074,
					-0.5343884825706482,
					-0.08619754016399384,
					-0.7850345969200134
				},
				{
					0.24,
					-0.3489398956298828,
					0.49311113357543945,
					-0.1329185962677002,
					0.5527911186218262,
					-0.42573776841163635,
					-0.46034547686576843,
					-0.5488638281822205
				},
				{
					0.2711111111111111,
					-0.4456329345703125,
					0.30289125442504883,
					-0.2738863229751587,
					0.7371177077293396,
					-0.21506017446517944,
					-0.5453240275382996,
					-0.33619698882102966
				},
				{
					0.30222222222222217,
					-0.45386314392089844,
					0.11864948272705078,
					-0.3485206365585327,
					0.7549285888671875,
					-0.06483502686023712,
					-0.6133258938789368,
					-0.22295881807804108
				},
				{
					0.3333333333333333,
					-0.3916759490966797,
					0.04313373565673828,
					-0.37567412853240967,
					0.760313868522644,
					0.0008948765462264419,
					-0.6316689252853394,
					-0.15138167142868042
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.18,
			range_mod = 1.65,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			slide_armour_hit = true,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "heavy_slashing_linesman",
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.33,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
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
					0.14666666666666667,
					-0.13609886169433594,
					0.47755956649780273,
					-0.09594285488128662,
					-0.23254390060901642,
					0.47752049565315247,
					-0.13504809141159058,
					-0.8364565372467041
				},
				{
					0.17777777777777778,
					-0.07053279876708984,
					0.5334243774414062,
					-0.12225711345672607,
					-0.17297036945819855,
					0.49908173084259033,
					-0.030576949939131737,
					-0.8485656380653381
				},
				{
					0.20888888888888887,
					0.048569679260253906,
					0.6010475158691406,
					-0.15884435176849365,
					-0.044084109365940094,
					0.5173933506011963,
					0.055491961538791656,
					-0.8528079390525818
				},
				{
					0.24,
					0.40606689453125,
					0.44586992263793945,
					-0.26690948009490967,
					0.46151310205459595,
					0.4228089153766632,
					0.4077329933643341,
					-0.6648248434066772
				},
				{
					0.2711111111111111,
					0.5982570648193359,
					0.06621217727661133,
					-0.36090636253356934,
					0.740608274936676,
					0.2083282470703125,
					0.5920941829681396,
					-0.23983998596668243
				},
				{
					0.30222222222222217,
					0.6595382690429688,
					-0.07069587707519531,
					-0.4087895154953003,
					0.7364643216133118,
					0.27569901943206787,
					0.6000981330871582,
					-0.1466037482023239
				},
				{
					0.3333333333333333,
					0.6495504379272461,
					-0.13558197021484375,
					-0.44215846061706543,
					0.78482586145401,
					0.2894946336746216,
					0.5287660360336304,
					-0.14369328320026398
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.53,
			anim_end_event = "attack_finished",
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			impact_sound_event = "slashing_hit",
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "medium_slashing_linesman",
			damage_window_end = 0.8,
			forced_interpolation = 0.008333333333333333,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.8,
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
					sub_action = "default_right",
					start_time = 0.85,
					action = "action_one",
					end_time = 1.3,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.3,
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
					0.4966666666666667,
					0.4021339416503906,
					0.2898683547973633,
					0.030147790908813477,
					-0.48356983065605164,
					-0.30989235639572144,
					0.4391093850135803,
					-0.6908761858940125
				},
				{
					0.5527777777777778,
					0.3244915008544922,
					0.37606239318847656,
					-0.002364516258239746,
					-0.2578868567943573,
					-0.40595710277557373,
					0.3075695335865021,
					-0.8210324048995972
				},
				{
					0.6088888888888889,
					0.16967010498046875,
					0.5173740386962891,
					-0.022518396377563477,
					0.015656959265470505,
					-0.4101688265800476,
					0.023640627041459084,
					-0.9115687012672424
				},
				{
					0.665,
					-0.19570064544677734,
					0.5400309562683105,
					-0.19039249420166016,
					0.5643450021743774,
					-0.4009280502796173,
					-0.38192281126976013,
					-0.6122960448265076
				},
				{
					0.7211111111111111,
					-0.3651609420776367,
					0.14651918411254883,
					-0.2897852659225464,
					0.759830892086029,
					0.36723795533180237,
					-0.5044282674789429,
					0.18260735273361206
				},
				{
					0.7772222222222223,
					-0.3257465362548828,
					0.1455221176147461,
					-0.3299238681793213,
					0.7603816986083984,
					0.2859477400779724,
					-0.5778009295463562,
					0.07873786240816116
				},
				{
					0.8333333333333334,
					-0.3080759048461914,
					0.11429882049560547,
					-0.3462026119232178,
					0.7688372731208801,
					0.22009891271591187,
					-0.5990860462188721,
					0.039263397455215454
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.5,
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.8,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_right_diagonal",
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
					sub_action = "default_left",
					start_time = 0.85,
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
					0.4666666666666667,
					-0.27582263946533203,
					0.17136430740356445,
					-0.011824488639831543,
					-0.4425011873245239,
					0.37471580505371094,
					-0.623542308807373,
					-0.5243812799453735
				},
				{
					0.5277777777777778,
					-0.2415447235107422,
					0.35687923431396484,
					-0.007171154022216797,
					-0.4529234766960144,
					0.39192238450050354,
					-0.479362815618515,
					-0.6414581537246704
				},
				{
					0.5888888888888889,
					-0.11064434051513672,
					0.5012903213500977,
					-0.036751389503479004,
					-0.23956990242004395,
					0.42699792981147766,
					-0.1524783819913864,
					-0.8585041761398315
				},
				{
					0.65,
					0.19419193267822266,
					0.5107107162475586,
					-0.14734292030334473,
					0.36277395486831665,
					0.47427651286125183,
					0.3445903956890106,
					-0.7243716716766357
				},
				{
					0.7111111111111111,
					0.4002103805541992,
					0.3614311218261719,
					-0.2990529537200928,
					0.7667891383171082,
					0.12125606834888458,
					0.45078012347221375,
					-0.4406004548072815
				},
				{
					0.7722222222222223,
					0.49817371368408203,
					0.2518477439880371,
					-0.3369128704071045,
					0.8048565983772278,
					0.08120082318782806,
					0.5546956658363342,
					-0.19474349915981293
				},
				{
					0.8333333333333334,
					0.4701070785522461,
					0.19222021102905273,
					-0.37858498096466064,
					0.823351263999939,
					0.05689862370491028,
					0.5548643469810486,
					-0.10478942096233368
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.32,
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			sweep_z_offset = 0.1,
			width_mod = 30,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_smiter_2h",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_hit",
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
					sub_action = "default",
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
					0.2866666666666667,
					-0.1105661392211914,
					0.47023916244506836,
					0.08699500560760498,
					-0.4952860176563263,
					0.20697079598903656,
					0.0519506074488163,
					-0.8421140313148499
				},
				{
					0.3111111111111111,
					-0.053295135498046875,
					0.479672908782959,
					0.03670382499694824,
					-0.35673272609710693,
					0.25508439540863037,
					0.07216553390026093,
					-0.8958046436309814
				},
				{
					0.33555555555555555,
					0.0266876220703125,
					0.4780745506286621,
					-0.06251084804534912,
					-0.10860314965248108,
					0.2874903678894043,
					0.09105639904737473,
					-0.947239875793457
				},
				{
					0.36,
					0.11115074157714844,
					0.449831485748291,
					-0.1896970272064209,
					0.24243053793907166,
					0.26858627796173096,
					0.12761464715003967,
					-0.9234735369682312
				},
				{
					0.3844444444444445,
					0.17303752899169922,
					0.40045881271362305,
					-0.30175888538360596,
					0.629357099533081,
					0.19661277532577515,
					0.14131194353103638,
					-0.7384334802627563
				},
				{
					0.4088888888888889,
					0.2318553924560547,
					0.2870216369628906,
					-0.4769676923751831,
					0.8572584986686707,
					0.07012158632278442,
					0.08063267171382904,
					-0.5036758184432983
				},
				{
					0.43333333333333335,
					0.2894010543823242,
					0.12784576416015625,
					-0.5829694271087646,
					0.9280399084091187,
					0.016390031203627586,
					0.04140448197722435,
					-0.36980944871902466
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
	action_wield = ActionTemplates.wield
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_greatsword/wpn_greatsword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords"
weapon_template.wield_anim = "to_2h_sword"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/2h_sword"
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
		external_optional_multiplier = 1.1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.1
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
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 3
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 4
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
	two_handed_swords_template_1 = table.clone(weapon_template)
}
