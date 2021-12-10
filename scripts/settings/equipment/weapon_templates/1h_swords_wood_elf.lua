local push_radius = 2
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_down",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_left",
					start_time = 0,
					action = "action_one",
					end_time = 0.31,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.6,
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
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.6,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_right = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_right_diagonal_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right",
					start_time = 0,
					action = "action_one",
					end_time = 0.31,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.6,
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
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.6,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_left",
			kind = "melee_start",
			aim_assist_ramp_decay_delay = 0.1,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_last",
					start_time = 0,
					action = "action_one",
					end_time = 0.31,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_up",
					start_time = 0.55,
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
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_up",
					start_time = 0.6,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.15,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = true,
			damage_profile = "medium_slashing_smiter_1h",
			aim_assist_max_ramp_multiplier = 0.6,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.5,
			anim_event = "attack_swing_heavy_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.15,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.35,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.35,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.45,
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
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.11666666666666667,
					-0.017545700073242188,
					0.1716442108154297,
					0.40807533264160156,
					-0.6916663646697998,
					-0.03445172309875488,
					0.014181890524923801,
					-0.7212556004524231
				},
				{
					0.1527777777777778,
					-0.002574920654296875,
					0.3801841735839844,
					0.26442718505859375,
					-0.28034108877182007,
					-0.026130080223083496,
					0.004385335836559534,
					-0.959534764289856
				},
				{
					0.18888888888888888,
					-0.00301361083984375,
					0.5883884429931641,
					-0.08212566375732422,
					0.48202386498451233,
					-0.0018278134521096945,
					-0.006211681757122278,
					-0.8761341571807861
				},
				{
					0.22499999999999998,
					0.006256103515625,
					0.6593647003173828,
					-0.3080110549926758,
					0.7450215816497803,
					-0.018295258283615112,
					0.015277360565960407,
					-0.6666143536567688
				},
				{
					0.26111111111111107,
					-0.0098114013671875,
					0.4832935333251953,
					-0.550847053527832,
					0.8800871968269348,
					0.003957293927669525,
					0.018181852996349335,
					-0.47444742918014526
				},
				{
					0.29722222222222217,
					-0.00650787353515625,
					0.29959678649902344,
					-0.6606674194335938,
					0.9334312081336975,
					-0.0024768796283751726,
					-0.012857620604336262,
					-0.35851746797561646
				},
				{
					0.3333333333333333,
					-0.009157180786132812,
					0.18023300170898438,
					-0.7201976776123047,
					0.9571477174758911,
					-0.004635762423276901,
					-0.035051338374614716,
					-0.28743383288383484
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.15,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = true,
			damage_profile = "medium_slashing_smiter_1h",
			aim_assist_max_ramp_multiplier = 0.6,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.5,
			anim_event = "attack_swing_heavy_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.15,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.45,
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
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.11666666666666667,
					-0.28662109375,
					0.1819324493408203,
					0.12035465240478516,
					-0.7227696180343628,
					0.2325831800699234,
					-0.4103078842163086,
					-0.5051302909851074
				},
				{
					0.1527777777777778,
					-0.2315807342529297,
					0.2779579162597656,
					0.16219520568847656,
					-0.6767522096633911,
					0.27557551860809326,
					-0.3155561685562134,
					-0.6053833365440369
				},
				{
					0.18888888888888888,
					-0.20079994201660156,
					0.3498249053955078,
					0.17940616607666016,
					-0.697175920009613,
					0.22929394245147705,
					-0.16625148057937622,
					-0.6585821509361267
				},
				{
					0.22499999999999998,
					-0.09911537170410156,
					0.5906581878662109,
					0.10559654235839844,
					-0.2825137972831726,
					0.2524477243423462,
					-0.0819401666522026,
					-0.921814501285553
				},
				{
					0.26111111111111107,
					0.04291534423828125,
					0.7441082000732422,
					-0.23987960815429688,
					0.4724188446998596,
					0.16327537596225739,
					0.051981121301651,
					-0.8645574450492859
				},
				{
					0.29722222222222217,
					0.5388584136962891,
					0.38440513610839844,
					-0.7426252365112305,
					0.7752327919006348,
					0.24314343929290771,
					0.2818926274776459,
					-0.5103254318237305
				},
				{
					0.3333333333333333,
					0.8699836730957031,
					0.20418167114257812,
					-0.5786771774291992,
					0.6148661375045776,
					0.4367455244064331,
					0.5501883029937744,
					-0.358449250459671
				}
			}
		},
		heavy_attack_up = {
			damage_window_start = 0.37,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = false,
			damage_profile = "medium_pointy_smiter_upper_1h",
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.48,
			impact_sound_event = "slashing_hit",
			reset_aim_on_attack = true,
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.5,
			anim_event = "attack_swing_heavy_left_up",
			hit_stop_anim = "attack_hit",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.45,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.35,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = NONE,
			baked_sweep = {
				{
					0.33666666666666667,
					0.6050510406494141,
					0.44842529296875,
					-0.2812662124633789,
					0.16720108687877655,
					0.8178247213363647,
					-0.26434943079948425,
					0.4830382168292999
				},
				{
					0.3661111111111111,
					0.518157958984375,
					0.5866661071777344,
					-0.2341775894165039,
					0.07067973911762238,
					0.8663846254348755,
					-0.10860845446586609,
					0.4822719693183899
				},
				{
					0.39555555555555555,
					0.3629283905029297,
					0.6613826751708984,
					-0.17205238342285156,
					0.011668930761516094,
					0.8675169348716736,
					0.14817926287651062,
					0.47467997670173645
				},
				{
					0.425,
					0.10574722290039062,
					0.7022895812988281,
					-0.08738899230957031,
					-0.10528018325567245,
					0.7608851790428162,
					0.5172650814056396,
					0.37736812233924866
				},
				{
					0.45444444444444443,
					-0.07367515563964844,
					0.6232643127441406,
					0.008697509765625,
					-0.1842794120311737,
					0.6392319798469543,
					0.7036390900611877,
					0.2496309131383896
				},
				{
					0.48388888888888887,
					-0.27509307861328125,
					0.375274658203125,
					0.12950801849365234,
					-0.31124401092529297,
					0.4152626693248749,
					0.8425130844116211,
					0.1444154530763626
				},
				{
					0.5133333333333333,
					-0.3264122009277344,
					0.2034931182861328,
					0.11846923828125,
					-0.3854164779186249,
					0.24784891307353973,
					0.8767531514167786,
					0.14604435861110687
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.38,
			anim_end_event = "attack_finished",
			total_time = 1.6,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_linesman_elf",
			damage_window_end = 0.52,
			forced_interpolation = 0.5,
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			range_mod = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.05,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.55,
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
					start_time = 0.4,
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
					0.3466666666666667,
					0.5058879852294922,
					0.4422779083251953,
					0.06482124328613281,
					-0.7066119313240051,
					-0.2436717301607132,
					0.13564927875995636,
					-0.6503252983093262
				},
				{
					0.3811111111111111,
					0.42827415466308594,
					0.546630859375,
					0.06397724151611328,
					-0.56141197681427,
					-0.3217480182647705,
					0.1429854929447174,
					-0.7488992214202881
				},
				{
					0.41555555555555557,
					0.2873878479003906,
					0.6618843078613281,
					0.01893138885498047,
					-0.3220597505569458,
					-0.3872087001800537,
					0.09792616963386536,
					-0.8583457469940186
				},
				{
					0.45,
					-0.0257110595703125,
					0.7564506530761719,
					-0.14697742462158203,
					0.20837613940238953,
					-0.3771020770072937,
					-0.13209769129753113,
					-0.8927057981491089
				},
				{
					0.48444444444444446,
					-0.3263816833496094,
					0.5609321594238281,
					-0.30338191986083984,
					0.7791458368301392,
					-0.1579272449016571,
					-0.3588221073150635,
					-0.4891190826892853
				},
				{
					0.518888888888889,
					-0.39288330078125,
					0.1840686798095703,
					-0.5095977783203125,
					0.9376533031463623,
					-0.06466550379991531,
					-0.33950263261795044,
					0.03691496327519417
				},
				{
					0.5533333333333333,
					-0.3640480041503906,
					0.02690887451171875,
					-0.4974641799926758,
					0.9306442737579346,
					-0.04730590432882309,
					-0.29099929332733154,
					0.21675525605678558
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.38,
			anim_end_event = "attack_finished",
			total_time = 1.6,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_linesman_elf",
			damage_window_end = 0.52,
			forced_interpolation = 0.5,
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			range_mod = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.05,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
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
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3466666666666667,
					-0.30132293701171875,
					0.20656967163085938,
					0.06366920471191406,
					0.8181207776069641,
					-0.11393251270055771,
					0.3542146682739258,
					0.4384402334690094
				},
				{
					0.3811111111111111,
					-0.22779464721679688,
					0.3888206481933594,
					0.06338310241699219,
					-0.7281675934791565,
					0.24580448865890503,
					-0.1786470115184784,
					-0.614359438419342
				},
				{
					0.41555555555555557,
					-0.09846687316894531,
					0.6071224212646484,
					-0.000926971435546875,
					-0.3544977307319641,
					0.4031827747821808,
					-0.050632961094379425,
					-0.8421468734741211
				},
				{
					0.45,
					0.2988433837890625,
					0.7153511047363281,
					-0.26253700256347656,
					0.4180164933204651,
					0.3619302213191986,
					0.29326990246772766,
					-0.7799112796783447
				},
				{
					0.48444444444444446,
					0.7323360443115234,
					0.43740272521972656,
					-0.49660301208496094,
					0.6928647756576538,
					0.27234697341918945,
					0.48599839210510254,
					-0.4577893912792206
				},
				{
					0.518888888888889,
					0.8568840026855469,
					0.1729869842529297,
					-0.6081562042236328,
					0.6274581551551819,
					0.4464639127254486,
					0.5317749381065369,
					-0.352394163608551
				},
				{
					0.5533333333333333,
					0.7651576995849609,
					-0.03911781311035156,
					-0.6522836685180664,
					0.8167610168457031,
					0.3616889715194702,
					0.4115394353866577,
					-0.18088075518608093
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.27,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "stab_hit_armour",
			width_mod = 25,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_stab_swords",
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.45,
			impact_sound_event = "stab_hit",
			reset_aim_on_attack = true,
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			aim_assist_ramp_multiplier = 0.6,
			anim_event = "attack_swing_stab",
			hit_stop_anim = "attack_hit",
			total_time = 1.6,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.1,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.1,
					external_multiplier = 1.35,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
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
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.2366666666666667,
					0.4553375244140625,
					-0.3684883117675781,
					0.00365447998046875,
					0.2862749993801117,
					0.6406983137130737,
					0.5469548106193542,
					-0.4565005302429199
				},
				{
					0.2777777777777778,
					0.156829833984375,
					0.5167655944824219,
					-0.004740715026855469,
					0.3134472072124481,
					0.5898995399475098,
					0.5799513459205627,
					-0.4662894606590271
				},
				{
					0.3188888888888889,
					0.1145172119140625,
					0.6026611328125,
					-0.04136371612548828,
					0.30569949746131897,
					0.6145880818367004,
					0.5814313292503357,
					-0.4367687404155731
				},
				{
					0.36,
					0.12154579162597656,
					0.5794467926025391,
					-0.04262828826904297,
					0.306512713432312,
					0.6177369356155396,
					0.5784270167350769,
					-0.4357445538043976
				},
				{
					0.4011111111111111,
					0.12046051025390625,
					0.5827980041503906,
					-0.041586875915527344,
					0.3081972301006317,
					0.6167883276939392,
					0.5790247321128845,
					-0.4351058006286621
				},
				{
					0.4422222222222222,
					0.11405754089355469,
					0.5851249694824219,
					-0.04070091247558594,
					0.30549055337905884,
					0.6167168021202087,
					0.5791445970535278,
					-0.43695247173309326
				},
				{
					0.48333333333333334,
					0.11408233642578125,
					0.5844802856445312,
					-0.04635143280029297,
					0.3054293990135193,
					0.6160895824432373,
					0.580268919467926,
					-0.4363881051540375
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "light_slashing_linesman_elf",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.5,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.45,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.05,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.55,
					action = "action_one",
					release_required = "action_two_hold",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.55,
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3466666666666667,
					0.4979362487792969,
					0.5005283355712891,
					0.018489837646484375,
					-0.38468441367149353,
					-0.5321440100669861,
					0.3524048924446106,
					-0.6668219566345215
				},
				{
					0.37777777777777777,
					0.42641258239746094,
					0.5578670501708984,
					0.016463279724121094,
					-0.32481276988983154,
					-0.5670905709266663,
					0.297601580619812,
					-0.6959441900253296
				},
				{
					0.4088888888888889,
					0.28052520751953125,
					0.6403789520263672,
					-0.0013265609741210938,
					-0.16875989735126495,
					-0.6170117259025574,
					0.15781056880950928,
					-0.7522715330123901
				},
				{
					0.44,
					0.03853797912597656,
					0.7116661071777344,
					-0.04547691345214844,
					0.14948996901512146,
					-0.6078135371208191,
					-0.12879861891269684,
					-0.7691725492477417
				},
				{
					0.4711111111111111,
					-0.3188743591308594,
					0.5574417114257812,
					-0.16222667694091797,
					-0.5650471448898315,
					0.3253098130226135,
					0.5767348408699036,
					0.4922116696834564
				},
				{
					0.5022222222222222,
					-0.4058952331542969,
					0.4154987335205078,
					-0.24257755279541016,
					-0.6630380153656006,
					0.15885120630264282,
					0.668820321559906,
					0.29635515809059143
				},
				{
					0.5333333333333333,
					-0.43575096130371094,
					0.29512977600097656,
					-0.3425750732421875,
					-0.6130070090293884,
					0.039156798273324966,
					0.7446082830429077,
					0.26124265789985657
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
					start_time = 0.3,
					action = "action_one",
					release_required = "action_two_hold",
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
					start_time = 0.225,
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
					external_multiplier = 0.9,
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
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_swords_wood_elf"
weapon_template.wield_anim = "to_1h_sword"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "SWORD_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 100
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 1.5
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25
	}
}
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
		arc = 1
	},
	hold_attack = {
		penetrating = true,
		arc = 0
	}
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	base_multiplier = 0.025,
	target_node = "j_neck",
	effective_max_range = 3,
	breed_scalars = {
		skaven_storm_vermin = 0.25,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_versatile"
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
	"wwise/one_handed_swords"
}

return {
	we_one_hand_sword_template_1 = table.clone(weapon_template)
}
