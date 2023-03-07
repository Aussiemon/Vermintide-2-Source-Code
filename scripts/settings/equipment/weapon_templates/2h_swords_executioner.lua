local push_radius = 2.25
local time_mod = 0.75
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_left_down",
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
					end_time = 0.4,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.8,
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
					end_time = 1.7,
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
			anim_event = "attack_swing_charge_right_down",
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
					end_time = 0.4,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.8,
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
					end_time = 1.7,
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
		default_left_diagonal = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_left_down",
			kind = "melee_start",
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
					sub_action = "light_attack_left_diagonal",
					start_time = 0,
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.8,
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
					end_time = 1.7,
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
		default_left_diagonal_other_left = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_swing_charge_right_down",
			kind = "melee_start",
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
					sub_action = "light_attack_left_diagonal",
					start_time = 0,
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.8,
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
		heavy_attack_left = {
			damage_window_start = 0.35,
			range_mod = 1.4,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0.2,
			use_precision_sweep = true,
			damage_profile = "heavy_slashing_smiter_executioner",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.43,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_down_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.33,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.2,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.15,
					external_multiplier = 2,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.5,
					end_time = 0.65,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_diagonal_other_left",
					start_time = 0.8,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left_diagonal_other_left",
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
					0.31666666666666665,
					0.185502290725708,
					0.4430084228515625,
					0.09503984451293945,
					-0.46458864212036133,
					-0.17775124311447144,
					0.1987147182226181,
					-0.844437301158905
				},
				{
					0.3411111111111111,
					0.13036245107650757,
					0.5404224395751953,
					0.022530555725097656,
					-0.35915857553482056,
					-0.10796545445919037,
					0.12580035626888275,
					-0.9184350371360779
				},
				{
					0.3655555555555555,
					0.08242005109786987,
					0.5804681777954102,
					-0.11921000480651855,
					0.015351179987192154,
					-0.10719998180866241,
					0.05614577606320381,
					-0.9925321936607361
				},
				{
					0.39,
					0.028069496154785156,
					0.5653829574584961,
					-0.24318814277648926,
					0.44002947211265564,
					-0.10574673116207123,
					-0.03875542804598808,
					-0.8908926844596863
				},
				{
					0.41444444444444445,
					-0.014983952045440674,
					0.5525493621826172,
					-0.40579795837402344,
					0.6955809593200684,
					-0.11643338948488235,
					-0.0778740718960762,
					-0.7046602368354797
				},
				{
					0.4388888888888889,
					-0.08300089836120605,
					0.46739864349365234,
					-0.5273251533508301,
					0.8397896885871887,
					-0.1286398321390152,
					-0.11149157583713531,
					-0.5155333876609802
				},
				{
					0.4633333333333333,
					-0.16899079084396362,
					0.2794933319091797,
					-0.5451514720916748,
					0.9270740747451782,
					-0.09056659787893295,
					-0.2016330361366272,
					-0.30277955532073975
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.32,
			range_mod = 1.4,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.1,
			additional_critical_strike_chance = 0.2,
			use_precision_sweep = true,
			damage_profile = "heavy_slashing_smiter_executioner",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.41,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.33,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.2,
					end_time = 0.15,
					buff_name = "planted_charging_decrease_movement"
				},
				{
					start_time = 0.15,
					external_multiplier = 2,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.5,
					end_time = 0.65,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_diagonal",
					start_time = 0.8,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left_diagonal",
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
					0.2866666666666667,
					-0.10517215728759766,
					0.47179412841796875,
					0.0824594497680664,
					-0.48313286900520325,
					0.21299496293067932,
					0.05379436910152435,
					-0.8475387692451477
				},
				{
					0.31277777777777777,
					-0.04035001993179321,
					0.4802684783935547,
					0.023421764373779297,
					-0.3210807144641876,
					0.2636083960533142,
					0.07555685937404633,
					-0.9064816236495972
				},
				{
					0.3388888888888889,
					0.04387420415878296,
					0.47486209869384766,
					-0.08577394485473633,
					-0.05025235190987587,
					0.28489693999290466,
					0.09812486171722412,
					-0.9521974325180054
				},
				{
					0.365,
					0.13209033012390137,
					0.4349832534790039,
					-0.2279834747314453,
					0.38522350788116455,
					0.25876584649086,
					0.134009450674057,
					-0.8756052255630493
				},
				{
					0.3911111111111111,
					0.19430911540985107,
					0.3768911361694336,
					-0.35071563720703125,
					0.7148516774177551,
					0.15706786513328552,
					0.13313569128513336,
					-0.6682751774787903
				},
				{
					0.41722222222222216,
					0.25762414932250977,
					0.2160196304321289,
					-0.536644458770752,
					0.9038828611373901,
					0.03194858878850937,
					0.0575820691883564,
					-0.42268115282058716
				},
				{
					0.4433333333333333,
					0.3149837851524353,
					0.0108642578125,
					-0.6157021522521973,
					0.9422690868377686,
					0.00456005334854126,
					0.024661753326654434,
					-0.33391615748405457
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.58,
			hit_armor_anim = "attack_hit_shield",
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			width_mod = 25,
			slide_armour_hit = true,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "medium_slashing_linesman_executioner",
			damage_window_end = 0.7,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.3,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.6,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.8,
					action = "action_one",
					end_time = 1.7,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.7,
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
					end_time = 0.4,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.5466666666666666,
					0.3512638211250305,
					0.31190013885498047,
					-0.10907506942749023,
					-0.4527963101863861,
					-0.4195816218852997,
					0.30722808837890625,
					-0.7242497205734253
				},
				{
					0.5777777777777777,
					0.30508285760879517,
					0.4130105972290039,
					-0.08867979049682617,
					-0.3823215067386627,
					-0.5419652462005615,
					0.0783536434173584,
					-0.7442880272865295
				},
				{
					0.6088888888888888,
					0.11650228500366211,
					0.6231851577758789,
					-0.08781862258911133,
					-0.037528056651353836,
					-0.7503983378410339,
					-0.06383080035448074,
					-0.6568254232406616
				},
				{
					0.6399999999999999,
					-0.2506455183029175,
					0.5313720703125,
					-0.12810540199279785,
					0.45760712027549744,
					-0.5213159918785095,
					-0.4338691532611847,
					-0.5749634504318237
				},
				{
					0.6711111111111111,
					-0.3621668815612793,
					0.2553558349609375,
					-0.12228059768676758,
					-0.6324349641799927,
					0.07652990520000458,
					0.7520229816436768,
					0.16920608282089233
				},
				{
					0.7022222222222222,
					-0.36407744884490967,
					0.12503719329833984,
					-0.13394594192504883,
					-0.6087141036987305,
					-0.200162872672081,
					0.7636731266975403,
					-0.0787736028432846
				},
				{
					0.7333333333333333,
					-0.3101072311401367,
					-0.06606483459472656,
					-0.14595818519592285,
					-0.6592969298362732,
					-0.19017186760902405,
					0.7221002578735352,
					-0.08793981373310089
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.52,
			hit_armor_anim = "attack_hit_shield",
			range_mod = 1.5,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			width_mod = 25,
			slide_armour_hit = true,
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman_executioner",
			damage_window_end = 0.7,
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
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.6,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_diagonal",
					start_time = 0.95,
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
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.4,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.4866666666666667,
					-0.3226156234741211,
					0.3124380111694336,
					-0.11644744873046875,
					-0.5453528165817261,
					0.5449812412261963,
					-0.3078388273715973,
					-0.5575132369995117
				},
				{
					0.5277777777777778,
					-0.31770873069763184,
					0.37665843963623047,
					-0.10734724998474121,
					-0.5538879632949829,
					0.5655858516693115,
					-0.2855345606803894,
					-0.5401766896247864
				},
				{
					0.5688888888888889,
					-0.17669904232025146,
					0.49799537658691406,
					-0.13710451126098633,
					-0.33599039912223816,
					0.6709204912185669,
					-0.12438745051622391,
					-0.649233341217041
				},
				{
					0.61,
					0.29726678133010864,
					0.5377836227416992,
					-0.10179424285888672,
					0.3403913676738739,
					0.5723404288291931,
					0.5147702693939209,
					-0.5399738550186157
				},
				{
					0.6511111111111111,
					0.4207138419151306,
					0.38109874725341797,
					-0.11468982696533203,
					0.6104733347892761,
					0.2542378008365631,
					0.7375999093055725,
					-0.13649848103523254
				},
				{
					0.6922222222222222,
					0.4685770869255066,
					0.22693252563476562,
					-0.12983131408691406,
					0.661173939704895,
					0.14206188917160034,
					0.7357532382011414,
					-0.036532625555992126
				},
				{
					0.7333333333333333,
					0.5195451378822327,
					0.08519554138183594,
					-0.1757373809814453,
					0.7098968029022217,
					0.0850573182106018,
					0.6958558559417725,
					-0.06779678165912628
				}
			}
		},
		light_attack_left_diagonal = {
			damage_window_start = 0.25,
			hit_armor_anim = "attack_hit_shield",
			range_mod = 1.6,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			sweep_z_offset = 0.1,
			width_mod = 25,
			no_damage_impact_sound_event = "slashing_hit_armour",
			slide_armour_hit = true,
			hit_effect = "melee_hit_sword_2h",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = false,
			damage_window_end = 0.5,
			impact_sound_event = "slashing_hit",
			damage_profile = "medium_slashing_linesman_executioner",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_left_diagonal_last",
			hit_stop_anim = "attack_hit",
			total_time = 1.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.6,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.65,
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
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.4,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.21666666666666667,
					0.45366477966308594,
					0.1832871437072754,
					-0.28292393684387207,
					0.5828924775123596,
					0.6091139912605286,
					-0.34931352734565735,
					0.408896803855896
				},
				{
					0.26944444444444443,
					0.43660545349121094,
					0.2398686408996582,
					-0.25370872020721436,
					0.5313596129417419,
					0.6314972043037415,
					-0.33526134490966797,
					0.4543876051902771
				},
				{
					0.32222222222222224,
					0.3652791976928711,
					0.4072697162628174,
					-0.25016021728515625,
					-0.3210941255092621,
					-0.7414043545722961,
					0.2768141031265259,
					-0.5201846957206726
				},
				{
					0.375,
					0.2422332763671875,
					0.5821821689605713,
					-0.18648362159729004,
					-0.023175129666924477,
					-0.8302702903747559,
					-0.04033222422003746,
					-0.555416464805603
				},
				{
					0.4277777777777778,
					-0.1034555435180664,
					0.5296189785003662,
					-0.06209826469421387,
					-0.37515097856521606,
					0.5470019578933716,
					0.6257496476173401,
					0.41047292947769165
				},
				{
					0.48055555555555557,
					-0.3133983612060547,
					0.25897693634033203,
					-0.04490172863006592,
					-0.47153300046920776,
					0.2600264549255371,
					0.8389211297035217,
					0.07908373326063156
				},
				{
					0.5333333333333333,
					-0.31500244140625,
					0.18358254432678223,
					-0.16269946098327637,
					-0.4549470841884613,
					-0.06072127819061279,
					0.8366360068321228,
					-0.29895859956741333
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.5,
			hit_armor_anim = "attack_hit_shield",
			range_mod = 1.45,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			sweep_z_offset = 0.1,
			width_mod = 25,
			slide_armour_hit = true,
			hit_effect = "melee_hit_sword_2h",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_window_end = 0.875,
			impact_sound_event = "slashing_hit",
			damage_profile = "medium_slashing_linesman_executioner",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.86,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.6,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
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
					start_time = 0.85,
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.4666666666666667,
					0.3998587727546692,
					0.2931785583496094,
					0.02516913414001465,
					-0.49836018681526184,
					-0.2977844774723053,
					0.43548551201820374,
					-0.6879781484603882
				},
				{
					0.5402777777777777,
					0.3562048673629761,
					0.3466014862060547,
					0.006306648254394531,
					-0.3239050805568695,
					-0.384965717792511,
					0.3559725880622864,
					-0.7875089645385742
				},
				{
					0.6138888888888889,
					0.14313161373138428,
					0.5419378280639648,
					-0.03577280044555664,
					0.060937099158763885,
					-0.41469094157218933,
					-0.016034742817282677,
					-0.9077780842781067
				},
				{
					0.6875,
					-0.32109761238098145,
					0.2873344421386719,
					-0.24201536178588867,
					0.8036554455757141,
					-0.009004678577184677,
					-0.5632019639015198,
					-0.1919906884431839
				},
				{
					0.7611111111111111,
					-0.3476361036300659,
					0.14382076263427734,
					-0.31408214569091797,
					0.7512457370758057,
					0.33823585510253906,
					-0.5497778058052063,
					0.13773438334465027
				},
				{
					0.8347222222222223,
					-0.30660581588745117,
					0.1116781234741211,
					-0.3467836380004883,
					0.7696185111999512,
					0.21772821247577667,
					-0.5989922285079956,
					0.038601674139499664
				},
				{
					0.9083333333333333,
					-0.253923237323761,
					0.04368114471435547,
					-0.3744947910308838,
					0.807304322719574,
					0.16697242856025696,
					-0.565951406955719,
					-0.008889672346413136
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
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords_executioner"
weapon_template.wield_anim = "to_2h_sword"
weapon_template.buff_type = "MELEE_2H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 2
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
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
		arc = 2
	},
	hold_attack = {
		arc = 0
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
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 5
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 6
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_headshotting",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_high_damage"
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
	two_handed_swords_executioner_template_1 = table.clone(weapon_template)
}
