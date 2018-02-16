local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			alert_sound_range_hit = 10,
			anim_end_event = "attack_finished",
			kind = "throw",
			velocity_multiplier = 1,
			throw_time = 0.35,
			ammo_usage = 1,
			weapon_action_hand = "left",
			block_pickup = true,
			speed = 5,
			uninterruptible = true,
			anim_event = "attack_throw",
			total_time = 0.7,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				-5,
				0
			},
			throw_offset = {
				0.25,
				1.2,
				0
			},
			projectile_info = {
				projectile_unit_template_name = "explosive_pickup_projectile_unit",
				pickup_name = "explosive_barrel",
				projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01"
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
			weapon_action_hand = "left",
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
	action_wield = ActionTemplates.wield_left
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.barrel
weapon_template.wield_anim = "to_barrel"
weapon_template.block_wielding = true
weapon_template.max_fatigue_points = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
Weapons = Weapons or {}
Weapons.explosive_barrel = Weapons.explosive_barrel or table.clone(weapon_template)
Weapons.explosive_barrel.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
Weapons.explosive_barrel_objective = table.clone(Weapons.explosive_barrel)
Weapons.explosive_barrel_objective.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_gun_powder_barrel_01"
Weapons.explosive_barrel_objective.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "explosive_barrel_objective",
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01"
}
Weapons.dwarf_explosive_barrel = table.clone(Weapons.explosive_barrel)
Weapons.dwarf_explosive_barrel.left_hand_unit = "units/weapons/player/wpn_dwarf_barrel_01/wpn_dwarf_barrel_01"
Weapons.dwarf_explosive_barrel.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "dwarf_explosive_barrel",
	projectile_unit_name = "units/weapons/player/pup_dwarf_barrel_01/pup_dwarf_barrel_01"
}
Weapons.lamp_oil = Weapons.lamp_oil or table.clone(weapon_template)
Weapons.lamp_oil.left_hand_unit = "units/weapons/player/wpn_oil_jug_01/wpn_oil_jug_01"
Weapons.lamp_oil.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
	pickup_name = "lamp_oil",
	projectile_unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01"
}
Weapons.beer_barrel = Weapons.beer_barrel or table.clone(weapon_template)
Weapons.beer_barrel.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
Weapons.beer_barrel.actions.action_one.default.speed = 8
Weapons.beer_barrel.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "beer_barrel",
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01"
}

return 
