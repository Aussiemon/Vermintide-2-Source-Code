local push_radius = 2
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0.2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
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
					sub_action = "light_attack_left_upward",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_down_first",
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
					start_time = 0.6,
					blocker = true,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_down_first",
					start_time = 0.75,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
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
					sub_action = "light_attack_right_upward",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_down_first",
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
					start_time = 0.6,
					blocker = true,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_down_first",
					start_time = 0.95,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_right = {
			aim_assist_ramp_decay_delay = 0.2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
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
					sub_action = "light_attack_left_upward",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_down_first",
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
					start_time = 0.6,
					blocker = true,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_down_first",
					start_time = 0.95,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		light_attack_right_upward = {
			damage_window_start = 0.38,
			range_mod = 1.45,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = -0.05,
			additional_critical_strike_chance = 0.1,
			hit_shield_stop_anim = "attack_hit_shield",
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "medium_slashing_linesman",
			damage_window_end = 0.51,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.26,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.7,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.5,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.4,
					external_multiplier = 0.8,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3466666666666667,
					-0.2768106460571289,
					0.3140830993652344,
					-0.2900257110595703,
					-0.4906095266342163,
					0.6989300847053528,
					-0.2562757432460785,
					-0.45290377736091614
				},
				{
					0.3794444444444445,
					-0.240570068359375,
					0.3921699523925781,
					-0.2601804733276367,
					-0.40260598063468933,
					0.7660760283470154,
					-0.20327085256576538,
					-0.4579486548900604
				},
				{
					0.4122222222222222,
					-0.16373920440673828,
					0.49975013732910156,
					-0.19935894012451172,
					-0.20761671662330627,
					0.8335595726966858,
					0.019319284707307816,
					-0.5115668773651123
				},
				{
					0.445,
					-0.011408805847167969,
					0.5791358947753906,
					-0.1309366226196289,
					0.08580926060676575,
					0.8294026851654053,
					0.32823798060417175,
					-0.4438331127166748
				},
				{
					0.47777777777777775,
					0.2568378448486328,
					0.5732555389404297,
					0.049530982971191406,
					0.30420219898223877,
					0.5348553657531738,
					0.7417617440223694,
					-0.26679641008377075
				},
				{
					0.5105555555555555,
					0.5124616622924805,
					0.4514427185058594,
					0.08444499969482422,
					0.4481271207332611,
					0.2831154465675354,
					0.8113903999328613,
					-0.2463197559118271
				},
				{
					0.5433333333333333,
					0.6048521995544434,
					0.3998088836669922,
					0.033438682556152344,
					0.49935802817344666,
					0.1968493014574051,
					0.7871184945106506,
					-0.3038691282272339
				}
			}
		},
		light_attack_left_upward = {
			damage_window_start = 0.4,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.45,
			sweep_z_offset = -0.05,
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_shield_stop_anim = "attack_hit_shield",
			additional_critical_strike_chance = 0.1,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman",
			damage_window_end = 0.5,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.26,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.7,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.5,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.4,
					external_multiplier = 0.8,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
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
					start_time = 0.5,
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
					0.3666666666666667,
					0.3530864715576172,
					0.2505970001220703,
					-0.24934864044189453,
					0.135246142745018,
					0.8438122868537903,
					-0.22844965755939484,
					0.46636903285980225
				},
				{
					0.3944444444444445,
					0.31166744232177734,
					0.36354637145996094,
					-0.23523807525634766,
					0.07885777950286865,
					0.8509826064109802,
					-0.19577372074127197,
					0.48091861605644226
				},
				{
					0.4222222222222222,
					0.17101573944091797,
					0.5326118469238281,
					-0.16828250885009766,
					0.009041355922818184,
					-0.8565521836280823,
					0.115984708070755,
					-0.502776563167572
				},
				{
					0.45,
					-0.004870414733886719,
					0.6226577758789062,
					-0.0738058090209961,
					0.07974530756473541,
					-0.8371227979660034,
					-0.1354578584432602,
					-0.5239441394805908
				},
				{
					0.4777777777777778,
					-0.07895278930664062,
					0.5793552398681641,
					-0.010544776916503906,
					-0.2088237702846527,
					0.7059981822967529,
					0.5919575691223145,
					0.3279414176940918
				},
				{
					0.5055555555555555,
					-0.29985809326171875,
					0.3778038024902344,
					0.06580066680908203,
					-0.32389330863952637,
					0.4138113856315613,
					0.8395861387252808,
					0.1376533955335617
				},
				{
					0.5333333333333333,
					-0.32100391387939453,
					0.10742950439453125,
					0.08063793182373047,
					-0.31379520893096924,
					0.17101192474365234,
					0.9248310327529907,
					0.13028845191001892
				}
			}
		},
		heavy_attack_down_first = {
			damage_window_start = 0.35,
			range_mod = 1.45,
			kind = "sweep",
			sweep_z_offset = 0,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "heavy_slashing_smiter_stab",
			hit_effect = "melee_hit_sword_2h",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.8,
			damage_window_end = 0.45,
			impact_sound_event = "slashing_hit",
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.5,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.75,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.5,
					external_multiplier = 0.25,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 1.15,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					start_time = 0.5,
					blocker = true,
					end_time = 1.5,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_down_second",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
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
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.31666666666666665,
					0.0977926254272461,
					-0.4805564880371094,
					-0.058379173278808594,
					0.3655940592288971,
					0.6024782061576843,
					0.5826327204704285,
					-0.4048458933830261
				},
				{
					0.34444444444444444,
					0.09525394439697266,
					-0.4373664855957031,
					-0.08018970489501953,
					0.4085165858268738,
					0.5698713660240173,
					0.5580254793167114,
					-0.44381123781204224
				},
				{
					0.37222222222222223,
					0.10346031188964844,
					-0.19890785217285156,
					-0.08818340301513672,
					0.4775935411453247,
					0.5064482688903809,
					0.4948737621307373,
					-0.5201100707054138
				},
				{
					0.4,
					0.08389759063720703,
					0.119110107421875,
					-0.08222484588623047,
					0.5460124015808105,
					0.42825496196746826,
					0.4079642593860626,
					-0.5933238863945007
				},
				{
					0.42777777777777776,
					0.08499526977539062,
					0.4480609893798828,
					-0.06394004821777344,
					0.614617645740509,
					0.3053601384162903,
					0.277739942073822,
					-0.6722059845924377
				},
				{
					0.45555555555555555,
					0.08237457275390625,
					0.7348613739013672,
					-0.06169414520263672,
					0.6563409566879272,
					0.1992652863264084,
					0.16505208611488342,
					-0.7087084650993347
				},
				{
					0.48333333333333334,
					0.05997180938720703,
					0.7911052703857422,
					-0.09288597106933594,
					0.6622483134269714,
					0.14530359208583832,
					0.13121803104877472,
					-0.7232536673545837
				}
			}
		},
		heavy_attack_down_second = {
			damage_window_start = 0.55,
			range_mod = 1.45,
			kind = "sweep",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = -0.05,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "heavy_slashing_linesman_executioner",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.68,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right",
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.5,
					external_multiplier = 0.8,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.8,
					action = "action_one",
					end_time = 1.8,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.5,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.3,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.7,
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.5166666666666667,
					-0.2817850112915039,
					0.3281879425048828,
					-0.22033405303955078,
					-0.4803656041622162,
					0.5922272801399231,
					-0.3938726484775543,
					-0.5132057666778564
				},
				{
					0.5494444444444445,
					-0.2532472610473633,
					0.3646583557128906,
					-0.21105480194091797,
					-0.4530932605266571,
					0.5585484504699707,
					-0.40501391887664795,
					-0.5645298361778259
				},
				{
					0.5822222222222223,
					-0.19567394256591797,
					0.4631614685058594,
					-0.18404006958007812,
					-0.3849126696586609,
					0.6044756770133972,
					-0.2094278633594513,
					-0.665275514125824
				},
				{
					0.615,
					-0.015248298645019531,
					0.5913963317871094,
					-0.11822700500488281,
					0.052297670394182205,
					0.7363982200622559,
					0.16483396291732788,
					-0.6540736556053162
				},
				{
					0.6477777777777778,
					0.37458181381225586,
					0.5705528259277344,
					-0.08922767639160156,
					0.5343004465103149,
					0.4347686469554901,
					0.6146088242530823,
					-0.38438957929611206
				},
				{
					0.6805555555555556,
					0.5785069465637207,
					0.4570789337158203,
					-0.1311502456665039,
					0.6701506972312927,
					0.12394323199987411,
					0.6338364481925964,
					-0.36576980352401733
				},
				{
					0.7133333333333334,
					0.6832680702209473,
					0.3803901672363281,
					-0.2650156021118164,
					0.7284082174301147,
					0.03628510609269142,
					0.584522545337677,
					-0.35558173060417175
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.4,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.45,
			sweep_z_offset = -0.05,
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_shield_stop_anim = "attack_hit_shield",
			additional_critical_strike_chance = 0.25,
			hit_effect = "melee_hit_sword_2h",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman",
			damage_window_end = 0.5,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.5,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.7,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.4,
					end_time = 0.35,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.35,
					external_multiplier = 0.8,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
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
					start_time = 0.5,
					action = "action_two",
					release_required = "action_two_hold",
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
					0.3666666666666667,
					-0.2605133056640625,
					0.35042572021484375,
					-0.2768898010253906,
					-0.4556863605976105,
					0.7301807403564453,
					-0.24175389111042023,
					-0.4480413794517517
				},
				{
					0.3944444444444445,
					-0.2262125015258789,
					0.4174823760986328,
					-0.2512788772583008,
					-0.3636099696159363,
					0.7858909964561462,
					-0.17520271241664886,
					-0.46847331523895264
				},
				{
					0.4222222222222222,
					-0.12055206298828125,
					0.5306816101074219,
					-0.17479610443115234,
					-0.10658127814531326,
					0.8455049395561218,
					0.1303945630788803,
					-0.5067139863967896
				},
				{
					0.45,
					0.07161712646484375,
					0.5949478149414062,
					-0.0994577407836914,
					0.18310874700546265,
					0.779030978679657,
					0.46322059631347656,
					-0.38079991936683655
				},
				{
					0.4777777777777778,
					0.26174354553222656,
					0.5719833374023438,
					0.05373096466064453,
					0.30601879954338074,
					0.5284448862075806,
					0.7458662986755371,
					-0.26604893803596497
				},
				{
					0.5055555555555555,
					0.47337913513183594,
					0.48069190979003906,
					0.08973026275634766,
					0.41356828808784485,
					0.32919183373451233,
					0.8163349628448486,
					-0.23279033601284027
				},
				{
					0.5333333333333333,
					0.582432746887207,
					0.4050559997558594,
					0.06273174285888672,
					0.49666157364845276,
					0.20669333636760712,
					0.7869152426719666,
					-0.3022739887237549
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
					start_time = 0.35,
					action = "action_two",
					send_buffer = true,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.35,
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
					external_multiplier = 0.75,
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
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords_wood_elf"
weapon_template.wield_anim = "to_2h_sword_we"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 6
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "SWORD_2H"
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.1
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
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_versatile"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left_upward"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_down_first"
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
	two_handed_swords_wood_elf_template = table.clone(weapon_template)
}
