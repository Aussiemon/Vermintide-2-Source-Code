local push_radius = 2.5
local time_mod = 0.9
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			anim_event = "attack_swing_charge",
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
					sub_action = "light_attack_left",
					start_time = 0,
					action = "action_one",
					end_time = 0.35,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
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
					end_time = 1.5,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end
		},
		default_left = {
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
					sub_action = "light_attack_right",
					start_time = 0,
					action = "action_one",
					end_time = 0.35,
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
					start_time = 0.3,
					blocker = true,
					end_time = 1.5,
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
		default_right = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
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
					sub_action = "light_attack_left_up",
					start_time = 0,
					action = "action_one",
					end_time = 0.35,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
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
					end_time = 1.5,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.35,
			push_radius = 3,
			range_mod = 1.3,
			kind = "sweep",
			first_person_hit_anim = "hit_right_shake",
			sweep_z_offset = 0.1,
			width_mod = 30,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_hammers_2h",
			slide_armour_hit = true,
			damage_profile = "heavy_blunt_tank",
			damage_window_end = 0.5,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 3,
			weapon_up_offset_mod = 0.25,
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
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			critical_strike = {},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.31666666666666665,
					0.1709270477294922,
					0.48630619049072266,
					-0.03273367881774902,
					-0.1614055186510086,
					0.7990110516548157,
					-0.06238066032528877,
					-0.5758804678916931
				},
				{
					0.35277777777777775,
					0.2546730041503906,
					0.44964075088500977,
					-0.026308387517929077,
					-0.029036877676844597,
					0.7892667055130005,
					0.07481172680854797,
					-0.6087841391563416
				},
				{
					0.3888888888888889,
					0.28462982177734375,
					0.44634246826171875,
					-0.04371127486228943,
					0.09409001469612122,
					0.7594013214111328,
					0.1841350942850113,
					-0.616888165473938
				},
				{
					0.425,
					0.29872608184814453,
					0.4607858657836914,
					-0.12863659858703613,
					0.44291794300079346,
					0.5028029680252075,
					0.5246778130531311,
					-0.5250964164733887
				},
				{
					0.46111111111111114,
					0.3331031799316406,
					0.281646728515625,
					-0.14055129885673523,
					0.58327716588974,
					0.30630871653556824,
					0.6689275503158569,
					-0.3442362844944
				},
				{
					0.49722222222222223,
					0.27718162536621094,
					0.10568857192993164,
					-0.14002716541290283,
					0.6194241642951965,
					0.25169652700424194,
					0.7112694978713989,
					-0.21692927181720734
				},
				{
					0.5333333333333333,
					0.2727632522583008,
					-0.0037865638732910156,
					-0.21192046999931335,
					0.621498703956604,
					0.1855800747871399,
					0.7586126923561096,
					-0.06169453635811806
				}
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.3,
			push_radius = 3,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "hit_left_shake",
			range_mod = 1.3,
			sweep_z_offset = 0.05,
			width_mod = 30,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_hammers_2h",
			slide_armour_hit = true,
			damage_profile = "heavy_blunt_tank",
			damage_window_end = 0.5,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "heavy_attack",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 3,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy",
			hit_stop_anim = "attack_hit",
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
					sub_action = "default_left",
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
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					0.2463245391845703,
					0.5099396705627441,
					-0.2212001085281372,
					-0.3380390405654907,
					-0.655960738658905,
					0.33311039209365845,
					-0.5869265198707581
				},
				{
					0.3111111111111111,
					0.14714527130126953,
					0.5592160224914551,
					-0.21291455626487732,
					-0.18423967063426971,
					-0.722193717956543,
					0.3148922324180603,
					-0.5876520872116089
				},
				{
					0.35555555555555557,
					-0.06714153289794922,
					0.5809550285339355,
					-0.12149298191070557,
					0.010464775376021862,
					-0.7682122588157654,
					-0.0025831200182437897,
					-0.6401045322418213
				},
				{
					0.4,
					-0.15618419647216797,
					0.2869701385498047,
					-0.10684216022491455,
					0.37500038743019104,
					-0.6111986041069031,
					-0.46415409445762634,
					-0.51997309923172
				},
				{
					0.4444444444444444,
					-0.26481151580810547,
					0.15573596954345703,
					-0.13986477255821228,
					-0.5376937985420227,
					0.43052732944488525,
					0.5928912162780762,
					0.41714712977409363
				},
				{
					0.48888888888888893,
					-0.04004383087158203,
					0.17995882034301758,
					-0.2594622075557709,
					-0.6627301573753357,
					0.06713072955608368,
					0.7453469634056091,
					-0.027205757796764374
				},
				{
					0.5333333333333333,
					-0.10624122619628906,
					0.24975347518920898,
					-0.3497382402420044,
					-0.628870964050293,
					-0.14366351068019867,
					0.7140467762947083,
					-0.2720649540424347
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.3,
			range_mod = 1.3,
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			width_mod = 30,
			damage_profile = "medium_blunt_smiter_2h_hammer",
			aim_assist_ramp_multiplier = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
			hit_effect = "melee_hit_hammers_2h",
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.45,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "light_attack",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.85,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_down_left",
			hit_stop_anim = "attack_hit",
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
					sub_action = "default_left",
					start_time = 0.7,
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
				}
			},
			baked_sweep = {
				{
					0.26666666666666666,
					0.20237255096435547,
					0.5603218078613281,
					0.11222600936889648,
					-0.6817010045051575,
					-0.1486615687608719,
					0.17322807013988495,
					-0.6951082944869995
				},
				{
					0.30277777777777776,
					0.1792917251586914,
					0.6063194274902344,
					0.052940964698791504,
					-0.633873701095581,
					-0.11731203645467758,
					0.15870550274848938,
					-0.7478333115577698
				},
				{
					0.3388888888888889,
					0.12103462219238281,
					0.7172813415527344,
					-0.08708500862121582,
					-0.5115281343460083,
					-0.09465902298688889,
					0.1399223953485489,
					-0.8424965143203735
				},
				{
					0.375,
					0.014052391052246094,
					0.6579327583312988,
					-0.354146808385849,
					-0.15727265179157257,
					-0.09838184714317322,
					0.07680623233318329,
					-0.9796361923217773
				},
				{
					0.4111111111111111,
					-0.047560691833496094,
					0.33458375930786133,
					-0.41678500175476074,
					0.4587741196155548,
					-0.09547106921672821,
					-0.05725870281457901,
					-0.8815515041351318
				},
				{
					0.44722222222222224,
					-0.06031608581542969,
					0.2315959930419922,
					-0.2984883785247803,
					0.7906507849693298,
					-0.08846736699342728,
					-0.13302935659885406,
					-0.591056764125824
				},
				{
					0.48333333333333334,
					-0.1571826934814453,
					0.06932353973388672,
					-0.2827773094177246,
					0.9427151083946228,
					-0.06631283462047577,
					-0.18321868777275085,
					-0.27077987790107727
				}
			}
		},
		light_attack_left_up = {
			damage_window_start = 0.3,
			range_mod = 1.35,
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			additional_critical_strike_chance = 0,
			damage_profile = "medium_blunt_smiter_2h_hammer_upper",
			width_mod = 30,
			aim_assist_ramp_multiplier = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			hit_effect = "melee_hit_hammers_2h",
			damage_window_end = 0.45,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "light_attack",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
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
				}
			},
			baked_sweep = {
				{
					0.26666666666666666,
					0.33017539978027344,
					0.6035099029541016,
					-0.18671870231628418,
					-0.4183093309402466,
					-0.5944336652755737,
					0.33829110860824585,
					-0.5976832509040833
				},
				{
					0.30277777777777776,
					0.1664714813232422,
					0.6221427917480469,
					-0.18270739912986755,
					-0.30762407183647156,
					-0.6459606885910034,
					0.23976196348667145,
					-0.6562137007713318
				},
				{
					0.3388888888888889,
					-0.030353546142578125,
					0.5606904029846191,
					-0.18068838119506836,
					-0.12818722426891327,
					-0.6847920417785645,
					0.0589849129319191,
					-0.7149466872215271
				},
				{
					0.375,
					-0.12763690948486328,
					0.2999277114868164,
					-0.1640056073665619,
					0.22139094769954681,
					-0.6377522349357605,
					-0.3428397476673126,
					-0.6532374620437622
				},
				{
					0.4111111111111111,
					-0.035676002502441406,
					0.13621091842651367,
					-0.1574234962463379,
					-0.5767629742622375,
					0.3045200705528259,
					0.6955668926239014,
					0.3013283610343933
				},
				{
					0.44722222222222224,
					-0.06701946258544922,
					0.11165809631347656,
					-0.16259178519248962,
					-0.6075748801231384,
					0.20106782019138336,
					0.7281047701835632,
					0.24553604423999786
				},
				{
					0.48333333333333334,
					-0.11242198944091797,
					0.06172370910644531,
					-0.17482027411460876,
					-0.6133906245231628,
					0.17440442740917206,
					0.7243056297302246,
					0.26213815808296204
				}
			}
		},
		light_attack_push_left_up = {
			damage_window_start = 0.33,
			range_mod = 1.4,
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			additional_critical_strike_chance = 0,
			sweep_z_offset = 0.2,
			width_mod = 30,
			damage_profile = "heavy_blunt_tank_light",
			aim_assist_ramp_multiplier = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
			hit_effect = "melee_hit_hammers_2h",
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.42,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "light_attack",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			weapon_up_offset_mod = 0.35,
			uninterruptible = true,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
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
					buff_name = "planted_fast_decrease_movement"
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
					sub_action = "default_left",
					start_time = 0.55,
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
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					release_required = "action_two_hold",
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
				}
			},
			baked_sweep = {
				{
					0.2966666666666667,
					0.23394393920898438,
					0.6845312118530273,
					-0.07216393947601318,
					-0.49214357137680054,
					-0.3794749081134796,
					0.2545698881149292,
					-0.7409370541572571
				},
				{
					0.3227777777777778,
					0.1130228042602539,
					0.7099852561950684,
					-0.1499447524547577,
					-0.38318902254104614,
					-0.4075649678707123,
					0.1973601132631302,
					-0.8050503134727478
				},
				{
					0.3488888888888889,
					-0.04795074462890625,
					0.6615505218505859,
					-0.27977821230888367,
					-0.1315607875585556,
					-0.4201664328575134,
					0.09407949447631836,
					-0.8929170966148376
				},
				{
					0.375,
					-0.12812423706054688,
					0.30997753143310547,
					-0.33122214674949646,
					0.41877567768096924,
					-0.3350183963775635,
					-0.24916934967041016,
					-0.8064144253730774
				},
				{
					0.4011111111111111,
					-0.029668807983398438,
					0.2074885368347168,
					-0.2256215512752533,
					0.7453804016113281,
					-0.1265639215707779,
					-0.5030258297920227,
					-0.41875383257865906
				},
				{
					0.42722222222222217,
					-0.05540180206298828,
					0.20357990264892578,
					-0.2280864417552948,
					0.7855116128921509,
					-0.06939984112977982,
					-0.5446038842201233,
					-0.2855902910232544
				},
				{
					0.4533333333333333,
					-0.10649967193603516,
					0.13132476806640625,
					-0.25223276019096375,
					0.788354754447937,
					-0.06628730893135071,
					-0.5449723601341248,
					-0.2776831090450287
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.35,
			range_mod = 1.3,
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			width_mod = 30,
			damage_profile = "medium_blunt_smiter_2h_hammer",
			aim_assist_ramp_multiplier = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
			hit_effect = "melee_hit_hammers_2h",
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.53,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "light_attack",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.85,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_down_right",
			hit_stop_anim = "attack_hit",
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
					sub_action = "default_right",
					start_time = 0.7,
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
				}
			},
			baked_sweep = {
				{
					0.31666666666666665,
					-0.16833019256591797,
					0.42822265625,
					0.11111271381378174,
					-0.6454620957374573,
					-0.028911644592881203,
					0.07256341725587845,
					-0.7597877383232117
				},
				{
					0.35777777777777775,
					-0.08115100860595703,
					0.5282435417175293,
					0.042432188987731934,
					-0.5618699789047241,
					0.17692996561527252,
					-0.037638187408447266,
					-0.807205855846405
				},
				{
					0.3988888888888889,
					0.021941184997558594,
					0.5947108268737793,
					-0.0614628791809082,
					-0.4081287980079651,
					0.3154764771461487,
					-0.09352323412895203,
					-0.8515626192092896
				},
				{
					0.44,
					0.1313943862915039,
					0.48545122146606445,
					-0.2841995656490326,
					-0.013836435042321682,
					0.27946287393569946,
					0.0509491004049778,
					-0.9587039351463318
				},
				{
					0.48111111111111116,
					0.07917404174804688,
					0.09948110580444336,
					-0.2573690414428711,
					0.8141093850135803,
					0.09902352094650269,
					0.22958073019981384,
					-0.5241307020187378
				},
				{
					0.5222222222222223,
					0.15752792358398438,
					-0.07754087448120117,
					-0.38698816299438477,
					0.904322624206543,
					0.040031787008047104,
					0.22043389081954956,
					-0.3633275330066681
				},
				{
					0.5633333333333334,
					0.22932910919189453,
					-0.22971820831298828,
					-0.5199525356292725,
					0.889232873916626,
					0.015479480847716331,
					0.17416833341121674,
					-0.42271822690963745
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
					sub_action = "light_attack_push_left_up",
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
				}
			}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_hammers"
weapon_template.wield_anim = "to_2h_hammer"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/2h_hammer"
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "MACE_2H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 2
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_2h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.attack_meta_data = {
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
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	base_multiplier = 0,
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 5
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 6,
		[DamageTypes.DAMAGE] = 2
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control",
	"weapon_keyword_armour_piercing"
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
	"wwise/two_handed_hammers"
}

return {
	two_handed_hammers_template_1 = table.clone(weapon_template)
}
