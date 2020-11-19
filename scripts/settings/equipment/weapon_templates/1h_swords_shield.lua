local push_radius = 3
local time_mod = 0.9
local weapon_template = weapon_template or {}
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
		default_right = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			uninterruptible = true,
			anim_event = "attack_swing_charge_stab",
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
					sub_action = "heavy_attack_stab",
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
					sub_action = "heavy_attack_stab",
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
			anim_event = "attack_swing_charge_right_pose",
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
		default_left_heavy = {
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
		default_stab_heavy = {
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			uninterruptible = true,
			anim_event = "attack_swing_charge_stab",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.6,
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
					sub_action = "heavy_attack_stab",
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
					sub_action = "heavy_attack_stab",
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
			armor_impact_sound_event = "shield_hit_armour",
			damage_profile = "shield_slam",
			additional_critical_strike_chance = 0,
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
					sub_action = "default_stab_heavy",
					start_time = 0.4,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_stab_heavy",
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
		heavy_attack_right = {
			damage_window_start = 0.15,
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman_1h",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.3,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right",
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
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.05,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			chain_condition_func = function (attacker_unit, input_extension)
				input_extension:reset_release_input()

				return true
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		heavy_attack_stab = {
			damage_window_start = 0.22,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.4,
			no_damage_impact_sound_event = "stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "medium_slashing_smiter_stab_1h",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.32,
			impact_sound_event = "stab_hit",
			dedicated_target_range = 2.75,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
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
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one"
				},
				{
					sub_action = "default_left_heavy",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.05,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.05,
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			chain_condition_func = function (attacker_unit, input_extension)
				input_extension:reset_release_input()

				return true
			end
		},
		light_attack_left = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "light_slashing_linesman",
			hit_effect = "melee_hit_hammers_2h",
			damage_window_end = 0.52,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
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
					start_time = 0.55,
					action = "action_one",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.55,
					action = "action_one",
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.2,
					action = "action_one",
					input = "action_one_hold"
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		light_attack_right = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "light_slashing_linesman",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.52,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
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
					start_time = 0.6,
					action = "action_one",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					end_time = 1.2,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.2,
					action = "action_one",
					input = "action_one_hold"
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		light_attack_stab_postpush = {
			damage_window_start = 0.18,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "light_slashing_smiter_stab",
			hit_shield_stop_anim = "attack_hit_shield",
			ignore_armour_hit = true,
			hit_effect = "melee_hit_hammers_2h",
			attack_direction = "up",
			damage_window_end = 0.28,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_stab",
			hit_stop_anim = "attack_hit",
			total_time = 1.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
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
					sub_action = "default_stab_heavy",
					start_time = 0.45,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default_stab_heavy",
					start_time = 0.45,
					action = "action_one",
					release_required = "action_two_hold",
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
					start_time = 0.45,
					action = "action_wield",
					input = "action_wield"
				}
			}
		},
		light_attack_last = {
			damage_window_start = 0.38,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "light_slashing_linesman_flat",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_hammers_2h",
			damage_window_end = 0.47,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 1.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
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
					start_time = 0.75,
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
					start_time = 0.2,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_one",
					release_required = "action_two_hold",
					doubleclick_window = 0,
					input = "action_one_hold"
				},
				{
					sub_action = "light_attack_stab_postpush",
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
					start_time = 0.2,
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
			minimum_hold_time = 0.2,
			hold_input = "action_two_hold",
			kind = "block",
			anim_end_event = "parry_finished",
			cooldown = 0.15,
			weapon_action_hand = "left",
			anim_event_3p = "parry_pose",
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
weapon_template.display_unit = "units/weapons/weapon_display/display_shield_sword"
weapon_template.wield_anim = "to_1h_sword_shield"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "SWORD_1H_SHIELD"
weapon_template.shield_block = true
weapon_template.max_fatigue_points = 10
weapon_template.dodge_count = 2
weapon_template.can_block_ranged_attacks = true
weapon_template.block_angle = 120
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
		penetrating = false,
		arc = 1
	},
	hold_attack = {
		penetrating = true,
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
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps",
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
	"wwise/one_handed_swords"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/two_handed_hammers"
}

return {
	one_handed_sword_shield_template_1 = table.clone(weapon_template)
}
