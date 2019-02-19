local push_radius = 2.5
local extra_range_add = 1.1
local time_mod = 0.9
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
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
					external_multiplier = 0.7,
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.5,
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
		default_left = {
			aim_assist_ramp_decay_delay = 0.1,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_swing_charge_right",
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.5,
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
		default_right = {
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
					external_multiplier = 0.6,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_up",
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
					start_time = 0.6,
					blocker = true,
					end_time = 1.5,
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
		heavy_attack_right = {
			damage_window_start = 0.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			width_mod = 30,
			damage_profile = "heavy_slashing_axe_linesman",
			hit_effect = "melee_hit_axes_2h",
			damage_window_end = 0.5,
			impact_sound_event = "axe_2h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			range_mod = extra_range_add * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.1,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
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
		heavy_attack_left = {
			damage_window_start = 0.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			width_mod = 30,
			use_precision_sweep = false,
			damage_profile = "heavy_slashing_axe_linesman",
			hit_effect = "melee_hit_axes_2h",
			damage_window_end = 0.5,
			impact_sound_event = "axe_2h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			range_mod = extra_range_add * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					end_time = 0.1,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
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
		light_attack_left = {
			damage_window_start = 0.3,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "attack_hit_alt_effect",
			hit_effect = "melee_hit_axes_2h",
			damage_profile = "medium_slashing_smiter_2h",
			use_precision_sweep = false,
			damage_window_end = 0.45,
			impact_sound_event = "axe_2h_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 3,
			anim_event = "attack_swing_down_left",
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			range_mod = extra_range_add * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.4,
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
					external_multiplier = 0.4,
					end_time = 0.8,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.7,
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
			}
		},
		light_attack_right = {
			damage_window_start = 0.35,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "attack_hit_alt_effect",
			hit_effect = "melee_hit_axes_2h",
			damage_profile = "medium_slashing_smiter_2h",
			use_precision_sweep = false,
			damage_window_end = 0.53,
			impact_sound_event = "axe_2h_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 3,
			anim_event = "attack_swing_down_right",
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			range_mod = extra_range_add * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.4,
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
					start_time = 0.5,
					external_multiplier = 0.4,
					end_time = 0.8,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.65,
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
			}
		},
		light_attack_up = {
			damage_window_start = 0.35,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "attack_hit_alt_effect",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_axe_linesman",
			hit_effect = "melee_hit_axes_2h",
			damage_window_end = 0.53,
			impact_sound_event = "axe_2h_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 3,
			anim_event = "attack_swing_up",
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 0.9,
			range_mod = extra_range_add * 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.4,
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
					start_time = 0.5,
					external_multiplier = 0.4,
					end_time = 0.8,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.75,
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
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.33,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			use_precision_sweep = false,
			damage_profile = "medium_slashing_axe_linesman",
			hit_effect = "melee_hit_axes_2h",
			damage_window_end = 0.5,
			impact_sound_event = "axe_2h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit_alt_effect",
			total_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			range_mod = extra_range_add * 1.4,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.4,
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
					start_time = 0.5,
					external_multiplier = 0.4,
					end_time = 0.8,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.75,
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
					start_time = 0.65,
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
			hit_time = 0.1,
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
					start_time = 0.4,
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
					start_time = 0.4,
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
			enter_function = function (attacker_unit, input_extension, remaining_time)
				return input_extension:reset_release_input_with_delay(remaining_time)
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "push",
					start_time = 0.3,
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
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_weapon"
weapon_template.wield_anim = "to_2h_hammer"
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "AXE_2H"
weapon_template.max_fatigue_points = 5
weapon_template.dodge_count = 2
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_2h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 0.95
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.95
	}
}
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = true,
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
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_shield_breaking",
	"weapon_keyword_armour_piercing"
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
	two_handed_axes_template_1 = table.clone(weapon_template)
}
