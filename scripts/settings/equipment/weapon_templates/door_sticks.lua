-- chunkname: @scripts/settings/equipment/weapon_templates/door_sticks.lua

local push_radius = 2
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			ammo_usage = 1,
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "throw",
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
				pickup_name = "door_stick",
				projectile_unit_name = "units/gameplay/timed_door_base_02/pup_timed_door_stick",
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
			weapon_action_hand = "right",
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
			block_pickup = true,
			kind = "throw",
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
				pickup_name = "door_stick",
				projectile_unit_name = "units/gameplay/timed_door_base_02/pup_timed_door_stick",
				projectile_unit_template_name = "pickup_projectile_unit",
				use_dynamic_collision = false,
			},
		},
	},
	action_wield = ActionTemplates.wield,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.pickup_data = {
	pickup_name = "door_stick",
}
weapon_template.right_hand_unit = "units/gameplay/timed_door_base_02/wpn_timed_door_stick"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_weapon"
weapon_template.wield_anim = "to_1h_sword"
weapon_template.wield_anim_3p = "to_1h_sword"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.block_wielding = true
weapon_template.third_person_extension_template = "prop_unit"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

local door_stick = table.clone(weapon_template)

door_stick.right_hand_unit = "units/gameplay/timed_door_base_02/wpn_timed_door_stick"

return {
	door_stick = door_stick,
}
