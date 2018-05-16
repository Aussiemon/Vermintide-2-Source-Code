local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			throw_time = 0.36,
			ammo_usage = 1,
			kind = "throw",
			speed = 60,
			anim_event = "attack_throw",
			total_time = 1.08,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				0,
				0
			},
			throw_offset = {
				0.5,
				0.6,
				0
			},
			angular_velocity = {
				0,
				0,
				10
			},
			throw_offset = {
				0.2,
				0,
				0
			},
			projectile_info = {
				projectile_unit_template_name = "pickup_projectile_unit",
				use_dynamic_collision = false,
				collision_filter = "n/a",
				projectile_unit_name = "units/weapons/player/wpn_fireball/wpn_fireball"
			}
		}
	}
}
weapon_template.ammo_data = {
	destroy_when_out_of_ammo = true,
	reload_time = 0,
	max_ammo = 1,
	ammo_per_clip = 1
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.wield_anim = "to_1h_sword"
Weapons = Weapons or {}
Weapons.fireball = weapon_template
Weapons.torch = Weapons.torch or table.clone(weapon_template)
Weapons.torch.right_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"

return
