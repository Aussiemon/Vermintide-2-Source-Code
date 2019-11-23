local push_radius = 3
local time_mod = 0.9
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
			anim_event = "attack_swing_charge_left",
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
		default_left = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
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
					external_multiplier = 0.5,
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
		default_right_heavy = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
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
					sub_action = "heavy_attack_stab",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.27,
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
			damage_profile = "medium_slashing_tank_1h",
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
			anim_time_scale = time_mod * 1.15,
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
					0.2366666666666667,
					0.7809548377990723,
					-0.2959403991699219,
					-0.2136249542236328,
					0.6509445905685425,
					-0.3156726062297821,
					0.6759173274040222,
					-0.14056210219860077
				},
				{
					0.2744444444444445,
					0.8711352348327637,
					-0.0104217529296875,
					-0.20604801177978516,
					0.7065627574920654,
					-0.080995574593544,
					0.6747678518295288,
					-0.19722352921962738
				},
				{
					0.31222222222222223,
					0.7973527908325195,
					0.4665203094482422,
					-0.1959705352783203,
					0.7153200507164001,
					0.23850680887699127,
					0.5782932043075562,
					-0.31146225333213806
				},
				{
					0.35,
					0.4087977409362793,
					0.8449134826660156,
					-0.1537189483642578,
					0.554313600063324,
					0.4129331409931183,
					0.5676639080047607,
					-0.44719168543815613
				},
				{
					0.3877777777777778,
					-0.22560787200927734,
					0.8792953491210938,
					-0.15307044982910156,
					0.34384965896606445,
					0.5803931951522827,
					0.4398220479488373,
					-0.5928471684455872
				},
				{
					0.4255555555555556,
					-1.1989026069641113,
					0.8387851715087891,
					-0.1613750457763672,
					0.08192506432533264,
					0.6745684742927551,
					0.24504292011260986,
					-0.6915199160575867
				},
				{
					0.4633333333333333,
					-1.7195658683776855,
					0.05486297607421875,
					-0.2436809539794922,
					-0.18127617239952087,
					0.6776824593544006,
					-0.0020141014829277992,
					-0.7126579880714417
				}
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.27,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "medium_slashing_linesman_1h",
			damage_window_end = 0.43,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		heavy_attack_right = {
			damage_window_start = 0.3,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 35,
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "heavy_slashing_smiter",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.35,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
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
					-0.20429039001464844,
					0.082366943359375,
					0.11629772186279297,
					-0.7455224990844727,
					0.2178315371274948,
					-0.2071455866098404,
					-0.5948414206504822
				},
				{
					0.2861111111111111,
					-0.23162364959716797,
					0.15941238403320312,
					0.17447662353515625,
					-0.6658081412315369,
					0.24324911832809448,
					-0.1353171169757843,
					-0.6922562122344971
				},
				{
					0.3055555555555555,
					-0.2389531135559082,
					0.37189483642578125,
					0.2734346389770508,
					-0.4292795658111572,
					0.26322150230407715,
					-0.0942896157503128,
					-0.8588032126426697
				},
				{
					0.32499999999999996,
					-0.13057661056518555,
					0.7078666687011719,
					0.24018287658691406,
					0.1285044252872467,
					0.16446104645729065,
					-0.017377004027366638,
					-0.9778227210044861
				},
				{
					0.34444444444444444,
					0.016563892364501953,
					0.9697952270507812,
					-0.20361804962158203,
					0.512937605381012,
					0.18292754888534546,
					0.07269074022769928,
					-0.8355528712272644
				},
				{
					0.3638888888888889,
					0.2930283546447754,
					0.7834186553955078,
					-0.7702817916870117,
					0.7982724905014038,
					0.1659807711839676,
					0.1167755275964737,
					-0.5670758485794067
				},
				{
					0.3833333333333333,
					0.4706234931945801,
					0.40012359619140625,
					-1.0183610916137695,
					0.9009179472923279,
					0.18376323580741882,
					0.1367255449295044,
					-0.36862459778785706
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
			damage_profile = "medium_slashing_smiter_stab_1h",
			damage_window_end = 0.32,
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
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.6,
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
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default",
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
					0.21666666666666667,
					0.3730177879333496,
					-1.1218414306640625,
					-0.059517860412597656,
					0.22161516547203064,
					0.6551753878593445,
					0.6434546113014221,
					-0.3280216455459595
				},
				{
					0.23944444444444446,
					0.39489221572875977,
					-1.14208984375,
					-0.05765533447265625,
					0.21999607980251312,
					0.6578623652458191,
					0.6400851607322693,
					-0.330317884683609
				},
				{
					0.26222222222222225,
					0.4260869026184082,
					-0.8798141479492188,
					-0.04477691650390625,
					0.2188764363527298,
					0.6628199815750122,
					0.6289854645729065,
					-0.34225723147392273
				},
				{
					0.28500000000000003,
					0.4488029479980469,
					-0.44828033447265625,
					-0.034270286560058594,
					0.222031369805336,
					0.6615645289421082,
					0.6197671294212341,
					-0.35905876755714417
				},
				{
					0.30777777777777776,
					0.4793081283569336,
					0.13068389892578125,
					0.07587051391601562,
					0.19826927781105042,
					0.6833220720291138,
					0.6253093481063843,
					-0.32054397463798523
				},
				{
					0.33055555555555555,
					0.23357105255126953,
					0.6441993713378906,
					-0.025473594665527344,
					0.2646447718143463,
					0.6366145014762878,
					0.5920544266700745,
					-0.41732096672058105
				},
				{
					0.35333333333333333,
					0.2120227813720703,
					0.7140579223632812,
					-0.018405914306640625,
					0.2636227011680603,
					0.6502165198326111,
					0.5953242778778076,
					-0.3915489614009857
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.38,
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
			damage_profile = "light_slashing_smiter_stab",
			damage_window_end = 0.52,
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
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.4,
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
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
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
			},
			baked_sweep = {
				{
					0.3466666666666667,
					0.5973548889160156,
					-0.2985954284667969,
					-0.34070491790771484,
					0.4701494872570038,
					0.4382833242416382,
					0.4450920820236206,
					-0.623506486415863
				},
				{
					0.3811111111111111,
					0.22276973724365234,
					0.7698783874511719,
					-0.09720230102539062,
					0.6355681419372559,
					0.2556324005126953,
					0.14664822816848755,
					-0.7135822176933289
				},
				{
					0.41555555555555557,
					0.1449604034423828,
					0.8588085174560547,
					-0.10024166107177734,
					0.6516624093055725,
					0.1758454591035843,
					0.10600546002388,
					-0.7301899790763855
				},
				{
					0.45,
					0.1521320343017578,
					0.8614444732666016,
					-0.09196281433105469,
					0.6488791108131409,
					0.18699398636817932,
					0.1237482950091362,
					-0.7271007299423218
				},
				{
					0.48444444444444446,
					0.1548609733581543,
					0.8619594573974609,
					-0.08745288848876953,
					0.6390565037727356,
					0.23085494339466095,
					0.1728573441505432,
					-0.7130449414253235
				},
				{
					0.518888888888889,
					0.1562814712524414,
					0.8642444610595703,
					-0.0874948501586914,
					0.6333348751068115,
					0.24443873763084412,
					0.19100849330425262,
					-0.7089798450469971
				},
				{
					0.5533333333333333,
					0.15507221221923828,
					0.8699054718017578,
					-0.09659671783447266,
					0.6479722261428833,
					0.20644396543502808,
					0.14764682948589325,
					-0.7181317806243896
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.38,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_smiter_stab",
			damage_window_end = 0.52,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			range_mod_add = 0.5,
			weapon_up_offset_mod = -0.25,
			anim_event = "attack_swing_stab_lh",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.4,
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
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
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
			},
			baked_sweep = {
				{
					0.3466666666666667,
					0.5070929527282715,
					-0.3564796447753906,
					0.32262420654296875,
					0.34061288833618164,
					0.6821123957633972,
					0.5220959186553955,
					-0.3822583258152008
				},
				{
					0.3811111111111111,
					0.16213178634643555,
					0.6581974029541016,
					0.011832237243652344,
					0.030266452580690384,
					0.7135069966316223,
					0.6840870380401611,
					-0.1483803689479828
				},
				{
					0.41555555555555557,
					0.13479948043823242,
					0.6958866119384766,
					0.00695037841796875,
					0.038041744381189346,
					0.7147222757339478,
					0.688292384147644,
					-0.11823073774576187
				},
				{
					0.45,
					0.13678789138793945,
					0.6941318511962891,
					0.00785064697265625,
					0.035330403596162796,
					0.7147820591926575,
					0.6884962916374207,
					-0.11752151697874069
				},
				{
					0.48444444444444446,
					0.1371297836303711,
					0.6941013336181641,
					0.003276824951171875,
					0.03336746245622635,
					0.7113470435142517,
					0.6906888484954834,
					-0.12578114867210388
				},
				{
					0.518888888888889,
					0.1399378776550293,
					0.6930599212646484,
					-0.0058536529541015625,
					0.05450041592121124,
					0.7078495025634766,
					0.6889562010765076,
					-0.14600752294063568
				},
				{
					0.5533333333333333,
					0.1430201530456543,
					0.690032958984375,
					-0.013604164123535156,
					0.07616911828517914,
					0.705133855342865,
					0.686191737651825,
					-0.16163386404514313
				}
			}
		},
		light_attack_stab = {
			damage_window_start = 0.18,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "stab_hit_armour",
			sweep_z_offset = 0.05,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_smiter_stab",
			attack_direction = "up",
			damage_window_end = 0.23,
			impact_sound_event = "stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			range_mod_add = 0.5,
			weapon_up_offset_mod = -0.25,
			anim_event = "attack_swing_stab_02",
			hit_stop_anim = "attack_hit",
			total_time = 1.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.4,
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
					start_time = 0.45,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.45,
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
			}
		},
		light_attack_stab_postpush = {
			damage_window_start = 0.3,
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
			damage_profile = "light_slashing_smiter_stab",
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
			anim_time_scale = time_mod * 1.3,
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
			baked_sweep = {
				{
					0.26666666666666666,
					0.42241716384887695,
					-0.9310989379882812,
					-0.04671478271484375,
					0.2184913158416748,
					0.6625492572784424,
					0.631001889705658,
					-0.3393031358718872
				},
				{
					0.29444444444444445,
					0.4875311851501465,
					-0.2910499572753906,
					0.015124320983886719,
					0.2289799153804779,
					0.6790812015533447,
					0.6057838201522827,
					-0.34560510516166687
				},
				{
					0.32222222222222224,
					0.3712310791015625,
					0.4276561737060547,
					-0.05644416809082031,
					0.2516264021396637,
					0.6237354278564453,
					0.5940327644348145,
					-0.44132012128829956
				},
				{
					0.35,
					0.2074751853942871,
					0.7059421539306641,
					-0.018350601196289062,
					0.26380178332328796,
					0.648607075214386,
					0.5951621532440186,
					-0.39433422684669495
				},
				{
					0.37777777777777777,
					0.22158432006835938,
					0.7135562896728516,
					-0.017343521118164062,
					0.2632017433643341,
					0.6504092812538147,
					0.5927988886833191,
					-0.3953253924846649
				},
				{
					0.40555555555555556,
					0.21927499771118164,
					0.7129745483398438,
					-0.017972946166992188,
					0.26052525639533997,
					0.6479941010475159,
					0.5926451086997986,
					-0.4012506306171417
				},
				{
					0.43333333333333335,
					0.2175922393798828,
					0.710601806640625,
					-0.0211639404296875,
					0.2578131854534149,
					0.6455994248390198,
					0.5929814577102661,
					-0.4063333570957184
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.3,
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
			damage_profile = "light_slashing_smiter_stab",
			attack_direction = "up",
			damage_window_end = 0.45,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			range_mod_add = 0.5,
			weapon_up_offset_mod = -0.25,
			anim_event = "attack_swing_stab_02",
			hit_stop_anim = "attack_hit",
			total_time = 1.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.4,
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
					0.26666666666666666,
					0.016028881072998047,
					0.5447883605957031,
					-0.17964649200439453,
					0.633053183555603,
					-0.06508415937423706,
					-0.12067539244890213,
					-0.7618695497512817
				},
				{
					0.30277777777777776,
					-0.004501819610595703,
					0.7404880523681641,
					-0.08198833465576172,
					0.6287904977798462,
					-0.26449328660964966,
					-0.2952346205711365,
					-0.6689562201499939
				},
				{
					0.3388888888888889,
					-0.007607936859130859,
					0.7501373291015625,
					-0.0819540023803711,
					0.6163711547851562,
					-0.2953912913799286,
					-0.3211654722690582,
					-0.655502438545227
				},
				{
					0.375,
					-0.007641315460205078,
					0.7501773834228516,
					-0.0829315185546875,
					0.6166005730628967,
					-0.29280462861061096,
					-0.3191116452217102,
					-0.657447338104248
				},
				{
					0.4111111111111111,
					-0.006511211395263672,
					0.7483711242675781,
					-0.08256912231445312,
					0.6162310838699341,
					-0.2857465147972107,
					-0.3138619363307953,
					-0.6633995175361633
				},
				{
					0.44722222222222224,
					-0.0031800270080566406,
					0.7431507110595703,
					-0.08202743530273438,
					0.616951048374176,
					-0.27235281467437744,
					-0.3045286536216736,
					-0.6726498007774353
				},
				{
					0.48333333333333334,
					0.0063800811767578125,
					0.7337493896484375,
					-0.08379077911376953,
					0.621077835559845,
					-0.25485771894454956,
					-0.29705050587654114,
					-0.6790220141410828
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
					external_multiplier = 1.1,
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
					start_time = 0.5,
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
			minimum_hold_time = 0.3,
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
					start_time = 0.3,
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
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.shield
weapon_template.display_unit = "units/weapons/weapon_display/display_shield_spear"
weapon_template.wield_anim = "to_1h_spear_shield"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "SWORD_1H_SHIELD"
weapon_template.max_fatigue_points = 10
weapon_template.dodge_count = 3
weapon_template.can_block_ranged_attacks = true
weapon_template.block_angle = 120
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.2
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
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
	"wwise/one_handed_swords"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/two_handed_axes"
}

return {
	one_handed_spears_shield_template = table.clone(weapon_template)
}
