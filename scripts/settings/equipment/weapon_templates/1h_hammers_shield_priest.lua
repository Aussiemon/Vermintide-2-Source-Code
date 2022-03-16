local push_radius = 2.5
local time_mod = 0.9
local weapon_template = {
	actions = {
		action_one = {
			default = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				anim_time_scale = time_mod * 1.1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.5,
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
			default_combo = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_left_pose",
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
						sub_action = "light_attack_left",
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
						end_time = 1,
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
			default_left_heavy = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_pose",
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
						sub_action = "heavy_attack",
						start_time = 0.45,
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
				anim_event = "attack_swing_charge_left_pose",
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
						end_time = 1,
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
			default_right_bopp = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_pose",
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
						end_time = 1,
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
			default_left = {
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_pose",
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
			heavy_attack = {
				damage_window_start = 0.2,
				forward_offset = 0.75,
				push_radius = 2.5,
				kind = "shield_slam",
				damage_profile_target = "shield_slam_target",
				no_damage_impact_sound_event = "shield_hit_armour",
				additional_critical_strike_chance = 0,
				armor_impact_sound_event = "shield_hit_armour",
				damage_profile = "shield_slam",
				hit_effect = "melee_hit_hammers_2h",
				hit_time = 0.2,
				weapon_action_hand = "left",
				damage_window_end = 0.25,
				impact_sound_event = "shield_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				damage_profile_aoe = "shield_slam_aoe",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				dedicated_target_range = 3.5,
				aim_assist_ramp_decay_delay = 0.2,
				uninterruptible = true,
				anim_event = "attack_swing_heavy",
				total_time = 1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.1,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_combo",
						start_time = 0.45,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default_combo",
						start_time = 0.45,
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
						start_time = 0.45,
						action = "action_wield",
						input = "action_wield"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end
			},
			heavy_attack_left = {
				damage_window_start = 0.27,
				range_mod = 1.4,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 25,
				headshot_multiplier = 2,
				additional_critical_strike_chance = 0,
				hit_effect = "melee_hit_hammers_1h",
				use_precision_sweep = false,
				damage_profile = "medium_blunt_tank_1h",
				damage_window_end = 0.39,
				impact_sound_event = "blunt_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.1,
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
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default_left_heavy",
						start_time = 0.65,
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
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.2366666666666667,
						0.7696208953857422,
						0.05136394500732422,
						-0.14295101165771484,
						-0.6219680905342102,
						-0.44734081625938416,
						0.3700750172138214,
						-0.525439441204071
					},
					{
						0.2677777777777778,
						0.7453441619873047,
						0.12378311157226562,
						-0.12864208221435547,
						-0.5630572438240051,
						-0.4594968557357788,
						0.336177796125412,
						-0.599010705947876
					},
					{
						0.2988888888888889,
						0.6829056739807129,
						0.2930154800415039,
						-0.09150886535644531,
						-0.42358142137527466,
						-0.5274480581283569,
						0.23237380385398865,
						-0.6988416910171509
					},
					{
						0.33,
						0.3617539405822754,
						0.6600322723388672,
						-0.14999866485595703,
						0.0005386930424720049,
						-0.6466557383537292,
						-0.08944959193468094,
						-0.7575188875198364
					},
					{
						0.3611111111111111,
						-0.19362640380859375,
						0.6420602798461914,
						-0.10601091384887695,
						-0.5376304984092712,
						0.4099138379096985,
						0.6095487475395203,
						0.41397401690483093
					},
					{
						0.39222222222222225,
						-0.4350295066833496,
						0.4156837463378906,
						-0.16892433166503906,
						0.6754317283630371,
						-0.19150002300739288,
						-0.6722778677940369,
						-0.23486635088920593
					},
					{
						0.42333333333333334,
						-0.5214939117431641,
						0.27021217346191406,
						-0.21492576599121094,
						0.7276694178581238,
						-0.05298718810081482,
						-0.6701427102088928,
						-0.13637594878673553
					}
				}
			},
			light_attack_left = {
				damage_window_start = 0.38,
				range_mod = 1.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 25,
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				damage_profile = "light_blunt_tank",
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.52,
				impact_sound_event = "blunt_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				anim_event = "attack_swing_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.15,
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
				critical_strike = {},
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.3466666666666667,
						0.46534013748168945,
						0.5276527404785156,
						0.020780563354492188,
						-0.3594379425048828,
						-0.5470880270004272,
						0.3268093764781952,
						-0.6816852688789368
					},
					{
						0.3811111111111111,
						0.3370389938354492,
						0.61175537109375,
						0.0039958953857421875,
						-0.23433925211429596,
						-0.6020603775978088,
						0.2195369005203247,
						-0.7310348749160767
					},
					{
						0.41555555555555557,
						0.1277909278869629,
						0.6977348327636719,
						-0.026298046112060547,
						0.034216057509183884,
						-0.6267169117927551,
						-0.019965050742030144,
						-0.7782394289970398
					},
					{
						0.45,
						-0.2573728561401367,
						0.6133222579956055,
						-0.1326460838317871,
						0.4936799705028534,
						-0.4039878845214844,
						-0.5046303868293762,
						-0.58174067735672
					},
					{
						0.48444444444444446,
						-0.4027824401855469,
						0.4233837127685547,
						-0.23737812042236328,
						-0.6608651876449585,
						0.16715027391910553,
						0.6652287244796753,
						0.30461257696151733
					},
					{
						0.518888888888889,
						-0.43578481674194336,
						0.29570579528808594,
						-0.34203100204467773,
						-0.6132437586784363,
						0.039767321199178696,
						0.7443829774856567,
						0.26123690605163574
					},
					{
						0.5533333333333333,
						-0.4167184829711914,
						0.21934223175048828,
						-0.4129633903503418,
						-0.6168398857116699,
						-0.0684441477060318,
						0.7417108416557312,
						0.254340261220932
					}
				}
			},
			light_attack_right = {
				damage_window_start = 0.38,
				range_mod = 1.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 25,
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				damage_profile = "light_blunt_tank_diag",
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.52,
				impact_sound_event = "blunt_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				anim_event = "attack_swing_right_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.15,
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
						sub_action = "default_right",
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
				critical_strike = {
					critical_damage_attack_template = "light_blunt_tank"
				},
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.3466666666666667,
						-0.28098297119140625,
						0.26538562774658203,
						0.0701904296875,
						0.8098113536834717,
						-0.15074391663074493,
						0.27359533309936523,
						0.49661603569984436
					},
					{
						0.3811111111111111,
						-0.17922735214233398,
						0.4968452453613281,
						0.04917621612548828,
						-0.6073237061500549,
						0.3232470154762268,
						-0.12228761613368988,
						-0.71534264087677
					},
					{
						0.41555555555555557,
						0.008192062377929688,
						0.6839799880981445,
						-0.07266807556152344,
						-0.10650215297937393,
						0.4325546622276306,
						0.05641722306609154,
						-0.8935160040855408
					},
					{
						0.45,
						0.5583243370056152,
						0.5892963409423828,
						-0.40744829177856445,
						0.694407045841217,
						0.23172742128372192,
						0.4023315906524658,
						-0.5497549772262573
					},
					{
						0.48444444444444446,
						0.8375515937805176,
						0.2817697525024414,
						-0.5614800453186035,
						0.6084209680557251,
						0.4128217399120331,
						0.5413541793823242,
						-0.4078453779220581
					},
					{
						0.518888888888889,
						0.8244872093200684,
						0.053526878356933594,
						-0.6407318115234375,
						0.7205333709716797,
						0.4206215739250183,
						0.482468843460083,
						-0.2667076885700226
					},
					{
						0.5533333333333333,
						0.688023567199707,
						-0.12014007568359375,
						-0.6539871692657471,
						0.8973931670188904,
						0.2856103479862213,
						0.3236016035079956,
						-0.09161992371082306
					}
				}
			},
			light_attack_last = {
				damage_window_start = 0.23,
				range_mod = 1.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				width_mod = 25,
				additional_critical_strike_chance = 0.1,
				use_precision_sweep = false,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.34,
				impact_sound_event = "blunt_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				anim_event = "attack_swing_up_left",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.15,
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
						sub_action = "default_combo",
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
				critical_strike = {
					critical_damage_attack_template = "light_blunt_tank"
				},
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.19666666666666668,
						0.5524778366088867,
						0.5595865249633789,
						-0.23603343963623047,
						0.1017959788441658,
						0.8527708053588867,
						-0.15122266113758087,
						0.4894397556781769
					},
					{
						0.22611111111111112,
						0.3764200210571289,
						0.6562328338623047,
						-0.16377735137939453,
						0.0031375978142023087,
						-0.8538860082626343,
						-0.12379410117864609,
						-0.5055135488510132
					},
					{
						0.2555555555555556,
						0.1282663345336914,
						0.7072067260742188,
						-0.10202598571777344,
						-0.18611344695091248,
						0.7546698451042175,
						0.4379371702671051,
						0.4517148435115814
					},
					{
						0.28500000000000003,
						-0.09061765670776367,
						0.6316661834716797,
						0.0005292892456054688,
						-0.3022386431694031,
						0.5873223543167114,
						0.6617444753646851,
						0.3546808660030365
					},
					{
						0.31444444444444447,
						-0.2570161819458008,
						0.41651344299316406,
						0.1203007698059082,
						-0.3824130594730377,
						0.3814171552658081,
						0.8107606768608093,
						0.2257174551486969
					},
					{
						0.3438888888888889,
						-0.32430219650268555,
						0.1940746307373047,
						0.11774301528930664,
						-0.43725600838661194,
						0.17775650322437286,
						0.8627843856811523,
						0.18114356696605682
					},
					{
						0.37333333333333335,
						-0.3147573471069336,
						0.0016107559204101562,
						0.04750967025756836,
						-0.47365742921829224,
						0.02274443209171295,
						0.8574925065040588,
						0.1995946168899536
					}
				}
			},
			light_attack_bopp = {
				damage_window_start = 0.4,
				range_mod = 1.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = true,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_2h",
				damage_window_end = 0.48,
				impact_sound_event = "blunt_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.5,
				anim_event = "attack_swing_down",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.45,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.25,
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
						sub_action = "default_right_bopp",
						start_time = 0.55,
						action = "action_one",
						release_required = "action_two_hold",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.55,
						action = "action_two",
						release_required = "action_two_hold",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.75,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.55,
						action = "action_wield",
						input = "action_wield"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				baked_sweep = {
					{
						0.3666666666666667,
						0.19110822677612305,
						0.37586402893066406,
						0.2899665832519531,
						-0.5429099202156067,
						-0.10907860845327377,
						-0.004848015494644642,
						-0.8326627016067505
					},
					{
						0.39111111111111113,
						0.1551957130432129,
						0.4980602264404297,
						0.2287440299987793,
						-0.39014479517936707,
						-0.11047640442848206,
						-0.03562738373875618,
						-0.9134072065353394
					},
					{
						0.41555555555555557,
						0.09266519546508789,
						0.6675052642822266,
						0.04912137985229492,
						0.017621658742427826,
						-0.08727113157510757,
						-0.03915899991989136,
						-0.995258629322052
					},
					{
						0.44,
						0.01287078857421875,
						0.7476997375488281,
						-0.24332904815673828,
						0.5526908040046692,
						-0.039069123566150665,
						-0.0396009236574173,
						-0.8315276503562927
					},
					{
						0.46444444444444444,
						-0.07782316207885742,
						0.6195783615112305,
						-0.5769293308258057,
						0.8658085465431213,
						-0.01104795839637518,
						-0.11990495026111603,
						-0.48567095398902893
					},
					{
						0.4888888888888889,
						-0.09623050689697266,
						0.2993497848510742,
						-0.7378730773925781,
						0.9784739017486572,
						-0.026454128324985504,
						-0.18445858359336853,
						-0.08867965638637543
					},
					{
						0.5133333333333333,
						-0.08266878128051758,
						0.07976913452148438,
						-0.7314858436584473,
						0.9647930860519409,
						-0.034964412450790405,
						-0.2121647149324417,
						0.1514529436826706
					}
				}
			},
			push = {
				damage_window_start = 0.05,
				anim_end_event = "attack_finished",
				outer_push_angle = 180,
				kind = "push_stagger",
				damage_profile_outer = "medium_push",
				weapon_action_hand = "right",
				push_angle = 100,
				hit_effect = "melee_hit_sword_1h",
				fatigue_regen_delay = 0.75,
				damage_window_end = 0.2,
				impact_sound_event = "slashing_hit",
				no_damage_impact_sound_event = "slashing_hit_armour",
				dedicated_target_range = 2,
				anim_event = "attack_push",
				damage_profile_inner = "shield_push",
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
						start_time = 0.4,
						action = "action_two",
						send_buffer = true,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.3,
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
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 2,
			[DamageTypes.CLEAVE] = 3,
			[DamageTypes.SPEED] = 3,
			[DamageTypes.STAGGER] = 4,
			[DamageTypes.DAMAGE] = 2
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 2,
			[DamageTypes.CLEAVE] = 5,
			[DamageTypes.SPEED] = 1,
			[DamageTypes.STAGGER] = 5,
			[DamageTypes.DAMAGE] = 1
		}
	},
	tooltip_keywords = {
		"weapon_keyword_wide_sweeps",
		"weapon_keyword_crowd_control",
		"weapon_keyword_powerful_blocks"
	},
	tooltip_compare = {
		light = {
			action_name = "action_one",
			sub_action_name = "light_attack_left"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "heavy_attack_left"
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
	attack_meta_data = {
		tap_attack = {
			penetrating = false,
			arc = 1
		},
		hold_attack = {
			penetrating = true,
			arc = 2
		}
	},
	defense_meta_data = {
		push = "heavy"
	},
	aim_assist_settings = {
		max_range = 5,
		no_aim_input_multiplier = 0,
		base_multiplier = 0,
		effective_max_range = 4,
		breed_scalars = {
			skaven_storm_vermin = 1,
			skaven_clan_rat = 1,
			skaven_slave = 1
		}
	},
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right,
	left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1",
	left_hand_attachment_node_linking = AttachmentNodeLinking.shield,
	display_unit = "units/weapons/weapon_display/display_shield_hammer",
	wield_anim = "to_1h_hammer_shield_priest",
	buff_type = "MELEE_1H",
	weapon_type = "MACE_1H_SHIELD",
	shield_block = true,
	max_fatigue_points = 10,
	dodge_count = 2,
	can_block_ranged_attacks = true,
	block_angle = 180,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.2,
	outer_block_fatigue_point_multiplier = 2,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	wwise_dep_right_hand = {
		"wwise/one_handed_hammers"
	},
	wwise_dep_left_hand = {
		"wwise/two_handed_hammers"
	}
}

return {
	one_handed_hammer_shield_priest_template = weapon_template
}
