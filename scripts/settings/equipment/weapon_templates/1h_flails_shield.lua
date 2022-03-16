local push_radius = 2.5
local time_mod = 1
local weapon_template = {
	actions = {
		action_one = {
			default = {
				blocking_charge = true,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				stop_action_on_leave_for_bot = true,
				blocking_charge_start_time = 0.3,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge",
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
						sub_action = "light_attack_01",
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
						start_time = 0.2,
						action = "action_one",
						send_buffer = true,
						end_time = 0.5,
						input = "action_one_hold"
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
			default_02 = {
				kind = "melee_start",
				blocking_charge_start_time = 0.3,
				anim_end_event = "attack_finished",
				blocking_charge = true,
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
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
						external_multiplier = 0.75,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_02",
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
						start_time = 0.3,
						action = "action_one",
						send_buffer = true,
						end_time = 0.8,
						input = "action_one_hold"
					},
					{
						sub_action = "default_charge_2",
						send_buffer = true,
						action = "action_one",
						auto_chain = true,
						start_time = 0.8
					}
				}
			},
			default_02_pose = {
				kind = "melee_start",
				blocking_charge_start_time = 0.3,
				anim_end_event = "attack_finished",
				blocking_charge = true,
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_pose",
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
						sub_action = "light_attack_02_pose",
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
						start_time = 0.3,
						action = "action_one",
						send_buffer = true,
						end_time = 0.8,
						input = "action_one_hold"
					},
					{
						sub_action = "default_charge_2",
						send_buffer = true,
						action = "action_one",
						auto_chain = true,
						start_time = 0.8
					}
				}
			},
			default_03 = {
				kind = "melee_start",
				blocking_charge_start_time = 0.3,
				anim_end_event = "attack_finished",
				blocking_charge = true,
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
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
						sub_action = "light_attack_03",
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
			default_03_pose = {
				kind = "melee_start",
				blocking_charge_start_time = 0.3,
				anim_end_event = "attack_finished",
				blocking_charge = true,
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_down_pose",
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
						sub_action = "light_attack_03",
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
			default_04 = {
				kind = "melee_start",
				blocking_charge_start_time = 0.3,
				anim_end_event = "attack_finished",
				blocking_charge = true,
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
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
						external_multiplier = 0.75,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_04",
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
			default_05 = {
				kind = "melee_start",
				blocking_charge_start_time = 0.3,
				anim_end_event = "attack_finished",
				blocking_charge = true,
				stop_action_on_leave_for_bot = true,
				aim_assist_ramp_decay_delay = 0.1,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_pose",
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
						sub_action = "light_attack_05",
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
			default_06 = {
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				anim_event = "attack_swing_charge_pose",
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
						sub_action = "light_attack_05",
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
				chain_block_charge = true,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				blocking_charge_start_time = 0,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				blocking_charge = true,
				uninterruptible = true,
				anim_event = "attack_swing_charge",
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
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
						sub_action = "heavy_attack",
						start_time = 0.3,
						action = "action_one",
						end_time = 0.83,
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
				chain_block_charge = true,
				anim_end_event = "attack_finished",
				kind = "melee_start",
				stop_action_on_leave_for_bot = true,
				blocking_charge_start_time = 0,
				aim_assist_max_ramp_multiplier = 0.4,
				aim_assist_ramp_multiplier = 0.2,
				blocking_charge = true,
				uninterruptible = true,
				anim_event = "attack_swing_charge",
				aim_assist_ramp_decay_delay = 0.1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
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
						sub_action = "heavy_attack_02",
						start_time = 0.3,
						action = "action_one",
						end_time = 0.83,
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
						sub_action = "heavy_attack_02",
						start_time = 0.5,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			heavy_attack = {
				damage_window_start = 0.37,
				kind = "sweep",
				range_mod = 1.4,
				damage_window_end = 0.53,
				sweep_z_offset = 0.35,
				width_mod = 25,
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				hit_effect = "melee_hit_hammers_1h",
				ignore_armour_hit = true,
				damage_profile = "medium_blunt_tank_spiked",
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
				anim_event = "attack_swing_left",
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
						external_multiplier = 0.65,
						end_time = 0.4,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.6,
						action = "action_one",
						release_required = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default_02",
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
						0.5366640090942383,
						0.35484790802001953,
						-0.03169822692871094,
						-0.6814677715301514,
						-0.39010003209114075,
						0.3151162564754486,
						-0.533034086227417
					},
					{
						0.37444444444444447,
						0.4519047737121582,
						0.5119132995605469,
						-0.049774169921875,
						-0.49719130992889404,
						-0.634907603263855,
						0.29758045077323914,
						-0.5110175013542175
					},
					{
						0.4122222222222222,
						0.26745033264160156,
						0.6826362609863281,
						-0.0606389045715332,
						0.022290857508778572,
						-0.6979926228523254,
						-0.031055264174938202,
						-0.7150838971138
					},
					{
						0.45,
						0.000774383544921875,
						0.6831798553466797,
						-0.1499347686767578,
						0.6020323634147644,
						-0.18538042902946472,
						-0.26469358801841736,
						-0.7301564812660217
					},
					{
						0.48777777777777775,
						-0.3128962516784668,
						0.5168027877807617,
						-0.2390146255493164,
						0.4821028411388397,
						0.31052684783935547,
						-0.3431299924850464,
						-0.7439164519309998
					},
					{
						0.5255555555555556,
						-0.4045748710632324,
						0.36989688873291016,
						-0.1760573387145996,
						-0.09305273741483688,
						0.48018983006477356,
						-0.36076438426971436,
						-0.7941083312034607
					},
					{
						0.5633333333333334,
						-0.4128541946411133,
						0.3047914505004883,
						-0.12338447570800781,
						-0.39273202419281006,
						0.45203697681427,
						-0.374819278717041,
						-0.7077674269676208
					}
				}
			},
			heavy_attack_02 = {
				damage_window_start = 0.37,
				kind = "sweep",
				range_mod = 1.4,
				damage_window_end = 0.53,
				sweep_z_offset = 0.35,
				width_mod = 25,
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				hit_effect = "melee_hit_hammers_1h",
				ignore_armour_hit = true,
				damage_profile = "medium_blunt_tank_spiked",
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
				anim_event = "attack_swing_heavy_left",
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
						external_multiplier = 0.65,
						end_time = 0.4,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.6,
						action = "action_one",
						release_required = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1,
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
						0.5857558250427246,
						0.36496448516845703,
						-0.2018451690673828,
						0.4797491431236267,
						0.6952961683273315,
						-0.2867049276828766,
						0.45188966393470764
					},
					{
						0.37444444444444447,
						0.4757256507873535,
						0.5173664093017578,
						-0.19837045669555664,
						0.3466726541519165,
						0.8053814172744751,
						-0.23978686332702637,
						0.4167506992816925
					},
					{
						0.4122222222222222,
						0.2765474319458008,
						0.6604061126708984,
						-0.13576459884643555,
						0.0003676372580230236,
						-0.7794805765151978,
						-0.1286650449037552,
						-0.6130703687667847
					},
					{
						0.45,
						-0.05086946487426758,
						0.6672182083129883,
						-0.08922433853149414,
						0.46263113617897034,
						-0.4548376798629761,
						-0.5684788227081299,
						-0.5058923363685608
					},
					{
						0.48777777777777775,
						-0.3317742347717285,
						0.49251365661621094,
						-0.0723123550415039,
						-0.568436861038208,
						0.2889002859592438,
						0.7156077027320862,
						0.2851698100566864
					},
					{
						0.5255555555555556,
						-0.37174224853515625,
						0.3353252410888672,
						0.013843059539794922,
						-0.3988399803638458,
						-0.006324927322566509,
						0.8211105465888977,
						0.408245325088501
					},
					{
						0.5633333333333334,
						-0.3676571846008301,
						0.24660491943359375,
						0.003047943115234375,
						0.02845904789865017,
						0.13006591796875,
						-0.8390867710113525,
						-0.5274527668952942
					}
				}
			},
			light_attack_01 = {
				damage_window_start = 0.41,
				range_mod = 1.25,
				kind = "sweep",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				ignore_armour_hit = false,
				width_mod = 25,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.5,
				impact_sound_event = "flail_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_down",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
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
						sub_action = "default_02_pose",
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
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.37666666666666665,
						0.23894548416137695,
						0.21222519874572754,
						0.3415173292160034,
						-0.687382698059082,
						-0.1360219568014145,
						0.11680406332015991,
						-0.7038180828094482
					},
					{
						0.4027777777777778,
						0.16224288940429688,
						0.37315797805786133,
						0.24979329109191895,
						-0.38668736815452576,
						-0.10826466977596283,
						0.07277677208185196,
						-0.9129377007484436
					},
					{
						0.4288888888888889,
						0.061926841735839844,
						0.5718786716461182,
						-0.005107998847961426,
						0.3509867191314697,
						-0.05481863394379616,
						0.024785352870821953,
						-0.9344457983970642
					},
					{
						0.45499999999999996,
						0.018807411193847656,
						0.6778409481048584,
						-0.10299134254455566,
						0.5416378378868103,
						-0.09728484600782394,
						-0.08103493601083755,
						-0.8310219049453735
					},
					{
						0.4811111111111111,
						-0.024775028228759766,
						0.7214393615722656,
						-0.1816946268081665,
						0.709276020526886,
						-0.11655500531196594,
						-0.12091414630413055,
						-0.6846329569816589
					},
					{
						0.5072222222222222,
						-0.05930805206298828,
						0.6720983982086182,
						-0.3445974588394165,
						0.8067610263824463,
						-0.1668020337820053,
						-0.17879965901374817,
						-0.537907600402832
					},
					{
						0.5333333333333333,
						-0.08054828643798828,
						0.4939887523651123,
						-0.4919475317001343,
						0.9333154559135437,
						-0.0744335800409317,
						-0.14326538145542145,
						-0.3207131326198578
					}
				}
			},
			light_attack_02 = {
				damage_window_start = 0.33,
				range_mod = 1.25,
				kind = "sweep",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				ignore_armour_hit = false,
				width_mod = 25,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.385,
				impact_sound_event = "flail_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_down",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
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
						sub_action = "default_03",
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
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.2966666666666667,
						0.03355550765991211,
						0.10280895233154297,
						0.22991418838500977,
						-0.46957048773765564,
						0.25029459595680237,
						-0.011761178262531757,
						-0.8465919494628906
					},
					{
						0.3169444444444445,
						0.02043914794921875,
						0.2597846984863281,
						0.1622481346130371,
						-0.1443558931350708,
						0.1920793503522873,
						-0.0630708634853363,
						-0.9686532020568848
					},
					{
						0.33722222222222226,
						0.009470939636230469,
						0.4148855209350586,
						0.07135534286499023,
						0.15874621272087097,
						0.1251557618379593,
						-0.07243718951940536,
						-0.9766721725463867
					},
					{
						0.35750000000000004,
						0.02798175811767578,
						0.5433111190795898,
						-0.058223724365234375,
						0.45153874158859253,
						0.08569877594709396,
						-0.007504297886043787,
						-0.8880947232246399
					},
					{
						0.37777777777777777,
						0.06380081176757812,
						0.5849618911743164,
						-0.2037820816040039,
						0.6544151902198792,
						0.044679153710603714,
						0.011298775672912598,
						-0.7547296285629272
					},
					{
						0.39805555555555555,
						0.10107612609863281,
						0.5884923934936523,
						-0.313173770904541,
						0.7621315121650696,
						0.02862810343503952,
						0.009293186478316784,
						-0.6467222571372986
					},
					{
						0.41833333333333333,
						0.1458873748779297,
						0.5506496429443359,
						-0.41988039016723633,
						0.8106924295425415,
						0.07348636537790298,
						0.004720711149275303,
						-0.5808229446411133
					}
				}
			},
			light_attack_02_pose = {
				damage_window_start = 0.33,
				range_mod = 1.25,
				kind = "sweep",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				ignore_armour_hit = false,
				width_mod = 25,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.38,
				impact_sound_event = "flail_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_swing_down_right",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
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
						sub_action = "default_03",
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
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.2966666666666667,
						-0.12061262130737305,
						0.3400869369506836,
						0.2217116355895996,
						0.7838329076766968,
						-0.2939743995666504,
						-0.2293585240840912,
						0.4965679347515106
					},
					{
						0.3161111111111111,
						-0.06983137130737305,
						0.3434410095214844,
						0.20415830612182617,
						-0.7338365316390991,
						0.17125777900218964,
						0.1614229679107666,
						-0.6372577548027039
					},
					{
						0.33555555555555555,
						-0.017726421356201172,
						0.4169912338256836,
						0.17451190948486328,
						-0.5094356536865234,
						0.11997205018997192,
						0.15845324099063873,
						-0.8372422456741333
					},
					{
						0.355,
						0.05030679702758789,
						0.6467380523681641,
						0.01206827163696289,
						0.2446727156639099,
						0.09416665881872177,
						0.09986899793148041,
						-0.9598406553268433
					},
					{
						0.37444444444444447,
						0.08860635757446289,
						0.7089881896972656,
						-0.166351318359375,
						0.6337835192680359,
						0.0558011457324028,
						0.05242030695080757,
						-0.7697121500968933
					},
					{
						0.3938888888888889,
						0.10411357879638672,
						0.6866598129272461,
						-0.2942972183227539,
						0.7699232697486877,
						0.08925575017929077,
						0.013032275252044201,
						-0.631729245185852
					},
					{
						0.41333333333333333,
						0.13582324981689453,
						0.6093111038208008,
						-0.4001350402832031,
						0.8180010318756104,
						0.11418500542640686,
						-0.0008959496044553816,
						-0.563768744468689
					}
				}
			},
			light_attack_03 = {
				damage_window_start = 0.38,
				forward_offset = 0.75,
				push_radius = 2.5,
				kind = "shield_slam",
				first_person_hit_anim = "attack_hit",
				range_mod = 1.3,
				width_mod = 25,
				armor_impact_sound_event = "shield_hit_armour",
				no_damage_impact_sound_event = "shield_hit_armour",
				damage_profile_target = "shield_slam_target",
				hit_effect = "melee_hit_hammers_2h",
				damage_profile = "priest_shield_slam_shotgun",
				additional_critical_strike_chance = 0,
				damage_window_end = 0.44,
				impact_sound_event = "shield_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				damage_profile_aoe = "priest_shield_slam_shotgun_aoe",
				attack_direction = "up",
				hit_time = 0.39,
				dedicated_target_range = 3.5,
				use_precision_sweep = false,
				uninterruptible = true,
				anim_event = "attack_slam",
				hit_stop_anim = "attack_hit",
				total_time = 1.75,
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
						external_multiplier = 0.75,
						end_time = 0.6,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_04",
						start_time = 0.7,
						action = "action_one",
						end_time = 1.25,
						input = "action_one"
					},
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
				}
			},
			light_attack_04 = {
				damage_window_start = 0.2,
				range_mod = 1.3,
				kind = "sweep",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				ignore_armour_hit = true,
				width_mod = 25,
				damage_profile = "light_blunt_tank_spiked",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				hit_effect = "melee_hit_hammers_1h",
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.32,
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
				anim_time_scale = time_mod * 1,
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
						sub_action = "default_05",
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
						0.16666666666666669,
						0.4383258819580078,
						0.3735477924346924,
						0.08204841613769531,
						-0.4396505057811737,
						-0.2863479554653168,
						0.3703770637512207,
						-0.7665071487426758
					},
					{
						0.1977777777777778,
						0.3023643493652344,
						0.6124975681304932,
						0.019199371337890625,
						-0.21484962105751038,
						-0.33358773589134216,
						0.21528135240077972,
						-0.8923075795173645
					},
					{
						0.2288888888888889,
						0.1665506362915039,
						0.6970102787017822,
						-0.046684980392456055,
						0.0913480594754219,
						-0.41408494114875793,
						-0.08544740825891495,
						-0.9016029834747314
					},
					{
						0.26,
						-0.012232780456542969,
						0.7046864032745361,
						-0.1356058120727539,
						0.4931415021419525,
						-0.3356019854545593,
						-0.32515788078308105,
						-0.7337950468063354
					},
					{
						0.2911111111111111,
						-0.30653858184814453,
						0.5758740901947021,
						-0.2749366760253906,
						0.672438383102417,
						-0.18083341419696808,
						-0.3994555175304413,
						-0.5962895154953003
					},
					{
						0.3222222222222222,
						-0.4337434768676758,
						0.35874009132385254,
						-0.37563610076904297,
						0.7899318337440491,
						-0.08841726928949356,
						-0.44233304262161255,
						-0.4153691232204437
					},
					{
						0.35333333333333333,
						-0.43936920166015625,
						0.1839137077331543,
						-0.41546201705932617,
						0.7931645512580872,
						-0.05300084128975868,
						-0.5411486625671387,
						-0.2742975950241089
					}
				}
			},
			light_attack_05 = {
				damage_window_start = 0.41,
				range_mod = 1.3,
				kind = "sweep",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				ignore_armour_hit = true,
				width_mod = 25,
				damage_profile = "light_blunt_tank_spiked",
				aim_assist_ramp_multiplier = 0.2,
				aim_assist_max_ramp_multiplier = 0.4,
				hit_effect = "melee_hit_hammers_1h",
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.53,
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
						sub_action = "default_03_pose",
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
						0.37666666666666665,
						-0.27403879165649414,
						0.3263731002807617,
						0.1433250904083252,
						-0.7327926158905029,
						0.16298285126686096,
						-0.23196567595005035,
						-0.6185818314552307
					},
					{
						0.4077777777777778,
						-0.13631033897399902,
						0.5362586975097656,
						0.07658672332763672,
						-0.467918336391449,
						0.2986977696418762,
						-0.06207266449928284,
						-0.8294450044631958
					},
					{
						0.4388888888888889,
						0.023806333541870117,
						0.6338315010070801,
						-0.06316518783569336,
						-0.07646117359399796,
						0.4178770184516907,
						0.1954636424779892,
						-0.8839267492294312
					},
					{
						0.47,
						0.2161111831665039,
						0.662447452545166,
						-0.16703176498413086,
						0.26356378197669983,
						0.44139358401298523,
						0.37020325660705566,
						-0.7737283110618591
					},
					{
						0.5011111111111111,
						0.5124871730804443,
						0.5396037101745605,
						-0.3502800464630127,
						0.5520128011703491,
						0.4580423831939697,
						0.4745039939880371,
						-0.5102208852767944
					},
					{
						0.5322222222222223,
						0.6765117645263672,
						0.3094196319580078,
						-0.45557308197021484,
						0.6063640713691711,
						0.42945027351379395,
						0.5405232310295105,
						-0.3946259617805481
					},
					{
						0.5633333333333334,
						0.6996428966522217,
						0.17830276489257812,
						-0.5058398246765137,
						0.6305715441703796,
						0.40185844898223877,
						0.5552910566329956,
						-0.36406204104423523
					}
				}
			},
			light_attack_05_removed_shield_slam = {
				damage_window_start = 0.4,
				range_mod = 1.3,
				kind = "sweep",
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				ignore_armour_hit = true,
				width_mod = 25,
				damage_profile = "light_blunt_smiter",
				hit_effect = "melee_hit_hammers_1h",
				damage_window_end = 0.52,
				impact_sound_event = "flail_hit",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				uninterruptible = true,
				anim_event = "attack_slam",
				hit_stop_anim = "attack_hit",
				total_time = 1,
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
						external_multiplier = 0.75,
						end_time = 0.6,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_06",
						start_time = 0.3,
						action = "action_one",
						end_time = 1.25,
						input = "action_one"
					},
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
				}
			},
			light_attack_bopp = {
				damage_window_start = 0.37,
				kind = "sweep",
				range_mod = 1.25,
				damage_window_end = 0.53,
				sweep_z_offset = 0.35,
				width_mod = 25,
				no_damage_impact_sound_event = "flail_hit_armour",
				use_precision_sweep = false,
				hit_effect = "melee_hit_hammers_1h",
				ignore_armour_hit = false,
				damage_profile = "light_blunt_tank_spiked",
				additional_critical_strike_chance = 0,
				impact_sound_event = "flail_hit",
				aim_assist_ramp_multiplier = 0.4,
				anim_end_event = "attack_finished",
				aim_assist_max_ramp_multiplier = 0.6,
				aim_assist_ramp_decay_delay = 0.1,
				reset_aim_on_attack = true,
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.15,
				uninterruptible = true,
				anim_event = "attack_swing_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.2,
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
						sub_action = "default_03",
						start_time = 0.7,
						action = "action_one",
						release_required = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default_03",
						start_time = 0.7,
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
						0.5368566513061523,
						0.35440635681152344,
						-0.031664371490478516,
						-0.6818403005599976,
						-0.38931703567504883,
						0.3150712549686432,
						-0.5331568121910095
					},
					{
						0.37444444444444447,
						0.45256805419921875,
						0.510986328125,
						-0.04967355728149414,
						-0.49856433272361755,
						-0.6337848901748657,
						0.2979796528816223,
						-0.5108410120010376
					},
					{
						0.4122222222222222,
						0.2618584632873535,
						0.6848840713500977,
						-0.061333656311035156,
						0.03901835158467293,
						-0.6931084990501404,
						-0.04286567494273186,
						-0.718498945236206
					},
					{
						0.45,
						-0.009412765502929688,
						0.6797361373901367,
						-0.15539789199829102,
						0.6126751899719238,
						-0.15797433257102966,
						-0.25375062227249146,
						-0.7316309809684753
					},
					{
						0.48777777777777775,
						-0.312349796295166,
						0.5172882080078125,
						-0.23891067504882812,
						0.48325252532958984,
						0.3096156418323517,
						-0.3427884876728058,
						-0.7437077760696411
					},
					{
						0.5255555555555556,
						-0.40404224395751953,
						0.37212657928466797,
						-0.17800140380859375,
						-0.08109313249588013,
						0.4794408082962036,
						-0.3608209490776062,
						-0.7958446145057678
					},
					{
						0.5633333333333334,
						-0.41286277770996094,
						0.30420494079589844,
						-0.12292003631591797,
						-0.3950001001358032,
						0.4514145851135254,
						-0.3750385046005249,
						-0.7067856788635254
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
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.flail,
	left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1",
	left_hand_attachment_node_linking = AttachmentNodeLinking.shield,
	display_unit = "units/weapons/weapon_display/display_shield_hammer",
	wield_anim = "to_1h_flail_shield",
	buff_type = "MELEE_1H",
	weapon_type = "FLAIL_1H",
	shield_block = true,
	max_fatigue_points = 8,
	dodge_count = 3,
	can_block_ranged_attacks = true,
	block_angle = 180,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.2,
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
			arc = 2,
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
						default_02 = {
							wanted_sub_action_name = "default_charge_2",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_02_pose = {
							wanted_sub_action_name = "default_charge_2",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_03 = {
							wanted_sub_action_name = "default_charge",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_03_pose = {
							wanted_sub_action_name = "default_charge",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_04 = {
							wanted_sub_action_name = "default_charge",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack",
							bot_wanted_input = "hold_attack"
						},
						default_05 = {
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
							wanted_sub_action_name = "heavy_attack_02",
							wanted_action_name = "action_one",
							bot_wait_input = "hold_attack"
						},
						heavy_attack = {
							wanted_sub_action_name = "default_02",
							wanted_action_name = "action_one",
							bot_wanted_input = "hold_attack"
						},
						heavy_attack_02 = {
							wanted_sub_action_name = "default",
							wanted_action_name = "action_one",
							bot_wanted_input = "hold_attack"
						},
						light_attack_01 = {
							wanted_sub_action_name = "default_02_pose",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_02 = {
							wanted_sub_action_name = "default_03",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_02_pose = {
							wanted_sub_action_name = "default_03",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_03 = {
							wanted_sub_action_name = "default_04",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_04 = {
							wanted_sub_action_name = "default_05",
							wanted_action_name = "action_one",
							bot_wanted_input = "tap_attack"
						},
						light_attack_05 = {
							wanted_sub_action_name = "default_03_pose",
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
weapon_template.tooltip_keywords = {
	"weapon_keyword_ignore_shields",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control"
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 4
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 4
	}
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_01"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack"
	}
}
weapon_template.weapon_sway_settings = {
	camera_look_sensitivity = 1,
	sway_range = 1,
	lerp_speed = 6,
	recetner_dampening = 1,
	look_sensitivity = 0.5,
	recenter_max_vel = 30,
	recenter_acc = 30
}
weapon_template.wwise_dep_right_hand = {
	"wwise/flail"
}

return {
	one_handed_flail_shield_template = weapon_template
}
