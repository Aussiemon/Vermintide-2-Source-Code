-- chunkname: @scripts/settings/equipment/weapon_templates/barrels.lua

local push_radius = 2
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			alert_sound_range_hit = 10,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "throw",
			speed = 5,
			throw_time = 0.35,
			total_time = 0.7,
			uninterruptible = true,
			velocity_multiplier = 1,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				-5,
				0,
			},
			throw_offset = {
				0.25,
				1.2,
				0,
			},
			projectile_info = {
				drop_on_player_destroyed = true,
				pickup_name = "explosive_barrel",
				projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
				projectile_unit_template_name = "explosive_pickup_projectile_unit",
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
			alert_sound_range_hit = 10,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "throw",
			speed = 5,
			throw_time = 0.35,
			total_time = 0.7,
			uninterruptible = true,
			velocity_multiplier = 1,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				-5,
				0,
			},
			throw_offset = {
				0.25,
				1.2,
				0,
			},
			projectile_info = {
				drop_on_player_destroyed = true,
				pickup_name = "explosive_barrel",
				projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
				projectile_unit_template_name = "explosive_pickup_projectile_unit",
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
weapon_template.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.barrel
weapon_template.wield_anim = "to_barrel"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.block_wielding = true
weapon_template.max_fatigue_points = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

local explosive_barrel = table.clone(weapon_template)

explosive_barrel.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"

local explosive_barrel_objective = table.clone(explosive_barrel)

explosive_barrel_objective.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_gun_powder_barrel_01"
explosive_barrel_objective.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "explosive_barrel_objective",
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local magic_barrel = table.clone(explosive_barrel_objective)

magic_barrel.left_hand_unit = "units/weapons/player/pup_magic_barrel/wpn_magic_barrel_01"
magic_barrel.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "magic_barrel",
	projectile_unit_name = "units/weapons/player/pup_magic_barrel/pup_magic_barrel_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
magic_barrel.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "magic_barrel",
	projectile_unit_name = "units/weapons/player/pup_magic_barrel/pup_magic_barrel_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local wizards_barrel = table.clone(explosive_barrel_objective)

wizards_barrel.left_hand_unit = "units/weapons/player/pup_wizards_barrel_01/wpn_wizards_barrel_01"
wizards_barrel.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "wizards_barrel",
	projectile_unit_name = "units/weapons/player/pup_wizards_barrel_01/pup_wizards_barrel_01",
	projectile_unit_template_name = "explosive_pickup_projectile_unit_limited",
}
wizards_barrel.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "wizards_barrel",
	projectile_unit_name = "units/weapons/player/pup_wizards_barrel_01/pup_wizards_barrel_01",
	projectile_unit_template_name = "explosive_pickup_projectile_unit_limited",
}

local lamp_oil = table.clone(weapon_template)

lamp_oil.left_hand_unit = "units/weapons/player/wpn_oil_jug_01/wpn_oil_jug_01"
lamp_oil.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "lamp_oil",
	projectile_unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01",
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
}
lamp_oil.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "lamp_oil",
	projectile_unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01",
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
}

local beer_barrel = table.clone(weapon_template)

beer_barrel.left_hand_unit = "units/weapons/player/wpn_explosive_barrel/wpn_explosive_barrel_01"
beer_barrel.actions.action_one.default.speed = 8
beer_barrel.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "beer_barrel",
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
beer_barrel.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "beer_barrel",
	projectile_unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local whale_oil_barrel = table.clone(weapon_template)

whale_oil_barrel.left_hand_unit = "units/weapons/player/pup_whale_oil_barrel/wpn_whale_oil_barrel_01"
whale_oil_barrel.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "whale_oil_barrel",
	projectile_unit_name = "units/weapons/player/pup_whale_oil_barrel/pup_whale_oil_barrel_01",
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
}
whale_oil_barrel.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "whale_oil_barrel",
	projectile_unit_name = "units/weapons/player/pup_whale_oil_barrel/pup_whale_oil_barrel_01",
	projectile_unit_template_name = "explosive_pickup_projectile_unit",
}

return {
	explosive_barrel = explosive_barrel,
	explosive_barrel_objective = explosive_barrel_objective,
	lamp_oil = lamp_oil,
	beer_barrel = beer_barrel,
	magic_barrel = magic_barrel,
	wizards_barrel = wizards_barrel,
	whale_oil_barrel = whale_oil_barrel,
}
