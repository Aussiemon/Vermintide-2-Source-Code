local push_radius = 2
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
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
					start_time = 0.7,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.8,
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
					start_time = 0.7,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_left",
					start_time = 0.8,
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
					start_time = 0.7,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.8,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_last = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
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
					sub_action = "light_attack_down",
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
					start_time = 0.7,
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_right",
					start_time = 0.8,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack_left = {
			damage_window_start = 0.22,
			hit_armor_anim = "attack_hit",
			additional_critical_strike_chance = 0,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			width_mod = 25,
			no_damage_impact_sound_event = "blunt_hit_armour",
			hit_shield_stop_anim = "attack_hit",
			use_precision_sweep = true,
			hit_effect = "melee_hit_hammers_1h",
			damage_profile = "medium_blunt_smiter_1h",
			aim_assist_ramp_multiplier = 0.4,
			damage_window_end = 0.32,
			impact_sound_event = "blunt_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
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
					external_multiplier = 1,
					end_time = 0.2,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
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
					0.18666666666666668,
					0.19494342803955078,
					0.32766246795654297,
					0.19522404670715332,
					-0.6413130164146423,
					-0.12424245476722717,
					0.03642956167459488,
					-0.7562766671180725
				},
				{
					0.21444444444444444,
					0.15386199951171875,
					0.4913792610168457,
					0.19536566734313965,
					-0.4043682813644409,
					-0.11895259469747543,
					-0.023840313777327538,
					-0.9065143465995789
				},
				{
					0.24222222222222223,
					0.07084083557128906,
					0.710568904876709,
					-0.026578187942504883,
					0.17714859545230865,
					-0.07496710121631622,
					-0.04339929670095444,
					-0.9803646802902222
				},
				{
					0.27,
					-0.039134979248046875,
					0.717318058013916,
					-0.39658379554748535,
					0.7216252088546753,
					-0.01544339582324028,
					-0.07250432670116425,
					-0.6883034706115723
				},
				{
					0.2977777777777778,
					-0.0940694808959961,
					0.49031877517700195,
					-0.6858594417572021,
					0.9403672218322754,
					-0.01967151276767254,
					-0.14244000613689423,
					-0.3082750141620636
				},
				{
					0.3255555555555556,
					-0.08566856384277344,
					0.1243746280670166,
					-0.7423121929168701,
					0.9725695252418518,
					-0.03329131007194519,
					-0.20668262243270874,
					0.10140256583690643
				},
				{
					0.35333333333333333,
					-0.07590866088867188,
					0.00624394416809082,
					-0.7058160305023193,
					0.9456360936164856,
					-0.04489145800471306,
					-0.22179779410362244,
					0.23358699679374695
				}
			}
		},
		heavy_attack_right = {
			damage_window_start = 0.2,
			hit_armor_anim = "attack_hit",
			additional_critical_strike_chance = 0,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			width_mod = 25,
			no_damage_impact_sound_event = "blunt_hit_armour",
			hit_shield_stop_anim = "attack_hit",
			use_precision_sweep = true,
			hit_effect = "melee_hit_hammers_1h",
			damage_profile = "medium_blunt_smiter_1h",
			aim_assist_ramp_multiplier = 0.4,
			damage_window_end = 0.28,
			impact_sound_event = "blunt_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down_right",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
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
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.5,
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
					0.16666666666666669,
					-0.21459007263183594,
					0.31487584114074707,
					0.17580187320709229,
					-0.7075250148773193,
					0.23821651935577393,
					-0.22463320195674896,
					-0.6262597441673279
				},
				{
					0.19111111111111112,
					-0.1763019561767578,
					0.4107201099395752,
					0.17464208602905273,
					-0.6320229172706604,
					0.2450340986251831,
					-0.1287061870098114,
					-0.7238370776176453
				},
				{
					0.21555555555555558,
					-0.09807395935058594,
					0.5921320915222168,
					0.10444915294647217,
					-0.27627596259117126,
					0.2518009841442108,
					-0.08147745579481125,
					-0.9239206314086914
				},
				{
					0.24000000000000002,
					-0.02826976776123047,
					0.6490464210510254,
					-0.009869575500488281,
					0.18438854813575745,
					0.16500763595104218,
					-0.0018233595183119178,
					-0.9689014554023743
				},
				{
					0.2644444444444445,
					0.1948099136352539,
					0.6699367761611938,
					-0.5758850574493408,
					0.7354743480682373,
					0.14777015149593353,
					0.08898589015007019,
					-0.6552274823188782
				},
				{
					0.2888888888888889,
					0.5576438903808594,
					0.36478090286254883,
					-0.7473573684692383,
					0.7726804614067078,
					0.25599992275238037,
					0.29408085346221924,
					-0.5009446144104004
				},
				{
					0.31333333333333335,
					0.834935188293457,
					0.20276212692260742,
					-0.6351335048675537,
					0.646497905254364,
					0.4290018081665039,
					0.5108902454376221,
					-0.3701203167438507
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
			width_mod = 25,
			damage_profile = "light_blunt_tank_diag",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.52,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.55,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default_left",
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3466666666666667,
					0.4885520935058594,
					0.4679558277130127,
					0.0647127628326416,
					-0.6736188530921936,
					-0.2653895318508148,
					0.13745751976966858,
					-0.6759523749351501
				},
				{
					0.3811111111111111,
					0.39832592010498047,
					0.5772593021392822,
					0.06015574932098389,
					-0.5106564164161682,
					-0.3416144549846649,
					0.1386006772518158,
					-0.7767364382743835
				},
				{
					0.41555555555555557,
					0.20271873474121094,
					0.7084746360778809,
					-0.023415327072143555,
					-0.17738527059555054,
					-0.40113234519958496,
					0.04136456921696663,
					-0.897728443145752
				},
				{
					0.45,
					-0.13530349731445312,
					0.7280949354171753,
					-0.1989368200302124,
					0.4065392017364502,
					-0.33075085282325745,
					-0.2201131284236908,
					-0.8227271437644958
				},
				{
					0.48444444444444446,
					-0.3790121078491211,
					0.4309518337249756,
					-0.388447642326355,
					0.873930037021637,
					-0.10680823773145676,
					-0.3687586486339569,
					-0.29808616638183594
				},
				{
					0.518888888888889,
					-0.3817605972290039,
					0.10535335540771484,
					-0.5103073120117188,
					0.9383577108383179,
					-0.054721977561712265,
					-0.31594955921173096,
					0.1290976107120514
				},
				{
					0.5533333333333333,
					-0.35121917724609375,
					-0.009827613830566406,
					-0.4921696186065674,
					0.9259192943572998,
					-0.04427545890212059,
					-0.27810096740722656,
					0.2517399191856384
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.37,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			width_mod = 25,
			damage_profile = "light_blunt_tank_diag",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.47,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default_right",
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.33666666666666667,
					-0.30158329010009766,
					0.20798635482788086,
					0.06473982334136963,
					0.8167173266410828,
					-0.11386890709400177,
					0.35492727160453796,
					0.4404921233654022
				},
				{
					0.36444444444444446,
					-0.2488412857055664,
					0.34107017517089844,
					0.0670328140258789,
					-0.7675599455833435,
					0.20887048542499542,
					-0.21025682985782623,
					-0.5683457255363464
				},
				{
					0.3922222222222222,
					-0.14381980895996094,
					0.5527217388153076,
					0.028610944747924805,
					-0.49988579750061035,
					0.36797869205474854,
					-0.09171658754348755,
					-0.7786487936973572
				},
				{
					0.42,
					0.011074066162109375,
					0.6854009628295898,
					-0.07478368282318115,
					-0.1005382090806961,
					0.4324178099632263,
					0.05900471657514572,
					-0.8941059112548828
				},
				{
					0.4477777777777778,
					0.4994335174560547,
					0.62831711769104,
					-0.37764662504196167,
					0.6535205245018005,
					0.26729655265808105,
					0.37946856021881104,
					-0.5978855490684509
				},
				{
					0.4755555555555555,
					0.7624044418334961,
					0.400907039642334,
					-0.5145911574363708,
					0.6807026267051697,
					0.29766547679901123,
					0.501364529132843,
					-0.44347813725471497
				},
				{
					0.5033333333333333,
					0.8569192886352539,
					0.17746353149414062,
					-0.6065747737884521,
					0.6251816153526306,
					0.4463402330875397,
					0.5327504277229309,
					-0.3551132380962372
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.38,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.2,
			use_precision_sweep = false,
			width_mod = 25,
			additional_critical_strike_chance = 0.1,
			damage_profile = "light_blunt_smiter",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.52,
			impact_sound_event = "blunt_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 2,
			anim_event = "attack_swing_left_diagonal_last",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0.1,
					external_multiplier = 1.3,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.9,
					end_time = 0.9,
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3466666666666667,
					0.4788246154785156,
					0.4987616539001465,
					-0.4393960237503052,
					0.22543755173683167,
					0.8471519351005554,
					-0.31082168221473694,
					0.3672892153263092
				},
				{
					0.3811111111111111,
					0.2208261489868164,
					0.7079302072525024,
					-0.29735732078552246,
					-0.11071814596652985,
					0.9228713512420654,
					-0.05655781179666519,
					0.3644876480102539
				},
				{
					0.41555555555555557,
					-0.029570579528808594,
					0.6876910924911499,
					-0.014702081680297852,
					-0.13267849385738373,
					0.7573058009147644,
					0.5766598582267761,
					0.27631115913391113
				},
				{
					0.45,
					-0.19774341583251953,
					0.5116655826568604,
					0.18982267379760742,
					-0.20348705351352692,
					0.4518566131591797,
					0.856343150138855,
					0.14524142444133759
				},
				{
					0.48444444444444446,
					-0.2860527038574219,
					0.2703096866607666,
					0.2858177423477173,
					-0.1642581820487976,
					0.1850966364145279,
					0.9329472780227661,
					0.2614724934101105
				},
				{
					0.518888888888889,
					-0.33072757720947266,
					-0.14343047142028809,
					0.2529587745666504,
					-0.2619725167751312,
					0.016284294426441193,
					0.9203823208808899,
					0.28983038663864136
				},
				{
					0.5533333333333333,
					-0.254119873046875,
					-0.44881582260131836,
					0.17182016372680664,
					-0.31001773476600647,
					-0.06482002884149551,
					0.9187907576560974,
					0.23560774326324463
				}
			}
		},
		light_attack_down = {
			damage_window_start = 0.38,
			range_mod = 1.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = true,
			width_mod = 25,
			damage_profile = "light_blunt_smiter",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.45,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_down_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.35,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.85,
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
					-0.2155599594116211,
					0.2979586124420166,
					0.17695772647857666,
					-0.6996107697486877,
					0.22854512929916382,
					-0.2507716715335846,
					-0.6288286447525024
				},
				{
					0.36944444444444446,
					-0.1874837875366211,
					0.4160645008087158,
					0.1811835765838623,
					-0.6091817021369934,
					0.21570880711078644,
					-0.17163197696208954,
					-0.7435790300369263
				},
				{
					0.39222222222222225,
					-0.12880611419677734,
					0.5870962142944336,
					0.16123104095458984,
					-0.4042046070098877,
					0.21779610216617584,
					-0.12262416630983353,
					-0.8798561096191406
				},
				{
					0.41500000000000004,
					-0.05316925048828125,
					0.7178025245666504,
					0.038548946380615234,
					0.051250312477350235,
					0.17500180006027222,
					-0.04108492285013199,
					-0.9823746085166931
				},
				{
					0.43777777777777777,
					0.1009054183959961,
					0.770221471786499,
					-0.3026658296585083,
					0.6162154674530029,
					0.1098581999540329,
					0.08260688930749893,
					-0.7754907011985779
				},
				{
					0.46055555555555555,
					0.4026670455932617,
					0.3218672275543213,
					-0.8195931911468506,
					0.841169536113739,
					0.19860783219337463,
					0.13755077123641968,
					-0.4838063418865204
				},
				{
					0.48333333333333334,
					0.7746467590332031,
					0.25507259368896484,
					-0.6675475835800171,
					0.6638069152832031,
					0.40127646923065186,
					0.46785926818847656,
					-0.4236098527908325
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.33,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "light_blunt_tank",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.47,
			impact_sound_event = "blunt_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default",
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
					0.2966666666666667,
					-0.4027719497680664,
					0.48967480659484863,
					-0.09750592708587646,
					-0.5091506242752075,
					0.5468618869781494,
					-0.20141266286373138,
					-0.6333567500114441
				},
				{
					0.33111111111111113,
					-0.3001747131347656,
					0.6076433658599854,
					-0.09796810150146484,
					-0.3777002692222595,
					0.6286516785621643,
					-0.13852091133594513,
					-0.6655460596084595
				},
				{
					0.3655555555555556,
					-0.11081981658935547,
					0.6949076652526855,
					-0.10968446731567383,
					-0.14913177490234375,
					0.6919703483581543,
					0.050288889557123184,
					-0.7045621871948242
				},
				{
					0.4,
					0.1674661636352539,
					0.6748830080032349,
					-0.13327240943908691,
					0.2410525530576706,
					0.6148346066474915,
					0.4279842972755432,
					-0.6170101761817932
				},
				{
					0.4344444444444444,
					0.45091819763183594,
					0.555657148361206,
					-0.1395580768585205,
					0.48617297410964966,
					0.40079790353775024,
					0.6452553868293762,
					-0.43202120065689087
				},
				{
					0.4688888888888889,
					0.6192913055419922,
					0.38524699211120605,
					-0.15521931648254395,
					0.5911787152290344,
					0.30636364221572876,
					0.715324342250824,
					-0.21203793585300446
				},
				{
					0.5033333333333333,
					0.7134914398193359,
					0.2103252410888672,
					-0.18308770656585693,
					0.63018798828125,
					0.2797117531299591,
					0.723551869392395,
					-0.03312431648373604
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			no_damage_impact_sound_event = "slashing_hit_armour",
			attack_template = "basic_sweep_push",
			damage_profile_outer = "light_push",
			weapon_action_hand = "right",
			push_angle = 100,
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.2,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
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
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_hammer"
weapon_template.wield_anim = "to_1h_hammer"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "MACE_1H"
weapon_template.max_fatigue_points = 9
weapon_template.dodge_count = 3
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
		penetrating = false,
		arc = 2
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
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
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
	"wwise/one_handed_hammers"
}
local one_handed_hammer_template_1 = table.clone(weapon_template)
local one_handed_hammer_template_2 = table.clone(weapon_template)
local inspect_table = table.clone(ActionTemplates.action_inspect)
inspect_table.action_inspect_hold.anim_event = "inspect_start_2"
one_handed_hammer_template_2.actions.action_inspect = inspect_table

return {
	one_handed_hammer_template_1 = one_handed_hammer_template_1,
	one_handed_hammer_template_2 = one_handed_hammer_template_2
}
