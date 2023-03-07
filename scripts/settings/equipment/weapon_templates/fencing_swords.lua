local push_radius = 2
local time_mod = 0.8
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0.2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_stab_charge",
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
					end_time = 0.25,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.35,
					action = "action_one",
					end_time = 0.7,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_charged",
					start_time = 0.7,
					action = "action_one",
					end_time = 1,
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
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					start_time = 0.35,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_charged",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_right = {
			aim_assist_ramp_decay_delay = 2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_stab_charge",
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
					sub_action = "light_attack_right",
					start_time = 0,
					action = "action_one",
					end_time = 0.25,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.35,
					action = "action_one",
					end_time = 0.7,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_charged",
					start_time = 0.7,
					action = "action_one",
					end_time = 1,
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
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					start_time = 0.35,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_charged",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			aim_assist_ramp_decay_delay = 0.2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_stab_charge",
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
					sub_action = "light_attack_left_last",
					start_time = 0,
					action = "action_one",
					end_time = 0.25,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.35,
					action = "action_one",
					end_time = 0.7,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_charged",
					start_time = 0.7,
					action = "action_one",
					end_time = 1,
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
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					start_time = 0.35,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_charged",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.03,
			range_mod = 1.3,
			kind = "sweep",
			first_person_hit_anim = "attack_hit",
			no_damage_impact_sound_event = "stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "medium_fencer_stab",
			attack_direction = "up",
			hit_effect = "melee_hit_sword_1h",
			aim_assist_ramp_multiplier = 0.4,
			damage_window_end = 0.15,
			impact_sound_event = "stab_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_stab",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.75,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 0.25,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0.05,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0.05,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0.05,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_three",
					input = "action_three"
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
			impact_axis = Vector3Box(0, 0, 1),
			baked_sweep = {
				{
					0,
					0.22241711616516113,
					0.3488898277282715,
					-0.21132373809814453,
					0.02946777455508709,
					-0.045402660965919495,
					-0.19760824739933014,
					-0.9787856340408325
				},
				{
					0.030555555555555555,
					0.32950127124786377,
					0.0744481086730957,
					-0.13337421417236328,
					0.4150872230529785,
					0.532979428768158,
					0.487052857875824,
					-0.553547739982605
				},
				{
					0.06111111111111111,
					0.2950096130371094,
					0.43221426010131836,
					-0.1297166347503662,
					0.4135914444923401,
					0.5336084961891174,
					0.4835298955440521,
					-0.557138204574585
				},
				{
					0.09166666666666666,
					0.212615966796875,
					0.7171034812927246,
					-0.11727797985076904,
					0.4258195757865906,
					0.5264131426811218,
					0.4874758720397949,
					-0.5513023138046265
				},
				{
					0.12222222222222222,
					0.13776731491088867,
					0.7350864410400391,
					-0.1410815715789795,
					0.4258079528808594,
					0.5208173394203186,
					0.5162565112113953,
					-0.5300153493881226
				},
				{
					0.15277777777777776,
					0.1374884843826294,
					0.7362289428710938,
					-0.1396723985671997,
					0.41334864497184753,
					0.5220422148704529,
					0.5249708294868469,
					-0.530113697052002
				},
				{
					0.18333333333333332,
					0.13071167469024658,
					0.7361669540405273,
					-0.13888251781463623,
					0.41202375292778015,
					0.5195612907409668,
					0.5311174988746643,
					-0.5274529457092285
				}
			}
		},
		heavy_attack_charged = {
			damage_window_start = 0.03,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "attack_hit",
			no_damage_impact_sound_event = "stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "medium_fencer_stab_charged",
			attack_direction = "up",
			hit_effect = "melee_hit_sword_1h",
			aim_assist_ramp_multiplier = 0.4,
			damage_window_end = 0.15,
			impact_sound_event = "stab_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_stab",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.75,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 0.25,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0.05,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0.05,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0.05,
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
					action = "action_three",
					input = "action_three"
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
			impact_axis = Vector3Box(0, 0, 1),
			baked_sweep = {
				{
					0,
					0.22227513790130615,
					0.3491091728210449,
					-0.2085820436477661,
					0.031685374677181244,
					-0.03441327437758446,
					-0.19560781121253967,
					-0.9795659184455872
				},
				{
					0.030555555555555555,
					0.3312685489654541,
					0.11005353927612305,
					-0.13305187225341797,
					0.41325393319129944,
					0.5326411724090576,
					0.4863429665565491,
					-0.555864155292511
				},
				{
					0.06111111111111111,
					0.2986027002334595,
					0.41562318801879883,
					-0.13114464282989502,
					0.4128061830997467,
					0.5336707830429077,
					0.4836938679218292,
					-0.5575182437896729
				},
				{
					0.09166666666666666,
					0.20735764503479004,
					0.7235078811645508,
					-0.1203157901763916,
					0.4259462356567383,
					0.5274235606193542,
					0.48837989568710327,
					-0.5494351983070374
				},
				{
					0.12222222222222222,
					0.13877630233764648,
					0.7349066734313965,
					-0.14107131958007812,
					0.4259299039840698,
					0.5209872722625732,
					0.5153763294219971,
					-0.5306063294410706
				},
				{
					0.15277777777777776,
					0.13783645629882812,
					0.736203670501709,
					-0.13974428176879883,
					0.41418352723121643,
					0.5219120383262634,
					0.5247517228126526,
					-0.5298067331314087
				},
				{
					0.18333333333333332,
					0.13077819347381592,
					0.7361693382263184,
					-0.1388871669769287,
					0.41199809312820435,
					0.5195921063423157,
					0.5310719609260559,
					-0.5274882912635803
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.2,
			anim_end_event = "attack_finished",
			kind = "sweep",
			range_mod = 1.3,
			additional_critical_strike_chance = 0,
			damage_profile = "light_slashing_linesman_fencer",
			width_mod = 30,
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_right",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.4,
					action = "action_one",
					doubleclick_window = 0.15,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 1.3,
					action = "idle",
					auto_chain = true
				}
			},
			baked_sweep = {
				{
					0.16666666666666669,
					0.39563941955566406,
					0.4138350486755371,
					0.06914901733398438,
					-0.6080538034439087,
					-0.3584406077861786,
					0.02768627367913723,
					-0.7078307271003723
				},
				{
					0.19444444444444445,
					0.328707218170166,
					0.47357988357543945,
					0.030809402465820312,
					-0.6252751350402832,
					-0.28098979592323303,
					0.08421605825424194,
					-0.7231758832931519
				},
				{
					0.22222222222222224,
					0.2605478763580322,
					0.5607719421386719,
					-0.020837068557739258,
					-0.4880165755748749,
					-0.2861593961715698,
					0.07698701322078705,
					-0.8209906220436096
				},
				{
					0.25,
					0.1404503583908081,
					0.6493954658508301,
					-0.10353493690490723,
					-0.00023159536067396402,
					-0.3511504530906677,
					-0.06494992226362228,
					-0.9340636134147644
				},
				{
					0.2777777777777778,
					-0.030713558197021484,
					0.6247038841247559,
					-0.22078561782836914,
					0.6362419724464417,
					-0.17314238846302032,
					-0.25236135721206665,
					-0.708189070224762
				},
				{
					0.3055555555555556,
					-0.12667828798294067,
					0.5502762794494629,
					-0.3373039960861206,
					0.8044455647468567,
					0.04445593059062958,
					-0.34781503677368164,
					-0.47949522733688354
				},
				{
					0.3333333333333333,
					-0.151933491230011,
					0.40532922744750977,
					-0.5461156368255615,
					0.6926787495613098,
					0.48007217049598694,
					-0.20958080887794495,
					-0.4957848787307739
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.2,
			anim_end_event = "attack_finished",
			kind = "sweep",
			range_mod = 1.3,
			additional_critical_strike_chance = 0,
			damage_profile = "light_slashing_linesman_fencer",
			width_mod = 30,
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_left",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.5,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.4,
					action = "action_one",
					doubleclick_window = 0.15,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 1.3,
					action = "idle",
					auto_chain = true
				}
			},
			baked_sweep = {
				{
					0.16666666666666669,
					-0.0613483190536499,
					0.610130786895752,
					-0.09940719604492188,
					-0.5319851636886597,
					0.36057451367378235,
					-0.2227901965379715,
					-0.733036458492279
				},
				{
					0.19444444444444445,
					0.000535130500793457,
					0.6453256607055664,
					-0.1127709150314331,
					-0.395749032497406,
					0.3633236289024353,
					-0.14484715461730957,
					-0.8309019207954407
				},
				{
					0.22222222222222224,
					0.08228445053100586,
					0.6774530410766602,
					-0.14895546436309814,
					-0.20517966151237488,
					0.39330530166625977,
					-0.008850859478116035,
					-0.8961774110794067
				},
				{
					0.25,
					0.19383955001831055,
					0.6923108100891113,
					-0.21972405910491943,
					0.08689090609550476,
					0.4015706181526184,
					0.1215236708521843,
					-0.9035612940788269
				},
				{
					0.2777777777777778,
					0.3403068780899048,
					0.6798672676086426,
					-0.34061992168426514,
					0.46369069814682007,
					0.3679254651069641,
					0.22600503265857697,
					-0.773655891418457
				},
				{
					0.3055555555555556,
					0.473321795463562,
					0.5702219009399414,
					-0.46686887741088867,
					0.727907121181488,
					0.25024473667144775,
					0.32616063952445984,
					-0.5487693548202515
				},
				{
					0.3333333333333333,
					0.5262095928192139,
					0.41461992263793945,
					-0.5679442286491394,
					0.8135154843330383,
					0.18721790611743927,
					0.39775946736335754,
					-0.3806960880756378
				}
			}
		},
		light_attack_left_last = {
			damage_window_start = 0.3,
			anim_end_event = "attack_finished",
			kind = "sweep",
			range_mod = 1.3,
			additional_critical_strike_chance = 0,
			damage_profile = "light_slashing_linesman_fencer",
			width_mod = 30,
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.42,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_right_diagonal",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					doubleclick_window = 0.15,
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
					start_time = 0.6,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 1.3,
					action = "idle",
					auto_chain = true
				}
			},
			baked_sweep = {
				{
					0.26666666666666666,
					0.49179327487945557,
					0.2689175605773926,
					-0.28555214405059814,
					0.25714555382728577,
					0.8280113339424133,
					-0.142573282122612,
					0.47743719816207886
				},
				{
					0.29777777777777775,
					0.4467122554779053,
					0.3782491683959961,
					-0.2344837188720703,
					-0.1537812203168869,
					-0.8407893180847168,
					0.09115991741418839,
					-0.5109939575195312
				},
				{
					0.3288888888888889,
					0.28437554836273193,
					0.5623035430908203,
					-0.18510770797729492,
					-0.11384466290473938,
					-0.8348864316940308,
					-0.038409773260354996,
					-0.5371488332748413
				},
				{
					0.36,
					0.0755767822265625,
					0.695831298828125,
					-0.1100308895111084,
					-0.05172478407621384,
					0.7788756489753723,
					0.4377075433731079,
					0.4461944103240967
				},
				{
					0.3911111111111111,
					-0.24117672443389893,
					0.5981574058532715,
					-0.06722569465637207,
					-0.43631309270858765,
					0.4229072034358978,
					0.7351517677307129,
					0.3005531430244446
				},
				{
					0.42222222222222217,
					-0.46766507625579834,
					0.29035472869873047,
					-0.09705281257629395,
					-0.4884580075740814,
					-0.16319598257541656,
					0.7788313031196594,
					0.35804712772369385
				},
				{
					0.4533333333333333,
					-0.4761127233505249,
					0.06199455261230469,
					-0.09397387504577637,
					-0.5022000074386597,
					-0.10334611684083939,
					0.7948599457740784,
					0.3245188295841217
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.2,
			range_mod = 1.3,
			kind = "sweep",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			width_mod = 30,
			damage_profile = "light_slashing_linesman_fencer",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_left",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.7,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_one",
					release_required = "action_two_hold",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.55,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 1.3,
					action = "idle",
					auto_chain = true
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.16666666666666669,
					-0.06072592735290527,
					0.610480785369873,
					-0.09940898418426514,
					-0.531187891960144,
					0.36026206612586975,
					-0.2223428189754486,
					-0.7339035272598267
				},
				{
					0.19444444444444445,
					0.006626486778259277,
					0.6483826637268066,
					-0.1150813102722168,
					-0.38114434480667114,
					0.36463263630867004,
					-0.13575920462608337,
					-0.8386545777320862
				},
				{
					0.22222222222222224,
					0.08247733116149902,
					0.677513599395752,
					-0.14906799793243408,
					-0.20468749105930328,
					0.3933757245540619,
					-0.008576048538088799,
					-0.8962616920471191
				},
				{
					0.25,
					0.20877909660339355,
					0.6908054351806641,
					-0.22991526126861572,
					0.1258862018585205,
					0.3999740183353424,
					0.13740473985671997,
					-0.8973814249038696
				},
				{
					0.2777777777777778,
					0.34733450412750244,
					0.6782360076904297,
					-0.3461505174636841,
					0.47960716485977173,
					0.3643256723880768,
					0.229518324136734,
					-0.7645686268806458
				},
				{
					0.3055555555555556,
					0.48608994483947754,
					0.539330005645752,
					-0.49203765392303467,
					0.753152072429657,
					0.2330140769481659,
					0.34388694167137146,
					-0.5101062655448914
				},
				{
					0.3333333333333333,
					0.5301508903503418,
					0.4044609069824219,
					-0.5720615386962891,
					0.8148709535598755,
					0.1857057362794876,
					0.40161365270614624,
					-0.3744398057460785
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			damage_profile_outer = "light_push",
			fatigue_cost = "action_stun_push",
			weapon_action_hand = "right",
			push_angle = 100,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.2,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 3,
			anim_event = "attack_push",
			damage_profile_inner = "light_push",
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
					start_time = 0.2,
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
					sub_action = "default",
					start_time = 0.2,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_two_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "push",
					start_time = 0.2,
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					end_time = math.huge,
					hold_required = {
						"action_two_hold"
					}
				},
				{
					sub_action = "block_shot",
					start_time = 0.2,
					action = "action_three",
					input = "action_three"
				}
			}
		}
	},
	action_three = {
		default = {
			apply_recoil = true,
			alert_sound_range_hit = 2,
			damage_profile = "shot_carbine_rapier",
			kind = "handgun",
			ammo_usage = 0,
			cooldown = 1.25,
			charge_value = "bullet_hit",
			headshot_multiplier = 2,
			aim_assist_auto_hit_chance = 0.5,
			cooldown_from_start = true,
			aim_assist_ramp_decay_delay = 0.2,
			hit_effect = "bullet_impact",
			alert_sound_range_fire = 12,
			fire_time = 0.12,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_shoot",
			total_time = 0.9,
			anim_time_scale = time_mod * 2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_wield",
					input = "action_wield"
				}
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 0.25,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		block_shot = {
			anim_event = "attack_shoot",
			charge_value = "bullet_hit",
			ammo_usage = 0,
			kind = "handgun",
			cooldown = 1.25,
			apply_recoil = true,
			damage_profile = "shot_carbine_rapier",
			headshot_multiplier = 2,
			keep_block = true,
			cooldown_from_start = true,
			aim_assist_auto_hit_chance = 0.5,
			hit_effect = "bullet_impact",
			aim_assist_ramp_decay_delay = 0.2,
			alert_sound_range_fire = 12,
			fire_time = 0.12,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_hit = 2,
			total_time = 0.9,
			anim_time_scale = time_mod * 2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_two",
					auto_chain = true
				}
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 0.25,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	idle = {
		default = {
			anim_event = "front_idle_exit",
			kind = "dummy",
			total_time = 0.5,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
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
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				}
			}
		}
	}
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_immediately_available = true,
	max_ammo = 16,
	reload_time = 1.25,
	single_clip = true
}
weapon_template.default_spread_template = "brace_of_pistols"
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
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 3
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 4
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_headshotting",
	"weapon_keyword_versatile"
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
weapon_template.right_hand_unit = "units/weapons/player/wpn_fencingsword_t1/wpn_fencingsword_t1"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_fencing_swords"
weapon_template.wield_anim = "to_fencing_sword"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "FENCING_SWORD_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 6
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.25
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_swords"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/pistol"
}
weapon_template.tooltip_special_action_description = "special_action_fencing_sword"

return {
	fencing_sword_template_1 = table.clone(weapon_template)
}
