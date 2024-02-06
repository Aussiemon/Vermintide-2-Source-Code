-- chunkname: @scripts/settings/equipment/weapon_templates/1h_swords_flaming_spell.lua

local push_radius = 2
local time_mod = 1.9
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_right",
			attack_hold_input = "action_one_hold",
			kind = "melee_start",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.65,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release",
					start_time = 0,
					sub_action = "light_attack_left",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 0.7,
					sub_action = "heavy_attack_spell",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold",
					start_time = 0.3,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 1.2,
					sub_action = "heavy_attack_spell",
				},
			},
		},
		default_right = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge",
			kind = "melee_start",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.65,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release",
					start_time = 0,
					sub_action = "light_attack_right",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 0.7,
					sub_action = "heavy_attack_left",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					end_time = 1.4,
					input = "action_one_hold",
					start_time = 0.3,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 1.2,
					sub_action = "heavy_attack_left",
				},
			},
		},
		default_left = {
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge",
			kind = "melee_start",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.65,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release",
					start_time = 0,
					sub_action = "light_attack_stab",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 0.7,
					sub_action = "heavy_attack_left",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					end_time = 1,
					input = "action_one_hold",
					start_time = 0.3,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 0.8,
					sub_action = "heavy_attack_left",
				},
			},
		},
		heavy_attack_left = {
			additional_critical_strike_chance = 0,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_heavy",
			charge_value = "heavy_attack",
			damage_profile = "medium_burning_tank",
			damage_window_end = 0.27,
			damage_window_start = 0.15,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			headshot_multiplier = 2,
			hit_effect = "melee_hit_sword_1h",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "fire_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "fire_hit_armour",
			range_mod = 1.2,
			total_time = 2.25,
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.25,
					external_multiplier = 1.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.05,
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					end_time = 1.05,
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
		},
		heavy_attack_spell = {
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_right_spell",
			aoe_damage = true,
			armor_impact_sound_event = "fire_hit_armour",
			charge_value = "heavy_attack",
			damage_profile = "dagger_burning_slam",
			damage_profile_aoe = "dagger_burning_slam_aoe",
			dedicated_target_range = 2,
			forward_offset = 1.5,
			hit_effect = "melee_hit_hammers_2h",
			hit_time = 0.35,
			impact_sound_event = "fire_hit",
			kind = "shield_slam",
			no_damage_impact_sound_event = "fire_hit_armour",
			push_radius = 2.5,
			total_time = 1.5,
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1.1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.65,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.65,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.55,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			critical_strike = {},
		},
		light_attack_left = {
			additional_critical_strike_chance = 0,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_left",
			charge_value = "light_attack",
			damage_profile = "light_slashing_linesman",
			damage_window_end = 0.52,
			damage_window_start = 0.38,
			dedicated_target_range = 2.5,
			first_person_hit_anim = "shake_hit",
			headshot_multiplier = 2,
			hit_effect = "melee_hit_sword_1h",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "fire_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "fire_hit_armour",
			range_mod = 1.15,
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.7,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.2,
					input = "action_one",
					start_time = 0.6,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.6,
					sub_action = "default_right",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
		},
		light_attack_right = {
			additional_critical_strike_chance = 0,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_right_diagonal",
			charge_value = "light_attack",
			damage_profile = "light_slashing_linesman",
			damage_window_end = 0.5,
			damage_window_start = 0.38,
			dedicated_target_range = 2.5,
			first_person_hit_anim = "shake_hit",
			headshot_multiplier = 2,
			hit_effect = "melee_hit_sword_1h",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "fire_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "fire_hit_armour",
			range_mod = 1.15,
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.05,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.7,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.2,
					input = "action_one",
					start_time = 0.5,
					sub_action = "default_left",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.5,
					sub_action = "default_left",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
		},
		light_attack_stab = {
			additional_critical_strike_chance = 0,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_stab",
			charge_value = "light_attack",
			damage_profile = "light_slashing_smiter_stab",
			damage_window_end = 0.4,
			damage_window_start = 0.25,
			dedicated_target_range = 2.5,
			first_person_hit_anim = "shake_hit",
			headshot_multiplier = 2,
			hit_effect = "melee_hit_sword_1h",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "fire_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "fire_hit_armour",
			range_mod = 1.2,
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.7,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.2,
					input = "action_one",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.55,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
		},
		light_attack_bopp = {
			additional_critical_strike_chance = 0,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_left_diagonal",
			charge_value = "light_attack",
			damage_profile = "light_slashing_linesman",
			damage_window_end = 0.5,
			damage_window_start = 0.38,
			dedicated_target_range = 2.5,
			first_person_hit_anim = "shake_hit",
			headshot_multiplier = 2,
			hit_effect = "melee_hit_sword_1h",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "slashing_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "slashing_hit_armour",
			range_mod = 1.15,
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.7,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.2,
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.6,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
		},
		push = {
			anim_end_event = "attack_finished",
			anim_event = "attack_push",
			charge_value = "action_push",
			damage_profile_inner = "medium_push",
			damage_profile_outer = "light_push",
			damage_window_end = 0.2,
			damage_window_start = 0.05,
			dedicated_target_range = 2,
			hit_effect = "melee_hit_sword_1h",
			impact_sound_event = "slashing_hit",
			kind = "push_stagger",
			no_damage_impact_sound_event = "slashing_hit_armour",
			outer_push_angle = 180,
			push_angle = 100,
			total_time = 0.8,
			weapon_action_hand = "right",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one_hold",
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					end_time = 0.8,
					input = "action_one_hold",
					start_time = 0.2,
					sub_action = "light_attack_bopp",
					hold_required = {
						"action_two_hold",
						"action_one_hold",
					},
				},
				{
					action = "action_two",
					input = "action_two_hold",
					send_buffer = true,
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			push_radius = push_radius,
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end,
		},
	},
	action_two = {
		default = {
			anim_end_event = "parry_finished",
			anim_event = "parry_pose",
			cooldown = 0.15,
			hold_input = "action_two_hold",
			kind = "block",
			minimum_hold_time = 0.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension, remaining_time)
				return input_extension:reset_release_input_with_delay(remaining_time)
			end,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					external_multiplier = 0.8,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					start_time = 0.2,
					sub_action = "push",
					hold_required = {
						"action_two_hold",
					},
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.2,
					sub_action = "default",
				},
			},
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_weapon"
weapon_template.wield_anim = "to_1h_weapon_spells"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/1h_weapon_spells"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "SWORD_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 3
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2,
	},
}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 1,
		penetrating = false,
	},
	hold_attack = {
		arc = 2,
		penetrating = true,
	},
}
weapon_template.aim_assist_settings = {
	base_multiplier = 0.025,
	effective_max_range = 3,
	max_range = 5,
	no_aim_input_multiplier = 0,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 0.25,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 2,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 2,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control",
	"weapon_keyword_damage_over_time",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_spell",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push",
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_swords",
}

return {
	flaming_sword_spell_template_1 = weapon_template,
}
