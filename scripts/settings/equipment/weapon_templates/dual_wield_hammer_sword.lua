local push_radius = 2
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.35,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_left_diagonal",
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
					start_time = 0.3,
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
					external_multiplier = 0.35,
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
					sub_action = "heavy_attack_2",
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
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_2",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
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
					external_multiplier = 0.35,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right_diagonal",
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
					start_time = 0.3,
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
		default_right_heavy = {
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
					external_multiplier = 0.35,
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
					start_time = 0.3,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.1,
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "both",
			use_precision_sweep = false,
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_dagger",
			damage_profile_left = "medium_slashing_axe_linesman_1h",
			damage_window_end = 0.44,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "medium_slashing_axe_linesman_1h",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.1,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			dual_hit_stop_anims = {
				left = "shake_hit",
				right = "attack_hit"
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.26666666666666666,
					0.5024709701538086,
					0.34731629490852356,
					0.15231549739837646,
					-0.5429589748382568,
					-0.1937687247991562,
					0.11197318881750107,
					-0.8093894720077515
				},
				{
					0.3011111111111111,
					0.45421409606933594,
					0.47781264781951904,
					0.1164853572845459,
					-0.3955320715904236,
					-0.256662517786026,
					-0.0035643845330923796,
					-0.8818537592887878
				},
				{
					0.33555555555555555,
					0.37749767303466797,
					0.5819547176361084,
					0.05471980571746826,
					-0.23363937437534332,
					-0.31548330187797546,
					-0.11095798760652542,
					-0.9130012392997742
				},
				{
					0.37,
					0.26685142517089844,
					0.6430476307868958,
					-0.0014030933380126953,
					-0.017243146896362305,
					-0.3588116466999054,
					-0.2309240698814392,
					-0.9042295217514038
				},
				{
					0.40444444444444444,
					0.12823200225830078,
					0.6140475273132324,
					-0.1255960464477539,
					0.27760636806488037,
					-0.39757978916168213,
					-0.2870216369628906,
					-0.8261256814002991
				},
				{
					0.4388888888888889,
					-0.07457542419433594,
					0.6161049604415894,
					-0.2221832275390625,
					0.5752977132797241,
					-0.36108431220054626,
					-0.36223074793815613,
					-0.6383098363876343
				},
				{
					0.47333333333333333,
					-0.26562976837158203,
					0.40721336007118225,
					-0.28548502922058105,
					0.805148720741272,
					-0.23400887846946716,
					-0.4346331059932709,
					-0.3287392258644104
				}
			},
			baked_sweep_left = {
				{
					0.26666666666666666,
					0.2932147979736328,
					0.4121238887310028,
					0.042321205139160156,
					-0.7051384449005127,
					-0.28034746646881104,
					0.3309572637081146,
					-0.560938835144043
				},
				{
					0.3011111111111111,
					0.17574119567871094,
					0.5954654812812805,
					-0.009053230285644531,
					-0.4090518057346344,
					-0.4275631606578827,
					0.20540092885494232,
					-0.7795363068580627
				},
				{
					0.33555555555555555,
					-0.13808059692382812,
					0.747784435749054,
					-0.19047892093658447,
					0.3253834545612335,
					-0.4549897313117981,
					-0.12043701112270355,
					-0.8201249241828918
				},
				{
					0.37,
					-0.38794898986816406,
					0.5883005261421204,
					-0.3511085510253906,
					0.5918368697166443,
					-0.3009568154811859,
					-0.32652467489242554,
					-0.6727077960968018
				},
				{
					0.40444444444444444,
					-0.5263204574584961,
					0.2288392186164856,
					-0.44991183280944824,
					0.7019387483596802,
					-0.2540056109428406,
					-0.38552650809288025,
					-0.5423398017883301
				},
				{
					0.4388888888888889,
					-0.5475759506225586,
					0.004086263477802277,
					-0.49236273765563965,
					0.7834705710411072,
					-0.21541985869407654,
					-0.38337844610214233,
					-0.43907755613327026
				},
				{
					0.47333333333333333,
					-0.5569114685058594,
					-0.04122833162546158,
					-0.5185034275054932,
					0.8199065327644348,
					-0.1884930431842804,
					-0.3740972578525543,
					-0.3902241885662079
				}
			}
		},
		heavy_attack_2 = {
			damage_window_start = 0.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.1,
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "both",
			use_precision_sweep = false,
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_1h",
			damage_profile_left = "medium_slashing_axe_linesman_1h",
			damage_window_end = 0.42,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "medium_slashing_axe_linesman_1h",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right_heavy",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default_right_heavy",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.1,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			dual_hit_stop_anims = {
				left = "attack_hit",
				right = "shake_hit"
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.26666666666666666,
					-0.26097679138183594,
					0.2653854489326477,
					0.022240161895751953,
					-0.6732077598571777,
					0.22980032861232758,
					-0.3785567283630371,
					-0.592180609703064
				},
				{
					0.29777777777777775,
					-0.15958499908447266,
					0.5195463299751282,
					-0.002910017967224121,
					-0.4143504798412323,
					0.3283511698246002,
					-0.22981996834278107,
					-0.8171181082725525
				},
				{
					0.3288888888888889,
					0.12395000457763672,
					0.6861767172813416,
					-0.14121127128601074,
					0.22858288884162903,
					0.48652103543281555,
					0.17600151896476746,
					-0.8246639966964722
				},
				{
					0.36,
					0.42108631134033203,
					0.6380244493484497,
					-0.24139904975891113,
					0.5608422756195068,
					0.4209355413913727,
					0.39876794815063477,
					-0.5909766554832458
				},
				{
					0.3911111111111111,
					0.6029109954833984,
					0.5078437328338623,
					-0.29600608348846436,
					0.6385037899017334,
					0.3465973734855652,
					0.460025817155838,
					-0.5104501843452454
				},
				{
					0.42222222222222217,
					0.6989841461181641,
					0.3958817422389984,
					-0.318886399269104,
					0.683341383934021,
					0.27399948239326477,
					0.5096692442893982,
					-0.44520342350006104
				},
				{
					0.4533333333333333,
					0.7387208938598633,
					0.28744232654571533,
					-0.3282735347747803,
					0.7089653015136719,
					0.2134990245103836,
					0.5400713086128235,
					-0.4001367390155792
				}
			},
			baked_sweep_left = {
				{
					0.26666666666666666,
					-0.5090122222900391,
					0.354446679353714,
					-0.06681454181671143,
					-0.3590306341648102,
					0.23282240331172943,
					-0.17552779614925385,
					-0.8866119384765625
				},
				{
					0.29777777777777775,
					-0.4408559799194336,
					0.4211328625679016,
					-0.015891313552856445,
					-0.40651604533195496,
					0.25339218974113464,
					-0.17011484503746033,
					-0.8611608743667603
				},
				{
					0.3288888888888889,
					-0.3589630126953125,
					0.4949197471141815,
					0.021994352340698242,
					-0.4080272614955902,
					0.2861938774585724,
					-0.14404073357582092,
					-0.854902982711792
				},
				{
					0.36,
					-0.2595252990722656,
					0.5718469619750977,
					0.0316770076751709,
					-0.2959508001804352,
					0.3188476264476776,
					-0.051953207701444626,
					-0.8989161252975464
				},
				{
					0.3911111111111111,
					-0.13152599334716797,
					0.6326584219932556,
					-0.02780604362487793,
					0.01797664538025856,
					0.3378892242908478,
					0.13116556406021118,
					-0.931827962398529
				},
				{
					0.42222222222222217,
					0.09014701843261719,
					0.6208309531211853,
					-0.16676974296569824,
					0.4631633460521698,
					0.3334728181362152,
					0.362994521856308,
					-0.7365531921386719
				},
				{
					0.4533333333333333,
					0.39824485778808594,
					0.45075759291648865,
					-0.3125544786453247,
					0.710534930229187,
					0.315799742937088,
					0.5158048868179321,
					-0.3596610426902771
				}
			}
		},
		light_attack_left_diagonal = {
			damage_window_start = 0.22,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "right",
			additional_critical_strike_chance = 0,
			damage_profile = "light_blunt_tank_diag",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.35,
			impact_sound_event = "blunt_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.45,
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
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			baked_sweep = {
				{
					0.18666666666666668,
					0.4709501266479492,
					0.5078465342521667,
					0.20737504959106445,
					-0.35407257080078125,
					-0.290472149848938,
					0.1357073038816452,
					-0.8785454034805298
				},
				{
					0.21944444444444444,
					0.4332571029663086,
					0.5522671937942505,
					0.16913259029388428,
					-0.32037049531936646,
					-0.3388505280017853,
					0.12059621512889862,
					-0.8763558864593506
				},
				{
					0.25222222222222224,
					0.3291053771972656,
					0.618353545665741,
					0.10492241382598877,
					-0.18038322031497955,
					-0.4076972007751465,
					0.059110891073942184,
					-0.8931689858436584
				},
				{
					0.28500000000000003,
					0.06563091278076172,
					0.6862278580665588,
					-0.02003014087677002,
					0.21956753730773926,
					-0.4529265761375427,
					-0.16507814824581146,
					-0.848172664642334
				},
				{
					0.31777777777777777,
					-0.2777881622314453,
					0.5925924777984619,
					-0.2014230489730835,
					0.7064687013626099,
					-0.28691908717155457,
					-0.4240926206111908,
					-0.48859477043151855
				},
				{
					0.3505555555555555,
					-0.3873634338378906,
					0.36153313517570496,
					-0.2861233949661255,
					0.8359353542327881,
					-0.07453154772520065,
					-0.49874934554100037,
					-0.21657845377922058
				},
				{
					0.3833333333333333,
					-0.4139127731323242,
					0.16608518362045288,
					-0.30995213985443115,
					0.8597057461738586,
					0.06276983767747879,
					-0.5040319561958313,
					-0.054016657173633575
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.35,
			range_mod = 1.15,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "right",
			width_mod = 30,
			additional_critical_strike_chance = 0,
			damage_profile = "light_blunt_tank_diag",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.47,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.6,
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
					start_time = 0,
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
			baked_sweep = {
				{
					0.31666666666666665,
					-0.34784698486328125,
					0.5750755071640015,
					-0.09787881374359131,
					-0.43243736028671265,
					0.5982872247695923,
					-0.16446538269519806,
					-0.6542182564735413
				},
				{
					0.34777777777777774,
					-0.21555328369140625,
					0.6677502393722534,
					-0.10085403919219971,
					-0.27560654282569885,
					0.6687111258506775,
					-0.06779167801141739,
					-0.6872196197509766
				},
				{
					0.3788888888888889,
					0.008315086364746094,
					0.7013888359069824,
					-0.11786413192749023,
					0.0340736098587513,
					0.6837998032569885,
					0.2323441207408905,
					-0.6908495426177979
				},
				{
					0.41,
					0.2850818634033203,
					0.6388088464736938,
					-0.1292785406112671,
					0.36034420132637024,
					0.5293192863464355,
					0.5433942079544067,
					-0.5428590774536133
				},
				{
					0.44111111111111106,
					0.5150012969970703,
					0.4993903934955597,
					-0.1483325958251953,
					0.5343904495239258,
					0.3529110550880432,
					0.6751191020011902,
					-0.36618971824645996
				},
				{
					0.4722222222222222,
					0.6352424621582031,
					0.33981892466545105,
					-0.16513121128082275,
					0.6010923385620117,
					0.30073103308677673,
					0.7198691368103027,
					-0.17331258952617645
				},
				{
					0.5033333333333333,
					0.6922731399536133,
					0.1795644760131836,
					-0.18902385234832764,
					0.6354051828384399,
					0.27084341645240784,
					0.7228097319602966,
					-0.021221263334155083
				}
			}
		},
		light_attack_right_diagonal = {
			damage_window_start = 0.28,
			range_mod = 1.1,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0,
			damage_profile = "light_slashing_linesman",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
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
					sub_action = "default_right_heavy",
					start_time = 0.45,
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
					start_time = 0,
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.2466666666666667,
					-0.36617183685302734,
					0.4236361086368561,
					0.098876953125,
					-0.4778461456298828,
					0.36917346715927124,
					-0.13273917138576508,
					-0.7859734892845154
				},
				{
					0.2777777777777778,
					-0.349853515625,
					0.4728807508945465,
					0.08270478248596191,
					-0.4473136365413666,
					0.38639047741889954,
					-0.13387559354305267,
					-0.7954183220863342
				},
				{
					0.30888888888888894,
					-0.2669191360473633,
					0.5693730115890503,
					0.046326279640197754,
					-0.19945691525936127,
					0.41983866691589355,
					0.0026503000408411026,
					-0.8854069113731384
				},
				{
					0.34,
					0.09582138061523438,
					0.6520498991012573,
					-0.15227067470550537,
					0.5241541862487793,
					0.3282324969768524,
					0.3572137951850891,
					-0.699945867061615
				},
				{
					0.3711111111111111,
					0.4583740234375,
					0.39761418104171753,
					-0.3064960241317749,
					0.7392004728317261,
					0.2580413818359375,
					0.5172622799873352,
					-0.34559670090675354
				},
				{
					0.40222222222222226,
					0.544403076171875,
					0.2585999071598053,
					-0.37462329864501953,
					0.805678129196167,
					0.22968274354934692,
					0.5306574702262878,
					-0.12857383489608765
				},
				{
					0.43333333333333335,
					0.5223178863525391,
					0.22423717379570007,
					-0.3970026969909668,
					0.8335548639297485,
					0.19285039603710175,
					0.5172933340072632,
					-0.02006487548351288
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.3,
			range_mod = 1.1,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0,
			damage_profile = "light_slashing_linesman",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
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
					sub_action = "default",
					start_time = 0.6,
					action = "action_one",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.1,
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
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					0.2524747848510742,
					0.4150330126285553,
					0.025866150856018066,
					-0.7108885645866394,
					-0.2866000831127167,
					0.3042285442352295,
					-0.5656350255012512
				},
				{
					0.29444444444444445,
					0.1740703582763672,
					0.5474333763122559,
					0.0002466440200805664,
					-0.5180383324623108,
					-0.3944810628890991,
					0.22680869698524475,
					-0.7242780923843384
				},
				{
					0.32222222222222224,
					-0.058320045471191406,
					0.7162259817123413,
					-0.13895869255065918,
					0.12089146673679352,
					-0.47435835003852844,
					0.009719060733914375,
					-0.8719375133514404
				},
				{
					0.35,
					-0.3351278305053711,
					0.6393128633499146,
					-0.2515968084335327,
					0.5369252562522888,
					-0.3752747178077698,
					-0.2837272882461548,
					-0.7002707123756409
				},
				{
					0.37777777777777777,
					-0.5588560104370117,
					0.28438112139701843,
					-0.3130398988723755,
					0.698065459728241,
					-0.324249267578125,
					-0.4630301296710968,
					-0.4395112693309784
				},
				{
					0.40555555555555556,
					-0.5996780395507812,
					0.06927961111068726,
					-0.418723464012146,
					0.7538602948188782,
					-0.2656727135181427,
					-0.43291184306144714,
					-0.4167734682559967
				},
				{
					0.43333333333333335,
					-0.5633926391601562,
					-0.002183884382247925,
					-0.5124238729476929,
					0.7741122841835022,
					-0.21392087638378143,
					-0.3893813490867615,
					-0.450965940952301
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.15,
			range_mod = 1.15,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 30,
			weapon_action_hand = "both",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_1h",
			use_precision_sweep = false,
			damage_profile_left = "light_slashing_axe_linesman",
			damage_window_end = 0.35,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "light_blunt_tank_spiked",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_down",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.55,
					action = "action_one",
					end_time = 1.35,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.55,
					action = "action_one",
					end_time = 1.35,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.25,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			dual_hit_stop_anims = {
				left = "shake_hit",
				right = "attack_hit"
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.11666666666666667,
					-0.324127197265625,
					0.24265050888061523,
					0.02211320400238037,
					-0.5796851515769958,
					0.2829289734363556,
					-0.05739802122116089,
					-0.7619854807853699
				},
				{
					0.1611111111111111,
					-0.3016500473022461,
					0.3358135223388672,
					0.0014865398406982422,
					-0.4049478769302368,
					0.376891165971756,
					-0.13430024683475494,
					-0.8221518397331238
				},
				{
					0.20555555555555555,
					-0.2545433044433594,
					0.4330437183380127,
					0.013390719890594482,
					-0.2251529097557068,
					0.44204312562942505,
					-0.10098119080066681,
					-0.8623844385147095
				},
				{
					0.24999999999999997,
					-0.0971221923828125,
					0.5809319019317627,
					-0.05699026584625244,
					0.07324904948472977,
					0.5033384561538696,
					0.06281858682632446,
					-0.8586843609809875
				},
				{
					0.2944444444444444,
					0.2881336212158203,
					0.6726799011230469,
					-0.20935893058776855,
					0.48286470770835876,
					0.45647647976875305,
					0.33693957328796387,
					-0.6670400500297546
				},
				{
					0.3388888888888888,
					0.5019121170043945,
					0.5036065578460693,
					-0.2984713315963745,
					0.6407145857810974,
					0.3376562297344208,
					0.4619452655315399,
					-0.5119370222091675
				},
				{
					0.3833333333333333,
					0.5915641784667969,
					0.3493020534515381,
					-0.3272671103477478,
					0.6934083104133606,
					0.2421138733625412,
					0.5192593932151794,
					-0.4369617998600006
				}
			},
			baked_sweep_left = {
				{
					0.11666666666666667,
					0.2713041305541992,
					0.24312448501586914,
					0.029151499271392822,
					0.22024892270565033,
					-0.5851943492889404,
					0.6687591075897217,
					0.40224283933639526
				},
				{
					0.1611111111111111,
					0.2595701217651367,
					0.27005958557128906,
					0.0316508412361145,
					0.22973991930484772,
					-0.5721186995506287,
					0.6690098643302917,
					0.41512131690979004
				},
				{
					0.20555555555555555,
					0.26686763763427734,
					0.38071107864379883,
					0.031165480613708496,
					0.28748345375061035,
					-0.48851683735847473,
					0.6755136847496033,
					0.47157788276672363
				},
				{
					0.24999999999999997,
					0.12764549255371094,
					0.602867841720581,
					-0.04661738872528076,
					0.4090963900089264,
					-0.16462603211402893,
					0.8459157943725586,
					0.29994136095046997
				},
				{
					0.2944444444444444,
					-0.24372291564941406,
					0.7355508804321289,
					-0.23871755599975586,
					0.37130972743034363,
					0.4563312232494354,
					0.7866775393486023,
					-0.18716146051883698
				},
				{
					0.3388888888888888,
					-0.3803415298461914,
					0.5390827655792236,
					-0.35219377279281616,
					0.24113336205482483,
					0.5846377611160278,
					0.761709451675415,
					-0.14089804887771606
				},
				{
					0.3833333333333333,
					-0.4992513656616211,
					0.1087336540222168,
					-0.44828683137893677,
					0.22718054056167603,
					0.7790189385414124,
					0.4030342996120453,
					-0.42318058013916016
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
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_two",
					send_buffer = true,
					input = "action_two_hold"
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
					external_multiplier = 0.85,
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
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				}
			}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_emp_mace_04_t1/wpn_emp_mace_04_t1"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_dual_weapons"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "AXE_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 3
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.15
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.15
	}
}
weapon_template.wield_anim = "to_dual_hammer_sword_es"
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
		arc = 0
	},
	hold_attack = {
		penetrating = true,
		arc = 0
	}
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_fast_attacks",
	"weapon_keyword_crowd_control"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_2"
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
weapon_template.wwise_dep_left_hand = {
	"wwise/one_handed_swords"
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_hammers"
}

return {
	dual_wield_hammer_sword_template = table.clone(weapon_template)
}
