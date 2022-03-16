local push_radius = 2
local time_mod = 1
local weapon_template = {
	actions = {
		action_one = {
			default = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_down",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.85,
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
						sub_action = "default_charge",
						send_buffer = true,
						action = "action_one",
						auto_chain = true,
						start_time = 0.5
					}
				}
			},
			default_charge = {
				looping_anim = true,
				aim_assist_ramp_multiplier = 0.2,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				uninterruptible = true,
				anim_event = "attack_swing_charge_down",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.85,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.1,
						end_time = 0.3,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.3,
						external_multiplier = 0.75,
						end_time = 0.5,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "heavy_attack",
						start_time = 0.3,
						action = "action_one",
						end_time = 0.5,
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default_charge",
						start_time = 0.5,
						action = "action_one",
						send_buffer = true,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack",
						start_time = 0.5,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_charge_2 = {
				looping_anim = true,
				anim_event_3p = "attack_swing_charge_left",
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_decay_delay = 0.1,
				uninterruptible = true,
				anim_event = "attack_swing_charge",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.85,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.1,
						end_time = 0.3,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.3,
						external_multiplier = 0.75,
						end_time = 0.5,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "heavy_attack_left",
						start_time = 0,
						action = "action_one",
						end_time = 0.5,
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default_charge_2",
						start_time = 0.5,
						action = "action_one",
						send_buffer = true,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack",
						start_time = 0.5,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_right = {
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_down",
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
						sub_action = "light_attack_last",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
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
						sub_action = "default_charge",
						send_buffer = true,
						action = "action_one",
						auto_chain = true,
						start_time = 0.5
					}
				}
			},
			default_left = {
				anim_end_event = "attack_finished",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_ramp_decay_delay = 0.1,
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				aim_assist_max_ramp_multiplier = 0.4,
				anim_event_3p = "attack_swing_charge_left",
				anim_event = "attack_swing_charge",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.85,
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
						sub_action = "default_charge_2",
						send_buffer = true,
						action = "action_one",
						auto_chain = true,
						start_time = 0.5
					}
				}
			},
			default_last = {
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_down",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.85,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_down",
						start_time = 0,
						action = "action_one",
						end_time = 0.3,
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
						sub_action = "default_charge",
						send_buffer = true,
						action = "action_one",
						auto_chain = true,
						start_time = 0.5
					}
				}
			},
			heavy_attack = {
				damage_window_start = 0.37,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				damage_window_end = 0.53,
				sweep_z_offset = 0.35,
				width_mod = 25,
				range_mod = 1.4,
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = true,
				hit_effect = "melee_hit_hammers_1h",
				impact_explosion_template = "flaming_flail_impact_heavy",
				damage_profile = "heavy_blunt_smiter_burn",
				additional_critical_strike_chance = 0,
				impact_sound_event = "flail_hit",
				aim_assist_ramp_multiplier = 0.4,
				anim_end_event = "attack_finished",
				aim_assist_max_ramp_multiplier = 0.6,
				aim_assist_ramp_decay_delay = 0.1,
				reset_aim_on_attack = true,
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_down",
				total_time = 1.2,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.5,
						end_time = 0.3,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.3,
						external_multiplier = 0.75,
						end_time = 0.4,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_left",
						start_time = 0.5,
						action = "action_one",
						release_required = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default_left",
						start_time = 0.5,
						action = "action_one",
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
				critical_strike = {},
				baked_sweep = {
					{
						0.33666666666666667,
						0.2003612518310547,
						0.3142247200012207,
						0.22526800632476807,
						-0.26186010241508484,
						-0.09007365256547928,
						0.7363101243972778,
						-0.6173843145370483
					},
					{
						0.37444444444444447,
						0.19239270687103271,
						0.5025625228881836,
						0.13360702991485596,
						0.003331267274916172,
						0.14534913003444672,
						0.703585147857666,
						-0.6955792903900146
					},
					{
						0.4122222222222222,
						0.18182814121246338,
						0.5909309387207031,
						-0.09436613321304321,
						0.2748934030532837,
						0.3549955487251282,
						0.56171715259552,
						-0.6948997974395752
					},
					{
						0.45,
						0.1327575445175171,
						0.5699009895324707,
						-0.36012887954711914,
						0.43740352988243103,
						0.49335092306137085,
						0.4291784167289734,
						-0.61732417345047
					},
					{
						0.48777777777777775,
						0.05492877960205078,
						0.46858692169189453,
						-0.5957105159759521,
						0.5337245464324951,
						0.5682362914085388,
						0.339221328496933,
						-0.5264739394187927
					},
					{
						0.5255555555555556,
						0.03301405906677246,
						0.32981109619140625,
						-0.6775836944580078,
						0.6153181195259094,
						0.5596452355384827,
						0.30446112155914307,
						-0.46420276165008545
					},
					{
						0.5633333333333334,
						0.053676486015319824,
						0.20493650436401367,
						-0.7052699327468872,
						0.6876680850982666,
						0.5110546946525574,
						0.292224258184433,
						-0.42490071058273315
					}
				}
			},
			heavy_attack_left = {
				damage_window_start = 0.37,
				damage_profile = "medium_blunt_tank_spiked",
				use_precision_sweep = false,
				damage_window_end = 0.53,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				width_mod = 25,
				aim_assist_ramp_multiplier = 0.4,
				ignore_armour_hit = true,
				additional_critical_strike_chance = 0,
				anim_end_event = "attack_finished",
				aim_assist_max_ramp_multiplier = 0.6,
				weapon_up_offset_mod = 0.15,
				aim_assist_ramp_decay_delay = 0.1,
				anim_event = "attack_swing_heavy_left",
				range_mod = 1.4,
				reset_aim_on_attack = true,
				sweep_z_offset = 0.35,
				hit_effect = "melee_hit_hammers_1h",
				impact_sound_event = "flail_hit",
				no_damage_impact_sound_event = "flail_hit_armour",
				dedicated_target_range = 3,
				uninterruptible = true,
				hit_stop_anim = "attack_hit",
				total_time = 1.2,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.3,
						end_time = 0.3,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.3,
						external_multiplier = 0.75,
						end_time = 0.4,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_last",
						start_time = 0.6,
						action = "action_one",
						release_required = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_one",
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
				critical_strike = {},
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.33666666666666667,
						0.5934354066848755,
						0.35158538818359375,
						-0.1992010474205017,
						0.48889654874801636,
						0.684134304523468,
						-0.2895205616950989,
						0.45729464292526245
					},
					{
						0.37444444444444447,
						0.48178577423095703,
						0.5107641220092773,
						-0.19904357194900513,
						0.35380327701568604,
						0.8019729852676392,
						-0.24210679531097412,
						0.41598910093307495
					},
					{
						0.4122222222222222,
						0.30588483810424805,
						0.6498804092407227,
						-0.14515787363052368,
						-0.06452270597219467,
						-0.7993842363357544,
						-0.05650705471634865,
						-0.5946669578552246
					},
					{
						0.45,
						-0.027243971824645996,
						0.6713924407958984,
						-0.08644932508468628,
						0.44589534401893616,
						-0.47287604212760925,
						-0.5538253784179688,
						-0.5204256176948547
					},
					{
						0.48777777777777775,
						-0.3216235637664795,
						0.5095477104187012,
						-0.07533842325210571,
						-0.5667745471000671,
						0.29799824953079224,
						0.7088803648948669,
						0.29572349786758423
					},
					{
						0.5255555555555556,
						-0.4176924228668213,
						0.3358898162841797,
						-0.16812938451766968,
						-0.5773336887359619,
						0.205738827586174,
						0.7685278654098511,
						0.18363624811172485
					},
					{
						0.5633333333333334,
						-0.4053800106048584,
						0.25864696502685547,
						-0.26854902505874634,
						-0.4622841775417328,
						0.018210995942354202,
						0.8483294248580933,
						0.25748586654663086
					}
				}
			},
			light_attack_left = {
				damage_window_start = 0.4,
				anim_end_event = "attack_finished",
				anim_event_3p = "attack_swing_left_diagonal",
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.25,
				no_damage_impact_sound_event = "flail_hit_armour",
				width_mod = 25,
				use_precision_sweep = false,
				ignore_armour_hit = false,
				damage_profile = "light_blunt_tank_spiked",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.48,
				impact_sound_event = "flail_hit",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.1,
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
						end_time = 0.25,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.65,
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
						0.3666666666666667,
						0.479811429977417,
						0.470064640045166,
						-0.04604315757751465,
						-0.5558568239212036,
						-0.5790556073188782,
						0.3117288649082184,
						-0.5084712505340576
					},
					{
						0.39111111111111113,
						0.4098677635192871,
						0.566312313079834,
						-0.05163896083831787,
						-0.3978573977947235,
						-0.6920382976531982,
						0.25009122490882874,
						-0.5479480624198914
					},
					{
						0.41555555555555557,
						0.25109124183654785,
						0.6872563362121582,
						-0.06355786323547363,
						0.0691598579287529,
						-0.6834022402763367,
						-0.06505218893289566,
						-0.7238414883613586
					},
					{
						0.44,
						0.06567502021789551,
						0.6995158195495605,
						-0.10612630844116211,
						0.45606696605682373,
						-0.43822771310806274,
						-0.36684930324554443,
						-0.6821884512901306
					},
					{
						0.46444444444444444,
						-0.17164134979248047,
						0.6323566436767578,
						-0.1735791563987732,
						0.572997510433197,
						-0.2388366013765335,
						-0.5564306974411011,
						-0.5522822737693787
					},
					{
						0.4888888888888889,
						-0.34316492080688477,
						0.5044450759887695,
						-0.2479192018508911,
						-0.6367857456207275,
						0.1574709415435791,
						0.6488005518913269,
						0.3857002258300781
					},
					{
						0.5133333333333333,
						-0.4174621105194092,
						0.38133716583251953,
						-0.30679851770401,
						-0.6664609909057617,
						0.12820281088352203,
						0.6837949156761169,
						0.26798951625823975
					}
				}
			},
			light_attack_right = {
				damage_window_start = 0.44,
				range_mod = 1.25,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				width_mod = 25,
				ignore_armour_hit = false,
				damage_profile = "light_blunt_tank_spiked",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.54,
				impact_sound_event = "flail_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
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
						external_multiplier = 0.75,
						end_time = 0.5,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_right",
						start_time = 0.6,
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
						end_time = 0.25,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.65,
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
						0.4066666666666667,
						-0.1161544919013977,
						0.5114474296569824,
						0.006168007850646973,
						-0.5112618803977966,
						0.3241960108280182,
						-0.10372503846883774,
						-0.7891446948051453
					},
					{
						0.43444444444444447,
						0.013343274593353271,
						0.5926046371459961,
						-0.07804882526397705,
						-0.19105306267738342,
						0.4092773199081421,
						0.12696784734725952,
						-0.8831024765968323
					},
					{
						0.46222222222222226,
						0.1950628161430359,
						0.6420650482177734,
						-0.17725515365600586,
						0.228373721241951,
						0.4446215033531189,
						0.33082643151283264,
						-0.8004443049430847
					},
					{
						0.49,
						0.4113820195198059,
						0.674807071685791,
						-0.3020220994949341,
						0.4929756820201874,
						0.44966521859169006,
						0.4312661588191986,
						-0.6072772741317749
					},
					{
						0.5177777777777778,
						0.703733503818512,
						0.4956808090209961,
						-0.44947147369384766,
						0.5991939902305603,
						0.4456123113632202,
						0.5184242129325867,
						-0.4166926145553589
					},
					{
						0.5455555555555556,
						0.806216299533844,
						0.3123025894165039,
						-0.5522340536117554,
						0.6114271283149719,
						0.41662248969078064,
						0.5454844236373901,
						-0.39373764395713806
					},
					{
						0.5733333333333334,
						0.7763598561286926,
						0.18298959732055664,
						-0.5601527690887451,
						0.6296619176864624,
						0.43385377526283264,
						0.5707582831382751,
						-0.29921865463256836
					}
				}
			},
			light_attack_last = {
				damage_window_start = 0.4,
				range_mod = 1.3,
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				width_mod = 25,
				ignore_armour_hit = true,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.52,
				impact_sound_event = "flail_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_left_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.2,
				buff_data = {
					{
						start_time = 0.1,
						external_multiplier = 1.3,
						end_time = 0.4,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.45,
						external_multiplier = 0.75,
						end_time = 0.6,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_last",
						start_time = 0.62,
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
						end_time = 0.25,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.6,
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
						0.3666666666666667,
						0.39472782611846924,
						0.4587736129760742,
						0.04797643423080444,
						-0.34273985028266907,
						-0.2795776128768921,
						0.34119850397109985,
						-0.8294271230697632
					},
					{
						0.3977777777777778,
						0.2552992105484009,
						0.6572294235229492,
						0.002240478992462158,
						-0.14357858896255493,
						-0.36528053879737854,
						0.13973361253738403,
						-0.9090818762779236
					},
					{
						0.42888888888888893,
						0.12776052951812744,
						0.7022395133972168,
						-0.06808525323867798,
						0.24466276168823242,
						-0.41664814949035645,
						-0.20018208026885986,
						-0.8523330688476562
					},
					{
						0.46,
						-0.13782501220703125,
						0.6720738410949707,
						-0.1845247745513916,
						0.5632908344268799,
						-0.27236080169677734,
						-0.35858187079429626,
						-0.692778468132019
					},
					{
						0.4911111111111111,
						-0.37377452850341797,
						0.5015730857849121,
						-0.341198205947876,
						0.7448960542678833,
						-0.1413649171590805,
						-0.3852902948856354,
						-0.5260200500488281
					},
					{
						0.5222222222222223,
						-0.450178861618042,
						0.33867454528808594,
						-0.38745081424713135,
						0.761974036693573,
						-0.07008933275938034,
						-0.506117045879364,
						-0.3979053497314453
					},
					{
						0.5533333333333333,
						-0.08816730976104736,
						0.31908559799194336,
						-0.7048391103744507,
						0.7230512499809265,
						0.07842423021793365,
						-0.2568467855453491,
						-0.6364559531211853
					}
				}
			},
			light_attack_down = {
				damage_window_start = 0.31,
				anim_end_event = "attack_finished",
				anim_event_3p = "attack_swing_right_diagonal",
				kind = "sweep",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.3,
				no_damage_impact_sound_event = "flail_hit_armour",
				width_mod = 25,
				use_precision_sweep = false,
				ignore_armour_hit = true,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_1h",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				damage_window_end = 0.4,
				impact_sound_event = "flail_hit",
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_down_right",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
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
						start_time = 0.6,
						action = "action_one",
						end_time = 1.25,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.25,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.6,
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
						0.27666666666666667,
						-0.14925605058670044,
						0.28020238876342773,
						0.15280520915985107,
						-0.6145315766334534,
						0.2519301176071167,
						-0.35006821155548096,
						-0.6605561375617981
					},
					{
						0.3027777777777778,
						-0.11703318357467651,
						0.32506799697875977,
						0.18586242198944092,
						-0.5517120957374573,
						0.34288638830184937,
						-0.2156672477722168,
						-0.7290612459182739
					},
					{
						0.3288888888888889,
						-0.047709763050079346,
						0.379396915435791,
						0.1653270721435547,
						-0.31620335578918457,
						0.2419511377811432,
						0.06440373510122299,
						-0.9150558710098267
					},
					{
						0.355,
						0.055893346667289734,
						0.5288228988647461,
						0.0559391975402832,
						0.22510288655757904,
						0.0773816853761673,
						0.07995912432670593,
						-0.9679603576660156
					},
					{
						0.3811111111111111,
						0.0759771317243576,
						0.5925760269165039,
						-0.18381202220916748,
						0.6577463746070862,
						0.029662735760211945,
						-0.023562047630548477,
						-0.7522863149642944
					},
					{
						0.40722222222222226,
						0.11020354926586151,
						0.5871458053588867,
						-0.33477503061294556,
						0.7692912817001343,
						0.06731759756803513,
						-0.013777857646346092,
						-0.6351925134658813
					},
					{
						0.43333333333333335,
						0.16953045129776,
						0.5123467445373535,
						-0.47719788551330566,
						0.8375231623649597,
						0.10566578060388565,
						2.4905344616854563e-05,
						-0.5360873341560364
					}
				}
			},
			light_attack_bopp = {
				damage_window_start = 0.3,
				kind = "sweep",
				anim_end_event = "attack_finished",
				anim_event_3p = "attack_swing_right_diagonal",
				first_person_hit_anim = "shake_hit",
				range_mod = 1.25,
				width_mod = 25,
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				hit_effect = "melee_hit_hammers_1h",
				ignore_armour_hit = true,
				damage_profile = "light_blunt_tank_spiked",
				damage_window_end = 0.45,
				impact_sound_event = "flail_hit",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_right",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1.25,
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
						start_time = 0.6,
						action = "action_one",
						release_required = "action_two_hold",
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
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.26666666666666666,
						-0.44726693630218506,
						0.44989919662475586,
						-0.08170294761657715,
						-0.6516045331954956,
						0.5185348391532898,
						-0.23248617351055145,
						-0.5024771094322205
					},
					{
						0.30277777777777776,
						-0.32564449310302734,
						0.5561842918395996,
						-0.06223505735397339,
						-0.483003169298172,
						0.4565158784389496,
						-0.2571788728237152,
						-0.7015413045883179
					},
					{
						0.3388888888888889,
						-0.12919414043426514,
						0.6320667266845703,
						-0.08824115991592407,
						-0.04501090943813324,
						0.494204580783844,
						-0.04791552573442459,
						-0.8668563961982727
					},
					{
						0.375,
						0.10169577598571777,
						0.6586694717407227,
						-0.1272175908088684,
						0.4570362865924835,
						0.41029608249664307,
						0.27217742800712585,
						-0.7407391667366028
					},
					{
						0.4111111111111111,
						0.40008795261383057,
						0.6625494956970215,
						-0.19522947072982788,
						0.642000675201416,
						0.3155950903892517,
						0.49753597378730774,
						-0.4906045198440552
					},
					{
						0.44722222222222224,
						0.7598291635513306,
						0.5383634567260742,
						-0.3114081025123596,
						0.80672287940979,
						0.2341369390487671,
						0.5398340821266174,
						-0.05438079684972763
					},
					{
						0.48333333333333334,
						0.9226462841033936,
						0.2472982406616211,
						-0.35108107328414917,
						0.780019223690033,
						-0.12272604554891586,
						0.41686585545539856,
						0.45025691390037537
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
						external_multiplier = 1.1,
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
	},
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.flail,
	display_unit = "units/weapons/weapon_display/display_1h_flail",
	wield_anim = "to_1h_flail",
	buff_type = "MELEE_1H",
	weapon_type = "FLAIL_1H",
	max_fatigue_points = 6,
	dodge_count = 4,
	block_angle = 90,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.5,
	outer_block_fatigue_point_multiplier = 2,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1.15
		},
		change_dodge_speed = {
			external_optional_multiplier = 1.15
		}
	},
	attack_meta_data = {
		tap_attack = {
			arc = 1
		},
		hold_attack = {
			penetrating = true,
			arc = 1,
			attack_chain = {
				start_sub_action_name = "default",
				start_action_name = "action_one",
				transitions = {
					action_one = {
						default = {
							wanted_sub_action_name = "default_charge",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_charge = {
							wanted_sub_action_name = "heavy_attack",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack"
						},
						default_charge_2 = {
							wanted_sub_action_name = "heavy_attack_left",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack"
						},
						default_right = {
							wanted_sub_action_name = "default_charge",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_left = {
							wanted_sub_action_name = "default_charge_2",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_last = {
							wanted_sub_action_name = "default_charge",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						heavy_attack = {
							wanted_sub_action_name = "default_left",
							wanted_action_name = "action_one",
							bot_wanted_input = "hold_attack"
						},
						heavy_attack_left = {
							wanted_sub_action_name = "default",
							wanted_action_name = "action_one",
							bot_wanted_input = "hold_attack"
						},
						light_attack_left = {
							wanted_sub_action_name = "default_left",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_right = {
							wanted_sub_action_name = "default_right",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_last = {
							wanted_sub_action_name = "default_last",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_down = {
							wanted_sub_action_name = "default",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						}
					},
					action_two = {}
				}
			}
		}
	}
}

WeaponUtils.add_bot_meta_data_chain_actions(weapon_template.actions, weapon_template.attack_meta_data.hold_attack.attack_chain.transitions)

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
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 5
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 5
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_ignore_shields",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control"
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
weapon_template.wwise_dep_right_hand = {
	"wwise/flail"
}

return {
	one_handed_flails_flaming_template = weapon_template
}
