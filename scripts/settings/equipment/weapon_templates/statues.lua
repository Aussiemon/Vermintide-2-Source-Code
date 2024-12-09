-- chunkname: @scripts/settings/equipment/weapon_templates/statues.lua

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
	statue_decrease_movement = {
		variable_value = 1,
	},
	change_dodge_distance = {
		external_optional_multiplier = 0.45,
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.65,
	},
}

local cannon_ball = table.clone(weapon_template)

cannon_ball.left_hand_unit = "units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01"
cannon_ball.actions.action_one.default.speed = 8
cannon_ball.actions.action_one.default.throw_time = 0.35000000000000003
cannon_ball.actions.action_one.default.throw_offset = {
	0.3,
	0.5,
	0,
}
cannon_ball.actions.action_one.default.buff_data = {
	{
		buff_name = "planted_fast_decrease_movement",
		end_time = 0.28,
		external_multiplier = 0.5,
		start_time = 0,
	},
}
cannon_ball.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "cannon_ball",
	projectile_unit_name = "units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
cannon_ball.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "cannon_ball",
	projectile_unit_name = "units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local trail_cog = table.clone(weapon_template)

trail_cog.wield_anim_3p = "to_cog"
trail_cog.wield_anim = "to_cog"
trail_cog.left_hand_unit = "units/weapons/player/wpn_trail_cog_02/wpn_trail_cog_02"
trail_cog.actions.action_inspect = ActionTemplates.action_inspect
trail_cog.actions.action_one.default.speed = 8
trail_cog.actions.action_one.default.throw_time = 0.35000000000000003
trail_cog.actions.action_one.default.throw_offset = {
	0.4,
	0.9,
	0,
}
trail_cog.actions.action_one.default.angular_velocity = {
	0,
	0,
	0,
}
trail_cog.actions.action_inspect = ActionTemplates.action_inspect
trail_cog.wield_anim = "to_cog"
trail_cog.wield_anim_3p = "to_cog"
trail_cog.actions.action_one.default.buff_data = {
	{
		buff_name = "planted_fast_decrease_movement",
		end_time = 0.28,
		external_multiplier = 0.5,
		start_time = 0,
	},
}
trail_cog.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "trail_cog",
	projectile_unit_name = "units/weapons/player/wpn_trail_cog_02/pup_trail_cog_02",
	projectile_unit_template_name = "pickup_projectile_unit_limited",
}
trail_cog.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "trail_cog",
	projectile_unit_name = "units/weapons/player/wpn_trail_cog_02/pup_trail_cog_02",
	projectile_unit_template_name = "pickup_projectile_unit_limited",
}

local gargoyle_head = table.clone(weapon_template)

gargoyle_head.left_hand_unit = "units/weapons/player/wpn_gargoyle_head/wpn_gargoyle_head"
gargoyle_head.actions.action_one.default.speed = 8
gargoyle_head.actions.action_one.default.throw_time = 0.35000000000000003
gargoyle_head.actions.action_one.default.throw_offset = {
	0.3,
	0.5,
	0,
}
gargoyle_head.actions.action_one.default.buff_data = {
	{
		buff_name = "planted_fast_decrease_movement",
		end_time = 0.28,
		external_multiplier = 1,
		start_time = 0,
	},
}
gargoyle_head.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "gargoyle_head",
	projectile_unit_name = "units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
gargoyle_head.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "gargoyle_head",
	projectile_unit_name = "units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local shadow_gargoyle_head = table.clone(weapon_template)

shadow_gargoyle_head.left_hand_unit = "units/weapons/player/wpn_shadow_gargoyle_head/wpn_shadow_gargoyle_head"
shadow_gargoyle_head.actions.action_one.default.speed = 8
shadow_gargoyle_head.actions.action_one.default.throw_time = 0.35000000000000003
shadow_gargoyle_head.actions.action_one.default.throw_offset = {
	0.3,
	0.5,
	0,
}
shadow_gargoyle_head.actions.action_one.default.buff_data = {
	{
		buff_name = "planted_fast_decrease_movement",
		end_time = 0.28,
		external_multiplier = 1,
		start_time = 0,
	},
}
shadow_gargoyle_head.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "shadow_gargoyle_head",
	projectile_unit_name = "units/weapons/player/pup_shadow_gargoyle_head/pup_shadow_gargoyle_head_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
shadow_gargoyle_head.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "shadow_gargoyle_head",
	projectile_unit_name = "units/weapons/player/pup_shadow_gargoyle_head/pup_shadow_gargoyle_head_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local magic_crystal = table.clone(weapon_template)

