-- chunkname: @scripts/settings/equipment/weapon_templates/sacks.lua

local push_radius = 2
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "throw",
			speed = 2.5,
			throw_time = 0.35,
			total_time = 0.7,
			uninterruptible = true,
			velocity_multiplier = 0.5,
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
				0,
				200,
				-500,
			},
			throw_offset = {
				0.3,
				1,
				0.3,
			},
			projectile_info = {
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				pickup_name = "grain_sack",
				projectile_unit_name = "units/weapons/player/pup_sacks/pup_sacks_01",
				projectile_unit_template_name = "pickup_projectile_unit",
				use_dynamic_collision = false,
			},
		},
	},
	action_two = {
		default = {
			anim_end_event = "attack_finished",
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
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "throw",
			speed = 2.5,
			throw_time = 0.35,
			total_time = 0.7,
			uninterruptible = true,
			velocity_multiplier = 0.5,
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
				0,
				200,
				-500,
			},
			throw_offset = {
				0.3,
				1,
				0.3,
			},
			projectile_info = {
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				pickup_name = "grain_sack",
				projectile_unit_name = "units/weapons/player/pup_sacks/pup_sacks_01",
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
weapon_template.pickup_data = {
	pickup_name = "grain_sack",
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_sacks/wpn_sacks_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.sack
weapon_template.wield_anim = "to_sack"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.block_wielding = true
weapon_template.max_fatigue_points = 3
weapon_template.dodge_count = 1
weapon_template.buffs = {
	sack_decrease_movement = {
		variable_value = 1,
	},
	change_dodge_distance = {
		external_optional_multiplier = 0.65,
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.45,
	},
}

local sack = table.clone(weapon_template)

sack.actions.action_one.default.projectile_info.projectile_unit_name = "units/weapons/player/pup_sacks/pup_sacks_01"
sack.left_hand_unit = "units/weapons/player/wpn_sacks/wpn_sacks_01"
sack.wield_anim = "to_sack"

return {
	sack = sack,
}
