local push_radius = 2
local time_mod = 0.6
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
			anim_event = "attack_swing_charge_right_pose",
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
		default_left = {
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
		heavy_attack_left = {
			damage_window_start = 0.12,
			hit_armor_anim = "attack_hit",
			additional_critical_strike_chance = 0,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			width_mod = 25,
			action_aborted_flow_event = "vfx_torch_swing_stop",
			hit_shield_stop_anim = "attack_hit",
			no_damage_impact_sound_event = "Play_weapon_fire_torch_armour_hit",
			hit_effect = "melee_hit_torches_1h",
			damage_profile = "torch",
			aim_assist_ramp_multiplier = 0.4,
			damage_window_end = 0.3,
			impact_sound_event = "Play_weapon_fire_torch_flesh_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
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
			critical_strike = {}
		},
		heavy_attack_right = {
			damage_window_start = 0.18,
			hit_armor_anim = "attack_hit",
			additional_critical_strike_chance = 0,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			width_mod = 25,
			action_aborted_flow_event = "vfx_torch_swing_stop",
			hit_shield_stop_anim = "attack_hit",
			no_damage_impact_sound_event = "Play_weapon_fire_torch_armour_hit",
			hit_effect = "melee_hit_torches_1h",
			use_precision_sweep = true,
			damage_profile = "torch_heavy",
			damage_window_end = 0.3,
			impact_sound_event = "Play_weapon_fire_torch_flesh_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			dedicated_target_range = 3,
			reset_aim_on_attack = true,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right",
			total_time = 1.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.3,
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
			critical_strike = {}
		},
		light_attack_left = {
			damage_window_start = 0.12,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "Play_weapon_fire_torch_armour_hit",
			action_aborted_flow_event = "vfx_torch_swing_stop",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "torch",
			hit_effect = "melee_hit_torches_1h",
			damage_window_end = 0.25,
			impact_sound_event = "Play_weapon_fire_torch_flesh_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 0.85,
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
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.4,
					action = "action_one",
					end_time = 0.65,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.45,
					action = "action_one",
					end_time = 0.65,
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
			hit_mass_count = ENDLESS_HIT_MASS_COUNT
		},
		light_attack_right = {
			damage_window_start = 0.17,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "Play_weapon_fire_torch_armour_hit",
			action_aborted_flow_event = "vfx_torch_swing_stop",
			width_mod = 25,
			use_precision_sweep = false,
			damage_profile = "torch",
			hit_effect = "melee_hit_torches_1h",
			damage_window_end = 0.28,
			impact_sound_event = "Play_weapon_fire_torch_flesh_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_right",
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
					start_time = 0.45,
					action = "action_one",
					end_time = 0.65,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 0.65,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
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
			hit_mass_count = ENDLESS_HIT_MASS_COUNT
		},
		light_attack_bopp = {
			damage_window_start = 0.15,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			action_aborted_flow_event = "vfx_torch_swing_stop",
			width_mod = 25,
			no_damage_impact_sound_event = "Play_weapon_fire_torch_armour_hit",
			use_precision_sweep = false,
			damage_profile = "torch_stab",
			hit_effect = "melee_hit_torches_1h",
			damage_window_end = 0.28,
			impact_sound_event = "Play_weapon_fire_torch_flesh_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2,
			anim_event = "attack_swing_stab_02",
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
			end
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			no_damage_impact_sound_event = "Play_weapon_fire_torch_armour_hit",
			attack_template = "basic_sweep_push",
			damage_profile_outer = "light_push",
			weapon_action_hand = "right",
			push_angle = 100,
			hit_effect = "melee_hit_torches_1h",
			damage_window_end = 0.2,
			impact_sound_event = "Play_weapon_fire_torch_flesh_hit",
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
			minimum_hold_time = 0.3,
			anim_end_event = "parry_finished",
			kind = "block",
			hold_input = "action_two_hold",
			anim_event = "parry_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
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
					start_time = 0.3,
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
			throw_time = 0.36,
			ammo_usage = 1,
			kind = "throw",
			block_pickup = true,
			speed = 4,
			uninterruptible = true,
			anim_event = "attack_throw",
			total_time = 1.08,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				11,
				0
			},
			throw_offset = {
				0.2,
				0,
				0
			},
			projectile_info = {
				use_dynamic_collision = false,
				collision_filter = "n/a",
				projectile_unit_template_name = "pickup_torch_unit",
				pickup_name = "torch",
				drop_on_player_destroyed = true,
				projectile_unit_name = "units/weapons/player/pup_torch/pup_torch"
			}
		}
	},
	action_wield = {
		default = {
			throw_time = 0.36,
			ammo_usage = 1,
			kind = "throw",
			block_pickup = true,
			speed = 4,
			uninterruptible = true,
			anim_event = "attack_throw",
			total_time = 1.08,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				11,
				0
			},
			throw_offset = {
				0.2,
				0,
				0
			},
			projectile_info = {
				use_dynamic_collision = false,
				collision_filter = "n/a",
				projectile_unit_template_name = "pickup_torch_unit",
				pickup_name = "torch",
				drop_on_player_destroyed = true,
				projectile_unit_name = "units/weapons/player/pup_torch/pup_torch"
			}
		}
	},
	action_dropped = {
		default = {
			throw_time = 0.36,
			ammo_usage = 1,
			kind = "throw",
			block_pickup = true,
			speed = 4,
			uninterruptible = true,
			anim_event = "attack_throw",
			total_time = 1.08,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				11,
				0
			},
			throw_offset = {
				0.2,
				0,
				0
			},
			projectile_info = {
				use_dynamic_collision = false,
				collision_filter = "n/a",
				projectile_unit_template_name = "pickup_torch_unit",
				pickup_name = "torch",
				drop_on_player_destroyed = true,
				projectile_unit_name = "units/weapons/player/pup_torch/pup_torch"
			}
		}
	}
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template.pickup_data = {
	pickup_name = "torch"
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_torch/wpn_torch"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_weapon"
weapon_template.wield_anim = "to_torch"
weapon_template.buff_type = "MELEE_1H"
weapon_template.block_wielding = false
weapon_template.max_fatigue_points = 6
weapon_template.third_person_extension_template = "torch_unit_3p"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
local shadow_torch = table.clone(weapon_template)
shadow_torch.actions.action_three.default.projectile_info.projectile_unit_name = "units/weapons/player/pup_shadow_torch/pup_shadow_torch"
shadow_torch.actions.action_three.default.projectile_info.pickup_name = "shadow_torch"
shadow_torch.actions.action_wield.default.projectile_info.projectile_unit_name = "units/weapons/player/pup_shadow_torch/pup_shadow_torch"
shadow_torch.actions.action_wield.default.projectile_info.pickup_name = "shadow_torch"
shadow_torch.actions.action_dropped.default.projectile_info.projectile_unit_name = "units/weapons/player/pup_shadow_torch/pup_shadow_torch"
shadow_torch.actions.action_dropped.default.projectile_info.pickup_name = "shadow_torch"
shadow_torch.right_hand_unit = "units/weapons/player/wpn_shadow_torch/wpn_shadow_torch"
shadow_torch.pickup_data.pickup_name = "shadow_torch"
local mutator_torch = table.clone(weapon_template)
mutator_torch.actions.action_three.default.projectile_info.pickup_name = "mutator_torch"
mutator_torch.actions.action_wield.default.projectile_info.pickup_name = "mutator_torch"
mutator_torch.actions.action_dropped.default.projectile_info.pickup_name = "mutator_torch"
mutator_torch.pickup_data.pickup_name = "mutator_torch"

return {
	torch = table.clone(weapon_template),
	shadow_torch = table.clone(shadow_torch),
	mutator_torch = table.clone(mutator_torch)
}
