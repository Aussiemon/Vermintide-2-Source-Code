local push_radius = 3
local time_mod = 0.8
local weapon_template = {}
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
			anim_event = "attack_swing_charge_left_diagonal",
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
		default_left = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			uninterruptible = true,
			anim_event = "attack_swing_charge",
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
		default_left_heavy = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			uninterruptible = true,
			anim_event = "attack_swing_charge",
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
					start_time = 0.7,
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
					sub_action = "light_attack_shield",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_stab",
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
					sub_action = "heavy_attack_stab",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.3,
			no_damage_impact_sound_event = "slashing_hit_armour",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "medium_slashing_smiter_1h",
			hit_time = 0.2,
			hit_effect = "melee_hit_sword_1h",
			weapon_action_hand = "right",
			aim_assist_ramp_multiplier = 0.2,
			damage_window_end = 0.37,
			impact_sound_event = "slashing_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			hit_stop_anim = "attack_hit",
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
					sub_action = "default_left_heavy",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left_heavy",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.6,
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
					0.1896660327911377,
					0.3478879928588867,
					0.26230573654174805,
					-0.5703155994415283,
					-0.11049903929233551,
					0.01106640137732029,
					-0.8138843178749084
				},
				{
					0.28944444444444445,
					0.16121864318847656,
					0.4651203155517578,
					0.2329878807067871,
					-0.4378204345703125,
					-0.11499302089214325,
					-0.024826811626553535,
					-0.8913324475288391
				},
				{
					0.31222222222222223,
					0.10916268825531006,
					0.63507080078125,
					0.09735584259033203,
					-0.07641091197729111,
					-0.09738413244485855,
					-0.03146037831902504,
					-0.9918104410171509
				},
				{
					0.33499999999999996,
					0.04303121566772461,
					0.7451019287109375,
					-0.15699338912963867,
					0.39050915837287903,
					-0.0667954683303833,
					-0.04035311937332153,
					-0.9172854423522949
				},
				{
					0.35777777777777775,
					-0.059872984886169434,
					0.6850757598876953,
					-0.4630105495452881,
					0.7819428443908691,
					-0.008306893520057201,
					-0.08991628140211105,
					-0.6167750954627991
				},
				{
					0.38055555555555554,
					-0.09836757183074951,
					0.48115062713623047,
					-0.6844403743743896,
					0.9401856064796448,
					-0.013605229556560516,
					-0.15008190274238586,
					-0.3055182099342346
				},
				{
					0.4033333333333333,
					-0.10862851142883301,
					0.19610023498535156,
					-0.7467865943908691,
					0.9765341281890869,
					-0.027198471128940582,
					-0.21264676749706268,
					0.02055978961288929
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.2,
			forward_offset = 0.75,
			anim_end_event = "attack_finished",
			kind = "shield_slam",
			damage_profile_target = "shield_slam_target",
			range_mod = 1.35,
			no_damage_impact_sound_event = "shield_hit_armour",
			push_radius = 2.5,
			armor_impact_sound_event = "shield_hit_armour",
			damage_profile = "shield_slam",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_hammers_2h",
			hit_time = 0.2,
			weapon_action_hand = "left",
			damage_window_end = 0.25,
			impact_sound_event = "shield_hit",
			charge_value = "heavy_attack",
			damage_profile_aoe = "shield_slam_aoe",
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_max_ramp_multiplier = 0.4,
			dedicated_target_range = 3.5,
			aim_assist_ramp_decay_delay = 0.1,
			uninterruptible = true,
			anim_event = "attack_swing_heavy",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_stab_heavy",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default_stab_heavy",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
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
			end
		},
		heavy_attack_stab = {
			damage_window_start = 0.22,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.4,
			no_damage_impact_sound_event = "stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "medium_slashing_smiter_stab_1h",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.32,
			impact_sound_event = "stab_hit",
			dedicated_target_range = 2.75,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
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
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
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
					0.18666666666666668,
					0.2905523180961609,
					-0.6235685348510742,
					-0.0651249885559082,
					0.2873588502407074,
					0.698367714881897,
					0.5781286954879761,
					-0.30898964405059814
				},
				{
					0.21444444444444444,
					0.2866169810295105,
					-0.594782829284668,
					-0.05302000045776367,
					0.26600268483161926,
					0.6924824714660645,
					0.5931326746940613,
					-0.31289634108543396
				},
				{
					0.24222222222222223,
					0.32273775339126587,
					-0.5821666717529297,
					-0.04467058181762695,
					0.24851180613040924,
					0.6811094880104065,
					0.6109529137611389,
					-0.31791234016418457
				},
				{
					0.27,
					0.37518125772476196,
					-0.5287895202636719,
					-0.030035972595214844,
					0.23409251868724823,
					0.6578314900398254,
					0.6329778432846069,
					-0.3343612551689148
				},
				{
					0.2977777777777778,
					0.3617313504219055,
					0.1492471694946289,
					-0.04140758514404297,
					0.24280552566051483,
					0.6257804036140442,
					0.6251131296157837,
					-0.39834386110305786
				},
				{
					0.3255555555555556,
					0.1566508412361145,
					0.547454833984375,
					-0.030037879943847656,
					0.26854225993156433,
					0.6302404403686523,
					0.6122355461120605,
					-0.3947780132293701
				},
				{
					0.35333333333333333,
					0.18035560846328735,
					0.5822601318359375,
					-0.03379678726196289,
					0.268753319978714,
					0.6356984972953796,
					0.6155436038970947,
					-0.3804800808429718
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.34,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "light_slashing_linesman",
			hit_effect = "melee_hit_hammers_2h",
			damage_window_end = 0.5,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_up_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "default_left",
					start_time = 0.6,
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
					start_time = 1.2,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3066666666666667,
					0.5904727578163147,
					0.37156200408935547,
					-0.29036974906921387,
					0.21798111498355865,
					0.792339563369751,
					-0.27366968989372253,
					0.4997871220111847
				},
				{
					0.34444444444444444,
					0.5699649453163147,
					0.5427846908569336,
					-0.2515735626220703,
					0.10498888045549393,
					0.8489531874656677,
					-0.18592894077301025,
					0.48341110348701477
				},
				{
					0.38222222222222224,
					0.35177308320999146,
					0.6663694381713867,
					-0.17214107513427734,
					-0.0005600929725915194,
					0.8658398389816284,
					0.1614340990781784,
					0.4735611379146576
				},
				{
					0.42000000000000004,
					0.04786175489425659,
					0.6927099227905273,
					-0.0639352798461914,
					-0.12836629152297974,
					0.7269529104232788,
					0.5815673470497131,
					0.3418201208114624
				},
				{
					0.4577777777777778,
					-0.19513541460037231,
					0.4917182922363281,
					0.08596944808959961,
					-0.2550170123577118,
					0.5243571400642395,
					0.7930720448493958,
					0.1762174814939499
				},
				{
					0.4955555555555555,
					-0.3238057494163513,
					0.22433948516845703,
					0.12271451950073242,
					-0.37716639041900635,
					0.26799458265304565,
					0.8748189210891724,
					0.14358365535736084
				},
				{
					0.5333333333333333,
					-0.3129122853279114,
					-0.021579742431640625,
					0.03707456588745117,
					-0.46157440543174744,
					0.02776743471622467,
					0.8653982877731323,
					0.19303834438323975
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.3,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "light_slashing_smiter",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.35,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_stab_heavy",
					start_time = 0.75,
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
					start_time = 1.2,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					-0.19136452674865723,
					0.4247293472290039,
					0.18347597122192383,
					-0.6439642310142517,
					0.2697877883911133,
					-0.0867309719324112,
					-0.7106351256370544
				},
				{
					0.2861111111111111,
					-0.12416315078735352,
					0.5833206176757812,
					0.12373161315917969,
					-0.3544824421405792,
					0.3234427571296692,
					-0.014489032328128815,
					-0.8772212266921997
				},
				{
					0.3055555555555555,
					-0.054711341857910156,
					0.627197265625,
					0.027805328369140625,
					0.0048785097897052765,
					0.2638930678367615,
					0.006784184370189905,
					-0.9645158052444458
				},
				{
					0.32499999999999996,
					0.026395797729492188,
					0.6986331939697266,
					-0.19577836990356445,
					0.37503930926322937,
					0.23272481560707092,
					0.07983501255512238,
					-0.8937622904777527
				},
				{
					0.34444444444444444,
					0.2617344856262207,
					0.5277442932128906,
					-0.6810657978057861,
					0.7634572386741638,
					0.24717018008232117,
					0.11226745694875717,
					-0.5860341191291809
				},
				{
					0.3638888888888889,
					0.5152966976165771,
					0.36826133728027344,
					-0.7320466041564941,
					0.7496796250343323,
					0.31345176696777344,
					0.25950688123703003,
					-0.5219048857688904
				},
				{
					0.3833333333333333,
					0.7715773582458496,
					0.17724609375,
					-0.6844387054443359,
					0.6626623868942261,
					0.4719175696372986,
					0.4579831659793854,
					-0.3583626449108124
				}
			}
		},
		light_attack_shield = {
			damage_window_start = 0.25,
			forward_offset = 0.75,
			kind = "shield_slam",
			damage_profile_target = "shield_slam_target",
			range_mod = 1.2,
			no_damage_impact_sound_event = "shield_hit_armour",
			push_radius = 2.5,
			armor_impact_sound_event = "shield_hit_armour",
			damage_profile = "shield_slam_shotgun",
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_hammers_2h",
			use_precision_sweep = false,
			attack_direction = "up",
			damage_window_end = 0.3,
			impact_sound_event = "shield_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			damage_profile_aoe = "shield_slam_shotgun_aoe",
			hit_time = 0.21,
			weapon_action_hand = "left",
			dedicated_target_range = 3.5,
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_heavy_breton",
			total_time = 1.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.4,
					buff_name = "planted_decrease_movement"
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
					end_time = 1.2,
					input = "action_one_hold"
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			}
		},
		light_attack_stab_postpush = {
			damage_window_start = 0.18,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "light_slashing_smiter_stab",
			hit_shield_stop_anim = "attack_hit_shield",
			ignore_armour_hit = true,
			hit_effect = "melee_hit_hammers_2h",
			attack_direction = "up",
			damage_window_end = 0.28,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_stab",
			hit_stop_anim = "attack_hit",
			total_time = 1.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
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
					sub_action = "default_stab_heavy",
					start_time = 0.45,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default_stab_heavy",
					start_time = 0.45,
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
					start_time = 0.45,
					action = "action_wield",
					input = "action_wield"
				}
			},
			baked_sweep = {
				{
					0.14666666666666667,
					0.23765403032302856,
					-0.7274208068847656,
					-0.06616735458374023,
					0.4997671842575073,
					0.5901103019714355,
					0.49856501817703247,
					-0.39170849323272705
				},
				{
					0.17444444444444446,
					0.2659319043159485,
					-0.7598991394042969,
					-0.016384124755859375,
					0.4752067029476166,
					0.5817435383796692,
					0.5405899882316589,
					-0.37883424758911133
				},
				{
					0.20222222222222222,
					0.30137306451797485,
					-0.7922163009643555,
					0.008984565734863281,
					0.42650169134140015,
					0.578403890132904,
					0.5776659250259399,
					-0.38710102438926697
				},
				{
					0.23,
					0.33211666345596313,
					-0.7222099304199219,
					-0.0005841255187988281,
					0.35194680094718933,
					0.6121858954429626,
					0.5986865162849426,
					-0.3780691623687744
				},
				{
					0.2577777777777778,
					0.3742637038230896,
					-0.5772562026977539,
					-0.021677017211914062,
					0.25807544589042664,
					0.6549104452133179,
					0.6200094819068909,
					-0.34652209281921387
				},
				{
					0.28555555555555556,
					0.4712386727333069,
					-0.16944408416748047,
					0.09640359878540039,
					0.21930405497550964,
					0.6862638592720032,
					0.6187385320663452,
					-0.3132256269454956
				},
				{
					0.31333333333333335,
					0.23306173086166382,
					0.4949302673339844,
					-0.040906429290771484,
					0.2691227197647095,
					0.6116232872009277,
					0.6053940653800964,
					-0.432420939207077
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
			charge_value = "action_push",
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
					sub_action = "light_attack_shield",
					start_time = 0.2,
					action = "action_one",
					release_required = "action_two_hold",
					end_time = 0.8,
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
weapon_template.left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.shield
weapon_template.display_unit = "units/weapons/weapon_display/display_shield_sword"
weapon_template.wield_anim = "to_1h_sword_shield_breton"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "SWORD_1H_SHIELD"
weapon_template.shield_block = true
weapon_template.max_fatigue_points = 10
weapon_template.dodge_count = 4
weapon_template.can_block_ranged_attacks = true
weapon_template.block_angle = 120
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.2
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
		penetrating = false,
		arc = 1
	},
	hold_attack = {
		penetrating = true,
		arc = 0
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
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 4
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 5
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
	"wwise/two_handed_swords"
}

return {
	one_handed_sword_shield_template_2 = weapon_template
}
