local push_radius = 2
local time_mod = 1
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_charge_diagonal",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.65,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right_first",
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
					start_time = 0.3,
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
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_charge_left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.65,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right_second",
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
					start_time = 0.3,
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
		default_right_2 = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.65,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right_second",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_2",
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
					start_time = 0.3,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_2",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_charge_left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.65,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_stab_left",
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
					start_time = 0.3,
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
		default_left_last = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_charge_left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.65,
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
					start_time = 0.3,
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
			damage_window_start = 0.15,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.15,
			no_damage_impact_sound_event = "slashing_dagger_hit_armour",
			weapon_action_hand = "both",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_dagger",
			damage_profile_left = "light_slashing_linesman_dual_medium",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_dagger_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "light_slashing_linesman_dual_medium",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.1,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right_2",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 0.75,
					input = "action_one"
				},
				{
					sub_action = "default_right_2",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 0.75,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			dual_hit_stop_anims = {
				left = "shake_hit",
				right = "shake_hit"
			},
			baked_sweep_right = {
				{
					0.11666666666666667,
					-0.3256791830062866,
					0.23079872131347656,
					0.025080561637878418,
					-0.5979181528091431,
					0.27123644948005676,
					-0.04202171787619591,
					-0.7530995011329651
				},
				{
					0.16944444444444445,
					-0.2999471426010132,
					0.3388514518737793,
					0.002899646759033203,
					-0.40154531598091125,
					0.3791784346103668,
					-0.1326807588338852,
					-0.8230315446853638
				},
				{
					0.2222222222222222,
					-0.24021899700164795,
					0.4552578926086426,
					0.009737968444824219,
					-0.18552634119987488,
					0.453840434551239,
					-0.08418985456228256,
					-0.8674796223640442
				},
				{
					0.275,
					0.032650113105773926,
					0.6443963050842285,
					-0.10744071006774902,
					0.22980181872844696,
					0.5064882636070251,
					0.16745643317699432,
					-0.8140142560005188
				},
				{
					0.3277777777777778,
					0.4263138771057129,
					0.588468074798584,
					-0.2670562267303467,
					0.5878671407699585,
					0.39176881313323975,
					0.4158705174922943,
					-0.5726964473724365
				},
				{
					0.38055555555555554,
					0.5688663721084595,
					0.40119218826293945,
					-0.3197830319404602,
					0.6795642375946045,
					0.2732730209827423,
					0.5061241984367371,
					-0.4553598165512085
				},
				{
					0.43333333333333335,
					0.6280390024185181,
					0.20671415328979492,
					-0.33127474784851074,
					0.7066143751144409,
					0.16736921668052673,
					0.5485785007476807,
					-0.4144216775894165
				}
			},
			baked_sweep_left = {
				{
					0.11666666666666667,
					0.2717808485031128,
					0.24435758590698242,
					0.028969168663024902,
					0.22054670751094818,
					-0.5833795070648193,
					0.6708729267120361,
					0.40119457244873047
				},
				{
					0.16944444444444445,
					0.2603496313095093,
					0.2710866928100586,
					0.03248286247253418,
					0.23082944750785828,
					-0.5723357200622559,
					0.6674075722694397,
					0.4167933762073517
				},
				{
					0.2222222222222222,
					0.26002323627471924,
					0.4096236228942871,
					0.026545166969299316,
					0.30175110697746277,
					-0.4608345627784729,
					0.6881001591682434,
					0.47233033180236816
				},
				{
					0.275,
					-0.0001404285430908203,
					0.7007064819335938,
					-0.11366653442382812,
					0.4407689869403839,
					0.0937085673213005,
					0.8880385756492615,
					0.09126222133636475
				},
				{
					0.3277777777777778,
					-0.3227043151855469,
					0.6614370346069336,
					-0.2974388599395752,
					0.29065465927124023,
					0.520671010017395,
					0.7891215085983276,
					-0.14733901619911194
				},
				{
					0.38055555555555554,
					-0.4801543951034546,
					0.20882654190063477,
					-0.43370044231414795,
					0.23300142586231232,
					0.7548474669456482,
					0.48824676871299744,
					-0.37085145711898804
				},
				{
					0.43333333333333335,
					-0.5289956331253052,
					-0.06697273254394531,
					-0.4556153416633606,
					0.2274320423603058,
					0.7877354025840759,
					0.2996958792209625,
					-0.48778071999549866
				}
			}
		},
		heavy_attack_2 = {
			damage_window_start = 0.13,
			range_mod = 1,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_dagger_hit_armour",
			weapon_action_hand = "both",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = false,
			damage_profile_left = "light_slashing_smiter_stab_dual",
			hit_effect = "melee_hit_dagger",
			attack_direction = "up",
			damage_window_end = 0.25,
			impact_sound_event = "slashing_dagger_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "light_slashing_smiter_stab_dual",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy",
			hit_stop_anim = "attack_hit",
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
				},
				{
					start_time = 0.25,
					external_multiplier = 0.75,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 0.75,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 0.75,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			dual_hit_stop_anims = {
				left = "attack_hit",
				right = "attack_hit"
			},
			baked_sweep_right = {
				{
					0.09666666666666668,
					0.3279433250427246,
					0.11156177520751953,
					0.37462282180786133,
					0.8450382947921753,
					0.07201321423053741,
					-0.08995925635099411,
					-0.5221414566040039
				},
				{
					0.1277777777777778,
					0.2782094478607178,
					0.252532958984375,
					0.3468773365020752,
					0.8068364858627319,
					0.13985589146614075,
					-0.02091011218726635,
					-0.5736009478569031
				},
				{
					0.15888888888888889,
					0.2414708137512207,
					0.41097402572631836,
					0.2939016819000244,
					0.7809834480285645,
					0.17182694375514984,
					0.03196083381772041,
					-0.5995989441871643
				},
				{
					0.19,
					0.1803302764892578,
					0.5931987762451172,
					0.17012977600097656,
					0.8455005884170532,
					0.2155127078294754,
					-0.0027582417242228985,
					-0.48854419589042664
				},
				{
					0.2211111111111111,
					0.09122705459594727,
					0.7246432304382324,
					-0.08066225051879883,
					0.9598720073699951,
					0.18801960349082947,
					-0.1463102102279663,
					-0.14794501662254333
				},
				{
					0.25222222222222224,
					0.03131723403930664,
					0.7248125076293945,
					-0.320473313331604,
					0.9754773378372192,
					0.06743200868368149,
					-0.1769523322582245,
					0.11218161135911942
				},
				{
					0.2833333333333333,
					0.03714323043823242,
					0.6629328727722168,
					-0.44745540618896484,
					0.9619588851928711,
					0.04189501702785492,
					-0.10624106228351593,
					0.24817883968353271
				}
			},
			baked_sweep_left = {
				{
					0.09666666666666668,
					-0.2278066873550415,
					0.055071353912353516,
					0.3788630962371826,
					0.8647637367248535,
					0.04777708277106285,
					0.11803654581308365,
					-0.48576581478118896
				},
				{
					0.1277777777777778,
					-0.20270907878875732,
					0.20779848098754883,
					0.3667008876800537,
					0.8389014601707458,
					-0.012860880233347416,
					0.07811062783002853,
					-0.5384958386421204
				},
				{
					0.15888888888888889,
					-0.2116870880126953,
					0.3745608329772949,
					0.32573437690734863,
					0.8263273239135742,
					-0.027311746031045914,
					0.06207733973860741,
					-0.5590919256210327
				},
				{
					0.19,
					-0.18058109283447266,
					0.5840592384338379,
					0.20660710334777832,
					0.888524055480957,
					-0.02126121334731579,
					0.08354292064905167,
					-0.4506590664386749
				},
				{
					0.2211111111111111,
					-0.11402511596679688,
					0.7366704940795898,
					-0.057155609130859375,
					0.9775705933570862,
					-0.026730075478553772,
					0.1337546557188034,
					-0.16047115623950958
				},
				{
					0.25222222222222224,
					-0.1017603874206543,
					0.7342138290405273,
					-0.2975778579711914,
					0.984494149684906,
					-0.09740934520959854,
					0.14004695415496826,
					0.04086046665906906
				},
				{
					0.2833333333333333,
					-0.12096738815307617,
					0.6764678955078125,
					-0.4295804500579834,
					0.9841141104698181,
					-0.07982629537582397,
					0.060635849833488464,
					0.14652851223945618
				}
			}
		},
		light_attack_right_second = {
			damage_window_start = 0.3,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "right",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "light_slashing_linesman_dual",
			hit_effect = "melee_hit_dagger",
			aim_assist_max_ramp_multiplier = 0.6,
			damage_window_end = 0.45,
			impact_sound_event = "slashing_dagger_hit",
			charge_value = "light_attack",
			no_damage_impact_sound_event = "stab_hit_armour",
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 2.5,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_right_diagonal",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.43,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
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
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					-0.23546016216278076,
					0.27011775970458984,
					0.05386604368686676,
					-0.6470598578453064,
					0.2641404867172241,
					-0.4261489510536194,
					-0.5744044780731201
				},
				{
					0.30277777777777776,
					-0.12363409996032715,
					0.5478129386901855,
					0.016968384385108948,
					-0.3552611172199249,
					0.40234997868537903,
					-0.19295546412467957,
					-0.8213843703269958
				},
				{
					0.3388888888888889,
					0.21794307231903076,
					0.6774625778198242,
					-0.13129733502864838,
					0.4222823679447174,
					0.4197070002555847,
					0.32835543155670166,
					-0.7332846522331238
				},
				{
					0.375,
					0.5238136053085327,
					0.5764822959899902,
					-0.25783586502075195,
					0.6230329871177673,
					0.3443479835987091,
					0.46442079544067383,
					-0.5268471837043762
				},
				{
					0.4111111111111111,
					0.677791953086853,
					0.44492149353027344,
					-0.31659364700317383,
					0.6614298224449158,
					0.31468960642814636,
					0.4638844132423401,
					-0.4982893466949463
				},
				{
					0.44722222222222224,
					0.6940033435821533,
					0.30116987228393555,
					-0.36083316802978516,
					0.7374743819236755,
					0.2130928635597229,
					0.5315783023834229,
					-0.3579770028591156
				},
				{
					0.48333333333333334,
					0.34147655963897705,
					0.16527271270751953,
					-0.44001245498657227,
					0.787267804145813,
					-0.03324025496840477,
					0.6001006364822388,
					0.13778144121170044
				}
			}
		},
		light_attack_right_first = {
			damage_window_start = 0.18,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			sweep_z_offset = 0.05,
			weapon_action_hand = "right",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_linesman_dual",
			damage_window_end = 0.35,
			impact_sound_event = "slashing_hit",
			charge_value = "light_attack",
			no_damage_impact_sound_event = "stab_hit_armour",
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 2.5,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_left",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.33,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
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
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.14666666666666667,
					0.3619316816329956,
					0.5268740653991699,
					-0.30338025093078613,
					0.3147548735141754,
					0.8376545310020447,
					0.22424030303955078,
					0.3859800100326538
				},
				{
					0.18611111111111112,
					0.33389461040496826,
					0.5908818244934082,
					-0.2607131600379944,
					0.10500767081975937,
					0.8494272232055664,
					0.14595620334148407,
					0.49612852931022644
				},
				{
					0.22555555555555556,
					0.11820471286773682,
					0.6344280242919922,
					-0.15836602449417114,
					-0.01960488222539425,
					0.7475141286849976,
					0.5060113668441772,
					0.42987290024757385
				},
				{
					0.265,
					-0.17460715770721436,
					0.5880584716796875,
					0.006090283393859863,
					-0.058677300810813904,
					0.7150704860687256,
					0.613818347454071,
					0.32932981848716736
				},
				{
					0.3044444444444444,
					-0.37930309772491455,
					0.3874826431274414,
					0.10672211647033691,
					-0.2574058175086975,
					0.6021924018859863,
					0.7168181538581848,
					0.23932912945747375
				},
				{
					0.3438888888888889,
					-0.43772339820861816,
					0.20284080505371094,
					0.08614951372146606,
					-0.4780292510986328,
					0.4117177426815033,
					0.7705966234207153,
					0.09031867235898972
				},
				{
					0.3833333333333333,
					-0.40806376934051514,
					0.014173030853271484,
					0.017623066902160645,
					-0.6463924646377563,
					0.21337009966373444,
					0.7308382987976074,
					-0.050253745168447495
				}
			}
		},
		light_attack_stab_left = {
			damage_window_start = 0.27,
			range_mod = 0.85,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "stab_hit_armour",
			sweep_z_offset = 0.05,
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = true,
			invert_attack_direction = true,
			hit_effect = "melee_hit_dagger",
			damage_profile = "light_fencer_stab_diag",
			damage_window_end = 0.45,
			impact_sound_event = "slashing_dagger_hit",
			charge_value = "light_attack",
			anim_end_event = "attack_finished",
			ignore_armour_hit = true,
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 2.5,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left_last",
					start_time = 0.43,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
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
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			baked_sweep = {
				{
					0.2366666666666667,
					-0.4471012353897095,
					0.352231502532959,
					-0.19664061069488525,
					0.828222393989563,
					0.24968509376049042,
					-0.4498332142829895,
					-0.22216013073921204
				},
				{
					0.2777777777777778,
					-0.31097257137298584,
					0.4923577308654785,
					-0.12771987915039062,
					0.816128134727478,
					0.11511119455099106,
					-0.5139565467834473,
					-0.23776666820049286
				},
				{
					0.3188888888888889,
					0.013799786567687988,
					0.6807651519775391,
					-0.023511052131652832,
					0.8095489740371704,
					-0.13272365927696228,
					-0.4602978229522705,
					-0.339324027299881
				},
				{
					0.36,
					0.2956596612930298,
					0.600590705871582,
					0.06909322738647461,
					0.7056963443756104,
					-0.3254665434360504,
					-0.41933947801589966,
					-0.4692746102809906
				},
				{
					0.4011111111111111,
					0.45577800273895264,
					0.321563720703125,
					0.12680292129516602,
					0.5839014649391174,
					-0.4990648031234741,
					-0.3136575520038605,
					-0.5582225322723389
				},
				{
					0.4422222222222222,
					0.5084718465805054,
					0.2042984962463379,
					0.10547757148742676,
					0.4928840100765228,
					-0.5502739548683167,
					-0.24590614438056946,
					-0.6275301575660706
				},
				{
					0.48333333333333334,
					0.5840193033218384,
					0.19588184356689453,
					0.11566042900085449,
					0.43320244550704956,
					-0.5834693908691406,
					-0.19951200485229492,
					-0.6573386192321777
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.2,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "right",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = true,
			ignore_armour_hit = true,
			damage_profile = "light_slashing_smiter_stab",
			hit_effect = "melee_hit_dagger",
			aim_assist_max_ramp_multiplier = 0.8,
			damage_window_end = 0.35,
			impact_sound_event = "slashing_dagger_hit",
			charge_value = "light_attack",
			no_damage_impact_sound_event = "stab_hit_armour",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 2.5,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.6,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 0.6,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
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
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			baked_sweep = {
				{
					0.16666666666666669,
					0.40977954864501953,
					-0.49143457412719727,
					-0.06156039237976074,
					0.22943556308746338,
					0.6574403047561646,
					0.6385698914527893,
					-0.32765862345695496
				},
				{
					0.20277777777777778,
					0.39598584175109863,
					-0.2108759880065918,
					-0.0018177032470703125,
					0.2517130672931671,
					0.6613507866859436,
					0.6177823543548584,
					-0.3429296016693115
				},
				{
					0.23888888888888887,
					0.2632782459259033,
					0.23083925247192383,
					-0.0017459392547607422,
					0.2688276469707489,
					0.6449808478355408,
					0.6347120404243469,
					-0.3299579322338104
				},
				{
					0.275,
					0.1493382453918457,
					0.5617899894714355,
					-0.019859790802001953,
					0.267509788274765,
					0.6526058912277222,
					0.621412992477417,
					-0.34115979075431824
				},
				{
					0.3111111111111111,
					0.14366602897644043,
					0.5869154930114746,
					-0.022437334060668945,
					0.2686193287372589,
					0.6464952826499939,
					0.6202526092529297,
					-0.3537997007369995
				},
				{
					0.3472222222222222,
					0.14047980308532715,
					0.5901303291320801,
					-0.020305395126342773,
					0.2696914076805115,
					0.6421971917152405,
					0.6165700554847717,
					-0.3670024573802948
				},
				{
					0.3833333333333333,
					0.131378173828125,
					0.5981802940368652,
					-0.020437240600585938,
					0.26693442463874817,
					0.6416582465171814,
					0.6148076057434082,
					-0.3728705048561096
				}
			}
		},
		push_stab = {
			damage_window_start = 0.26,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "stab_hit_armour",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = true,
			ignore_armour_hit = true,
			damage_profile = "light_slashing_smiter_stab",
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.35,
			impact_sound_event = "stab_hit",
			reset_aim_on_attack = true,
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "push_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.6,
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
					sub_action = "default_right_2",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right_2",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.22666666666666668,
					0.3149312734603882,
					0.0818023681640625,
					0.000882565975189209,
					0.266635537147522,
					0.6476720571517944,
					0.6345635652542114,
					-0.3267346918582916
				},
				{
					0.25277777777777777,
					0.20708715915679932,
					0.39281129837036133,
					-0.008684277534484863,
					0.26977548003196716,
					0.6489343047142029,
					0.6267244219779968,
					-0.3366335928440094
				},
				{
					0.2788888888888889,
					0.1474825143814087,
					0.5687422752380371,
					-0.02050846815109253,
					0.2676539421081543,
					0.652190625667572,
					0.6217483282089233,
					-0.3412300944328308
				},
				{
					0.305,
					0.14358794689178467,
					0.5880575180053711,
					-0.02371770143508911,
					0.26880109310150146,
					0.6476420164108276,
					0.6207746863365173,
					-0.35063478350639343
				},
				{
					0.3311111111111111,
					0.1423635482788086,
					0.5854649543762207,
					-0.020507216453552246,
					0.26979222893714905,
					0.6436053514480591,
					0.6175970435142517,
					-0.36270979046821594
				},
				{
					0.3572222222222222,
					0.13707447052001953,
					0.5928325653076172,
					-0.019857347011566162,
					0.26867908239364624,
					0.6419967412948608,
					0.6155573129653931,
					-0.36978524923324585
				},
				{
					0.3833333333333333,
					0.1316455602645874,
					0.597902774810791,
					-0.020357131958007812,
					0.2670561671257019,
					0.6416903138160706,
					0.6148267984390259,
					-0.3726966679096222
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			fatigue_cost = "action_stun_push",
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
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "push_stab",
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
					external_multiplier = 0.85,
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
					start_time = 0.2,
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
	action_wield = ActionTemplates.wield
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_dual_weapons"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "DUAL_SWORD_DAGGER_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 6
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.75
weapon_template.outer_block_fatigue_point_multiplier = 1.5
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25
	}
}
weapon_template.wield_anim = "to_dual_sword_dagger"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/dual_sword_dagger"
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
		arc = 0
	},
	hold_attack = {
		penetrating = true,
		arc = 1
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
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 3
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 4
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
		sub_action_name = "light_attack_right_first"
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
	"wwise/one_handed_daggers"
}

return {
	dual_wield_sword_dagger_template_1 = table.clone(weapon_template)
}
