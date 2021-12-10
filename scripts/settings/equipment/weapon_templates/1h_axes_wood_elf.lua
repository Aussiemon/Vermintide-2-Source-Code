local push_radius = 2
local time_mod = 1
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_charge_left_diagonal",
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
					start_time = 0.5,
					blocker = true,
					end_time = 1.2,
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
		default_right = {
			aim_assist_ramp_decay_delay = 0,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_charge_right_diagonal_pose",
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
					start_time = 0.5,
					blocker = true,
					end_time = 1.2,
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
		default_left = {
			aim_assist_ramp_decay_delay = 0,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_charge_left_diagonal_pose",
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
					start_time = 0.5,
					blocker = true,
					end_time = 1.2,
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
		default_last = {
			aim_assist_ramp_decay_delay = 0,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_swing_charge_right_diagonal_pose",
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
					sub_action = "light_attack_right_last",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
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
					start_time = 0.5,
					blocker = true,
					end_time = 1.2,
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
		heavy_attack_left = {
			damage_window_start = 0.22,
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "blunt_hit_armour",
			kind = "sweep",
			first_person_hit_anim = "attack_hit",
			use_precision_sweep = true,
			width_mod = 17.5,
			damage_profile = "medium_slashing_smiter_1h_axe",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			hit_effect = "melee_hit_axes_1h",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			damage_window_end = 0.32,
			impact_sound_event = "axe_1h_hit",
			dedicated_target_range = 2.75,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			total_time = 1.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
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
					start_time = 0.55,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.55,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.18666666666666668,
					0.1928849220275879,
					0.3465576171875,
					0.1997363567352295,
					-0.6189309358596802,
					-0.12451362609863281,
					0.030166763812303543,
					-0.7749263644218445
				},
				{
					0.21444444444444444,
					0.15185952186584473,
					0.4997568130493164,
					0.19197797775268555,
					-0.38854673504829407,
					-0.11893057823181152,
					-0.024657273665070534,
					-0.913388729095459
				},
				{
					0.24222222222222223,
					0.07632708549499512,
					0.6990423202514648,
					-0.0014226436614990234,
					0.1294747143983841,
					-0.07801222801208496,
					-0.04381288215517998,
					-0.9875378012657166
				},
				{
					0.27,
					-0.035057783126831055,
					0.7210512161254883,
					-0.38542723655700684,
					0.7106927633285522,
					-0.017652248963713646,
					-0.06914740055799484,
					-0.6998734474182129
				},
				{
					0.2977777777777778,
					-0.09662127494812012,
					0.4747581481933594,
					-0.6938865184783936,
					0.9456583261489868,
					-0.019871918484568596,
					-0.14680151641368866,
					-0.2894560992717743
				},
				{
					0.3255555555555556,
					-0.08463382720947266,
					0.12092304229736328,
					-0.7418155670166016,
					0.9722124338150024,
					-0.03382474556565285,
					-0.20624887943267822,
					0.10545284301042557
				},
				{
					0.35333333333333333,
					-0.07559680938720703,
					0.0045604705810546875,
					-0.7051987648010254,
					0.9451793432235718,
					-0.04515744373202324,
					-0.22183310985565186,
					0.23534421622753143
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.2,
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "blunt_hit_armour",
			kind = "sweep",
			first_person_hit_anim = "attack_hit",
			use_precision_sweep = true,
			width_mod = 17.5,
			damage_profile = "medium_slashing_smiter_1h_axe",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			hit_effect = "melee_hit_axes_1h",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			damage_window_end = 0.28,
			impact_sound_event = "axe_1h_hit",
			dedicated_target_range = 2.75,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down_right",
			total_time = 1.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
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
					start_time = 0.55,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.55,
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
					start_time = 0.4,
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
					-0.21480464935302734,
					0.31410884857177734,
					0.17562174797058105,
					-0.7065491080284119,
					0.2395385503768921,
					-0.2272188365459442,
					-0.6259244084358215
				},
				{
					0.19111111111111112,
					-0.17440032958984375,
					0.41541576385498047,
					0.17396259307861328,
					-0.6263563632965088,
					0.2461560219526291,
					-0.1265784502029419,
					-0.7287405729293823
				},
				{
					0.21555555555555558,
					-0.09667563438415527,
					0.5937099456787109,
					0.1028897762298584,
					-0.26774072647094727,
					0.25072571635246277,
					-0.0807306095957756,
					-0.9267869591712952
				},
				{
					0.24000000000000002,
					-0.008882284164428711,
					0.6793746948242188,
					-0.061193227767944336,
					0.27291059494018555,
					0.1594190150499344,
					0.022122910246253014,
					-0.9484808444976807
				},
				{
					0.2644444444444445,
					0.23991012573242188,
					0.6307849884033203,
					-0.6196286678314209,
					0.7630268335342407,
					0.14374153316020966,
					0.10678070783615112,
					-0.6210687756538391
				},
				{
					0.2888888888888889,
					0.5966160297393799,
					0.32210731506347656,
					-0.7548739910125732,
					0.7662671804428101,
					0.28552913665771484,
					0.3192744553089142,
					-0.4789275527000427
				},
				{
					0.31333333333333335,
					0.8342859745025635,
					0.2026691436767578,
					-0.6361019611358643,
					0.6470870971679688,
					0.42883729934692383,
					0.5101670622825623,
					-0.37027880549430847
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_diag",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.47,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			uninterruptible = true,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.55,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.55,
					action = "action_one",
					end_time = 1.25,
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
					0.4714381694793701,
					0.5227899551391602,
					0.020548582077026367,
					-0.3642655909061432,
					-0.5442494750022888,
					0.3316611647605896,
					-0.6790463924407959
				},
				{
					0.37277777777777776,
					0.3927757740020752,
					0.5802803039550781,
					0.011805057525634766,
					-0.292525053024292,
					-0.5823108553886414,
					0.27014392614364624,
					-0.7087774276733398
				},
				{
					0.3988888888888889,
					0.255051851272583,
					0.6519861221313477,
					-0.004257917404174805,
					-0.1371336728334427,
					-0.6218339204788208,
					0.1291280835866928,
					-0.7601597905158997
				},
				{
					0.425,
					0.0777289867401123,
					0.7071952819824219,
					-0.036727190017700195,
					0.09882839769124985,
					-0.6182830929756165,
					-0.08039449155330658,
					-0.775561511516571
				},
				{
					0.4511111111111111,
					-0.20235443115234375,
					0.6503229141235352,
					-0.11157631874084473,
					0.4298279583454132,
					-0.4615359902381897,
					-0.4349200427532196,
					-0.6427107453346252
				},
				{
					0.4772222222222222,
					-0.381206750869751,
					0.4709177017211914,
					-0.20796632766723633,
					-0.6358863115310669,
					0.21816132962703705,
					0.6446021199226379,
					0.3640635311603546
				},
				{
					0.5033333333333333,
					-0.42635154724121094,
					0.36040782928466797,
					-0.2850162982940674,
					-0.6546914577484131,
					0.1007532924413681,
					0.7021984457969666,
					0.261046439409256
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_diag",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.45,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
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
					-0.21572208404541016,
					0.29787349700927734,
					0.17684197425842285,
					-0.6989205479621887,
					0.22974303364753723,
					-0.25195690989494324,
					-0.6286859512329102
				},
				{
					0.36944444444444446,
					-0.18794512748718262,
					0.41394901275634766,
					0.1811058521270752,
					-0.6107937693595886,
					0.21561715006828308,
					-0.17237038910388947,
					-0.7421109676361084
				},
				{
					0.39222222222222225,
					-0.12941884994506836,
					0.5860424041748047,
					0.161668062210083,
					-0.4067637622356415,
					0.21792417764663696,
					-0.12306150794029236,
					-0.8785830736160278
				},
				{
					0.41500000000000004,
					-0.05363321304321289,
					0.7172584533691406,
					0.039534568786621094,
					0.0483129657804966,
					0.17534899711608887,
					-0.04186074063181877,
					-0.982428789138794
				},
				{
					0.43777777777777777,
					0.09318161010742188,
					0.772120475769043,
					-0.28412365913391113,
					0.6048346757888794,
					0.10831542313098907,
					0.07993455231189728,
					-0.7848905920982361
				},
				{
					0.46055555555555555,
					0.39004945755004883,
					0.3316831588745117,
					-0.8175486326217651,
					0.842195987701416,
					0.19276681542396545,
					0.12989677488803864,
					-0.48649120330810547
				},
				{
					0.48333333333333334,
					0.7735424041748047,
					0.254913330078125,
					-0.6688098907470703,
					0.6647912859916687,
					0.4007580280303955,
					0.4667152762413025,
					-0.42381882667541504
				}
			}
		},
		light_attack_right_last = {
			damage_window_start = 0.35,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_diag",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.47,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					end_time = 1.25,
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
					-0.35820066928863525,
					0.551788330078125,
					-0.0971219539642334,
					-0.44832417368888855,
					0.5898890495300293,
					-0.17337659001350403,
					-0.6488273739814758
				},
				{
					0.34777777777777774,
					-0.2294255495071411,
					0.6592044830322266,
					-0.09808707237243652,
					-0.29563063383102417,
					0.6608599424362183,
					-0.08005252480506897,
					-0.6851702332496643
				},
				{
					0.3788888888888889,
					-0.00933539867401123,
					0.7010517120361328,
					-0.1212151050567627,
					-0.0053623938001692295,
					0.6900889873504639,
					0.18919384479522705,
					-0.6985371708869934
				},
				{
					0.41,
					0.2595735788345337,
					0.6497220993041992,
					-0.1333606243133545,
					0.3374190926551819,
					0.5514644980430603,
					0.5184585452079773,
					-0.5596750378608704
				},
				{
					0.44111111111111106,
					0.4877122640609741,
					0.5269002914428711,
					-0.1436471939086914,
					0.5130868554115295,
					0.3724185526371002,
					0.66352379322052,
					-0.39721861481666565
				},
				{
					0.4722222222222222,
					0.636212944984436,
					0.36120033264160156,
					-0.1584303379058838,
					0.598544180393219,
					0.3022090792655945,
					0.7190064787864685,
					-0.18287771940231323
				},
				{
					0.5033333333333333,
					0.713760495185852,
					0.20956707000732422,
					-0.18317461013793945,
					0.630311906337738,
					0.2794775068759918,
					0.7235577702522278,
					-0.03260987997055054
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_flat",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.5,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			anim_event = "attack_swing_left_diagonal_last",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_last",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default_last",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
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
					0.4907255172729492,
					0.4795246124267578,
					-0.44356560707092285,
					0.24004581570625305,
					0.8407548666000366,
					-0.31790533661842346,
					0.36666807532310486
				},
				{
					0.37777777777777777,
					0.24033403396606445,
					0.69866943359375,
					-0.3129243850708008,
					-0.09115275740623474,
					0.9204927086830139,
					-0.09092153608798981,
					0.3689412474632263
				},
				{
					0.4088888888888889,
					0.023502349853515625,
					0.7160825729370117,
					-0.06873822212219238,
					-0.13651810586452484,
					0.8191327452659607,
					0.46484798192977905,
					0.30708426237106323
				},
				{
					0.44,
					-0.15297698974609375,
					0.5679712295532227,
					0.12587690353393555,
					-0.21467013657093048,
					0.5399214029312134,
					0.7910081744194031,
					0.19159241020679474
				},
				{
					0.4711111111111111,
					-0.2502577304840088,
					0.38939666748046875,
					0.2646982669830322,
					-0.1666567325592041,
					0.3019948899745941,
					0.9169927835464478,
					0.20037181675434113
				},
				{
					0.5022222222222222,
					-0.33596038818359375,
					0.07491397857666016,
					0.26296067237854004,
					-0.20942066609859467,
					0.07629255950450897,
					0.9238526821136475,
					0.3111570179462433
				},
				{
					0.5333333333333333,
					-0.293027400970459,
					-0.3521604537963867,
					0.23871207237243652,
					-0.306989848613739,
					-0.027938010171055794,
					0.9194444417953491,
					0.24412831664085388
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.32,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.25,
			sweep_z_offset = 0.2,
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = true,
			damage_profile = "light_slashing_smiter",
			additional_critical_strike_chance = 0.2,
			hit_effect = "melee_hit_axes_1h",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.8,
			damage_window_end = 0.47,
			impact_sound_event = "axe_1h_hit",
			aim_assist_ramp_decay_delay = 0,
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.75,
			anim_event_3p = "attack_swing_up_left",
			anim_event = "attack_swing_up",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
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
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					input = "action_one"
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
					start_time = 0.55,
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
					0.2866666666666667,
					-0.4160337448120117,
					0.48052310943603516,
					-0.25862979888916016,
					-0.36285436153411865,
					0.7257198691368103,
					-0.08066707104444504,
					-0.5789303183555603
				},
				{
					0.3227777777777778,
					-0.24476408958435059,
					0.6299228668212891,
					-0.1503746509552002,
					-0.0822780430316925,
					0.8235551118850708,
					0.09011363983154297,
					-0.5539556741714478
				},
				{
					0.35888888888888887,
					-0.013920307159423828,
					0.72979736328125,
					-0.06399917602539062,
					0.1520054191350937,
					0.716920793056488,
					0.4444597363471985,
					-0.5151453018188477
				},
				{
					0.395,
					0.22315692901611328,
					0.7471513748168945,
					0.021082639694213867,
					0.36069679260253906,
					0.4987759292125702,
					0.6831395626068115,
					-0.39298954606056213
				},
				{
					0.4311111111111111,
					0.464280366897583,
					0.6327152252197266,
					0.12510442733764648,
					0.364742249250412,
					0.4421878159046173,
					0.7872908115386963,
					-0.22717007994651794
				},
				{
					0.4672222222222222,
					0.7516279220581055,
					0.4665975570678711,
					0.06435894966125488,
					0.5310858488082886,
					0.26260462403297424,
					0.8055940866470337,
					-0.0021779604721814394
				},
				{
					0.5033333333333333,
					0.8990819454193115,
					0.17259597778320312,
					-0.05380558967590332,
					0.5877859592437744,
					0.06701291352510452,
					0.8061704635620117,
					0.010306071490049362
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
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_axes"
weapon_template.wield_anim = "to_1h_axe"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "AXE_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 100
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2
	}
}
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = true,
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
	vertical_only = true,
	base_multiplier = 0,
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_shield_breaking"
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
	"wwise/one_handed_axes"
}

return {
	we_one_hand_axe_template = table.clone(weapon_template)
}
