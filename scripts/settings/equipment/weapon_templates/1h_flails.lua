local push_radius = 2
local time_mod = 1
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			stop_action_on_leave_for_bot = true,
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
			anim_event = "attack_swing_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.05,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
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
					send_buffer = true,
					action = "action_one",
					auto_chain = true,
					start_time = 0.5
				}
			}
		},
		default_charge_2 = {
			looping_anim = true,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
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
					external_multiplier = 0.8,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.05,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
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
					send_buffer = true,
					action = "action_one",
					auto_chain = true,
					start_time = 0.5
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
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			stop_action_on_leave_for_bot = true,
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
					external_multiplier = 0.75,
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
					start_time = 0.8
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
			hit_effect = "melee_hit_hammers_1h",
			use_precision_sweep = false,
			ignore_armour_hit = true,
			additional_critical_strike_chance = 0,
			impact_sound_event = "flail_hit",
			damage_profile = "medium_blunt_tank_spiked",
			anim_end_event = "attack_finished",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 3,
			weapon_up_offset_mod = 0.15,
			uninterruptible = true,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			reset_aim_on_attack = true,
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
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default_left",
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
			hit_mass_count = TANK_HIT_MASS_COUNT
		},
		heavy_attack_left = {
			damage_window_start = 0.37,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			damage_window_end = 0.53,
			sweep_z_offset = 0.35,
			width_mod = 25,
			range_mod = 1.4,
			no_damage_impact_sound_event = "flail_hit_armour",
			hit_effect = "melee_hit_hammers_1h",
			use_precision_sweep = false,
			ignore_armour_hit = true,
			additional_critical_strike_chance = 0,
			impact_sound_event = "flail_hit",
			damage_profile = "medium_blunt_tank_spiked",
			anim_end_event = "attack_finished",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 3,
			weapon_up_offset_mod = 0.15,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left",
			hit_stop_anim = "attack_hit",
			reset_aim_on_attack = true,
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
			hit_mass_count = TANK_HIT_MASS_COUNT
		},
		light_attack_left = {
			damage_window_start = 0.42,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "flail_hit_armour",
			use_precision_sweep = false,
			width_mod = 25,
			ignore_armour_hit = false,
			damage_profile = "light_blunt_tank_spiked",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.48,
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
			hit_mass_count = TANK_HIT_MASS_COUNT
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
			hit_mass_count = TANK_HIT_MASS_COUNT
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
			anim_event = "attack_swing_down",
			hit_stop_anim = "attack_hit",
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
					external_multiplier = 0.75,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_last",
					start_time = 0.58,
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
			}
		},
		light_attack_down = {
			damage_window_start = 0.31,
			range_mod = 1.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "flail_hit_armour",
			use_precision_sweep = false,
			width_mod = 25,
			ignore_armour_hit = true,
			damage_profile = "light_blunt_smiter",
			aim_assist_ramp_multiplier = 0.2,
			hit_effect = "melee_hit_hammers_1h",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.4,
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
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.3,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			width_mod = 25,
			no_damage_impact_sound_event = "flail_hit_armour",
			use_precision_sweep = false,
			ignore_armour_hit = false,
			hit_effect = "melee_hit_hammers_1h",
			damage_profile = "light_blunt_tank_spiked",
			damage_window_end = 0.45,
			impact_sound_event = "flail_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			uninterruptible = true,
			anim_event = "attack_swing_right",
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
			hit_mass_count = TANK_HIT_MASS_COUNT
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
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.flail
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_flail"
weapon_template.wield_anim = "to_1h_flail"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "FLAIL_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 4
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.15
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.15
	}
}
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
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
	one_handed_flail_template_1 = table.clone(weapon_template)
}
