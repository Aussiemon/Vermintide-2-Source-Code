local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			uppety = 0,
			anim_time_scale = 0.8,
			kind = "throw",
			is_statue_and_needs_rotation_cause_reasons = true,
			throw_time = 0.43749999999999994,
			ammo_usage = 1,
			weapon_action_hand = "left",
			block_pickup = true,
			speed = 2,
			uninterruptible = true,
			anim_event = "attack_throw",
			total_time = 0.7249999999999999,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.35,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {},
			angular_velocity = {
				-1.85,
				-0.25,
				0
			},
			throw_offset = {
				0.39,
				1.15,
				-0.57
			},
			projectile_info = {
				projectile_unit_template_name = "pickup_projectile_unit",
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				use_dynamic_collision = false
			}
		}
	},
	action_two = {
		default = {
			damage_window_start = 0.05,
			outer_push_angle = 180,
			kind = "push_stagger",
			damage_profile_outer = "light_push",
			attack_template = "basic_sweep_push",
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
			uppety = 0,
			anim_time_scale = 0.8,
			kind = "throw",
			is_statue_and_needs_rotation_cause_reasons = true,
			throw_time = 0.43749999999999994,
			ammo_usage = 1,
			weapon_action_hand = "left",
			block_pickup = true,
			speed = 2,
			uninterruptible = true,
			anim_event = "attack_throw",
			total_time = 0.7249999999999999,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.35,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {},
			angular_velocity = {
				-1.85,
				-0.25,
				0
			},
			throw_offset = {
				0.39,
				1.15,
				-0.57
			},
			projectile_info = {
				projectile_unit_template_name = "pickup_projectile_unit",
				collision_filter = "n/a",
				drop_on_player_destroyed = true,
				use_dynamic_collision = false
			}
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
weapon_template.pickup_data = {}
weapon_template.left_hand_unit = nil
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.barrel
weapon_template.wield_anim_3p = "to_statue"
weapon_template.wield_anim = "to_statue"
weapon_template.block_wielding = true
weapon_template.max_fatigue_points = 1
weapon_template.dodge_count = 1
weapon_template.buffs = {
	statue_decrease_movement = {
		variable_value = 1
	},
	change_dodge_distance = {
		external_optional_multiplier = 0.45
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.65
	}
}
Weapons = Weapons or {}
Weapons.cannon_ball = Weapons.cannon_ball or table.clone(weapon_template)
Weapons.cannon_ball.left_hand_unit = "units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01"
Weapons.cannon_ball.actions.action_one.default.speed = 8
Weapons.cannon_ball.actions.action_one.default.throw_time = 0.35000000000000003
Weapons.cannon_ball.actions.action_one.default.throw_offset = {
	0.3,
	0.5,
	0
}
Weapons.cannon_ball.actions.action_one.default.buff_data = {
	{
		start_time = 0,
		external_multiplier = 0.5,
		end_time = 0.28,
		buff_name = "planted_fast_decrease_movement"
	}
}
Weapons.cannon_ball.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "cannon_ball",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01"
}
Weapons.cannon_ball.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "cannon_ball",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01"
}
Weapons.gargoyle_head = Weapons.gargoyle_head or table.clone(weapon_template)
Weapons.gargoyle_head.left_hand_unit = "units/weapons/player/wpn_gargoyle_head/wpn_gargoyle_head"
Weapons.gargoyle_head.actions.action_one.default.speed = 8
Weapons.gargoyle_head.actions.action_one.default.throw_time = 0.35000000000000003
Weapons.gargoyle_head.actions.action_one.default.throw_offset = {
	0.3,
	0.5,
	0
}
Weapons.gargoyle_head.actions.action_one.default.buff_data = {
	{
		start_time = 0,
		external_multiplier = 1,
		end_time = 0.28,
		buff_name = "planted_fast_decrease_movement"
	}
}
Weapons.gargoyle_head.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "gargoyle_head",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01"
}
Weapons.gargoyle_head.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "pickup_projectile_unit",
	pickup_name = "gargoyle_head",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01"
}
Weapons.training_dummy = Weapons.training_dummy or table.clone(weapon_template)
Weapons.training_dummy.buffs = nil
Weapons.training_dummy.left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy"
Weapons.training_dummy.actions.action_one.default.speed = 2
Weapons.training_dummy.actions.action_one.default.angular_velocity = {
	0,
	0,
	0
}
Weapons.training_dummy.actions.action_one.default.throw_offset = {
	0,
	1,
	-0.2
}
Weapons.training_dummy.actions.action_one.default.rotate_towards_owner_unit = true
Weapons.training_dummy.wield_anim = "to_statue"
Weapons.training_dummy.wield_anim_3p = "to_statue"
Weapons.training_dummy.actions.action_one.default.projectile_info = {
	projectile_unit_template_name = "pickup_training_dummy_unit",
	pickup_name = "training_dummy",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/gameplay/training_dummy/training_dummy"
}
Weapons.training_dummy.actions.action_dropped.default.projectile_info = {
	projectile_unit_template_name = "pickup_training_dummy_unit",
	pickup_name = "training_dummy",
	drop_on_player_destroyed = true,
	projectile_unit_name = "units/gameplay/training_dummy/training_dummy"
}
Weapons.training_dummy_armored = Weapons.training_dummy_armored or table.clone(Weapons.training_dummy)
Weapons.training_dummy_armored.left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy_armored"
Weapons.training_dummy_armored.actions.action_one.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_armored"
Weapons.training_dummy_armored.actions.action_one.default.projectile_info.pickup_name = "training_dummy_armored"
Weapons.training_dummy_armored.actions.action_dropped.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_armored"
Weapons.training_dummy_armored.actions.action_dropped.default.projectile_info.pickup_name = "training_dummy_armored"
Weapons.training_dummy_skaven = Weapons.training_dummy_skaven or table.clone(Weapons.training_dummy)
Weapons.training_dummy_skaven.left_hand_unit = "units/gameplay/training_dummy/training_dummy_skaven/wpn_training_dummy_skaven"
Weapons.training_dummy_skaven.actions.action_one.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_skaven/training_dummy_skaven"
Weapons.training_dummy_skaven.actions.action_one.default.projectile_info.pickup_name = "training_dummy_skaven"
Weapons.training_dummy_skaven.actions.action_dropped.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_skaven/training_dummy_skaven"
Weapons.training_dummy_skaven.actions.action_dropped.default.projectile_info.pickup_name = "training_dummy_skaven"

return
