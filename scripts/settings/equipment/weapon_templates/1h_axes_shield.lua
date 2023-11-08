local push_radius = 2.5
local time_mod = 0.9
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
			anim_event = "attack_swing_charge",
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
					start_time = 0.4,
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
					start_time = 0.6,
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
			anim_event = "attack_swing_charge_right_pose",
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
					sub_action = "heavy_attack_right",
					start_time = 0.4,
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
					start_time = 0.6,
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
			anim_event = "attack_swing_charge_left_diagonal_pose",
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
					sub_action = "heavy_attack_left",
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
					sub_action = "heavy_attack_left",
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
			anim_event = "attack_swing_charge_right_pose",
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
					sub_action = "heavy_attack_right",
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
					sub_action = "heavy_attack_right",
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
			anim_event = "attack_swing_charge_left_pose",
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
					sub_action = "light_attack_last",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_left",
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
					sub_action = "heavy_attack_left",
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
			hit_effect = "melee_hit_axes_1h",
			hit_time = 0.18,
			weapon_action_hand = "left",
			damage_window_end = 0.25,
			impact_sound_event = "shield_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			damage_profile_aoe = "shield_slam_aoe",
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_max_ramp_multiplier = 0.4,
			dedicated_target_range = 3.5,
			aim_assist_ramp_decay_delay = 0.1,
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
					sub_action = "default_right_heavy",
					start_time = 0.4,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right_heavy",
					start_time = 0.4,
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
			end
		},
		heavy_attack_left = {
			damage_window_start = 0.27,
			range_mod = 1.1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = true,
			damage_profile = "medium_slashing_smiter_1h",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			hit_effect = "melee_hit_axes_1h",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			damage_window_end = 0.36,
			impact_sound_event = "axe_1h_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
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
					sub_action = "default_right_heavy",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right_heavy",
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
			baked_sweep = {
				{
					0.2366666666666667,
					0.20311355590820312,
					0.17465734481811523,
					0.28113389015197754,
					-0.6693105101585388,
					-0.07223066687583923,
					0.001962493173778057,
					-0.739460825920105
				},
				{
					0.2627777777777778,
					0.1938648223876953,
					0.3131215572357178,
					0.2648460865020752,
					-0.5970861315727234,
					-0.10696926712989807,
					0.016170261427760124,
					-0.7948485612869263
				},
				{
					0.2888888888888889,
					0.16570758819580078,
					0.4461519718170166,
					0.2414238452911377,
					-0.46484068036079407,
					-0.11416622251272202,
					-0.020942896604537964,
					-0.8777531981468201
				},
				{
					0.315,
					0.1161203384399414,
					0.6199219226837158,
					0.11514413356781006,
					-0.11737078428268433,
					-0.10105865448713303,
					-0.02959405444562435,
					-0.9874895215034485
				},
				{
					0.3411111111111111,
					0.03715038299560547,
					0.7478110790252686,
					-0.184059739112854,
					0.43360599875450134,
					-0.0636897161602974,
					-0.03964637219905853,
					-0.8979741930961609
				},
				{
					0.3672222222222222,
					-0.07789802551269531,
					0.6480886936187744,
					-0.5242358446121216,
					0.831190824508667,
					-0.001812414382584393,
					-0.10942237079143524,
					-0.5451102256774902
				},
				{
					0.3933333333333333,
					-0.10489940643310547,
					0.3733549118041992,
					-0.7300444841384888,
					0.9693758487701416,
					-0.021405693143606186,
					-0.17147418856620789,
					-0.1744958758354187
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.17,
			range_mod = 1.1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			headshot_multiplier = 2.5,
			use_precision_sweep = true,
			damage_profile = "medium_slashing_tank_1h",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.26,
			impact_sound_event = "axe_1h_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
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
					0.1366666666666667,
					-0.2973041534423828,
					0.3993253707885742,
					-0.14411604404449463,
					-0.43759214878082275,
					0.6370789408683777,
					-0.22848814725875854,
					-0.5919769406318665
				},
				{
					0.1627777777777778,
					-0.22699546813964844,
					0.5096101760864258,
					-0.12814199924468994,
					-0.2898523211479187,
					0.6743695735931396,
					-0.10552926361560822,
					-0.6708762049674988
				},
				{
					0.1888888888888889,
					-0.000644683837890625,
					0.6700739860534668,
					-0.09454292058944702,
					0.13117891550064087,
					0.673397958278656,
					0.32661938667297363,
					-0.6501131057739258
				},
				{
					0.21500000000000002,
					0.49878597259521484,
					0.5357656478881836,
					-0.10148388147354126,
					0.5052220225334167,
					0.3875812292098999,
					0.6853864192962646,
					-0.35323792695999146
				},
				{
					0.2411111111111111,
					0.7512092590332031,
					0.1597747802734375,
					-0.09460461139678955,
					0.6062414050102234,
					0.17324399948120117,
					0.754608154296875,
					-0.1817263513803482
				},
				{
					0.26722222222222225,
					0.8161983489990234,
					-0.04821038246154785,
					-0.128698468208313,
					0.652555525302887,
					0.07260971516370773,
					0.7440526485443115,
					-0.12363148480653763
				},
				{
					0.29333333333333333,
					0.8357048034667969,
					-0.1390697956085205,
					-0.13602173328399658,
					0.6698338389396667,
					0.03948373347520828,
					0.7301374077796936,
					-0.1290852427482605
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.38,
			range_mod = 1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_diag",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.5,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
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
					sub_action = "default_right",
					start_time = 0.7,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			baked_sweep = {
				{
					0.3466666666666667,
					0.4900350570678711,
					0.4657611846923828,
					0.06471097469329834,
					-0.6765003204345703,
					-0.2635459899902344,
					0.13724134862422943,
					-0.6738364696502686
				},
				{
					0.37777777777777777,
					0.4096078872680664,
					0.5662367343902588,
					0.062047600746154785,
					-0.5296738147735596,
					-0.3346252143383026,
					0.14066250622272491,
					-0.7666066288948059
				},
				{
					0.4088888888888889,
					0.264434814453125,
					0.6762967109680176,
					0.007625102996826172,
					-0.28228750824928284,
					-0.39263999462127686,
					0.08377499878406525,
					-0.871280312538147
				},
				{
					0.44,
					-0.04294395446777344,
					0.7544276714324951,
					-0.15496432781219482,
					0.23769760131835938,
					-0.3717270493507385,
					-0.14631572365760803,
					-0.8853872418403625
				},
				{
					0.4711111111111111,
					-0.3089914321899414,
					0.5857973098754883,
					-0.2882973551750183,
					0.7467772364616394,
					-0.1767471730709076,
					-0.3520500063896179,
					-0.5358591675758362
				},
				{
					0.5022222222222222,
					-0.39815521240234375,
					0.24299860000610352,
					-0.4882428050041199,
					0.9324087500572205,
					-0.07029470801353455,
					-0.35311147570610046,
					-0.03138351812958717
				},
				{
					0.5333333333333333,
					-0.3720130920410156,
					0.05648517608642578,
					-0.5027636885643005,
					0.9344199299812317,
					-0.049533721059560776,
					-0.3003234565258026,
					0.1849638670682907
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.38,
			range_mod = 1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_diag",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.5,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
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
					sub_action = "default_left",
					start_time = 0.7,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			baked_sweep = {
				{
					0.3466666666666667,
					-0.28481101989746094,
					0.25472521781921387,
					0.06956815719604492,
					0.8131007552146912,
					-0.14297236502170563,
					0.2863211929798126,
					0.4862573742866516
				},
				{
					0.37777777777777777,
					-0.1946115493774414,
					0.4674501419067383,
					0.05577540397644043,
					-0.6466256976127625,
					0.30225691199302673,
					-0.13698220252990723,
					-0.6868420243263245
				},
				{
					0.4088888888888889,
					-0.056568145751953125,
					0.6439659595489502,
					-0.02773749828338623,
					-0.24899879097938538,
					0.4199000597000122,
					-0.006884787697345018,
					-0.8727176785469055
				},
				{
					0.44,
					0.3761625289916992,
					0.6908512115478516,
					-0.3069877624511719,
					0.5209200978279114,
					0.3383338749408722,
					0.33325961232185364,
					-0.7093027830123901
				},
				{
					0.4711111111111111,
					0.7384300231933594,
					0.4304037094116211,
					-0.5003576874732971,
					0.6904639601707458,
					0.27752089500427246,
					0.4889979660511017,
					-0.45510733127593994
				},
				{
					0.5022222222222222,
					0.8560333251953125,
					0.1960277557373047,
					-0.599555492401123,
					0.6167944073677063,
					0.44514498114585876,
					0.5360671877861023,
					-0.3661183714866638
				},
				{
					0.5333333333333333,
					0.7829160690307617,
					-0.01563882827758789,
					-0.6504762172698975,
					0.7915648221969604,
					0.3800260126590729,
					0.4325464069843292,
					-0.20471693575382233
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.38,
			range_mod = 1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = true,
			damage_profile = "light_slashing_smiter",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.5,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_down",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.35,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.35,
					external_multiplier = 0.3,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.75,
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
					0.21750259399414062,
					0.2479078769683838,
					0.31728386878967285,
					-0.6527528166770935,
					-0.09558233618736267,
					0.029304904863238335,
					-0.7509454488754272
				},
				{
					0.37777777777777777,
					0.18672847747802734,
					0.3939332962036133,
					0.2841174602508545,
					-0.5241293907165527,
					-0.10971654206514359,
					-0.009117542766034603,
					-0.844492495059967
				},
				{
					0.4088888888888889,
					0.12429428100585938,
					0.5900812149047852,
					0.14907491207122803,
					-0.21054622530937195,
					-0.10597342252731323,
					-0.04460659250617027,
					-0.9707987308502197
				},
				{
					0.44,
					0.03657722473144531,
					0.7432043552398682,
					-0.16040164232254028,
					0.437024861574173,
					-0.04637724906206131,
					-0.0318714901804924,
					-0.8976873755455017
				},
				{
					0.4711111111111111,
					-0.07423591613769531,
					0.6354784965515137,
					-0.5555545091629028,
					0.850457489490509,
					-0.010175985284149647,
					-0.11475666612386703,
					-0.5132733583450317
				},
				{
					0.5022222222222222,
					-0.100250244140625,
					0.20006465911865234,
					-0.7462902069091797,
					0.9775993824005127,
					-0.029797933995723724,
					-0.20719732344150543,
					0.021926362067461014
				},
				{
					0.5333333333333333,
					-0.07818317413330078,
					0.026646137237548828,
					-0.7138413190841675,
					0.9513219594955444,
					-0.04206002503633499,
					-0.2187787890434265,
					0.2129632979631424
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.18,
			range_mod = 1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_upper",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.35,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_up_left",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
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
					sub_action = "default_right",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_two_hold",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_two",
					release_required = "action_two_hold",
					input = "action_two_hold"
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
			baked_sweep = {
				{
					0.14666666666666667,
					0.5478887557983398,
					0.3996264934539795,
					-0.3321390151977539,
					-0.05353938788175583,
					-0.782234251499176,
					0.363590270280838,
					-0.5030360221862793
				},
				{
					0.18611111111111112,
					0.5843505859375,
					0.5122377872467041,
					-0.27812445163726807,
					0.1054195985198021,
					0.8383576273918152,
					-0.236880823969841,
					0.4795109033584595
				},
				{
					0.22555555555555556,
					0.40540409088134766,
					0.6457600593566895,
					-0.17281293869018555,
					-0.016175510361790657,
					-0.858980655670166,
					-0.0815940573811531,
					-0.5052059888839722
				},
				{
					0.265,
					0.08608341217041016,
					0.7062695026397705,
					-0.08836573362350464,
					-0.21129651367664337,
					0.7279545664787292,
					0.48400020599365234,
					0.4372411072254181
				},
				{
					0.3044444444444444,
					-0.19560527801513672,
					0.5150201320648193,
					0.07611668109893799,
					-0.3530382215976715,
					0.473164439201355,
					0.757592499256134,
					0.27844762802124023
				},
				{
					0.3438888888888889,
					-0.3200693130493164,
					0.23284077644348145,
					0.12751996517181396,
					-0.42817994952201843,
					0.21101053059101105,
					0.8596989512443542,
					0.18180802464485168
				},
				{
					0.3833333333333333,
					-0.31060123443603516,
					-0.02899479866027832,
					0.030684351921081543,
					-0.48018255829811096,
					-0.0031252820044755936,
					0.8526771664619446,
					0.20580726861953735
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
weapon_template.display_unit = "units/weapons/weapon_display/display_shield"
weapon_template.wield_anim = "to_1h_axe_shield"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/1h_axe_shield"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "AXE_1H_SHIELD"
weapon_template.max_fatigue_points = 10
weapon_template.dodge_count = 2
weapon_template.can_block_ranged_attacks = true
weapon_template.block_angle = 180
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
		penetrating = true,
		arc = 0
	},
	hold_attack = {
		penetrating = false,
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
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 5
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 2
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_armour_piercing",
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
	"wwise/one_handed_axes"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/two_handed_hammers"
}

return {
	one_hand_axe_shield_template_1 = weapon_template
}
