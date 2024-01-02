local push_radius = 2
local time_mod = 1
local weapon_template = {}
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
					0.18429040908813477,
					0.3869699239730835,
					0.20804309844970703,
					-0.568268358707428,
					-0.12277889996767044,
					0.012264389544725418,
					-0.8135392069816589
				},
				{
					0.21444444444444444,
					0.13206148147583008,
					0.5735982656478882,
					0.15012168884277344,
					-0.23147808015346527,
					-0.11319378763437271,
					-0.02767736278474331,
					-0.9658359289169312
				},
				{
					0.24222222222222223,
					0.05155372619628906,
					0.7407821416854858,
					-0.12662029266357422,
					0.3536735773086548,
					-0.0655936747789383,
					-0.03737959265708923,
					-0.9323171377182007
				},
				{
					0.27,
					-0.06906938552856445,
					0.6680850982666016,
					-0.5049277544021606,
					0.8144542574882507,
					-0.004021505359560251,
					-0.10152580589056015,
					-0.5712623000144958
				},
				{
					0.2977777777777778,
					-0.11176204681396484,
					0.3630814552307129,
					-0.7326452732086182,
					0.9695950746536255,
					-0.019296159967780113,
					-0.18077296018600464,
					-0.16381137073040009
				},
				{
					0.3255555555555556,
					-0.07503128051757812,
					0.07555747032165527,
					-0.7319175601005554,
					0.9650427103042603,
					-0.03979409113526344,
					-0.20504871010780334,
					0.15831626951694489
				},
				{
					0.35333333333333333,
					-0.07184553146362305,
					-0.01930713653564453,
					-0.6960705518722534,
					0.938398003578186,
					-0.04928339645266533,
					-0.22311373054981232,
					0.25923067331314087
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
					-0.2077782154083252,
					0.3324166536331177,
					0.1787184476852417,
					-0.7101161479949951,
					0.22725149989128113,
					-0.18539269268512726,
					-0.6400948166847229
				},
				{
					0.19111111111111112,
					-0.14099359512329102,
					0.49841558933258057,
					0.15428698062896729,
					-0.5081787109375,
					0.25994986295700073,
					-0.10019189864397049,
					-0.8149491548538208
				},
				{
					0.21555555555555558,
					-0.06712508201599121,
					0.613888144493103,
					0.06715571880340576,
					-0.07298752665519714,
					0.2152300477027893,
					-0.05754135921597481,
					-0.9721305966377258
				},
				{
					0.24000000000000002,
					0.04242420196533203,
					0.7450429201126099,
					-0.23922860622406006,
					0.47204017639160156,
					0.16335073113441467,
					0.0519426092505455,
					-0.8647523522377014
				},
				{
					0.2644444444444445,
					0.3526649475097656,
					0.5478306412696838,
					-0.6788211464881897,
					0.7839735746383667,
					0.15724311769008636,
					0.16603410243988037,
					-0.5771419405937195
				},
				{
					0.2888888888888889,
					0.7028794288635254,
					0.20923006534576416,
					-0.7500014305114746,
					0.7386687397956848,
					0.3705439269542694,
					0.3885784149169922,
					-0.4075199365615845
				},
				{
					0.31333333333333335,
					0.8798832893371582,
					0.19931626319885254,
					-0.5608536601066589,
					0.6081917881965637,
					0.43854641914367676,
					0.5608412027359009,
					-0.35105112195014954
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
			damage_profile = "light_slashing_smiter_diag_1h",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.49,
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
					0.4504280090332031,
					0.5395792722702026,
					0.02011871337890625,
					-0.3467637896537781,
					-0.554619550704956,
					0.3151553273200989,
					-0.6876257061958313
				},
				{
					0.3761111111111111,
					0.34246134757995605,
					0.6088217496871948,
					0.004671812057495117,
					-0.2402578741312027,
					-0.6003840565681458,
					0.22501835227012634,
					-0.7288223505020142
				},
				{
					0.40555555555555556,
					0.16670489311218262,
					0.6868093609809875,
					-0.019176721572875977,
					-0.018294595181941986,
					-0.6290723085403442,
					0.026166284456849098,
					-0.7766909003257751
				},
				{
					0.435,
					-0.11676621437072754,
					0.6901761293411255,
					-0.08481717109680176,
					0.3330237865447998,
					-0.5309361815452576,
					-0.3230273425579071,
					-0.709122896194458
				},
				{
					0.46444444444444444,
					-0.3632841110229492,
					0.5008306503295898,
					-0.1911482810974121,
					-0.6146014928817749,
					0.2535327076911926,
					0.6265378594398499,
					0.40673893690109253
				},
				{
					0.4938888888888889,
					-0.4261491298675537,
					0.3610910475254059,
					-0.2844505310058594,
					-0.6549902558326721,
					0.10145145654678345,
					0.7017423510551453,
					0.2612527906894684
				},
				{
					0.5233333333333333,
					-0.43340563774108887,
					0.27179184556007385,
					-0.3639485836029053,
					-0.6076627373695374,
					0.01272839866578579,
					0.750745952129364,
					0.2587750554084778
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.33,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_diag",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.46,
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
					0.2966666666666667,
					-0.38773059844970703,
					0.5140411853790283,
					-0.09681379795074463,
					-0.48819541931152344,
					0.5634968876838684,
					-0.19010379910469055,
					-0.638746440410614
				},
				{
					0.3294444444444445,
					-0.276303768157959,
					0.6272764205932617,
					-0.09754049777984619,
					-0.3498818278312683,
					0.6409440636634827,
					-0.1196410059928894,
					-0.6726510524749756
				},
				{
					0.3622222222222222,
					-0.07821178436279297,
					0.699138343334198,
					-0.11354100704193115,
					-0.1049969419836998,
					0.6946050524711609,
					0.09228705614805222,
					-0.7056788802146912
				},
				{
					0.395,
					0.19220876693725586,
					0.668515145778656,
					-0.1335369348526001,
					0.2705271244049072,
					0.5985161066055298,
					0.45588821172714233,
					-0.6006326079368591
				},
				{
					0.4277777777777778,
					0.4629526138305664,
					0.5467269420623779,
					-0.14078009128570557,
					0.4948478043079376,
					0.3912324905395508,
					0.6513665914535522,
					-0.42164477705955505
				},
				{
					0.46055555555555555,
					0.6197824478149414,
					0.3845815062522888,
					-0.15529489517211914,
					0.5913895964622498,
					0.30625054240226746,
					0.7154439091682434,
					-0.21120832860469818
				},
				{
					0.49333333333333335,
					0.7121882438659668,
					0.2139570713043213,
					-0.18266749382019043,
					0.6295932531356812,
					0.2808004915714264,
					0.7235279083251953,
					-0.035648979246616364
				}
			}
		},
		light_attack_right_last = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_finesse",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.44,
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
					0.3466666666666667,
					-0.20868158340454102,
					0.31882244348526,
					0.17837965488433838,
					-0.6931465864181519,
					0.21367864310741425,
					-0.22222334146499634,
					-0.6515413522720337
				},
				{
					0.36777777777777776,
					-0.17809677124023438,
					0.4570538401603699,
					0.18202567100524902,
					-0.5796858072280884,
					0.21741843223571777,
					-0.1595923900604248,
					-0.768910825252533
				},
				{
					0.3888888888888889,
					-0.10939550399780273,
					0.6196384429931641,
					0.1442950963973999,
					-0.3162991404533386,
					0.21195663511753082,
					-0.10830925405025482,
					-0.9183127284049988
				},
				{
					0.41000000000000003,
					-0.035643577575683594,
					0.7361742854118347,
					0.0018665790557861328,
					0.15179182589054108,
					0.16299735009670258,
					-0.012649533338844776,
					-0.9747980237007141
				},
				{
					0.4311111111111111,
					0.10013008117675781,
					0.7705539464950562,
					-0.30066800117492676,
					0.6150994896888733,
					0.1096552163362503,
					0.08239176869392395,
					-0.7764277458190918
				},
				{
					0.4522222222222222,
					0.3987741470336914,
					0.3247303068637848,
					-0.8190550804138184,
					0.8415489196777344,
					0.19675734639167786,
					0.13511745631694794,
					-0.4845876693725586
				},
				{
					0.47333333333333333,
					0.7245345115661621,
					0.2450278103351593,
					-0.7192736864089966,
					0.706611692905426,
					0.3774919807910919,
					0.4164131283760071,
					-0.4298834800720215
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.37,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "light_slashing_smiter_finesse",
			hit_effect = "melee_hit_axes_1h",
			damage_window_end = 0.48,
			impact_sound_event = "axe_1h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			anim_event = "attack_swing_down",
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
					0.33666666666666667,
					0.21807241439819336,
					0.24418723583221436,
					0.31789612770080566,
					-0.6554926633834839,
					-0.09498004615306854,
					0.030208375304937363,
					-0.7485957741737366
				},
				{
					0.3661111111111111,
					0.18726634979248047,
					0.391807496547699,
					0.2848472595214844,
					-0.5263928771018982,
					-0.10967162251472473,
					-0.00859826523810625,
					-0.8430947661399841
				},
				{
					0.39555555555555555,
					0.13473129272460938,
					0.5584100484848022,
					0.17972898483276367,
					-0.2827797532081604,
					-0.10936576128005981,
					-0.04501732066273689,
					-0.9518656730651855
				},
				{
					0.425,
					0.05039501190185547,
					0.7345894575119019,
					-0.11292994022369385,
					0.35396215319633484,
					-0.0550084225833416,
					-0.030280109494924545,
					-0.933149516582489
				},
				{
					0.45444444444444443,
					-0.06496477127075195,
					0.6619532704353333,
					-0.512045681476593,
					0.817988932132721,
					-0.011468405835330486,
					-0.10198752582073212,
					-0.5660045146942139
				},
				{
					0.48388888888888887,
					-0.09505748748779297,
					0.31425827741622925,
					-0.7354942560195923,
					0.9775539040565491,
					-0.02577848732471466,
					-0.1800408661365509,
					-0.10634423792362213
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
					-0.3881516456604004,
					0.5164315700531006,
					-0.23452311754226685,
					-0.30146560072898865,
					0.7621136903762817,
					-0.04586663842201233,
					-0.5711370706558228
				},
				{
					0.3227777777777778,
					-0.20792627334594727,
					0.6519869565963745,
					-0.13356465101242065,
					-0.03899512439966202,
					0.8208688497543335,
					0.13525351881980896,
					-0.5534981489181519
				},
				{
					0.35888888888888887,
					0.040635108947753906,
					0.7416567802429199,
					-0.0458909273147583,
					0.20983096957206726,
					0.6671550273895264,
					0.5242974758148193,
					-0.4857851266860962
				},
				{
					0.395,
					0.27410078048706055,
					0.7354297637939453,
					0.04078531265258789,
					0.36447566747665405,
					0.47608986496925354,
					0.7113440036773682,
					-0.3667229413986206
				},
				{
					0.4311111111111111,
					0.5050768852233887,
					0.6038322448730469,
					0.1363072395324707,
					0.3858036398887634,
					0.41994383931159973,
					0.8009393811225891,
					-0.18247978389263153
				},
				{
					0.4672222222222222,
					0.7981967926025391,
					0.4228546619415283,
					0.049626708030700684,
					0.5428799986839294,
					0.21791186928749084,
					0.8108705878257751,
					0.016868941485881805
				},
				{
					0.5033333333333333,
					0.9008464813232422,
					0.12993168830871582,
					-0.07772219181060791,
					0.5994481444358826,
					0.030389849096536636,
					0.7998355627059937,
					-0.001235230709426105
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
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/1h_axe"
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
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 3
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 4
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
	we_one_hand_axe_template = weapon_template
}
