local push_radius = 2
local weapon_template = {
	actions = {
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
					drop_on_player_destroyed = true,
					projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01"
				}
			}
		},
		action_two = {
			default = {
				damage_window_start = 0.05,
				anim_end_event = "attack_finished",
				outer_push_angle = 180,
				kind = "push_stagger",
				attack_template = "basic_sweep_push",
				damage_profile_outer = "light_push",
				push_angle = 100,
				hit_effect = "melee_hit_slashing",
				damage_window_end = 0.2,
				charge_value = "action_push",
				weapon_action_hand = "left",
				anim_event = "attack_push",
				damage_profile_inner = "medium_push",
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

					return not status_extension:fatigued()
				end
			}
		},
		action_dropped = {
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
					drop_on_player_destroyed = true,
					projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01"
				}
			}
		},
		action_wield = ActionTemplates.wield_left
	},
	ammo_data = {
		ammo_hand = "left",
		destroy_when_out_of_ammo = true,
		max_ammo = 1,
		ammo_per_clip = 1,
		reload_time = 0
	},
	left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01",
	left_hand_attachment_node_linking = AttachmentNodeLinking.barrel,
	wield_anim = "to_barrel",
	state_machine = "units/beings/player/first_person_base/state_machines/common",
	load_state_machine = false,
	block_wielding = true,
	max_fatigue_points = 3,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	}
}
local explosive_barrel = Weapons.explosive_barrel or table.clone(weapon_template)
explosive_barrel.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
local explosive_barrel_objective = table.clone(explosive_barrel)
explosive_barrel_objective.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_gun_powder_barrel_01"
explosive_barrel_objective.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "explosive_barrel_objective",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01"
}
local magic_barrel = table.clone(explosive_barrel_objective)
magic_barrel.left_hand_unit = "units/weapons/player/pup_magic_barrel/wpn_magic_barrel_01"
magic_barrel.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "magic_barrel",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_magic_barrel/pup_magic_barrel_01"
}
magic_barrel.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "magic_barrel",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_magic_barrel/pup_magic_barrel_01"
}
local wizards_barrel = table.clone(explosive_barrel_objective)
wizards_barrel.left_hand_unit = "units/weapons/player/pup_wizards_barrel_01/wpn_wizards_barrel_01"
wizards_barrel.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "explosive_pickup_projectile_unit_limited",
	pickup_name = "wizards_barrel",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_wizards_barrel_01/pup_wizards_barrel_01"
}
wizards_barrel.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "explosive_pickup_projectile_unit_limited",
	pickup_name = "wizards_barrel",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_wizards_barrel_01/pup_wizards_barrel_01"
}
local lamp_oil = table.clone(weapon_template)
lamp_oil.left_hand_unit = "units/weapons/player/wpn_oil_jug_01/wpn_oil_jug_01"
lamp_oil.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
	pickup_name = "lamp_oil",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01"
}
lamp_oil.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
	pickup_name = "lamp_oil",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01"
}
local beer_barrel = table.clone(weapon_template)
beer_barrel.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
beer_barrel.actions.action_one.default.speed = 8
beer_barrel.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "beer_barrel",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01"
}
beer_barrel.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "beer_barrel",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01"
}

return {
	explosive_barrel = explosive_barrel,
	explosive_barrel_objective = explosive_barrel_objective,
	lamp_oil = lamp_oil,
	beer_barrel = beer_barrel,
	magic_barrel = magic_barrel,
	wizards_barrel = wizards_barrel
}
