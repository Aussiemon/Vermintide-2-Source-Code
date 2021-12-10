local push_radius = 2
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_diagonal",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
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
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.8,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_right = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_upper",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_right_up",
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
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_right_up",
					start_time = 0.8,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_right_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
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
					start_time = 0.5,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.8,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_last = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
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
					sub_action = "heavy_attack_right_up",
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
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_right_up",
					start_time = 0.8,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.2,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = true,
			damage_profile = "medium_blunt_smiter_heavy",
			aim_assist_ramp_multiplier = 0.4,
			hit_effect = "melee_hit_hammers_1h",
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.28,
			impact_sound_event = "blunt_hit",
			reset_aim_on_attack = true,
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1,
					end_time = 0.2,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
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
			baked_sweep = {
				{
					0.16666666666666669,
					0.21458780765533447,
					0.4345588684082031,
					0.18754076957702637,
					-0.6862231492996216,
					-0.14708790183067322,
					0.05740763992071152,
					-0.7100474238395691
				},
				{
					0.19111111111111112,
					0.17167961597442627,
					0.5080041885375977,
					0.1579422950744629,
					-0.5611456036567688,
					-0.1391165852546692,
					0.01492244005203247,
					-0.8158060312271118
				},
				{
					0.21555555555555558,
					0.11244094371795654,
					0.6175899505615234,
					0.06084704399108887,
					-0.27217692136764526,
					-0.11460765451192856,
					-0.026804253458976746,
					-0.9550216197967529
				},
				{
					0.24000000000000002,
					0.05680811405181885,
					0.6694164276123047,
					-0.1325376033782959,
					0.17774415016174316,
					-0.07443541288375854,
					-0.04137232527136803,
					-0.9803850054740906
				},
				{
					0.2644444444444445,
					-0.015893101692199707,
					0.6161365509033203,
					-0.3571906089782715,
					0.674669086933136,
					-0.026273583993315697,
					-0.060172006487846375,
					-0.7351943254470825
				},
				{
					0.2888888888888889,
					-0.06074941158294678,
					0.45755672454833984,
					-0.5720703601837158,
					0.9244356155395508,
					-0.0177704356610775,
					-0.1352018117904663,
					-0.35612279176712036
				},
				{
					0.31333333333333335,
					-0.053920865058898926,
					0.22417068481445312,
					-0.6284012794494629,
					0.9784762859344482,
					-0.023168889805674553,
					-0.20452655851840973,
					-0.014707032591104507
				}
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.45,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "medium_blunt_tank_upper_1h",
			hit_effect = "melee_hit_hammers_1h",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			damage_window_end = 0.6,
			impact_sound_event = "blunt_hit",
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right_up",
			hit_stop_anim = "attack_hit",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1,
					end_time = 0.2,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_last",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_last",
					start_time = 0.6,
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
					0.4166666666666667,
					-0.18067562580108643,
					0.47675323486328125,
					-0.1889808177947998,
					-0.28625547885894775,
					0.7983511686325073,
					-0.3163127601146698,
					-0.42501702904701233
				},
				{
					0.4527777777777778,
					0.016138315200805664,
					0.5200443267822266,
					-0.09528183937072754,
					-0.18111515045166016,
					0.8637568354606628,
					-0.090223029255867,
					-0.4614989757537842
				},
				{
					0.4888888888888889,
					0.1785905361175537,
					0.4728727340698242,
					-0.04346013069152832,
					-0.02185196615755558,
					0.8651542663574219,
					0.2117547243833542,
					-0.45408204197883606
				},
				{
					0.525,
					0.26116418838500977,
					0.41361141204833984,
					-0.023511648178100586,
					0.17924632132053375,
					0.7011634111404419,
					0.6042805910110474,
					-0.3332950174808502
				},
				{
					0.5611111111111111,
					0.36661219596862793,
					0.4245138168334961,
					-0.03844475746154785,
					0.3124764561653137,
					0.45819973945617676,
					0.7916136980056763,
					-0.2564355432987213
				},
				{
					0.5972222222222222,
					0.4148292541503906,
					0.3110637664794922,
					-0.1164085865020752,
					0.4902198910713196,
					0.2197524756193161,
					0.8380619883537292,
					-0.09510752558708191
				},
				{
					0.6333333333333333,
					0.4069875478744507,
					0.18103408813476562,
					-0.3777740001678467,
					0.5618476271629333,
					0.08191739022731781,
					0.8211470246315002,
					-0.0577438622713089
				}
			}
		},
		heavy_attack_right_up = {
			damage_window_start = 0.35,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "medium_blunt_tank_upper_1h",
			hit_effect = "melee_hit_hammers_1h",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			damage_window_end = 0.48,
			impact_sound_event = "blunt_hit",
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_up",
			hit_stop_anim = "attack_hit",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1,
					end_time = 0.2,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.6,
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
					0.31666666666666665,
					0.5002800822257996,
					0.5058431625366211,
					-0.24350106716156006,
					-0.18271173536777496,
					-0.776508629322052,
					0.2785421311855316,
					-0.534850537776947
				},
				{
					0.34944444444444445,
					0.403793603181839,
					0.6067705154418945,
					-0.1951732635498047,
					-0.10408088564872742,
					-0.8293417692184448,
					0.1387588530778885,
					-0.5311360359191895
				},
				{
					0.3822222222222222,
					0.18211853504180908,
					0.6198396682739258,
					-0.13387322425842285,
					0.015684394165873528,
					0.841280460357666,
					0.21016494929790497,
					0.4978271424770355
				},
				{
					0.415,
					-0.030119001865386963,
					0.5683917999267578,
					-0.09688115119934082,
					-0.10499835759401321,
					0.7309853434562683,
					0.5639484524726868,
					0.369591623544693
				},
				{
					0.4477777777777777,
					-0.19824910163879395,
					0.3979024887084961,
					-0.03216385841369629,
					-0.27015671133995056,
					0.5455756187438965,
					0.7623936533927917,
					0.21935947239398956
				},
				{
					0.4805555555555555,
					-0.3168715834617615,
					0.17598628997802734,
					-0.014933586120605469,
					-0.45303875207901,
					0.2620689868927002,
					0.8294142484664917,
					0.1953144520521164
				},
				{
					0.5133333333333333,
					-0.30558228492736816,
					-0.010802268981933594,
					-0.08144688606262207,
					-0.5245541930198669,
					0.030169205740094185,
					0.8125362992286682,
					0.2524232864379883
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.33,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "light_blunt_tank",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.42,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 0.95,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.25,
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.2966666666666667,
					0.29688936471939087,
					0.4987173080444336,
					-0.0246889591217041,
					-0.49300989508628845,
					-0.379343181848526,
					0.254568487405777,
					-0.7404288649559021
				},
				{
					0.3227777777777778,
					0.20303428173065186,
					0.5554103851318359,
					-0.08080530166625977,
					-0.35616031289100647,
					-0.41125431656837463,
					0.18346385657787323,
					-0.8187556266784668
				},
				{
					0.3488888888888889,
					0.10077089071273804,
					0.5971870422363281,
					-0.1559135913848877,
					-0.090769462287426,
					-0.4198834300041199,
					0.0871020182967186,
					-0.8988170027732849
				},
				{
					0.375,
					-0.07143759727478027,
					0.4763174057006836,
					-0.2433021068572998,
					0.4690452516078949,
					-0.3100539445877075,
					-0.2963958978652954,
					-0.7720184922218323
				},
				{
					0.4011111111111111,
					-0.18122345209121704,
					0.36538219451904297,
					-0.26127099990844727,
					0.7602024078369141,
					-0.11286941170692444,
					-0.5111995935440063,
					-0.3847438097000122
				},
				{
					0.42722222222222217,
					-0.24335390329360962,
					0.3079376220703125,
					-0.28750157356262207,
					0.7870586514472961,
					-0.06750833988189697,
					-0.5462151169776917,
					-0.27862226963043213
				},
				{
					0.4533333333333333,
					-0.2928769588470459,
					0.23108196258544922,
					-0.3118932247161865,
					0.7879590392112732,
					-0.06594967097043991,
					-0.5430364012718201,
					-0.282635360956192
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.36,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "light_blunt_tank",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.49,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_last",
					start_time = 0.65,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.25,
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.32666666666666666,
					-0.1517963409423828,
					0.36910486221313477,
					-0.08582866191864014,
					-0.38675689697265625,
					0.39321428537368774,
					-0.23680485785007477,
					-0.7998281717300415
				},
				{
					0.35944444444444446,
					-0.04258441925048828,
					0.43310546875,
					-0.09685027599334717,
					-0.22751112282276154,
					0.4654182195663452,
					-0.12680691480636597,
					-0.8458986878395081
				},
				{
					0.3922222222222222,
					0.07411384582519531,
					0.47009801864624023,
					-0.12025332450866699,
					-0.016115574166178703,
					0.4940354824066162,
					0.004484661854803562,
					-0.8692808151245117
				},
				{
					0.425,
					0.12717533111572266,
					0.4489874839782715,
					-0.14241981506347656,
					0.1855521947145462,
					0.47525185346603394,
					0.11657372862100601,
					-0.852124810218811
				},
				{
					0.45777777777777773,
					0.2896261215209961,
					0.30338001251220703,
					-0.22996854782104492,
					0.5621223449707031,
					0.3280510902404785,
					0.3700125813484192,
					-0.6629417538642883
				},
				{
					0.4905555555555555,
					0.4259176254272461,
					0.09722328186035156,
					-0.35876893997192383,
					0.7359717488288879,
					0.14370180666446686,
					0.5020461082458496,
					-0.430865615606308
				},
				{
					0.5233333333333333,
					0.46581554412841797,
					-0.04169178009033203,
					-0.40539073944091797,
					0.7852447628974915,
					0.09830030798912048,
					0.5502020716667175,
					-0.2664685845375061
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.35,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 37,
			use_precision_sweep = true,
			damage_profile = "light_blunt_smiter",
			aim_assist_max_ramp_multiplier = 0.8,
			hit_effect = "melee_hit_hammers_1h",
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.5,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			aim_assist_ramp_multiplier = 0.6,
			anim_event = "attack_swing_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.25,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 1.1,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.25,
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
					0.31666666666666665,
					0.1831197440624237,
					0.43997859954833984,
					0.08010697364807129,
					-0.6236708760261536,
					-0.12322568893432617,
					0.179287850856781,
					-0.750803530216217
				},
				{
					0.35277777777777775,
					0.13547354936599731,
					0.5736188888549805,
					-0.029468774795532227,
					-0.43458235263824463,
					-0.10321971774101257,
					0.1688690334558487,
					-0.8786166310310364
				},
				{
					0.3888888888888889,
					0.05813157558441162,
					0.5723361968994141,
					-0.23548603057861328,
					0.08218680322170258,
					-0.0903492271900177,
					0.07449343800544739,
					-0.9897136092185974
				},
				{
					0.425,
					0.0028592944145202637,
					0.4987649917602539,
					-0.3417387008666992,
					0.5942244529724121,
					-0.056656740605831146,
					-0.048450782895088196,
					-0.800836980342865
				},
				{
					0.46111111111111114,
					-0.11521852016448975,
					0.3087482452392578,
					-0.43164098262786865,
					0.8502897620201111,
					-0.03285152465105057,
					-0.13741916418075562,
					-0.5069952011108398
				},
				{
					0.49722222222222223,
					-0.22674185037612915,
					0.07923507690429688,
					-0.5017061233520508,
					0.9549803137779236,
					-0.01349621545523405,
					-0.18144139647483826,
					-0.2343277633190155
				},
				{
					0.5333333333333333,
					-0.22739368677139282,
					0.02578258514404297,
					-0.48672056198120117,
					0.9773911833763123,
					-0.01386019866913557,
					-0.18533112108707428,
					-0.1008303314447403
				}
			}
		},
		light_attack_upper = {
			damage_window_start = 0.38,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 30,
			use_precision_sweep = false,
			damage_profile = "light_blunt_smiter",
			hit_effect = "melee_hit_hammers_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.52,
			impact_sound_event = "blunt_hit",
			reset_aim_on_attack = true,
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_left_diagonal_last",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
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
					start_time = 0.75,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.25,
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3466666666666667,
					0.4541061520576477,
					0.5504512786865234,
					-0.3390834331512451,
					0.1267274022102356,
					0.824830949306488,
					-0.34155404567718506,
					0.4323597252368927
				},
				{
					0.3811111111111111,
					0.11531221866607666,
					0.7142486572265625,
					-0.23909521102905273,
					-0.21459168195724487,
					0.8687118887901306,
					-0.04585814103484154,
					0.4440576136112213
				},
				{
					0.41555555555555557,
					-0.1141851544380188,
					0.6217174530029297,
					-0.07746171951293945,
					-0.22842346131801605,
					0.7312595844268799,
					0.5500587821006775,
					0.3324417173862457
				},
				{
					0.45,
					-0.25894802808761597,
					0.4529294967651367,
					0.050142526626586914,
					-0.37184014916419983,
					0.3778035342693329,
					0.8283352255821228,
					0.1812736839056015
				},
				{
					0.48444444444444446,
					-0.37387019395828247,
					0.2157115936279297,
					0.09711742401123047,
					-0.3393981158733368,
					0.14121007919311523,
					0.8952447175979614,
					0.2518046796321869
				},
				{
					0.518888888888889,
					-0.3691823482513428,
					-0.2307147979736328,
					0.08783793449401855,
					-0.4623721241950989,
					-0.014604327268898487,
					0.8521219491958618,
					0.24471808969974518
				},
				{
					0.5533333333333333,
					-0.2801332473754883,
					-0.4812946319580078,
					-0.0028548240661621094,
					-0.5104240775108337,
					-0.08407364785671234,
					0.8286159634590149,
					0.21399642527103424
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.31,
			range_mod = 1.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "light_blunt_tank",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.47,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
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
					sub_action = "default_left",
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
					release_required = "action_two_hold",
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.27666666666666667,
					0.28147774934768677,
					0.6226816177368164,
					-0.15244650840759277,
					-0.42113059759140015,
					-0.6237697601318359,
					0.29830464720726013,
					-0.5870048999786377
				},
				{
					0.3144444444444444,
					0.08839678764343262,
					0.6392812728881836,
					-0.18016982078552246,
					-0.2532898187637329,
					-0.6671435236930847,
					0.17245395481586456,
					-0.6789870262145996
				},
				{
					0.3522222222222222,
					-0.09179532527923584,
					0.5455255508422852,
					-0.18488717079162598,
					0.0035706288181245327,
					-0.6853293776512146,
					-0.08215150982141495,
					-0.7235758900642395
				},
				{
					0.39,
					-0.09104502201080322,
					0.19211387634277344,
					-0.1597146987915039,
					-0.4902234673500061,
					0.43399593234062195,
					0.6261261701583862,
					0.42343178391456604
				},
				{
					0.42777777777777776,
					-0.06569850444793701,
					0.15018844604492188,
					-0.1592562198638916,
					-0.5901875495910645,
					0.23909620940685272,
					0.7414289712905884,
					0.21164771914482117
				},
				{
					0.4655555555555555,
					-0.1071540117263794,
					0.10743236541748047,
					-0.16434526443481445,
					-0.5774407982826233,
					0.22261996567249298,
					0.7634518146514893,
					0.1847803145647049
				},
				{
					0.5033333333333333,
					-0.11633217334747314,
					0.08882999420166016,
					-0.18531203269958496,
					-0.5753210186958313,
					0.1905049979686737,
					0.7843921184539795,
					0.13207031786441803
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
					start_time = 0.25,
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
					external_multiplier = 0.8,
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
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_wide_sweeps"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_last"
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
	vertical_only = true,
	base_multiplier = 0,
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.brw_hammer
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_hammer_wizard"
weapon_template.wield_anim = "to_brw_hammer"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "MACE_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 4
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
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_hammers"
}

return {
	one_handed_hammer_wizard_template_1 = table.clone(weapon_template)
}
