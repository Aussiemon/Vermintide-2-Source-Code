-- chunkname: @scripts/settings/equipment/weapon_templates/mutator_statue_01.lua

local push_radius = 2
local weapon_template = {}

weapon_template.actions = {
	action_one = {
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
					external_multiplier = 1,
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
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				projectile_unit_template_name = "pickup_projectile_unit",
				use_dynamic_collision = false,
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
			push_radius = push_radius,
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
					external_multiplier = 1,
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
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				projectile_unit_template_name = "pickup_projectile_unit",
				use_dynamic_collision = false,
			},
		},
	},
	action_wield = ActionTemplates.wield_left,
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.pickup_data = {}
weapon_template.left_hand_unit = nil
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.barrel
weapon_template.wield_anim_3p = "to_statue"
weapon_template.wield_anim = "to_statue"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.block_wielding = true
weapon_template.max_fatigue_points = 1
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 0.45,
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.65,
	},
}

local mutator_statue_01 = table.clone(weapon_template)

mutator_statue_01.left_hand_unit = "units/weapons/player/pup_mutator_statue_01/wpn_mutator_statue_01"
mutator_statue_01.actions.action_one.default.speed = 8
mutator_statue_01.actions.action_one.default.throw_time = 0.35000000000000003
mutator_statue_01.actions.action_one.default.throw_offset = {
	0.3,
	0.5,
	0,
}
mutator_statue_01.actions.action_one.default.buff_data = {
	{
		buff_name = "planted_fast_decrease_movement",
		end_time = 0.28,
		external_multiplier = 1,
		start_time = 0,
	},
}
mutator_statue_01.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "mutator_statue_01",
	projectile_unit_name = "units/weapons/player/pup_mutator_statue_01/pup_mutator_statue_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
mutator_statue_01.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "mutator_statue_01",
	projectile_unit_name = "units/weapons/player/pup_mutator_statue_01/pup_mutator_statue_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

return {
	mutator_statue_01 = mutator_statue_01,
}
