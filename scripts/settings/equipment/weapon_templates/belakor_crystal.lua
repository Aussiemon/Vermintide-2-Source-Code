-- chunkname: @scripts/settings/equipment/weapon_templates/belakor_crystal.lua

require("scripts/settings/dlcs/belakor/belakor_balancing")

local weapon_template = {
	block_wielding = true,
	dodge_count = 1,
	left_hand_unit = "units/weapons/player/wpn_belakor_crystal/wpn_belakor_crystal",
	load_state_machine = false,
	max_fatigue_points = 1,
	state_machine = "units/beings/player/first_person_base/state_machines/common",
	wield_anim = "to_crystal",
	wield_anim_3p = "to_crystal",
	actions = {
		action_one = {
			default = {
				ammo_usage = 1,
				anim_event = "attack_throw",
				anim_time_scale = 0.8,
				block_pickup = true,
				is_statue_and_needs_rotation_cause_reasons = true,
				kind = "throw",
				throw_time = 0.35000000000000003,
				total_time = 0.7249999999999999,
				uninterruptible = true,
				uppety = 0,
				weapon_action_hand = "left",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {},
				allowed_chain_actions = {},
				speed = BelakorBalancing.crystal_throw_speed,
				angular_velocity = {
					-1.85,
					-0.25,
					0,
				},
				throw_offset = {
					-0.2,
					0.5,
					0,
				},
				projectile_info = {
					drop_on_player_destroyed = true,
					pickup_name = "belakor_crystal",
					projectile_unit_name = "units/weapons/player/pup_belakor_crystal/pup_belakor_crystal",
					projectile_unit_template_name = "belakor_crystal_throw",
				},
			},
		},
		action_two = {
			default = {
				anim_event = "attack_push",
				attack_template = "basic_sweep_push",
				charge_value = "action_push",
				damage_profile_inner = "medium_push",
				damage_profile_outer = "light_push",
				damage_window_end = 0.2,
				damage_window_start = 0.05,
				hit_effect = "melee_hit_slashing",
				kind = "push_stagger",
				outer_push_angle = 180,
				push_angle = 100,
				push_radius = 2,
				total_time = 0.8,
				weapon_action_hand = "left",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				allowed_chain_actions = {
					{
						action = "action_one",
						end_time = 0.7,
						input = "action_one",
						start_time = 0.4,
						sub_action = "default",
					},
				},
				condition_func = function (attacker_unit, input_extension)
					local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

					return not status_extension:fatigued()
				end,
			},
		},
		action_dropped = {
			default = {
				ammo_usage = 1,
				anim_event = "attack_throw",
				anim_time_scale = 0.8,
				block_pickup = true,
				is_statue_and_needs_rotation_cause_reasons = true,
				kind = "throw",
				speed = 2,
				throw_time = 0.43749999999999994,
				total_time = 0.7249999999999999,
				uninterruptible = true,
				uppety = 0,
				weapon_action_hand = "left",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						buff_name = "planted_fast_decrease_movement",
						end_time = 0.35,
						external_multiplier = 0.5,
						start_time = 0,
					},
				},
				allowed_chain_actions = {},
				angular_velocity = {
					-1.85,
					-0.25,
					0,
				},
				throw_offset = {
					0.39,
					1.15,
					-0.57,
				},
				projectile_info = {
					drop_on_player_destroyed = true,
					pickup_name = "belakor_crystal",
					projectile_unit_name = "units/weapons/player/pup_belakor_crystal/pup_belakor_crystal",
					projectile_unit_template_name = "belakor_crystal_throw",
				},
			},
		},
		action_inspect = ActionTemplates.action_inspect,
		action_wield = ActionTemplates.wield_left,
	},
	ammo_data = {
		ammo_hand = "left",
		ammo_per_clip = 1,
		destroy_when_out_of_ammo = true,
		max_ammo = 1,
		reload_time = 0,
	},
	pickup_data = {},
	left_hand_attachment_node_linking = AttachmentNodeLinking.magic_crystal,
	buffs = {},
}

return {
	belakor_crystal = weapon_template,
}
