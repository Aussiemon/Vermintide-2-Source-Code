-- chunkname: @scripts/settings/equipment/weapon_templates/deus_relic.lua

local push_radius = 2
local time_mod = 0.8
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_diagonal",
			attack_hold_input = "action_one_hold",
			kind = "melee_start",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.25,
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
					start_time = 0.5,
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
					end_time = 1.2,
					input = "action_one_hold",
					start_time = 0.7,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 0.8,
					sub_action = "heavy_attack_left",
				},
			},
		},
		default_right = {
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_right_pose",
			kind = "melee_start",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.25,
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
					start_time = 0.5,
					sub_action = "heavy_attack_right",
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
					start_time = 0.7,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 0.8,
					sub_action = "heavy_attack_right",
				},
			},
		},
		default_left = {
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_diagonal_pose",
			kind = "melee_start",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.25,
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
					start_time = 0.5,
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
					end_time = 1.2,
					input = "action_one_hold",
					start_time = 0.7,
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
			action_aborted_flow_event = "vfx_torch_swing_stop",
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_heavy_left_diagonal",
			charge_value = "heavy_attack",
			damage_profile = "medium_burning_tank",
			damage_window_end = 0.3,
			damage_window_start = 0.12,
			dedicated_target_range = 3,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_deus_relic_01",
			hit_shield_stop_anim = "attack_hit",
			impact_explosion_template = "deus_relic_small",
			impact_sound_event = "Play_weapon_deus_relic_01_flesh_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "Play_weapon_deus_relic_01_armour_hit",
			reset_aim_on_attack = true,
			total_time = 1.2,
			uninterruptible = true,
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
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
		heavy_attack_right = {
			action_aborted_flow_event = "vfx_torch_swing_stop",
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_heavy_right",
			charge_value = "heavy_attack",
			damage_profile = "medium_burning_tank",
			damage_window_end = 0.3,
			damage_window_start = 0.18,
			dedicated_target_range = 3,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_deus_relic_01",
			hit_shield_stop_anim = "attack_hit",
			impact_explosion_template = "deus_relic_small",
			impact_sound_event = "Play_weapon_deus_relic_01_flesh_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "Play_weapon_deus_relic_01_armour_hit",
			reset_aim_on_attack = true,
			total_time = 1.2,
			uninterruptible = true,
			use_precision_sweep = true,
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_left",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_left",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
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
			action_aborted_flow_event = "vfx_torch_swing_stop",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_left",
			damage_profile = "light_slashing_linesman",
			damage_window_end = 0.25,
			damage_window_start = 0.12,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_effect = "melee_hit_deus_relic_01",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "Play_weapon_deus_relic_01_flesh_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "Play_weapon_deus_relic_01_armour_hit",
			range_mod = 1.2,
			total_time = 0.85,
			use_precision_sweep = false,
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.65,
					sub_action = "default",
				},
				{
					action = "action_one",
					end_time = 0.65,
					input = "action_one",
					start_time = 0.4,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					end_time = 0.65,
					input = "action_one_hold",
					start_time = 0.45,
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
			hit_mass_count = ENDLESS_HIT_MASS_COUNT,
		},
		light_attack_right = {
			action_aborted_flow_event = "vfx_torch_swing_stop",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_right",
			damage_profile = "light_slashing_linesman",
			damage_window_end = 0.28,
			damage_window_start = 0.17,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_effect = "melee_hit_deus_relic_01",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "Play_weapon_deus_relic_01_flesh_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "Play_weapon_deus_relic_01_armour_hit",
			range_mod = 1.2,
			total_time = 1.5,
			use_precision_sweep = false,
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.65,
					input = "action_one",
					start_time = 0.45,
					sub_action = "default_left",
				},
				{
					action = "action_one",
					end_time = 0.65,
					input = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_left",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.65,
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
			hit_mass_count = ENDLESS_HIT_MASS_COUNT,
		},
		light_attack_bopp = {
			action_aborted_flow_event = "vfx_torch_swing_stop",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_stab_02",
			damage_profile = "light_blunt_tank_spiked",
			damage_window_end = 0.28,
			damage_window_start = 0.15,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_effect = "melee_hit_deus_relic_01",
			hit_stop_anim = "attack_hit",
			impact_explosion_template = "deus_relic_large",
			impact_sound_event = "Play_weapon_deus_relic_01_flesh_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "Play_weapon_deus_relic_01_armour_hit",
			range_mod = 1.2,
			total_time = 1.5,
			use_precision_sweep = false,
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
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
		push = {
			anim_end_event = "attack_finished",
			anim_event = "attack_push",
			attack_template = "basic_sweep_push",
			charge_value = "action_push",
			damage_profile_inner = "medium_push",
			damage_profile_outer = "light_push",
			damage_window_end = 0.2,
			damage_window_start = 0.05,
			dedicated_target_range = 2,
			hit_effect = "melee_hit_deus_relic_01",
			impact_sound_event = "Play_weapon_deus_relic_01_flesh_hit",
			kind = "push_stagger",
			no_damage_impact_sound_event = "Play_weapon_deus_relic_01_armour_hit",
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
					start_time = 0.3,
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
					start_time = 0.3,
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
			minimum_hold_time = 0.3,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					external_multiplier = 0.85,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
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
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
			},
		},
	},
	action_three = {
		default = {
			ammo_usage = 1,
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "deus_relic_throw",
			speed = 4,
			throw_time = 0.36,
			total_time = 1.08,
			uninterruptible = true,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				11,
				0,
			},
			throw_offset = {
				0.2,
				0,
				0,
			},
			projectile_info = {
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				pickup_name = "deus_relic_01",
				projectile_unit_name = "units/weapons/player/pup_deus_relic_01/pup_deus_relic_01",
				projectile_unit_template_name = "deus_relic",
				use_dynamic_collision = false,
			},
		},
	},
	action_wield = {
		default = {
			ammo_usage = 1,
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "deus_relic_throw",
			speed = 4,
			throw_time = 0.36,
			total_time = 1.08,
			uninterruptible = true,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				11,
				0,
			},
			throw_offset = {
				0.2,
				0,
				0,
			},
			projectile_info = {
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				pickup_name = "deus_relic_01",
				projectile_unit_name = "units/weapons/player/pup_deus_relic_01/pup_deus_relic_01",
				projectile_unit_template_name = "deus_relic",
				use_dynamic_collision = false,
			},
		},
	},
	action_dropped = {
		default = {
			ammo_usage = 1,
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "deus_relic_throw",
			speed = 4,
			throw_time = 0.36,
			total_time = 1.08,
			uninterruptible = true,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				11,
				0,
			},
			throw_offset = {
				0.2,
				0,
				0,
			},
			projectile_info = {
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				pickup_name = "deus_relic_01",
				projectile_unit_name = "units/weapons/player/pup_deus_relic_01/pup_deus_relic_01",
				projectile_unit_template_name = "deus_relic",
				use_dynamic_collision = false,
			},
		},
	},
	action_inspect = ActionTemplates.action_inspect,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.pickup_data = {
	pickup_name = "deus_relic_01",
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_deus_relic_01/wpn_deus_relic_01"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_weapon"
weapon_template.wield_anim = "to_torch"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.block_wielding = false
weapon_template.max_fatigue_points = 6
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.third_person_extension_template = "torch_unit_3p"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

return {
	deus_relic = table.clone(weapon_template),
}