magic_crystal.left_hand_unit = "units/weapons/player/wpn_magic_crystal/wpn_magic_crystal"
magic_crystal.actions.action_one.default.speed = 8
magic_crystal.actions.action_one.default.throw_time = 0.35000000000000003
magic_crystal.actions.action_one.default.throw_offset = {
	-0.2,
	0.5,
	0,
}
magic_crystal.actions.action_one.default.buff_data = {}
magic_crystal.wield_anim_3p = "to_crystal"
magic_crystal.wield_anim = "to_crystal"
magic_crystal.left_hand_attachment_node_linking = AttachmentNodeLinking.magic_crystal
magic_crystal.buffs = {}
magic_crystal.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "magic_crystal",
	projectile_unit_name = "units/weapons/player/pup_magic_crystal/pup_magic_crystal",
	projectile_unit_template_name = "pickup_projectile_unit",
}
magic_crystal.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "magic_crystal",
	projectile_unit_name = "units/weapons/player/pup_magic_crystal/pup_magic_crystal",
	projectile_unit_template_name = "pickup_projectile_unit",
}

local training_dummy = table.clone(weapon_template)

training_dummy.buffs = nil
training_dummy.left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy"
training_dummy.actions.action_one.default.speed = 2
training_dummy.actions.action_one.default.angular_velocity = {
	0,
	0,
	0,
}
training_dummy.actions.action_one.default.throw_offset = {
	0,
	1,
	-0.2,
}
training_dummy.actions.action_one.default.rotate_towards_owner_unit = true
training_dummy.wield_anim = "to_statue"
training_dummy.wield_anim_3p = "to_statue"

local training_dummy_bob = table.clone(training_dummy)

training_dummy_bob.left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy"
training_dummy_bob.actions.action_one.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_bob"
training_dummy_bob.actions.action_one.default.projectile_info.projectile_unit_template_name = "ai_unit_training_dummy_bob"
training_dummy_bob.actions.action_one.default.projectile_info.pickup_name = "training_dummy_bob"
training_dummy_bob.actions.action_one.default.projectile_info.disable_throwing_dialogue = true
training_dummy_bob.actions.action_dropped.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_bob"
training_dummy_bob.actions.action_dropped.default.projectile_info.projectile_unit_template_name = "ai_unit_training_dummy_bob"
training_dummy_bob.actions.action_dropped.default.projectile_info.pickup_name = "training_dummy_bob"
training_dummy_bob.actions.action_dropped.default.projectile_info.disable_throwing_dialogue = true

local training_dummy_armored_bob = table.clone(training_dummy)

training_dummy_armored_bob.left_hand_unit = "units/gameplay/training_dummy/wpn_training_dummy_armored"
training_dummy_armored_bob.actions.action_one.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_bob"
training_dummy_armored_bob.actions.action_one.default.projectile_info.projectile_unit_template_name = "ai_unit_training_dummy_bob"
training_dummy_armored_bob.actions.action_one.default.projectile_info.pickup_name = "training_dummy_armored_bob"
training_dummy_armored_bob.actions.action_one.default.projectile_info.disable_throwing_dialogue = true
training_dummy_armored_bob.actions.action_dropped.default.projectile_info.projectile_unit_name = "units/gameplay/training_dummy/training_dummy_bob"
training_dummy_armored_bob.actions.action_dropped.default.projectile_info.projectile_unit_template_name = "ai_unit_training_dummy_bob"
training_dummy_armored_bob.actions.action_dropped.default.projectile_info.pickup_name = "training_dummy_armored_bob"
training_dummy_armored_bob.actions.action_dropped.default.projectile_info.disable_throwing_dialogue = true

local waystone_piece = table.clone(gargoyle_head)

waystone_piece.left_hand_unit = "units/weapons/player/pup_waystone_piece_01/wpn_waystone_piece_01"
waystone_piece.wield_anim_3p = "to_statue"
waystone_piece.wield_anim = "to_statue"
waystone_piece.actions.action_one.default.speed = 4
waystone_piece.actions.action_one.default.throw_time = 0.35000000000000003
waystone_piece.actions.action_one.default.throw_offset = {
	0.35,
	0.5,
	0,
}
waystone_piece.actions.action_one.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "waystone_piece",
	projectile_unit_name = "units/weapons/player/pup_waystone_piece_01/pup_waystone_piece_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}
waystone_piece.actions.action_dropped.default.projectile_info = {
	drop_on_player_destroyed = true,
	pickup_name = "waystone_piece",
	projectile_unit_name = "units/weapons/player/pup_waystone_piece_01/pup_waystone_piece_01",
	projectile_unit_template_name = "pickup_projectile_unit",
}

return {
	cannon_ball = cannon_ball,
	trail_cog = trail_cog,
	gargoyle_head = gargoyle_head,
	shadow_gargoyle_head = shadow_gargoyle_head,
	magic_crystal = magic_crystal,
	training_dummy_bob = training_dummy_bob,
	training_dummy_armored_bob = training_dummy_armored_bob,
	waystone_piece = waystone_piece,
}
