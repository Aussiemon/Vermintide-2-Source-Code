PlayerUnitMovementSettings = PlayerUnitMovementSettings or {}
local units_player_movement_setting = {}
PlayerUnitMovementSettings.get_movement_settings_table = function (unit)
	if not units_player_movement_setting[unit] then
		PlayerUnitMovementSettings.register_unit(unit)
	end

	return units_player_movement_setting[unit]
end
PlayerUnitMovementSettings.register_unit = function (unit)
	units_player_movement_setting[unit] = table.clone(PlayerUnitMovementSettings)

	return 
end
PlayerUnitMovementSettings.unregister_unit = function (unit)
	units_player_movement_setting[unit] = nil

	return 
end
PlayerUnitMovementSettings.get_active_units_in_movement_settings = function ()
	local units = {}
	local index = 1

	for unit, __ in pairs(units_player_movement_setting) do
		units[index] = unit
		index = index + 1
	end

	return units
end
PlayerUnitMovementSettings.FWD_MOVE_SPEED_SCALE = 1
PlayerUnitMovementSettings.BWD_MOVE_SPEED_SCALE = 0.65
PlayerUnitMovementSettings.STRAFE_MOVE_SPEED_SCALE = 1
PlayerUnitMovementSettings.slope_traversion = PlayerUnitMovementSettings.slope_traversion or {}
PlayerUnitMovementSettings.slope_traversion.max_angle = math.pi*0.27
PlayerUnitMovementSettings.slope_traversion.standing_frames = 1
PlayerUnitMovementSettings.slope_traversion.jump_disallowed_frames = 10
PlayerUnitMovementSettings.slope_traversion.crouch_step_up = 0.15
PlayerUnitMovementSettings.slope_traversion.aim_step_up = 0.15
PlayerUnitMovementSettings.player_speed_scale = 1
PlayerUnitMovementSettings.player_air_speed_scale = 0.035
PlayerUnitMovementSettings.crouch_move_speed = 1.4
PlayerUnitMovementSettings.walk_move_speed = 1.9
PlayerUnitMovementSettings.move_speed = 4
PlayerUnitMovementSettings.backward_move_scale = 0.75
PlayerUnitMovementSettings.move_acceleration_up = 8
PlayerUnitMovementSettings.move_acceleration_down = 5
PlayerUnitMovementSettings.leap_speed = 10
PlayerUnitMovementSettings.post_dodge_jump_velocity_scale = 0.2
PlayerUnitMovementSettings.post_dodge_jump_speed_scale = 1
PlayerUnitMovementSettings.backwards_jump_velocity_scale = 0.35
PlayerUnitMovementSettings.rig_movement = PlayerUnitMovementSettings.rig_movement or {}
PlayerUnitMovementSettings.rig_movement.mass = 8
PlayerUnitMovementSettings.rig_movement.tension = 600
PlayerUnitMovementSettings.rig_movement.damping = 40
PlayerUnitMovementSettings.rig_movement.motion_offset = 3
PlayerUnitMovementSettings.rig_movement.horizontal_motion_damping = 0.8
PlayerUnitMovementSettings.rig_movement.vertical_motion_damping = 0.2
PlayerUnitMovementSettings.rig_movement.vertical_look_multiplier_ranged = 0.25
PlayerUnitMovementSettings.rig_movement.vertical_look_multiplier_melee = 0.1
PlayerUnitMovementSettings.ladder = PlayerUnitMovementSettings.ladder or {}
PlayerUnitMovementSettings.ladder.player_ladder_speed_scale = 1
PlayerUnitMovementSettings.ladder.climb_speed = 3
PlayerUnitMovementSettings.ladder.climb_move_acceleration_up = 4
PlayerUnitMovementSettings.ladder.climb_move_acceleration_down = 5
PlayerUnitMovementSettings.ladder.climb_pitch_offset = math.pi/8
PlayerUnitMovementSettings.ladder.climb_speed_lerp_interval = 22.5
PlayerUnitMovementSettings.ladder.climb_horizontals_multiplier = 0.25
PlayerUnitMovementSettings.ladder.climb_attach_to_ladder_position_in_ladder_space_y = -0.73
PlayerUnitMovementSettings.ladder.animation_distance_threshold_from_top_node = 2
PlayerUnitMovementSettings.ladder.movement_animation_length = 1.666
PlayerUnitMovementSettings.ladder.leaving_ladder_top_animation_time = 0.25
PlayerUnitMovementSettings.ladder.leaving_ladder_height_below_get_of_node = 0.4
PlayerUnitMovementSettings.ladder.enter_ladder_top_animation_time = 0.25
PlayerUnitMovementSettings.ladder.whole_movement_animation_distance = 2.5
PlayerUnitMovementSettings.ladder.threshold_for_idle_right = 0.166
PlayerUnitMovementSettings.ladder.threshold_for_idle_middle = 0.433
PlayerUnitMovementSettings.ladder.threshold_for_idle_left = 1.066
PlayerUnitMovementSettings.ladder.pitch_offset = 20
PlayerUnitMovementSettings.ladder.look_horizontal_max_degrees = 360
PlayerUnitMovementSettings.ladder.jump_backwards_force = -8.5
PlayerUnitMovementSettings.ladder.jump_up_force = 4.25
PlayerUnitMovementSettings.ladder.jump_force_backward_movement_time = 1
PlayerUnitMovementSettings.ladder.jump_force_forward_movement_time = 0.4
PlayerUnitMovementSettings.ladder.leave_ladder_reattach_time = 0.5
PlayerUnitMovementSettings.ladder.looking_up_threshold = -0.25
PlayerUnitMovementSettings.ladder.looking_down_threshold = -0.6
PlayerUnitMovementSettings.ladder.bot_looking_down_threshold = 0
PlayerUnitMovementSettings.soft_collision = {
	speed_modifier = 0.01,
	lowest_speed = 1,
	highest_speed = 3,
	grace_time_pushed_entering_standing = 0.75,
	max_distance = 0.65,
	max_height_diference = 0.1,
	idle_speed_threshold = 0.05
}
PlayerUnitMovementSettings.catapulted = PlayerUnitMovementSettings.catapulted or {}
PlayerUnitMovementSettings.catapulted.directions = PlayerUnitMovementSettings.catapulted.directions or {}
PlayerUnitMovementSettings.catapulted.directions.forward = {
	wall_collide_animation = "airtime_end",
	start_animation = "airtime_bwd",
	land_animation = "airtime_end"
}
PlayerUnitMovementSettings.catapulted.directions.backward = {
	wall_collide_animation = "airtime_end",
	start_animation = "airtime_fwd",
	land_animation = "airtime_end"
}
PlayerUnitMovementSettings.catapulted.directions.forward_thrown = {
	start_animation_1p = "airtime_bwd",
	start_animation = "airtime_fwd",
	wall_collide_animation = "airtime_end",
	land_animation = "airtime_end"
}
PlayerUnitMovementSettings.gameplay_collision_box = {
	collision_check_player_half_height = 0.8,
	collision_check_player_radius = 0.8,
	collision_check_player_height_offset = 0.8
}
PlayerUnitMovementSettings.ledge_hanging = {
	time_until_fall_down = 30,
	reattach_time = 2,
	look_horizontal_max_degrees_yaw = 0,
	look_horizontal_max_degrees_pitch = 0,
	attach_rotation_speed_slowdown_modifier_yaw = 0.1,
	attach_rotation_speed_slowdown_modifier_pitch = 0.1,
	attach_position_lerp_threshold = 0.05,
	attach_position_lerp_time_per_meter = 0.2,
	ledge_hanging_attachment_offset_x = -0,
	ledge_hanging_attachment_offset_y = 0.95,
	ledge_hanging_attachment_offset_z = 0.05,
	attach_pos_lerp_percentage_start_per_unit_velocity = 0.2,
	attach_max_instant_start_pos_movement = 0.3,
	leaving_animation_time = 2.83,
	leaving_time_to_activate_gravitation = 2.5,
	leaving_forward_push_factor = 0.1,
	leaving_push_up_constant = -0.01,
	falling_kill_timer = 0.2,
	leaving_falling_forward_push_constant = -1.8,
	leaving_falling_push_up_constant = -0.7
}
PlayerUnitMovementSettings.dodging = {
	distance = 2,
	speed_at_times = {
		{
			time_in_dodge = 0,
			speed = 1
		},
		{
			time_in_dodge = 0.05,
			speed = 4
		},
		{
			time_in_dodge = 0.1,
			speed = 7
		},
		{
			time_in_dodge = 0.25,
			speed = 5
		},
		{
			time_in_dodge = 0.4,
			speed = 2
		},
		{
			time_in_dodge = 0.5,
			speed = 1
		}
	},
	dodge_cd = 0.15,
	dodge_jump_override_timer = 0.35,
	stop_threshold = 0.1,
	speed_modifier = 1,
	distance_modifier = 1
}
PlayerUnitMovementSettings.first_person_height_knocked_down = 0.25
PlayerUnitMovementSettings.first_person_height_crouch = 1
PlayerUnitMovementSettings.first_person_height_stand = 1.65
PlayerUnitMovementSettings.slowing_damage_types = {
	projectile = true,
	kinetic = true,
	blunt = true,
	slashing = true,
	vomit_face = true,
	warpfire_ground = false,
	plague_face = false,
	piercing = true,
	vomit_ground = false,
	warpfire_face = false,
	cutting = true,
	crush = true
}
PlayerUnitMovementSettings.stun_settings = PlayerUnitMovementSettings.stun_settings or {}
PlayerUnitMovementSettings.stun_settings.parry_broken = {
	animation_driven = true,
	first_person_anim_name = "parry_break",
	third_person_anim_name = "parry_break",
	duration = 1
}
PlayerUnitMovementSettings.stun_settings.pushed = {
	animation_driven = false,
	first_person_anim_name = "interrupt",
	third_person_anim_name = "idle",
	duration = 0.2
}
PlayerUnitMovementSettings.hit_react_settings = {
	light_push = {
		start_look_sense_override = 0.9,
		end_look_sense_override = 1,
		movement_speed_modifier = 1,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.05 + -0.1

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 0.1

			return duration
		end,
		onscreen_particle_function = function (duration)
			return "fx/screenspace_head_blow_light_push"
		end
	},
	light = {
		start_look_sense_override = 0.6,
		end_look_sense_override = 1,
		movement_speed_modifier = 0.8,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.1 + -0.2

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 0.35

			return duration
		end,
		onscreen_particle_function = function (duration)
			if duration < 0.35 then
				return 
			end

			return "fx/screenspace_head_blow_light"
		end
	},
	medium_push = {
		start_look_sense_override = 0.6,
		end_look_sense_override = 1,
		movement_speed_modifier = 0.8,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.1 + -0.15

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 0.35

			return duration
		end,
		onscreen_particle_function = function (duration)
			return "fx/screenspace_head_blow_medium_push"
		end
	},
	medium = {
		start_look_sense_override = 0.4,
		end_look_sense_override = 0.8,
		movement_speed_modifier = 0.65,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.2 + -0.3

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 0.6

			return duration
		end,
		onscreen_particle_function = function (duration)
			if duration < 0.6 then
				return "fx/screenspace_head_blow_light"
			end

			return "fx/screenspace_head_blow_medium"
		end
	},
	heavy_push = {
		start_look_sense_override = 0.4,
		end_look_sense_override = 0.8,
		movement_speed_modifier = 0.65,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.1 + -0.25

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 0.6

			return duration
		end,
		onscreen_particle_function = function (duration)
			return "fx/screenspace_head_blow_heavy_push"
		end
	},
	heavy = {
		start_look_sense_override = 0.35,
		end_look_sense_override = 0.7,
		movement_speed_modifier = 0.5,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.2 + -0.5

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 1

			return duration
		end,
		onscreen_particle_function = function (duration)
			if duration < 1 then
				return "fx/screenspace_head_blow_medium"
			end

			return "fx/screenspace_head_blow_heavy"
		end
	},
	slow_bomb = {
		start_look_sense_override = 0.35,
		end_look_sense_override = 0.7,
		movement_speed_modifier = 0.1,
		look_override_function = function ()
			local look_override_x = (math.random() - 0.5)*0.5
			local look_override_y = math.random()*0.2 + -0.5

			return look_override_x, look_override_y
		end,
		duration_function = function ()
			local duration = 7

			return duration
		end,
		onscreen_particle_function = function (duration)
			if duration < 7 then
				return "fx/screenspace_head_blow_light"
			end

			return "fx/screenspace_head_blow_heavy"
		end
	}
}
PlayerUnitMovementSettings.overpowered_templates = PlayerUnitMovementSettings.overpowered_templates or {}
PlayerUnitMovementSettings.overpowered_templates.slow_bomb = {}
PlayerUnitMovementSettings.gravity_acceleration = 11
PlayerUnitMovementSettings.jump = PlayerUnitMovementSettings.jump or {}
PlayerUnitMovementSettings.jump.stamina_cost = 0
PlayerUnitMovementSettings.jump.initial_vertical_speed = 4.25
PlayerUnitMovementSettings.jump.initial_vertical_leap_speed = 5
PlayerUnitMovementSettings.fall = PlayerUnitMovementSettings.fall or {}
PlayerUnitMovementSettings.fall.heights = PlayerUnitMovementSettings.fall.heights or {}
PlayerUnitMovementSettings.fall.heights.FALL_DAMAGE_MULTIPLIER = 14
PlayerUnitMovementSettings.fall.heights.MIN_FALL_DAMAGE_HEIGHT = 5
PlayerUnitMovementSettings.fall.heights.MIN_FALL_DAMAGE = 0
PlayerUnitMovementSettings.fall.heights.MAX_FALL_DAMAGE = 150
PlayerUnitMovementSettings.fall.heights.HARD_LANDING_FALL_HEIGHT = 7
PlayerUnitMovementSettings.landing = PlayerUnitMovementSettings.landing or {}
PlayerUnitMovementSettings.landing.anim_forced_upper_body_block = 0.3
PlayerUnitMovementSettings.swing = PlayerUnitMovementSettings.swing or {}
PlayerUnitMovementSettings.swing.REQUIRED_MOVEMENT_TO_POSE = 0.003
PlayerUnitMovementSettings.swing.REQUIRED_MOVEMENT_TO_POSE_SCALE_Y_UP = 2.5
PlayerUnitMovementSettings.swing.REQUIRED_MOVEMENT_TO_POSE_SCALE_Y_DOWN = 0
PlayerUnitMovementSettings.swing.THRUST_TIMER = 0.15
PlayerUnitMovementSettings.swing.invert_pose_control_x = false
PlayerUnitMovementSettings.swing.invert_pose_control_y = false
PlayerUnitMovementSettings.swing.keyboard_controlled = false
PlayerUnitMovementSettings.swing.mounted_lean_swing_top = 0
PlayerUnitMovementSettings.swing.mounted_lean_swing_range = 30
PlayerUnitMovementSettings.swing.stamina_settings = PlayerUnitMovementSettings.swing.stamina_settings or {}
PlayerUnitMovementSettings.swing.stamina_settings.minimum_activation_cost = 0.1
PlayerUnitMovementSettings.swing.stamina_settings.activation_cost = 0.2
PlayerUnitMovementSettings.parry = PlayerUnitMovementSettings.parry or {}
PlayerUnitMovementSettings.parry.stamina_per_damage = 0.001375
PlayerUnitMovementSettings.parry.override_recharge_rate = 0.025
PlayerUnitMovementSettings.block = PlayerUnitMovementSettings.block or {}
PlayerUnitMovementSettings.block.stamina_per_damage = 0.001375
PlayerUnitMovementSettings.block.consecutive_block_impact_time = 3
PlayerUnitMovementSettings.block.consecutive_block_impact_multiplier = 1
PlayerUnitMovementSettings.block.override_recharge_rate = 0.025
PlayerUnitMovementSettings.block.aim_direction_pitch_function = function (z)
	return (z - 0.2)*1.25
end
PlayerUnitMovementSettings.parry = PlayerUnitMovementSettings.parry or {}
PlayerUnitMovementSettings.parry.REQUIRED_MOVEMENT_TO_POSE = 0.003
PlayerUnitMovementSettings.parry.invert_parry_control_x = false
PlayerUnitMovementSettings.parry.invert_parry_control_y = false
PlayerUnitMovementSettings.parry.keyboard_controlled = false
PlayerUnitMovementSettings.parry.raise_delay = 0.18
PlayerUnitMovementSettings.block = PlayerUnitMovementSettings.block or {}
PlayerUnitMovementSettings.block.raise_delay = 0.18

return 
