local push_radius = 2
local time_mod = 0.9
local heavy_smiter_stagger = 3
local heavy_linesman_stagger = 3
local light_linesman_stagger = 3
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
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
					external_multiplier = 0.75,
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
					end_time = 1.5,
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
					external_multiplier = 0.75,
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
					end_time = 1.5,
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
					external_multiplier = 0.75,
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
					end_time = 1.5,
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
			range_mod = 1.35,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = -0.05,
			use_target = false,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			damage_profile = "medium_slashing_linesman",
			hit_effect = "melee_hit_sword_2h",
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
			anim_time_scale = time_mod*1.2,
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
					sub_action = "default_right",
					start_time = 0.85,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.85,
					action = "action_one",
					release_required = "action_one_hold",
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			}
		},
		light_attack_left_upward = {
			damage_window_start = 0.4,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = -0.05,
			use_target = false,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_effect = "melee_hit_sword_2h",
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
			anim_time_scale = time_mod*1,
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
					sub_action = "default_left",
					start_time = 0.85,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.85,
					action = "action_one",
					release_required = "action_one_hold",
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
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension.reset_release_input(input_extension)
			end
		},
		heavy_attack_down_first = {
			damage_window_start = 0.35,
			range_mod = 1.2,
			kind = "sweep",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0,
			sweep_z_offset = 0,
			use_target = false,
			damage_profile = "heavy_slashing_smiter_stab",
			hit_shield_stop_anim = "attack_hit_shield",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.45,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "attack_swing_heavy",
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod*1.5,
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
					sub_action = "heavy_attack_down_second",
					start_time = 0.6,
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
		heavy_attack_down_second = {
			damage_window_start = 0.55,
			range_mod = 1.35,
			kind = "sweep",
			no_damage_impact_sound_event = "slashing_hit_armour",
			sweep_z_offset = -0.05,
			use_target = false,
			additional_critical_strike_chance = 0,
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
			anim_time_scale = time_mod*1.2,
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT
		},
		light_attack_bopp = {
			damage_window_start = 0.4,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.35,
			sweep_z_offset = -0.05,
			use_target = false,
			additional_critical_strike_chance = 0,
			hit_shield_stop_anim = "attack_hit_shield",
			no_damage_impact_sound_event = "slashing_hit_armour",
			hit_effect = "melee_hit_sword_2h",
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
			anim_time_scale = time_mod*1.2,
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
					sub_action = "default_",
					start_time = 0.65,
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
					start_time = 0.75,
					action = "action_two",
					release_required = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension.reset_release_input(input_extension)
			end,
			enter_function = function (attacker_unit, input_extension)
				return input_extension.reset_release_input(input_extension)
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
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			push_radius = push_radius,
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension.fatigued(status_extension)
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
				return input_extension.reset_release_input(input_extension)
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
					sub_action = "push",
					start_time = 0.3,
					action = "action_one",
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
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_weapon"
weapon_template.wield_anim = "to_2h_sword_we"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.dodge_count = 6
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "SWORD_2H"
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = true,
		arc = 0
	},
	hold_attack = {
		penetrating = false,
		arc = 1
	}
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.wwise_dep_right_hand = {
	"wwise/two_handed_swords"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.5,
			stagger = 0.2,
			damage = 0.625,
			targets = 0.2
		},
		heavy_attack = {
			speed = 0.4,
			stagger = 0.3,
			damage = 0.546875,
			targets = 0.7
		}
	},
	perks = {
		light_attack = {},
		heavy_attack = {
			"armor_penetration"
		}
	}
}
Weapons = Weapons or {}
Weapons.two_handed_swords_wood_elf_template = table.clone(weapon_template)
Weapons.two_handed_swords_wood_elf_template_t3_un = table.clone(Weapons.two_handed_swords_wood_elf_template)
Weapons.two_handed_swords_wood_elf_template_t3_un.actions.action_inspect.default.anim_event = "inspect_start_2"
Weapons.two_handed_swords_wood_elf_template_t3_un.actions.action_inspect.default.anim_end_event = "inspect_end_2"

return 
