local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
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
				projectile_unit_template_name = "pickup_projectile_unit",
				pickup_name = "door_stick",
				drop_on_player_destroyed = true,
				projectile_unit_name = "units/gameplay/timed_door_base_02/pup_timed_door_stick"
			}
		}
	},
	action_two = {
		default = {
			damage_window_start = 0.05,
			charge_value = "action_push",
			anim_end_event = "attack_finished",
			kind = "push_stagger",
			damage_window_end = 0.2,
			attack_template = "basic_sweep_push",
			hit_effect = "melee_hit_slashing",
			outer_push_angle = 180,
			weapon_action_hand = "right",
			push_angle = 100,
			anim_event = "attack_push",
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_one",
					end_time = 0.7,
					input = "action_one"
				}
			},
			push_radius = push_radius,
			condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension.fatigued(status_extension)
			end
		}
	},
	action_wield = ActionTemplates.wield
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template.pickup_data = {
	pickup_name = "door_stick"
}
weapon_template.right_hand_unit = "units/gameplay/timed_door_base_02/wpn_timed_door_stick"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_weapon"
weapon_template.wield_anim = "to_1h_sword"
weapon_template.wield_anim_3p = "to_1h_sword"
weapon_template.block_wielding = true
weapon_template.third_person_extension_template = "prop_unit"
Weapons = Weapons or {}
Weapons.door_stick = weapon_template
Weapons.door_stick = Weapons.door_stick or table.clone(weapon_template)
Weapons.door_stick.right_hand_unit = "units/gameplay/timed_door_base_02/wpn_timed_door_stick"

return 
