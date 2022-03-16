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
						0.7711992263793945,
						0.04500937461853027,
						-0.14521431922912598,
						-0.6252360343933105,
						-0.44842883944511414,
						0.3721138536930084,
						-0.5191556811332703
					},
					{
						0.2677777777777778,
						0.7487335205078125,
						0.11508607864379883,
						-0.13045823574066162,
						-0.5721673369407654,
						-0.4562678933143616,
						0.34261560440063477,
						-0.5891169309616089
					},
					{
						0.2988888888888889,
						0.6979389190673828,
						0.2569679021835327,
						-0.0974435806274414,
						-0.45230528712272644,
						-0.5100192427635193,
						0.25521254539489746,
						-0.6856871247291565
					},
					{
						0.33,
						0.5089044570922852,
						0.5649136304855347,
						-0.10073506832122803,
						-0.13997142016887665,
						-0.6312522292137146,
						0.01930920034646988,
						-0.7625980973243713
					},
					{
						0.3611111111111111,
						-0.14525985717773438,
						0.6637282967567444,
						-0.1050029993057251,
						-0.4944330155849457,
						0.4506416618824005,
						0.5842325687408447,
						0.45948952436447144
					},
					{
						0.39222222222222225,
						-0.4060964584350586,
						0.45589911937713623,
						-0.15843737125396729,
						-0.6618089079856873,
						0.21850864589214325,
						0.6703514456748962,
						0.2547389566898346
					},
					{
						0.42333333333333334,
						-0.5150127410888672,
						0.281494140625,
						-0.21016812324523926,
						0.7232648730278015,
						-0.0662187933921814,
						-0.6713981628417969,
						-0.1474027931690216
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
						0.4765920639038086,
						0.518657922744751,
						0.02019798755645752,
						-0.36823001503944397,
						-0.5419291257858276,
						0.33574753999710083,
						-0.6767518520355225
					},
					{
						0.3811111111111111,
						0.3512887954711914,
						0.6040105819702148,
						0.005841970443725586,
						-0.2497757077217102,
						-0.5975494384765625,
						0.23363438248634338,
						-0.7252321839332581
					},
					{
						0.41555555555555557,
						0.16162109375,
						0.6884378790855408,
						-0.020075440406799316,
						-0.011281696148216724,
						-0.6289898157119751,
						0.020152976736426353,
						-0.7770704030990601
					},
					{
						0.45,
						-0.20151138305664062,
						0.6508117914199829,
						-0.11128497123718262,
						0.4288659691810608,
						-0.46233126521110535,
						-0.4338245391845703,
						-0.6435216069221497
					},
					{
						0.48444444444444446,
						-0.4017810821533203,
						0.42589306831359863,
						-0.23574864864349365,
						-0.6599997878074646,
						0.16977980732917786,
						0.6641506552696228,
						0.30737459659576416
					},
					{
						0.518888888888889,
						-0.43578147888183594,
						0.3047976493835449,
						-0.3331775665283203,
						-0.6193581819534302,
						0.04845898225903511,
						0.7393552660942078,
						0.2596169412136078
					},
					{
						0.5533333333333333,
						-0.41757965087890625,
						0.22114861011505127,
						-0.41117238998413086,
						-0.6162289381027222,
						-0.06491163372993469,
						0.7425910830497742,
						0.25417885184288025
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
						-0.2894554138183594,
						0.24152719974517822,
						0.06851959228515625,
						0.8157525062561035,
						-0.1338275671005249,
						0.3042021691799164,
						0.47339102625846863
					},
					{
						0.3811111111111111,
						-0.19710636138916016,
						0.4622316360473633,
						0.056683897972106934,
						-0.6529075503349304,
						0.2985855042934418,
						-0.13952665030956268,
						-0.6819756031036377
					},
					{
						0.41555555555555557,
						-0.014286041259765625,
						0.6719449162483215,
						-0.056461215019226074,
						-0.15388469398021698,
						0.4316287040710449,
						0.0356430858373642,
						-0.8881136178970337
					},
					{
						0.45,
						0.5295352935791016,
						0.6090722680091858,
						-0.3933374881744385,
						0.6766785383224487,
						0.2480027973651886,
						0.39074382185935974,
						-0.5726430416107178
					},
					{
						0.48444444444444446,
						0.8294429779052734,
						0.3017289638519287,
						-0.5533264875411987,
						0.6172019243240356,
						0.3957584798336029,
						0.5389530062675476,
						-0.4146886169910431
					},
					{
						0.518888888888889,
						0.8322267532348633,
						0.07004058361053467,
						-0.6372342705726624,
						0.7047833800315857,
						0.4277949333190918,
						0.49183914065361023,
						-0.2799395024776459
					},
					{
						0.5533333333333333,
						0.7011747360229492,
						-0.10835754871368408,
						-0.654400110244751,
						0.8867157101631165,
						0.2971547842025757,
						0.33810997009277344,
						-0.10543239861726761
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
						0.5701694488525391,
						0.5397642850875854,
						-0.25228607654571533,
						0.10815665870904922,
						0.8469541668891907,
						-0.18869319558143616,
						0.48514506220817566
					},
					{
						0.22611111111111112,
						0.4248800277709961,
						0.6379908323287964,
						-0.17914104461669922,
						-0.0287620946764946,
						-0.8614489436149597,
						-0.05309798941016197,
						-0.5042411684989929
					},
					{
						0.2555555555555556,
						0.17076873779296875,
						0.7038431167602539,
						-0.11373841762542725,
						-0.15736372768878937,
						0.7792662978172302,
						0.3891690671443939,
						0.46532580256462097
					},
					{
						0.28500000000000003,
						-0.05882835388183594,
						0.6547498106956482,
						-0.018982887268066406,
						-0.2869393825531006,
						0.6162953972816467,
						0.6319133639335632,
						0.37219810485839844
					},
					{
						0.31444444444444447,
						-0.24666500091552734,
						0.43638336658477783,
						0.11359930038452148,
						-0.3770134150981903,
						0.39968937635421753,
						0.8018729090690613,
						0.2347533106803894
					},
					{
						0.3438888888888889,
						-0.3213653564453125,
						0.223494291305542,
						0.12535500526428223,
						-0.43042290210723877,
						0.2028905153274536,
						0.8605973124504089,
						0.18150432407855988
					},
					{
						0.37333333333333335,
						-0.3181304931640625,
						0.031078457832336426,
						0.06180727481842041,
						-0.4676138460636139,
						0.04665436968207359,
						0.8610167503356934,
						0.1944502741098404
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
						0.1949300765991211,
						0.35874366760253906,
						0.2950657606124878,
						-0.5599973797798157,
						-0.10792297124862671,
						-0.000984439393505454,
						-0.8214344382286072
					},
					{
						0.39111111111111113,
						0.15732765197753906,
						0.4920468330383301,
						0.23303735256195068,
						-0.3991307020187378,
						-0.11042709648609161,
						-0.034079451113939285,
						-0.9095818400382996
					},
					{
						0.41555555555555557,
						0.1009531021118164,
						0.6496803760528564,
						0.07644152641296387,
						-0.04223744571208954,
						-0.09259343892335892,
						-0.040159616619348526,
						-0.9939968585968018
					},
					{
						0.44,
						0.01781177520751953,
						0.7479267120361328,
						-0.2242622971534729,
						0.5286750793457031,
						-0.03974037617444992,
						-0.03798511624336243,
						-0.8470422029495239
					},
					{
						0.46444444444444444,
						-0.06827926635742188,
						0.6541187763214111,
						-0.5261389017105103,
						0.8287242650985718,
						-0.01058661937713623,
						-0.10642640292644501,
						-0.5493425726890564
					},
					{
						0.4888888888888889,
						-0.09278297424316406,
						0.38151025772094727,
						-0.7225810885429382,
						0.968704342842102,
						-0.022597691044211388,
						-0.16215623915195465,
						-0.1865653097629547
					},
					{
						0.5133333333333333,
						-0.08535957336425781,
						0.10302519798278809,
						-0.7376056909561157,
						0.9693092703819275,
						-0.03347104787826538,
						-0.20961005985736847,
						0.1240277886390686
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
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 1,
			[DamageTypes.CLEAVE] = 5,
			[DamageTypes.SPEED] = 3,
			[DamageTypes.STAGGER] = 4,
			[DamageTypes.DAMAGE] = 1
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 2,
			[DamageTypes.CLEAVE] = 5,
			[DamageTypes.SPEED] = 1,
			[DamageTypes.STAGGER] = 5,
			[DamageTypes.DAMAGE] = 1
		}
	},
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right,
	left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1",
	left_hand_attachment_node_linking = AttachmentNodeLinking.shield,
	display_unit = "units/weapons/weapon_display/display_shield_hammer",
	wield_anim = "to_1h_hammer_shield",
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
local one_handed_hammer_shield_template_1 = table.clone(weapon_template)
local one_handed_hammer_shield_template_2 = table.clone(weapon_template)
one_handed_hammer_shield_template_2.actions.action_one.light_attack_left.range_mod = 1
one_handed_hammer_shield_template_2.actions.action_one.light_attack_right.range_mod = 1
one_handed_hammer_shield_template_2.actions.action_one.light_attack_last.range_mod = 1
local inspect_table = table.clone(ActionTemplates.action_inspect)
inspect_table.action_inspect_hold.anim_event = "inspect_start_2"
one_handed_hammer_shield_template_2.actions.action_inspect = inspect_table

return {
	one_handed_hammer_shield_template_1 = one_handed_hammer_shield_template_1,
	one_handed_hammer_shield_template_2 = one_handed_hammer_shield_template_2
}
