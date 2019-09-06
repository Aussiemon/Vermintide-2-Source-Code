local push_radius = 2.5
local time_mod = 0.85
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			anim_event_3p = "attack_swing_charge_left_diagonal",
			anim_event = "attack_swing_charge_stab",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_stab",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_stab",
					start_time = 0.5,
					action = "action_one",
					force_release_input = "action_one_hold",
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
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1.5,
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
			anim_end_event = "attack_finished",
			kind = "melee_start",
			anim_event_3p = "attack_swing_stab_charge",
			anim_event = "attack_swing_charge_down",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
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
					sub_action = "heavy_attack_down",
					start_time = 0.5,
					action = "action_one",
					force_release_input = "action_one_hold",
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
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1.5,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_down",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_stab = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			anim_event_3p = "attack_swing_stab_charge",
			anim_event = "attack_swing_charge_stab",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_stab_2",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_stab",
					start_time = 0.5,
					action = "action_one",
					force_release_input = "action_one_hold",
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
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1.5,
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
		heavy_attack_down = {
			damage_window_start = 0.18,
			push_radius = 3,
			range_mod = 1.4,
			anim_event_3p = "attack_swing_heavy_left_diagonal",
			kind = "sweep",
			first_person_hit_anim = "hit_right_shake",
			sweep_z_offset = 0.15,
			width_mod = 20,
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "blunt_hit_armour",
			hit_effect = "melee_hit_axes_2h",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_window_end = 0.25,
			impact_sound_event = "axe_1h_hit",
			damage_profile = "heavy_slashing_smiter_polearm",
			dedicated_target_range = 3,
			weapon_up_offset_mod = 0.45,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			height_mod = 5,
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.5,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.4,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.7,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_stab",
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.15,
					input = "action_one"
				},
				{
					sub_action = "default_stab",
					start_time = 0.5,
					action = "action_one",
					doubleclick_window = 0,
					release_required = "action_one_hold",
					end_time = 1.15,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.15,
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.15,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_three",
					input = "action_three"
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
		heavy_attack_stab = {
			damage_window_start = 0.2,
			push_radius = 3,
			kind = "sweep",
			first_person_hit_anim = "hit_left_shake",
			sweep_z_offset = 0.5,
			width_mod = 35,
			range_mod = 1.4,
			hit_stop_anim = "attack_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			hit_effect = "melee_hit_axes_2h",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_window_end = 0.3,
			impact_sound_event = "axe_1h_hit",
			damage_profile = "heavy_slashing_smiter_stab_polearm",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			range_mod_add = 0.45,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_stab",
			height_mod = 5,
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.4,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.7,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					doubleclick_window = 0,
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
					start_time = 0,
					action = "action_two",
					end_time = 0.15,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_three",
					input = "action_three"
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
			end
		},
		light_attack_stab = {
			damage_window_start = 0.15,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "attack_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			sweep_z_offset = 0.4,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "medium_slashing_smiter_stab",
			hit_effect = "melee_hit_axes_2h",
			aim_assist_ramp_multiplier = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
			damage_window_end = 0.35,
			impact_sound_event = "axe_1h_hit",
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			range_mod_add = 0.45,
			uninterruptible = true,
			anim_event = "attack_swing_stab",
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.75,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1,
					input = "action_one_hold"
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
					end_time = 0.15,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_three",
					input = "action_three"
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.22,
			range_mod = 1.2,
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			sweep_z_offset = 0.15,
			width_mod = 25,
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			damage_profile = "medium_slashing_linesman_spear",
			hit_effect = "melee_hit_axes_2h",
			aim_assist_ramp_multiplier = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
			damage_window_end = 0.3,
			impact_sound_event = "axe_1h_hit",
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			weapon_up_offset_mod = 0.45,
			uninterruptible = true,
			anim_event = "attack_swing_left_diagonal",
			height_mod = 5,
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 1.2,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.5,
					external_multiplier = 0.75,
					end_time = 0.6,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_stab",
					start_time = 0.6,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default_stab",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_three",
					input = "action_three"
				}
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		light_attack_stab_2 = {
			damage_window_start = 0.15,
			push_radius = 3,
			headshot_multiplier = 1.5,
			first_person_hit_anim = "hit_right_shake",
			sweep_z_offset = 0.15,
			width_mod = 25,
			kind = "sweep",
			hit_shield_stop_anim = "attack_hit",
			range_mod = 1.2,
			hit_effect = "melee_hit_axes_2h",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_window_end = 0.35,
			impact_sound_event = "stab_hit",
			damage_profile = "medium_slashing_smiter_stab",
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "stab_hit_armour",
			dedicated_target_range = 2.8,
			range_mod_add = 0.45,
			anim_event_3p = "attack_swing_stab",
			anim_event = "attack_swing_stab_02",
			height_mod = 5,
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.75,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.75,
					end_time = 0.75,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.8,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.8,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.8,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_three",
					input = "action_three"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end
		},
		light_attack_bopp = {
			damage_window_start = 0.3,
			hit_armor_anim = "attack_hit",
			anim_end_event = "attack_finished",
			range_mod = 1.35,
			first_person_hit_anim = "hit_left_shake",
			width_mod = 25,
			sweep_z_offset = 0.05,
			hit_shield_stop_anim = "attack_hit",
			kind = "sweep",
			hit_effect = "melee_hit_sword_1h",
			anim_event_3p = "attack_swing_left_diagonal",
			additional_critical_strike_chance = 0,
			damage_window_end = 0.41,
			impact_sound_event = "slashing_hit",
			charge_value = "heavy_attack",
			use_precision_sweep = false,
			no_damage_impact_sound_event = "slashing_hit_armour",
			damage_profile = "medium_slashing_linesman_spear",
			dedicated_target_range = 2.8,
			weapon_up_offset_mod = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left",
			hit_stop_anim = "attack_hit",
			total_time = 1.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.4,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_three",
					input = "action_three"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			damage_profile_outer = "billhook_light_push",
			push_angle = 100,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.2,
			impact_sound_event = "axe_1h_hit",
			charge_value = "action_push",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			damage_profile_inner = "billhook_medium_push",
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
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
					start_time = 0.45,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_three",
					input = "action_three"
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
			minimum_hold_time = 0.25,
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
					sub_action = "push",
					start_time = 0.25,
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					hold_required = {
						"action_two_hold"
					}
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					doubleclick_window = 0,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			}
		}
	},
	action_three = {
		default = {
			damage_window_start = 0.23,
			push_radius = 3,
			anim_end_event = "attack_finished",
			range_mod = 1.35,
			headshot_multiplier = 1.5,
			first_person_hit_anim = "attack_hit_pull",
			sweep_z_offset = 0.1,
			width_mod = 20,
			damage_window_end = 0.33,
			hit_shield_stop_anim = "attack_hit",
			hit_effect = "melee_hit_axes_2h",
			kind = "sweep",
			additional_critical_strike_chance = 0,
			hit_time = 0.2,
			impact_sound_event = "Play_weapon_billhook_grab",
			damage_profile = "light_slashing_smiter_pull",
			use_precision_sweep = true,
			no_damage_impact_sound_event = "stab_hit_armour",
			dedicated_target_range = 4.8,
			weapon_up_offset_mod = 0.25,
			anim_event = "attack_swing_down",
			height_mod = 4,
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				},
				{
					start_time = 0.2,
					external_multiplier = 1.4,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.7,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.polearm
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_weapon"
weapon_template.wield_anim = "to_2h_billhook"
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "POLEARM"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 99
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
		penetrating = true,
		arc = 0
	},
	hold_attack = {
		penetrating = true,
		arc = 2
	}
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	base_multiplier = 0,
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_versatile"
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
	"wwise/two_handed_axes"
}

return {
	two_handed_billhooks_template = table.clone(weapon_template)
}
