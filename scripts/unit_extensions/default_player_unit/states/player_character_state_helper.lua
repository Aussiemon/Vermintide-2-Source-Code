CharacterStateHelper = CharacterStateHelper or {}
local CharacterStateHelper = CharacterStateHelper

CharacterStateHelper.get_movement_input = function (input_extension)
	local move_input = input_extension:get("move") or Vector3(0, 0, 0)
	local move_input_controller = input_extension:get("move_controller") or Vector3(0, 0, 0)
	local movement = nil

	if Vector3.length(move_input_controller) < Vector3.length(move_input) then
		movement = Vector3.normalize(move_input)
	else
		movement = move_input_controller
	end

	return movement
end

CharacterStateHelper.get_square_movement_input = function (input_extension)
	local move_input = input_extension:get("move") or Vector3(0, 0, 0)
	local move_input_controller = input_extension:get("move_controller") or Vector3(0, 0, 0)
	local movement = nil

	if Vector3.length(move_input_controller) < Vector3.length(move_input) then
		movement = move_input
	else
		movement = math.circular_to_square_coordinates(move_input_controller)
	end

	return movement
end

CharacterStateHelper.get_look_input = function (input_extension, status_extension, inventory_extension, is_3p)
	local hacky_unit = status_extension.unit
	local targeting_data = nil

	if ScriptUnit.has_extension(hacky_unit, "smart_targeting_system") then
		local targeting_extension = ScriptUnit.extension(hacky_unit, "smart_targeting_system")
		targeting_data = targeting_extension:get_targeting_data()
	end

	local look_input = input_extension:get("look")
	local look_input_gamepad = nil
	local is_zooming = status_extension:is_zooming()
	local gamepad_enabled = Managers.input:is_device_active("gamepad")
	local wielded_slot_name = inventory_extension:get_wielded_slot_name()
	local weapon_template = inventory_extension:get_wielded_slot_item_template()

	if gamepad_enabled then
		if is_zooming then
			look_input_gamepad = input_extension:get("look_controller_zoom")
		elseif is_3p then
			look_input_gamepad = input_extension:get("look_controller_3p")
		elseif wielded_slot_name == "slot_ranged" then
			look_input_gamepad = input_extension:get("look_controller_ranged")
		elseif wielded_slot_name == "slot_melee" and targeting_data and targeting_data.targets_within_range then
			look_input_gamepad = input_extension:get("look_controller_melee")
		else
			look_input_gamepad = input_extension:get("look_controller")
		end
	end

	local look_delta = Vector3(0, 0, 0)

	if look_input then
		look_delta = look_delta + look_input
	end

	if look_input_gamepad then
		look_delta = look_delta + look_input_gamepad
	end

	look_delta = CharacterStateHelper.apply_motion_controls(look_delta, input_extension)

	if script_data.attract_mode_spectate then
		look_delta = Vector3(0.005, 0, 0)
	end

	return look_delta
end

CharacterStateHelper.apply_motion_controls = function (look_delta, input_extension)
	if MotionControlSettings.use_motion_controls then
		if MotionControlSettings.motion_disable_right_stick_vertical then
			look_delta.y = 0
		end

		local min = MotionControlSettings.sensitivity_min_value
		local base_multiplier = MotionControlSettings.sensitivity_base_value
		local yaw_steps = MotionControlSettings.sensitivity_yaw_max - MotionControlSettings.sensitivity_yaw_min
		local yaw_step = (base_multiplier - min) / (yaw_steps * 0.5)
		local motion_sensitivity_yaw = base_multiplier + MotionControlSettings.motion_sensitivity_yaw * yaw_step
		local pitch_steps = MotionControlSettings.sensitivity_pitch_max - MotionControlSettings.sensitivity_pitch_min
		local pitch_step = (base_multiplier - min) / (pitch_steps * 0.5)
		local motion_sensitivity_pitch = base_multiplier + MotionControlSettings.motion_sensitivity_pitch * pitch_step
		local scale_yaw = motion_sensitivity_yaw * ((MotionControlSettings.motion_invert_yaw and -1) or 1) * ((MotionControlSettings.motion_enable_yaw_motion and 1) or 0)
		local scale_pitch = motion_sensitivity_pitch * ((MotionControlSettings.motion_invert_pitch and -1) or 1) * ((MotionControlSettings.motion_enable_pitch_motion and 1) or 0)
		local angular_velocity = input_extension:get("angular_velocity")
		local magnitude_x = (angular_velocity and angular_velocity.x) or 0
		local magnitude_y = (angular_velocity and -angular_velocity.y) or 0
		look_delta = look_delta + Vector3(scale_yaw * magnitude_y, scale_pitch * magnitude_x, 0)
	end

	return look_delta
end

CharacterStateHelper.update_dodge_lock = function (unit, input_extension, status_extension)
	if status_extension:dodge_locked() and not input_extension:get("dodge_hold") then
		status_extension:set_dodge_locked(false)
	end
end

local DOUBLE_TAP_DODGES = {
	move_left_pressed = Vector3Box(-Vector3.right()),
	move_right_pressed = Vector3Box(Vector3.right()),
	move_back_pressed = Vector3Box(-Vector3.forward())
}

CharacterStateHelper.check_to_start_dodge = function (unit, input_extension, status_extension, t)
	if status_extension:dodge_locked() or not status_extension:can_dodge(t) then
		return false
	end

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input = CharacterStateHelper.get_movement_input(input_extension)
	local double_tap_dodge = input_extension.double_tap_dodge
	local start_dodge = false
	local dodge_direction = Vector3(0, 0, 0)
	local dodge_hold = input_extension:get("dodge_hold")
	local manual_dodge = input_extension:get("dodge")
	local dodge_input = manual_dodge or (input_extension:get("jump") and dodge_hold)
	local input_length = Vector3.length(input)
	local using_keyboard = not Managers.input:is_device_active("gamepad")
	local stationary_dodge = Application.user_setting("toggle_stationary_dodge")

	if double_tap_dodge then
		for input, dir in pairs(DOUBLE_TAP_DODGES) do
			if input_extension:get(input) then
				local was_double_tap = input_extension:was_double_tap(input, t, Application.user_setting("double_tap_dodge_threshold"))

				for input, dir in pairs(DOUBLE_TAP_DODGES) do
					input_extension:clear_double_tap(input)
				end

				if was_double_tap then
					start_dodge = true
					dodge_direction = dir:unbox()

					break
				end

				input_extension:start_double_tap(input, t)

				break
			end
		end
	end

	if not start_dodge and dodge_input and input_extension.minimum_dodge_input < input_length then
		local normalized_input = input / input_length
		local x = normalized_input.x
		local y = normalized_input.y
		local abs_x = math.abs(x)
		local forward_ok = y <= 0 or (not using_keyboard and abs_x > 0.9239) or (manual_dodge and abs_x > 0.707)

		if forward_ok then
			start_dodge = true

			if y > 0 then
				dodge_direction = Vector3(math.sign(x), 0, 0)
			else
				dodge_direction = normalized_input
			end
		end
	elseif dodge_input and stationary_dodge then
		start_dodge = true
		dodge_direction = -Vector3.forward()
	end

	if start_dodge then
		Managers.state.entity:system("play_go_tutorial_system"):register_dodge(dodge_direction)
		status_extension:add_fatigue_points("action_dodge")
		status_extension:set_dodge_locked(true)
		status_extension:add_dodge_cooldown()

		slot15 = ScriptUnit.extension(unit, "first_person_system")
	end

	return start_dodge, dodge_direction
end

CharacterStateHelper.move_on_ground = function (first_person_extension, input_extension, locomotion_extension, local_move_direction, speed, unit, strafe_speed_mult)
	local unit_rotation = first_person_extension:current_rotation()
	local flat_unit_rotation = Quaternion.look(Vector3.flat(Quaternion.forward(unit_rotation)), Vector3.up())
	local move_direction = Quaternion.rotate(flat_unit_rotation, local_move_direction)

	if local_move_direction.y < 0 then
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		speed = speed * movement_settings_table.backward_move_scale
	end

	local dot = Vector3.dot(Quaternion.forward(flat_unit_rotation), move_direction)
	local strafe_speed_penalty = (strafe_speed_mult and 1 - strafe_speed_mult) or 0
	speed = speed - speed * strafe_speed_penalty * (1 - math.abs(dot))

	locomotion_extension:set_wanted_velocity(move_direction * speed)
end

CharacterStateHelper.packmaster_move_on_ground = function (t, first_person_extension, input_extension, locomotion_extension, local_move_direction, speed, unit, player, pole_dir, dragged_unit, idle_anim_played, is_pushing)
	local unit_rotation = first_person_extension:current_rotation()
	local flat_unit_rotation = Quaternion.look(Vector3.flat(Quaternion.forward(unit_rotation)), Vector3.up())
	local move_direction = Quaternion.rotate(flat_unit_rotation, local_move_direction)
	local world = Managers.world:world("level_world")
	local physics_world = World.get_data(world, "physics_world")
	local camera_rotation = Managers.state.camera:camera_rotation(player.viewport_name)
	local camera_direction = Quaternion.forward(camera_rotation)

	Vector3.set_z(camera_direction, 0)
	Vector3.set_z(pole_dir, 0)

	camera_direction = Vector3.normalize(camera_direction)
	pole_dir = Vector3.normalize(pole_dir)
	local dot = Vector3.dot(pole_dir, move_direction)
	local is_pushing = dot > 0
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local penalty = math.clamp(1 - dot, movement_settings_table.packmaster_forward_move_scale, 1)

	if is_pushing then
		local ray_dist = (idle_anim_played and 1.5) or 1.1
		local dragged_unit_pos = POSITION_LOOKUP[dragged_unit]
		local hit, hit_position, dist, hit_normal, actor = PhysicsWorld.immediate_raycast(physics_world, dragged_unit_pos + Vector3(0, 0, 0.5), pole_dir, ray_dist, "closest", "types", "both", "collision_filter", "filter_ground_material_check")

		if hit then
			penalty = 0
		end
	else
		local neck_node = Unit.node(dragged_unit, "j_neck")
		local neck_position = Unit.world_position(dragged_unit, neck_node)
		local hand_node = Unit.node(unit, "j_rightweaponcomponent10")
		local hand_node_position = Unit.world_position(unit, hand_node)
		local distance = Vector3.distance(neck_position, hand_node_position)

		if distance > 3.25 then
			penalty = 0
		end
	end

	speed = speed * penalty

	locomotion_extension:set_wanted_velocity(move_direction * speed)
end

CharacterStateHelper.update_soft_collision_movement = function (first_person_extension, status_extension, locomotion_extension, unit, world, current_animation, side)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local final_velocity = Vector3(0, 0, 0)
	local own_position = POSITION_LOOKUP[unit]
	local rotation = Unit.local_rotation(unit, 0)
	local player_units = side.PLAYER_UNITS

	if Unit.alive(unit) then
		for index, player_unit in pairs(player_units) do
			if player_unit ~= unit and Unit.alive(player_unit) and StatusUtils.use_soft_collision(player_unit) then
				local distance = own_position - POSITION_LOOKUP[player_unit]
				local height_diference = math.abs(Vector3.z(distance))

				Vector3.set_z(distance, 0)

				local length = Vector3.length(distance)

				if height_diference <= movement_settings_table.soft_collision.max_height_diference and length <= movement_settings_table.soft_collision.max_distance then
					local direction = Vector3.normalize(distance)
					local speed = 1 / (length + movement_settings_table.soft_collision.speed_modifier)
					speed = speed * speed
					final_velocity = final_velocity + direction * speed
				end
			end
		end
	end

	local final_direction_length = Vector3.length(final_velocity)
	local final_direction = Vector3.normalize(final_velocity)
	local idle_speed_threshold = movement_settings_table.soft_collision.idle_speed_threshold

	if final_direction_length <= idle_speed_threshold then
		locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
	else
		final_direction_length = math.clamp(final_direction_length, movement_settings_table.soft_collision.lowest_speed, movement_settings_table.soft_collision.highest_speed)

		locomotion_extension:set_wanted_velocity(final_direction * final_direction_length)
	end

	if final_direction_length <= idle_speed_threshold then
		if current_animation ~= "idle" then
			CharacterStateHelper.play_animation_event(unit, "idle")
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")

			current_animation = "idle"
		end
	elseif Vector3.dot(final_direction, Quaternion.forward(rotation)) >= 0 then
		if current_animation ~= "move_fwd" then
			CharacterStateHelper.play_animation_event(unit, "move_fwd")
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "move_fwd")

			current_animation = "move_fwd"
		end
	elseif current_animation ~= "move_bwd" then
		CharacterStateHelper.play_animation_event(unit, "move_bwd")
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "move_bwd")

		current_animation = "move_bwd"
	end

	return current_animation
end

CharacterStateHelper.do_common_state_transitions = function (status_extension, csm, in_state)
	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return true
	end

	if CharacterStateHelper.is_staggered(status_extension) then
		csm:change_state("staggered")

		return true
	end

	if CharacterStateHelper.is_knocked_down(status_extension) then
		csm:change_state("knocked_down")

		return true
	end

	if CharacterStateHelper.is_pounced_down(status_extension) then
		csm:change_state("pounced_down")

		return true
	end

	local is_catapulted, direction = CharacterStateHelper.is_catapulted(status_extension)

	if is_catapulted then
		local params = {
			sound_event = "Play_hit_by_ratogre",
			direction = direction
		}

		csm:change_state("catapulted", params)

		return true
	end

	if CharacterStateHelper.is_grabbed_by_pack_master(status_extension) then
		csm:change_state("grabbed_by_pack_master")

		return true
	end

	if status_extension.grabbed_by_corruptor then
		csm:change_state("grabbed_by_corruptor")

		return true
	end

	if status_extension.grabbed_by_tentacle then
		csm:change_state("grabbed_by_tentacle")

		return true
	end

	if status_extension.grabbed_by_chaos_spawn then
		csm:change_state("grabbed_by_chaos_spawn")

		return true
	end

	if status_extension.in_vortex then
		csm:change_state("in_vortex")

		return true
	end

	if status_extension.do_lunge then
		csm:change_state("lunging")

		return true
	end

	if status_extension.is_packmaster_dragging then
		local dragged_unit = status_extension:get_packmaster_dragged_unit()
		local dragged_unit_status_extension = ScriptUnit.extension(dragged_unit, "status_system")
		local being_hoisted = dragged_unit_status_extension.pack_master_status == "pack_master_hanging" or dragged_unit_status_extension.pack_master_status == "pack_master_hoisting"

		if not being_hoisted then
			csm:change_state("packmaster_dragging")

			return true
		end
	end

	if status_extension.in_hanging_cage then
		local animations = status_extension.in_hanging_cage_animations
		local cage_unit = status_extension.in_hanging_cage_unit
		local params = {
			animations = animations,
			cage_unit = cage_unit
		}

		csm:change_state("in_hanging_cage", params)

		return true
	end

	if in_state ~= "overpowered" and status_extension.overpowered then
		local params = PlayerUnitMovementSettings.overpowered_templates[status_extension.overpowered_template]

		csm:change_state("overpowered", params)

		return true
	end

	return false
end

CharacterStateHelper.is_colliding_with_gameplay_collision_box = function (world, unit, collision_filter, params)
	local physics_world = World.get_data(world, "physics_world")
	local position = (params and params.position) or POSITION_LOOKUP[unit]
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_settings_table_name = (params and params.movement_settings_table_name) or "gameplay_collision_box"
	local player_half_height = movement_settings_table[movement_settings_table_name].collision_check_player_half_height
	local player_height_offset = movement_settings_table[movement_settings_table_name].collision_check_player_height_offset
	local offset = Vector3(0, 0, player_height_offset)
	position = position + offset
	local rotation = Unit.local_rotation(unit, 0)
	local radius = movement_settings_table[(params and params.movement_settings_table_name) or "gameplay_collision_box"].collision_check_player_radius
	local size = Vector3(radius, player_half_height, radius)
	local shape = (player_half_height - radius > 0 and "capsule") or "sphere"
	local actors = PhysicsWorld.immediate_overlap(physics_world, "shape", shape, "position", position, "rotation", rotation, "size", size, "collision_filter", collision_filter, "use_global_table")
	local collided_actor = actors and actors[1]
	local colliding, collided_unit = nil

	if collided_actor then
		colliding = true
		collided_unit = Actor.unit(collided_actor)
	end

	return colliding, collided_unit
end

CharacterStateHelper.move_in_air = function (first_person_extension, input_extension, locomotion_extension, speed, unit, wait_timer_force_backwards_movement, wait_timer_force_forward_movement)
	local movement = CharacterStateHelper.get_movement_input(input_extension)
	local force_y_movement = 0

	if wait_timer_force_backwards_movement and wait_timer_force_backwards_movement > 0 then
		force_y_movement = force_y_movement - 1
	end

	if wait_timer_force_forward_movement and wait_timer_force_forward_movement > 0 then
		force_y_movement = force_y_movement + 1
	end

	if force_y_movement ~= 0 then
		Vector3.set_y(movement, force_y_movement)
	end

	local move_direction = Vector3.normalize(movement)
	local unit_rotation = first_person_extension:current_rotation()
	local move_velocity = Vector3.normalize(Vector3.flat(Quaternion.rotate(unit_rotation, move_direction)))
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local move_cap = math.clamp(movement_settings_table.move_speed, 0, PlayerUnitMovementSettings.move_speed)

	if movement.y < 0 then
		speed = speed * movement_settings_table.backward_move_scale
		move_cap = move_cap * movement_settings_table.backward_move_scale * 0.9
	end

	local prev_move_velocity = Vector3.flat(locomotion_extension:current_velocity())
	local new_move_velocity = prev_move_velocity + move_velocity * speed
	local new_move_speed = Vector3.length(new_move_velocity)
	new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
	local new_move_direction = Vector3.normalize(new_move_velocity)

	locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
end

CharacterStateHelper.move_in_air_pactsworn = function (first_person_extension, input_extension, locomotion_extension, speed, unit, wait_timer_force_backwards_movement, wait_timer_force_forward_movement, dt)
	local movement = CharacterStateHelper.get_movement_input(input_extension)
	local force_y_movement = 0
	local breed = Unit.get_data(unit, "breed")

	if wait_timer_force_backwards_movement and wait_timer_force_backwards_movement > 0 then
		force_y_movement = force_y_movement - 1
	end

	if wait_timer_force_forward_movement and wait_timer_force_forward_movement > 0 then
		force_y_movement = force_y_movement + 1
	end

	if force_y_movement ~= 0 then
		Vector3.set_y(movement, force_y_movement)
	end

	local move_direction = Vector3.normalize(movement)
	local unit_rotation = first_person_extension:current_rotation()
	local move_velocity = Vector3.normalize(Vector3.flat(Quaternion.rotate(unit_rotation, move_direction)))
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local move_cap = breed.movement_speed
	local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	if in_ghost_mode then
		move_cap = movement_settings_table.ghost_move_speed
	end

	move_cap = move_cap * 0.7

	if movement.y < 0 then
		speed = speed * movement_settings_table.backward_move_scale
		move_cap = move_cap * movement_settings_table.backward_move_scale * 0.9
	end

	local prev_move_velocity = Vector3.flat(locomotion_extension:current_velocity())
	local new_move_velocity = prev_move_velocity + move_velocity * speed
	local new_move_speed = Vector3.length(new_move_velocity)
	new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
	local new_move_direction = Vector3.normalize(new_move_velocity)

	locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
end

CharacterStateHelper.looking_up = function (first_person_extension, threshold)
	local first_person_unit = first_person_extension:get_first_person_unit()
	local rotation = Unit.world_rotation(first_person_unit, 0)
	local direction = Quaternion.forward(rotation)
	local normalised_direction = Vector3.normalize(direction)
	local dot = Vector3.dot(normalised_direction, Vector3.up())

	return (threshold < dot and true) or false
end

CharacterStateHelper.looking_down = function (first_person_extension, threshold)
	local first_person_unit = first_person_extension:get_first_person_unit()
	local rotation = Unit.world_rotation(first_person_unit, 0)
	local direction = Quaternion.forward(rotation)
	local normalised_direction = Vector3.normalize(direction)
	local dot = Vector3.dot(normalised_direction, Vector3.up())

	return (dot < threshold and true) or false
end

CharacterStateHelper.look = function (input_extension, viewport_name, first_person_extension, status_extension, inventory_extension, override_sens, override_delta)
	local camera_manager = Managers.state.camera
	local look_sensitivity = override_sens or (camera_manager:has_viewport(viewport_name) and camera_manager:fov(viewport_name) / 0.785) or 1
	local is_3p = false
	local look_delta = CharacterStateHelper.get_look_input(input_extension, status_extension, inventory_extension, is_3p)
	look_delta = look_delta * look_sensitivity

	if override_delta then
		look_delta = look_delta + override_delta
	end

	first_person_extension:set_look_delta(look_delta)
end

CharacterStateHelper.look_limited_rotation_freedom = function (input_extension, viewport_name, first_person_extension, unit, rotation, max_radians_yaw, max_radians_pitch, status_extension, inventory_extension, override_sens)
	local camera_manager = Managers.state.camera
	local look_sensitivity = override_sens or (camera_manager:has_viewport(viewport_name) and Managers.state.camera:fov(viewport_name) / 0.785) or 1
	local is_3p = false
	local look_delta = CharacterStateHelper.get_look_input(input_extension, status_extension, inventory_extension, is_3p)
	look_delta = look_delta * look_sensitivity
	local new_look_delta = look_delta

	if max_radians_yaw then
		local ladder_yaw = Quaternion.yaw(rotation)
		local own_yaw = Quaternion.yaw(Unit.local_rotation(first_person_extension.first_person_unit, 0))
		local dif_yaw = ladder_yaw - own_yaw
		local look_delta_x = Vector3.x(new_look_delta)

		if look_delta_x > 0 and max_radians_yaw < dif_yaw then
			look_delta_x = 0
		end

		if look_delta_x < 0 and dif_yaw < -max_radians_yaw then
			look_delta_x = 0
		end

		Vector3.set_x(new_look_delta, look_delta_x)
	end

	if max_radians_pitch then
		local ladder_pitch = Quaternion.pitch(rotation)
		local own_pitch = Quaternion.pitch(Unit.local_rotation(first_person_extension.first_person_unit, 0))
		local dif_pitch = ladder_pitch - own_pitch
		local look_delta_y = Vector3.y(new_look_delta)
		local half_pi = math.pi / 2

		if look_delta_y < 0 and max_radians_pitch < dif_pitch then
			look_delta_y = 0
		end

		if look_delta_y > 0 and dif_pitch < -max_radians_pitch then
			look_delta_y = 0
		end

		Vector3.set_y(new_look_delta, look_delta_y)
	end

	first_person_extension:set_look_delta(new_look_delta)
end

CharacterStateHelper.lerp_player_rotation_radian = function (player_radian, target_radian, original_diference_radian, percentage_in_lerp)
	local final_radian_value = nil

	if (target_radian >= 0 and player_radian >= 0) or (target_radian <= 0 and player_radian <= 0) then
		final_radian_value = player_radian + (target_radian - player_radian) * percentage_in_lerp
	else
		local current_rotation = original_diference_radian * percentage_in_lerp

		if target_radian < 0 then
			local dif_radian = math.abs(target_radian) + player_radian

			if math.pi < dif_radian then
				final_radian_value = player_radian + current_rotation

				if math.pi <= final_radian_value then
					local below_pi = math.pi - math.abs(final_radian_value)
					final_radian_value = math.pi - below_pi
				end
			else
				final_radian_value = player_radian - current_rotation
			end
		else
			local dif_radian = target_radian + math.abs(player_radian)

			if math.pi < dif_radian then
				final_radian_value = player_radian - current_rotation

				if final_radian_value <= -math.pi then
					local above_pi = final_radian_value - math.pi
					final_radian_value = -math.pi + above_pi
				end
			else
				final_radian_value = player_radian + current_rotation
			end
		end
	end

	return final_radian_value
end

CharacterStateHelper.lerp_player_pitch_rotation = function (player_start_pitch, first_person_extension, percentage_in_lerp, unit)
	local player_rotation = Unit.local_rotation(unit, 0)
	local new_pitch = math.lerp(player_start_pitch, 0, percentage_in_lerp)
	local player_yaw = Quaternion.yaw(player_rotation)
	local player_roll = Quaternion.roll(player_rotation)
	local player_yaw_rotation = Quaternion(Vector3.up(), player_yaw)
	local player_pitch_rotation = Quaternion(Vector3.right(), new_pitch)
	local player_roll_rotation = Quaternion(Vector3.forward(), player_roll)
	local yaw_pitch_rotation = Quaternion.multiply(player_yaw_rotation, player_pitch_rotation)
	local final_roation = Quaternion.multiply(yaw_pitch_rotation, player_roll_rotation)

	first_person_extension:set_rotation(final_roation)
	Unit.set_local_rotation(unit, 0, final_roation)
end

CharacterStateHelper.lerp_player_yaw_rotation = function (player_yaw, target_yaw, original_diference_yaw, first_person_extension, percentage_in_lerp, unit)
	local first_person_unit = first_person_extension:get_first_person_unit()
	local player_rotation = Unit.local_rotation(first_person_unit, 0)
	local final_yaw = CharacterStateHelper.lerp_player_rotation_radian(player_yaw, target_yaw, original_diference_yaw, percentage_in_lerp)
	local player_pitch = Quaternion.pitch(player_rotation)
	local player_roll = Quaternion.roll(player_rotation)
	local player_yaw_rotation = Quaternion(Vector3.up(), final_yaw)
	local player_pitch_rotation = Quaternion(Vector3.right(), player_pitch)
	local player_roll_rotation = Quaternion(Vector3.forward(), player_roll)
	local yaw_pitch_rotation = Quaternion.multiply(player_yaw_rotation, player_pitch_rotation)
	local final_roation = Quaternion.multiply(yaw_pitch_rotation, player_roll_rotation)

	first_person_extension:set_rotation(final_roation)
	Unit.set_local_rotation(unit, 0, final_roation)
end

CharacterStateHelper.time_in_ladder_move_animation = function (unit, ladder_base_height)
	local unit_pos = Unit.world_position(unit, 0)
	local unit_position_height = Vector3.z(unit_pos)
	local above_ladder_position = unit_position_height - ladder_base_height
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local percentage_in_move_animation = above_ladder_position % movement_settings_table.ladder.whole_movement_animation_distance / movement_settings_table.ladder.whole_movement_animation_distance
	local time_in_move_animation = percentage_in_move_animation * movement_settings_table.ladder.movement_animation_length

	return time_in_move_animation
end

CharacterStateHelper.show_inventory_3p = function (unit, show_inventory_3p, include_local_player, is_server, inventory_extension)
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)

	if not network_manager.game_session then
		return
	end

	if include_local_player or (is_server and inventory_extension.is_bot) then
		inventory_extension:show_third_person_inventory(show_inventory_3p)
	end

	if is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_show_inventory", unit_id, show_inventory_3p)
	else
		network_manager.network_transmit:send_rpc_server("rpc_show_inventory", unit_id, show_inventory_3p)
	end
end

CharacterStateHelper.set_is_on_ladder = function (ladder_unit, unit, on_ladder, is_server, status_extension)
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local ladder_level_index, is_level_unit = network_manager:game_object_or_level_id(ladder_unit)

	assert(is_level_unit, "Ladder unit wasn't a level unit")

	if is_server or LEVEL_EDITOR_TEST then
		local status_system = Managers.state.entity:system("status_system")

		status_system:rpc_status_change_bool(nil, NetworkLookup.statuses.ladder_climbing, on_ladder, unit_id, ladder_level_index)
	else
		status_extension:set_is_on_ladder(on_ladder, ladder_unit)
		network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.ladder_climbing, on_ladder, unit_id, ladder_level_index)
	end
end

CharacterStateHelper.set_is_on_ledge = function (ledge_unit, unit, on_ledge, is_server, status_extension)
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local ledge_level_index, is_level_unit = network_manager:game_object_or_level_id(ledge_unit)

	status_extension:set_crouching(false)

	if Managers.state.network:game() and not LEVEL_EDITOR_TEST then
		status_extension:set_is_ledge_hanging(on_ledge, ledge_unit)
		network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.ledge_hanging, on_ledge, unit_id, ledge_level_index)
	end
end

CharacterStateHelper.get_buffered_input = function (input_id, input_extension, no_buffer, doubleclick_window, softbutton_threshold, is_melee_slot)
	local input, buffered = nil

	if input_id then
		input = input_extension:get(input_id)

		if input and softbutton_threshold and input < softbutton_threshold then
			return false
		end

		if not no_buffer then
			if input then
				input_extension:add_buffer(input_id, doubleclick_window)
			else
				input = input_extension:get_buffer(input_id)
				buffered = true
			end
		end
	end

	return input, buffered
end

CharacterStateHelper._check_cooldown = function (weapon_extension, action, t)
	local is_in_cooldown = false

	if weapon_extension then
		local action_cooldown = weapon_extension:get_action_cooldown(action)
		is_in_cooldown = action_cooldown and t <= action_cooldown
	end

	return is_in_cooldown
end

CharacterStateHelper.wield_input = function (input_extension, inventory_extension, action_name, verify)
	if action_name ~= "action_wield" then
		return nil
	end

	local slots_by_name = InventorySettings.slots_by_name
	local wieldable_slots = InventorySettings.slots_by_wield_input
	local equipment = inventory_extension:equipment()
	local wielded_slot_name = equipment.wielded_slot
	local current_slot = slots_by_name[wielded_slot_name]
	local current_slot_wield_input = current_slot.wield_input
	local slot_to_wield = nil

	if CharacterStateHelper.get_buffered_input("wield_switch", input_extension, nil, nil, nil, wielded_slot_name == "slot_melee") then
		if current_slot.name ~= "slot_melee" then
			slot_to_wield = "slot_melee"
		else
			slot_to_wield = "slot_ranged"
		end
	end

	if not slot_to_wield then
		for index, slot in ipairs(wieldable_slots) do
			if slot ~= current_slot or inventory_extension:can_swap_from_storage(slot.name, SwapFromStorageType.Unique) then
				local wield_input = slot.wield_input
				local name = slot.name

				if equipment.slots[name] and CharacterStateHelper.get_buffered_input(wield_input, input_extension, nil, nil, nil, wielded_slot_name == "slot_melee") then
					slot_to_wield = name

					break
				end
			end
		end
	end

	local scroll_value = 0

	if input_extension:get("wield_prev") then
		scroll_value = -1
	elseif input_extension:get("wield_next") then
		scroll_value = 1
	end

	local changing_debug_speed = DebugKeyHandler.key_pressed("left shift") or DebugKeyHandler.key_pressed("left alt")
	local scroll_type = Application.user_setting("weapon_scroll_type") or "scroll_wrap"

	if scroll_type ~= "scroll_disabled" and not slot_to_wield and scroll_value ~= 0 and not changing_debug_speed then
		local current_index = current_slot.wield_index or 1
		local num_slots = #wieldable_slots
		local slot_to_wield_index = current_index + scroll_value
		local scroll_dir = math.sign(scroll_value)

		while not wieldable_slots[slot_to_wield_index] or not equipment.slots[wieldable_slots[slot_to_wield_index].name] do
			if num_slots < slot_to_wield_index then
				if scroll_type == "scroll_clamp" then
					slot_to_wield_index = num_slots
					scroll_dir = -1
				else
					slot_to_wield_index = 1
				end
			elseif slot_to_wield_index < 1 then
				if scroll_type == "scroll_clamp" then
					slot_to_wield_index = 1
					scroll_dir = 1
				else
					slot_to_wield_index = num_slots
				end
			else
				slot_to_wield_index = slot_to_wield_index + scroll_dir
			end
		end

		if current_slot.wield_index ~= slot_to_wield_index then
			slot_to_wield = wieldable_slots[slot_to_wield_index].name
		end
	end

	if slot_to_wield and not equipment.slots[slot_to_wield] then
		slot_to_wield = nil
	end

	return slot_to_wield, scroll_value
end

local empty_table = {}

CharacterStateHelper.get_item_data_and_weapon_extensions = function (inventory_extension)
	local equipment = inventory_extension:equipment()
	local item_data = equipment.wielded

	if item_data == nil then
		return
	end

	local right_hand_wielded_unit = equipment.right_hand_wielded_unit
	local left_hand_wielded_unit = equipment.left_hand_wielded_unit
	local right_hand_weapon_extension, left_hand_weapon_extension = nil

	if Unit.alive(right_hand_wielded_unit) then
		right_hand_weapon_extension = ScriptUnit.extension(right_hand_wielded_unit, "weapon_system")
	end

	if Unit.alive(left_hand_wielded_unit) then
		left_hand_weapon_extension = ScriptUnit.extension(left_hand_wielded_unit, "weapon_system")
	end

	if not right_hand_weapon_extension and not left_hand_weapon_extension then
		return
	end

	return item_data, right_hand_weapon_extension, left_hand_weapon_extension
end

CharacterStateHelper.get_current_action_data = function (left_hand_weapon_extension, right_hand_weapon_extension)
	local current_action_settings, current_action_extension, current_action_hand = nil

	if left_hand_weapon_extension then
		local left_current_action_settings = left_hand_weapon_extension.current_action_settings

		if left_current_action_settings then
			current_action_settings = left_current_action_settings
			current_action_extension = left_hand_weapon_extension
			current_action_hand = current_action_settings.weapon_action_hand or "left"
		end
	end

	if right_hand_weapon_extension then
		local right_current_action_settings = right_hand_weapon_extension.current_action_settings

		if right_current_action_settings then
			current_action_settings = right_current_action_settings
			current_action_extension = right_hand_weapon_extension
			current_action_hand = current_action_settings.weapon_action_hand or "right"
		end
	end

	return current_action_settings, current_action_extension, current_action_hand
end

CharacterStateHelper._check_chain_action = function (wield_input, action_data, item_template, current_action_extension, input_extension, inventory_extension, unit, t, ammo_extension)
	local new_action, new_sub_action, send_buffer, clear_buffer, force_release_input = nil
	local release_required = action_data.release_required
	local input_extra_requirement = true

	if release_required then
		input_extra_requirement = input_extension:released_input(release_required)
	end

	local hold_required = action_data.hold_required

	if hold_required then
		for index, hold_require in pairs(hold_required) do
			if input_extension:released_input(hold_require) then
				input_extra_requirement = false

				break
			end
		end
	end

	local input_id = action_data.input
	local softbutton_threshold = action_data.softbutton_threshold
	local input, buffered = nil
	local no_buffer = action_data.no_buffer
	local doubleclick_window = action_data.doubleclick_window
	local blocking_input = action_data.blocking_input
	local blocked = false

	if blocking_input then
		blocked = input_extension:get(blocking_input)
	end

	if input_extra_requirement and not blocked then
		local equipment = inventory_extension:equipment()
		local wielded_slot_name = equipment.wielded_slot
		input, buffered = CharacterStateHelper.get_buffered_input(input_id, input_extension, no_buffer, doubleclick_window, softbutton_threshold, wielded_slot_name == "slot_melee")

		if not input and action_data.hold_allowed then
			input, buffered = CharacterStateHelper.get_buffered_input(input_id .. "_hold", input_extension, no_buffer, doubleclick_window, softbutton_threshold, wielded_slot_name == "slot_melee")
		end
	end

	input = input or (action_settings and action_settings.kind == "block" and input_extension:is_input_blocked())

	if not input then
		wield_input = CharacterStateHelper.wield_input(input_extension, inventory_extension, action_data.action)
		input = wield_input
	end

	if input or action_data.auto_chain then
		local select_chance = action_data.select_chance or 1
		local is_selected = math.random() <= select_chance
		local chain_action_available = current_action_extension:is_chain_action_available(action_data, t)

		if chain_action_available and is_selected then
			local sub_action = action_data.sub_action

			if action_data.blocker then
				return true, nil, nil, wield_input, nil, nil
			end

			if sub_action then
				new_action = action_data.action
				new_sub_action = sub_action
				local action_settings = item_template.actions[new_action] and item_template.actions[new_action][new_sub_action]
				local condition_func = action_settings and action_settings.chain_condition_func
				local condition_failed = false

				if condition_func then
					condition_failed = not condition_func(unit, input_extension, ammo_extension)
				end

				local cooldown = CharacterStateHelper._check_cooldown(current_action_extension, new_action, t)

				if action_settings and not condition_failed and not cooldown then
					send_buffer = action_data.send_buffer
					clear_buffer = action_data.clear_buffer

					if buffered and action_data.input == "action_one_release" then
						force_release_input = "action_one_hold"
					end

					return true, new_action, new_sub_action, wield_input, send_buffer, clear_buffer, force_release_input
				end
			end
		end
	end

	return false
end

local career_chain_action = {
	sub_action = "default",
	start_time = 0,
	action = "N/A",
	input = "action_career"
}

CharacterStateHelper._get_chain_action_data = function (item_template, current_action_extension, current_action_settings, input_extension, inventory_extension, unit, t, ammo_extension)
	local done, new_action, new_sub_action, wield_input, send_buffer, clear_buffer, force_release_input = nil
	local career_extension = ScriptUnit.has_extension(unit, "career_system")

	if career_extension then
		local lookup_data = current_action_settings.lookup_data
		local current_action_name = lookup_data.action_name
		local num_abilities = career_extension:ability_amount()

		for i = 1, num_abilities, 1 do
			local activated_ability_data = career_extension:get_activated_ability_data(i)
			local action_name = activated_ability_data.action_name

			if action_name and action_name ~= current_action_name then
				local action_data = career_chain_action
				action_data.action = action_name
				local career_done, career_new_action, career_new_sub_action, career_wield_input, career_send_buffer, career_clear_buffer, career_force_release_input = CharacterStateHelper._check_chain_action(wield_input, action_data, item_template, current_action_extension, input_extension, inventory_extension, unit, t, ammo_extension)

				if career_done then
					local on_wield = activated_ability_data.activatable_on_wield_chain_only
					local career_action_allowed = not on_wield

					if on_wield then
						local chain_actions = current_action_settings.allowed_chain_actions

						if chain_actions then
							for chain_action_idx = 1, #chain_actions, 1 do
								local chain_action_data = chain_actions[chain_action_idx]

								if chain_action_data.input == "action_wield" and current_action_extension:is_chain_action_available(chain_action_data, t) then
									career_action_allowed = true

									break
								end
							end
						end
					end

					if career_action_allowed then
						done = career_done
						new_action = career_new_action
						new_sub_action = career_new_sub_action
						wield_input = career_wield_input
						send_buffer = career_send_buffer
						clear_buffer = career_clear_buffer
						force_release_input = career_force_release_input
					end
				end
			end
		end
	end

	if not new_action then
		local chain_actions = current_action_settings.allowed_chain_actions or empty_table

		for i = 1, #chain_actions, 1 do
			local action_data = chain_actions[i]
			done, new_action, new_sub_action, wield_input, send_buffer, clear_buffer, force_release_input = CharacterStateHelper._check_chain_action(wield_input, action_data, item_template, current_action_extension, input_extension, inventory_extension, unit, t, ammo_extension)

			if done then
				break
			end
		end
	end

	if new_action then
		local action_settings = item_template.actions[new_action] and item_template.actions[new_action][new_sub_action]

		if clear_buffer or new_sub_action == "push" then
			input_extension:clear_input_buffer()
		elseif action_settings and not wield_input and not action_settings.keep_buffer and not send_buffer then
			input_extension:reset_input_buffer()
		end
	end

	return new_action, new_sub_action, wield_input, force_release_input
end

local function validate_action(unit, action_name, sub_action_name, action_settings, input_extension, inventory_extension, only_check_condition, ammo_extension, current_action_extension, t)
	local input_id = action_settings.input_override or action_name
	local hold_input = not action_settings.do_not_validate_with_hold and action_settings.hold_input
	local allow_toggle = action_settings.allow_hold_toggle and input_extension.toggle_alternate_attack
	local has_input = only_check_condition or input_extension:get(input_id) or input_extension:get_buffer(input_id) or input_extension:get(action_settings.attack_hold_input) or (not allow_toggle and input_extension:get(hold_input)) or (action_settings.kind == "block" and input_extension:is_input_blocked())
	local wield_input, wield_input_init = nil

	if not has_input then
		wield_input = CharacterStateHelper.wield_input(input_extension, inventory_extension, input_id)
		wield_input_init = true
	end

	if has_input or wield_input then
		local condition_func = action_settings.condition_func

		if (not condition_func or condition_func(unit, input_extension, ammo_extension)) and not CharacterStateHelper._check_cooldown(current_action_extension, action_name, t) then
			if not wield_input_init then
				wield_input = CharacterStateHelper.wield_input(input_extension, inventory_extension, input_id)
			end

			if not wield_input and not action_settings.keep_buffer then
				input_extension:reset_input_buffer()
			end

			return action_name, sub_action_name
		else
			input_extension:add_buffer(input_id)
		end
	end
end

CharacterStateHelper.validate_action = function (unit, action_name, sub_action_name, action_settings, input_extension, inventory_extension, only_check_condition, ammo_extension, current_action_extension, t)
	return validate_action(unit, action_name, sub_action_name, action_settings, input_extension, inventory_extension, only_check_condition, ammo_extension, current_action_extension, t)
end

local weapon_action_interrupt_damage_types = {
	cutting_berserker = true,
	cutting = true
}
local interupting_action_data = {}

CharacterStateHelper.update_weapon_actions = function (t, unit, input_extension, inventory_extension, health_extension)
	local breed = Unit.get_data(unit, "breed")

	if not breed.is_hero then
		return
	end

	local item_data, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)

	table.clear(interupting_action_data)

	if not item_data then
		return
	end

	local new_action, new_sub_action, wield_input, force_release_input, current_action_settings, current_action_extension, current_action_hand = nil
	current_action_settings, current_action_extension, current_action_hand = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)
	local item_template = BackendUtils.get_item_template(item_data)
	local recent_damage_type, recent_hit_react_type = health_extension:recently_damaged()
	local status_extension = ScriptUnit.extension(unit, "status_system")
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local uninterruptible_heavy = false

	if current_action_settings then
		local action_type = current_action_settings.kind
		uninterruptible_heavy = action_type and action_type == "melee_start" and buff_extension:has_buff_perk("uninterruptible_heavy")
	end

	local can_interrupt, reloading = nil
	local player = Managers.player:owner(unit)
	local is_bot_player = player and player.bot_player
	local ammo_extension = (left_hand_weapon_extension and left_hand_weapon_extension.ammo_extension) or (right_hand_weapon_extension and right_hand_weapon_extension.ammo_extension)

	if recent_damage_type and weapon_action_interrupt_damage_types[recent_damage_type] then
		if ammo_extension then
			if left_hand_weapon_extension and left_hand_weapon_extension.ammo_extension then
				reloading = left_hand_weapon_extension.ammo_extension:is_reloading()
			end

			if right_hand_weapon_extension and right_hand_weapon_extension.ammo_extension then
				reloading = right_hand_weapon_extension.ammo_extension:is_reloading()
			end
		end

		if (current_action_settings and current_action_settings.uninterruptible) or script_data.uninterruptible or reloading or is_bot_player or buff_extension:has_buff_perk("uninterruptible") or uninterruptible_heavy then
			can_interrupt = false
		elseif recent_damage_type == "cutting_berserker" then
			can_interrupt = true
		else
			can_interrupt = status_extension:hitreact_interrupt()
		end

		if can_interrupt and not status_extension:is_disabled() then
			local has_reduced_hit_react_buff = buff_extension:has_buff_perk("reduced_hit_react")

			if has_reduced_hit_react_buff then
				recent_hit_react_type = "light"
			end

			if current_action_settings then
				current_action_extension:stop_action("interrupted")
			end

			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			CharacterStateHelper.play_animation_event(unit, "hit_reaction")

			if recent_hit_react_type == "medium" then
				first_person_extension:play_hud_sound_event("enemy_hit_medium")
			elseif recent_hit_react_type == "heavy" then
				first_person_extension:play_hud_sound_event("enemy_hit_heavy")
			end

			if not Development.parameter("attract_mode") then
				if recent_damage_type == "cutting_berserker" then
					status_extension:set_hit_react_type(recent_hit_react_type)
					status_extension:set_pushed_no_cooldown(true, t)
				else
					status_extension:set_hit_react_type(recent_hit_react_type)
					status_extension:set_pushed(true, t)
				end
			end

			return
		end
	end

	local next_action_init_data = nil

	if current_action_settings then
		new_action, new_sub_action, wield_input, force_release_input = CharacterStateHelper._get_chain_action_data(item_template, current_action_extension, current_action_settings, input_extension, inventory_extension, unit, t, ammo_extension)

		if not new_action then
			if current_action_settings.allow_hold_toggle and input_extension.toggle_alternate_attack then
				local input_id = current_action_settings.lookup_data.action_name

				if input_id and input_extension:get(input_id, true) and current_action_extension:can_stop_hold_action(t) then
					current_action_extension:stop_action("hold_input_released")
				end
			elseif current_action_settings.kind ~= "block" or not input_extension:is_input_blocked() then
				local input_id = current_action_settings.hold_input

				if input_id and not input_extension:get(input_id) and current_action_extension:can_stop_hold_action(t) then
					current_action_extension:stop_action("hold_input_released")
				end
			end
		end
	elseif item_template.next_action then
		local action_data = item_template.next_action
		next_action_init_data = action_data.action_init_data
		local action_name = action_data.action
		local only_check_condition = true
		local sub_actions = item_template.actions[action_name]

		for sub_action_name, action_settings in pairs(sub_actions) do
			if sub_action_name ~= "default" and action_settings.condition_func then
				new_action, new_sub_action = validate_action(unit, action_name, sub_action_name, action_settings, input_extension, inventory_extension, only_check_condition, nil, current_action_extension, t)

				if new_action and new_sub_action then
					break
				end
			end
		end

		if not new_action then
			local action_settings = item_template.actions[action_name].default
			new_action, new_sub_action = validate_action(unit, action_name, "default", action_settings, input_extension, inventory_extension, only_check_condition, nil, current_action_extension, t)
		end

		item_template.next_action = nil
	else
		local highest_priority_action = 0

		for action_name, sub_actions in pairs(item_template.actions) do
			for sub_action_name, action_settings in pairs(sub_actions) do
				if sub_action_name ~= "default" and action_settings.condition_func then
					local weapon_action_hand = action_settings.weapon_action_hand or "right"
					local action_priority = action_settings.action_priority or 1

					if highest_priority_action < action_priority then
						local weapon_extension = (weapon_action_hand == "right" and right_hand_weapon_extension) or left_hand_weapon_extension
						local potential_new_action, potential_new_sub_action = validate_action(unit, action_name, sub_action_name, action_settings, input_extension, inventory_extension, false, ammo_extension, weapon_extension, t)

						if potential_new_action and potential_new_sub_action then
							new_action = potential_new_action
							new_sub_action = potential_new_sub_action
							highest_priority_action = action_priority
						end
					end
				end
			end

			local action_settings = item_template.actions[action_name].default

			if action_settings then
				local weapon_action_hand = action_settings.weapon_action_hand or "right"
				local action_priority = action_settings.action_priority or 1

				if highest_priority_action < action_priority then
					local weapon_extension = (weapon_action_hand == "right" and right_hand_weapon_extension) or left_hand_weapon_extension
					local potential_new_action, potential_new_sub_action = validate_action(unit, action_name, "default", action_settings, input_extension, inventory_extension, false, ammo_extension, weapon_extension, t)

					if potential_new_action and potential_new_sub_action then
						new_action = potential_new_action
						new_sub_action = potential_new_sub_action
						highest_priority_action = action_priority
					end
				end
			end
		end
	end

	if new_action and new_sub_action then
		local career_ext = ScriptUnit.extension(unit, "career_system")
		local power_level = career_ext:get_career_power_level()
		local actions = item_template.actions
		local new_action_settings = actions[new_action][new_sub_action]
		local weapon_action_hand = new_action_settings.weapon_action_hand or "right"
		interupting_action_data.new_action = new_action
		interupting_action_data.new_sub_action = new_sub_action
		interupting_action_data.new_action_settings = new_action_settings

		if weapon_action_hand == "both" then
			assert(left_hand_weapon_extension and right_hand_weapon_extension, "tried to start a dual wield weapon action without both a left and right hand wielded unit")

			if current_action_hand == "left" then
				left_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
			elseif current_action_hand == "right" then
				right_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
			elseif current_action_hand == "both" then
				left_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
				right_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
			end

			local left_action_init_data = (next_action_init_data and table.merge(next_action_init_data, {
				action_hand = "left"
			})) or {
				action_hand = "left"
			}
			local right_action_init_data = (next_action_init_data and table.merge(next_action_init_data, {
				action_hand = "right"
			})) or {
				action_hand = "right"
			}

			left_hand_weapon_extension:start_action(new_action, new_sub_action, item_template.actions, t, power_level, left_action_init_data)
			right_hand_weapon_extension:start_action(new_action, new_sub_action, item_template.actions, t, power_level, right_action_init_data)

			return
		end

		if weapon_action_hand == "either" then
			if right_hand_weapon_extension then
				weapon_action_hand = "right"
			else
				weapon_action_hand = "left"
			end
		end

		if weapon_action_hand == "left" then
			assert(left_hand_weapon_extension, "tried to start a left hand weapon action without a left hand wielded unit")

			if current_action_hand == "right" then
				right_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
			elseif current_action_hand == "both" then
				left_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
				right_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
			end

			left_hand_weapon_extension:start_action(new_action, new_sub_action, item_template.actions, t, power_level, next_action_init_data)

			return
		end

		assert(right_hand_weapon_extension, "tried to start a right hand weapon action without a right hand wielded unit")

		if current_action_hand == "left" then
			left_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
		elseif current_action_hand == "both" then
			left_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
			right_hand_weapon_extension:stop_action("new_interupting_action", interupting_action_data)
		end

		right_hand_weapon_extension:start_action(new_action, new_sub_action, item_template.actions, t, power_level, next_action_init_data)

		if force_release_input then
			input_extension:force_release_input(force_release_input)
		end
	end
end

CharacterStateHelper.stop_weapon_actions = function (inventory_extension, reason)
	local equipment = inventory_extension:equipment()
	local right_hand_wielded_unit = equipment.right_hand_wielded_unit
	local left_hand_wielded_unit = equipment.left_hand_wielded_unit
	local right_weapon_extension = Unit.alive(right_hand_wielded_unit) and ScriptUnit.extension(right_hand_wielded_unit, "weapon_system")
	local left_weapon_extension = Unit.alive(left_hand_wielded_unit) and ScriptUnit.extension(left_hand_wielded_unit, "weapon_system")

	if right_weapon_extension and right_weapon_extension.current_action_settings then
		right_weapon_extension:stop_action(reason)
	end

	if left_weapon_extension and left_weapon_extension.current_action_settings then
		left_weapon_extension:stop_action(reason)
	end
end

CharacterStateHelper.stop_career_abilities = function (career_extension, reason)
	career_extension:stop_ability(reason)
end

CharacterStateHelper.check_crouch = function (unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)
	local is_crouching = status_extension:is_crouching()
	local crouch = is_crouching
	local toggle_input = input_extension:get("crouch")
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local hold_toggle_input = input_extension:get("crouching")

	if gamepad_active and Managers.matchmaking and Managers.matchmaking:is_matchmaking_in_inn() then
		toggle_input = false
		hold_toggle_input = false
	end

	if toggle_crouch and toggle_input then
		crouch = status_extension:crouch_toggle()
	elseif not toggle_crouch and not hold_toggle_input then
		crouch = false
	elseif not toggle_crouch and hold_toggle_input then
		crouch = true
	end

	if crouch and not is_crouching then
		CharacterStateHelper.crouch(unit, t, first_person_extension, status_extension)
	elseif not crouch and is_crouching and CharacterStateHelper.can_uncrouch(unit) then
		CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
	end

	return is_crouching
end

CharacterStateHelper.can_uncrouch = function (unit)
	local mover = Unit.mover(unit)
	local position = Mover.position(mover)

	return Unit.mover_fits_at(unit, "standing", position)
end

CharacterStateHelper.crouch = function (unit, t, first_person_extension, status_extension)
	CharacterStateHelper.play_animation_event(unit, "to_crouch")
	first_person_extension:set_wanted_player_height("crouch", t)
	ScriptUnit.extension(unit, "locomotion_system"):set_active_mover("crouch")
	status_extension:set_crouching(true)

	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	buff_extension:trigger_procs("on_crouch")
end

CharacterStateHelper.uncrouch = function (unit, t, first_person_extension, status_extension)
	CharacterStateHelper.play_animation_event(unit, "to_uncrouch")
	first_person_extension:set_wanted_player_height("stand", t)
	ScriptUnit.extension(unit, "locomotion_system"):set_active_mover("standing")
	status_extension:set_crouching(false)
end

local EPSILON_MOVEMENT_SPEED_TO_IDLE_ANIM = 0.05
local SLOW_MOVEMENT_SPEED = 2.1

CharacterStateHelper.get_move_animation = function (locomotion_extension, input_extension, status_extension)
	local move_direction = CharacterStateHelper.get_movement_input(input_extension)
	local slowed = Vector3.length(Vector3.flat(locomotion_extension:current_velocity())) < SLOW_MOVEMENT_SPEED

	if status_extension.unit then
		local unit = status_extension.unit
		local breed = Unit.get_data(unit, "breed")

		if breed and breed.run_threshold then
			slowed = Vector3.length(Vector3.flat(locomotion_extension:current_velocity())) < breed.run_threshold
		end
	end

	if Vector3.length(locomotion_extension:current_velocity()) < EPSILON_MOVEMENT_SPEED_TO_IDLE_ANIM then
		return "idle", "idle"
	end

	if move_direction.y < 0 then
		return "move_bwd", (slowed and "walk_bwd") or "move_bwd"
	end

	return "move_fwd", (slowed and "walk_fwd") or "move_fwd"
end

CharacterStateHelper.is_colliding_down = function (unit)
	local mover = Unit.mover(unit)

	return Mover.collides_down(mover)
end

CharacterStateHelper.is_colliding_sides = function (unit)
	local mover = Unit.mover(unit)

	return Mover.collides_sides(mover)
end

CharacterStateHelper.has_move_input = function (input_extension)
	local movement = CharacterStateHelper.get_movement_input(input_extension)

	return Vector3.length(movement) > 0
end

CharacterStateHelper.is_moving = function (locomotion_extension)
	local velocity_current = locomotion_extension:current_velocity()
	local speed = Vector3.length_squared(velocity_current)
	local moving = speed > 0.001

	return moving
end

CharacterStateHelper.is_moving_backwards = function (locomotion_extension, first_person_extension)
	local rotation_current = first_person_extension:current_rotation()
	local velocity_current = Vector3.flat(locomotion_extension:current_velocity())
	local dot = Vector3.dot(velocity_current, rotation_current)

	return dot < -0.1
end

CharacterStateHelper.is_knocked_down = function (status_extension)
	return status_extension:is_knocked_down()
end

CharacterStateHelper.is_staggered = function (status_extension)
	return status_extension:is_staggered()
end

CharacterStateHelper.is_pounced_down = function (status_extension)
	return status_extension:is_pounced_down()
end

CharacterStateHelper.is_catapulted = function (status_extension)
	local is_catapulted, direction = status_extension:is_catapulted()

	return is_catapulted, direction
end

CharacterStateHelper.is_grabbed_by_pack_master = function (status_extension)
	return status_extension:is_grabbed_by_pack_master()
end

CharacterStateHelper.is_grabbed_by_tentacle = function (status_extension)
	return status_extension.grabbed_by_tentacle
end

CharacterStateHelper.is_in_vortex = function (status_extension)
	return status_extension.in_vortex
end

CharacterStateHelper.is_overcharge_exploding = function (status_extension)
	return status_extension:is_overcharge_exploding()
end

CharacterStateHelper.pack_master_status = function (status_extension)
	return status_extension.pack_master_status
end

CharacterStateHelper.corruptor_status = function (status_extension)
	return status_extension.corruptor_status
end

CharacterStateHelper.grabbed_by_tentacle_status = function (status_extension)
	return status_extension.grabbed_by_tentacle_status
end

CharacterStateHelper.grabbed_by_chaos_spawn_status = function (status_extension)
	return status_extension.grabbed_by_chaos_spawn_status, status_extension.grabbed_by_chaos_spawn_status_count
end

CharacterStateHelper.is_waiting_for_assisted_respawn = function (status_extension)
	return status_extension:is_ready_for_assisted_respawn()
end

CharacterStateHelper.is_assisted_respawning = function (status_extension)
	return status_extension:is_assisted_respawning()
end

CharacterStateHelper.is_pushed = function (status_extension)
	return status_extension:is_pushed()
end

CharacterStateHelper.is_charged = function (status_extension)
	return status_extension:is_charged()
end

CharacterStateHelper.is_block_broken = function (status_extension)
	return status_extension:is_block_broken()
end

CharacterStateHelper.is_dead = function (status_extension)
	return status_extension:is_dead()
end

CharacterStateHelper.is_using_transport = function (status_extension)
	return status_extension:is_using_transport()
end

CharacterStateHelper.is_zooming = function (status_extension)
	return status_extension:is_zooming()
end

CharacterStateHelper.is_crouching = function (status_extension)
	return status_extension:is_crouching()
end

CharacterStateHelper.is_starting_interaction = function (input_extension, interactor_extension)
	local can_interact, fail_reason, interaction_type = interactor_extension:can_interact()

	if GameSettingsDevelopment.disabled_interactions[interaction_type] then
		return false
	end

	return can_interact and interaction_type ~= "heal" and interaction_type ~= "give_item" and input_extension:get("interact", true)
end

CharacterStateHelper.is_interacting = function (interactor_extension)
	return interactor_extension:is_interacting()
end

CharacterStateHelper.is_waiting_for_interaction_approval = function (interactor_extension)
	return interactor_extension:is_waiting_for_interaction_approval()
end

CharacterStateHelper.interact = function (input_extension, interactor_extension)
	local config = interactor_extension:interaction_config()

	if config.hold then
		local key_to_hold = interactor_extension:interaction_hold_input()
		local is_holding = input_extension:get(key_to_hold)

		if not is_holding then
			interactor_extension:abort_interaction()

			return false
		end
	end

	return true
end

CharacterStateHelper.will_be_ledge_hanging = function (world, unit, params)
	if not script_data.ledge_hanging_turned_off then
		local collision_filter = params.collision_filter or "filter_ledge_collision"
		local colliding, ledge_unit = CharacterStateHelper.is_raycasting_to_gameplay_collision_box(world, unit, collision_filter, params)

		if colliding then
			local own_z = Vector3.z((params and params.ray_position) or Unit.world_position(unit, 0)) + ((params and params.z_offset) or 0)
			local trigger_box_node = Unit.node(ledge_unit, "g_gameplay_ledge_trigger_box")
			local ledge_z = Vector3.z(Unit.world_position(ledge_unit, trigger_box_node))
			local below_z = own_z <= ledge_z

			if below_z then
				params.ledge_unit = ledge_unit

				return true
			end
		end
	end

	return false
end

local INDEX_ACTOR = 4

CharacterStateHelper.is_raycasting_to_gameplay_collision_box = function (world, unit, collision_filter, params)
	local physics_world = World.get_data(world, "physics_world")
	local position = (params and params.ray_position) or POSITION_LOOKUP[unit]
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_settings_table_name = (params and params.movement_settings_table_name) or "gameplay_collision_box"
	local player_half_height = movement_settings_table[movement_settings_table_name].collision_check_player_half_height
	local player_height_offset = movement_settings_table[movement_settings_table_name].collision_check_player_height_offset
	local offset = Vector3(0, 0, player_height_offset * 2)
	position = position + offset
	local colliding, collided_unit = nil
	local hits, num_hits = PhysicsWorld.immediate_raycast(physics_world, position, Vector3.down(), player_half_height * 4, "all", "collision_filter", collision_filter, "use_global_table")

	for i = 1, num_hits, 1 do
		local hit = hits[i]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_unit = Actor.unit(hit_actor)

		if Unit.get_data(hit_unit, "is_ledge_unit") then
			colliding = true
			collided_unit = hit_unit
		else
			colliding = false
			collided_unit = nil

			break
		end
	end

	if colliding and collided_unit then
		local radius = (params and params.radius) or 0.15
		local max_hits = 4
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, position, position + Vector3.down() * player_half_height * 4, radius, max_hits, "collision_filter", collision_filter, "report_initial_overlap")

		if result then
			for j = 1, #result, 1 do
				local hit = result[j]
				local hit_actor = hit.actor
				local hit_unit = Actor.unit(hit_actor)

				if Unit.get_data(hit_unit, "is_ledge_unit") then
					colliding = true
					collided_unit = hit_unit
				else
					colliding = false
					collided_unit = nil

					break
				end
			end
		end
	end

	return colliding, collided_unit
end

CharacterStateHelper.is_ledge_hanging = function (world, unit, params)
	if not script_data.ledge_hanging_turned_off then
		local colliding, ledge_unit = CharacterStateHelper.is_colliding_with_gameplay_collision_box(world, unit, "filter_ledge_collision", params)

		if colliding then
			local own_z = Vector3.z((params and params.position) or Unit.world_position(unit, 0)) + ((params and params.z_offset) or 0)
			local trigger_box_node = Unit.node(ledge_unit, "g_gameplay_ledge_trigger_box")
			local ledge_z = Vector3.z(Unit.world_position(ledge_unit, trigger_box_node))
			local below_z = own_z <= ledge_z

			if below_z then
				params.ledge_unit = ledge_unit

				return true
			end
		end
	end

	return false
end

CharacterStateHelper.recently_left_ladder = function (status_extension, t)
	return status_extension:has_recently_left_ladder(t)
end

CharacterStateHelper.change_camera_state = function (player, state, params)
	if player.bot_player then
		return
	end

	if Development.parameter("third_person_mode") and state == "follow" then
		state = "follow_third_person_over_shoulder"
	end

	local entity_manager = Managers.state.entity
	local camera_system = entity_manager:system("camera_system")

	camera_system:external_state_change(player, state, params)
end

CharacterStateHelper.play_animation_event = function (unit, anim_event)
	Managers.state.network:anim_event(unit, anim_event)
end

CharacterStateHelper.play_animation_event_first_person = function (first_person_extension, anim_event)
	first_person_extension:animation_event(anim_event)
end

CharacterStateHelper.play_animation_event_with_variable_float = function (unit, anim_event, variable_name, variable_value)
	Managers.state.network:anim_event_with_variable_float(unit, anim_event, variable_name, variable_value)
end

CharacterStateHelper.set_animation_variable_float = function (unit, variable_name, variable_value)
	Managers.state.network:anim_set_variable_float(unit, variable_name, variable_value)
end

CharacterStateHelper.is_enemy_character = function (unit)
	local side = Managers.state.side.side_by_unit[unit]

	if side and side:name() == "dark_pact" then
		return true
	end

	return false
end

CharacterStateHelper.is_viable_stab_target = function (unit, target_unit, target_status_extension)
	local is_assisted_respawning = CharacterStateHelper.is_waiting_for_assisted_respawn(target_status_extension)
	local is_knocked_down = target_status_extension:is_knocked_down()
	local is_pounced_down = target_status_extension:is_pounced_down() and target_status_extension:get_pouncer_unit() ~= unit
	local is_grabbed_by_chaos_spawn = target_status_extension:is_grabbed_by_chaos_spawn()
	local is_hanging = target_status_extension.pack_master_status == "pack_master_hanging"
	local is_using_transport = target_status_extension.using_transport
	local ledge_hanging = target_status_extension.is_ledge_hanging
	local is_grabbed_by_corruptor = target_status_extension:is_grabbed_by_corruptor()
	local is_grabbed_by_packmaster = target_status_extension:is_grabbed_by_pack_master()
	local is_dark_pact_ally = CharacterStateHelper.is_enemy_character(target_unit)

	if not is_knocked_down and not is_assisted_respawning and not is_pounced_down and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not is_grabbed_by_corruptor and not is_grabbed_by_packmaster and not is_dark_pact_ally then
		return true
	end

	return false
end

CharacterStateHelper.ghost_mode = function (ghost_mode_extension, input_extension)
	if not ghost_mode_extension:is_in_ghost_mode() then
		if input_extension:get("ghost_mode_enter") and ghost_mode_extension:allowed_to_enter() then
			ghost_mode_extension:request_enter_ghost_mode()
		end
	elseif ghost_mode_extension:is_in_ghost_mode() then
		if input_extension:get("action_one") and ghost_mode_extension:allowed_to_leave() then
			local force_leave = false

			ghost_mode_extension:request_leave_ghost_mode(force_leave)
		end

		if input_extension:get("ghost_mode_enter") then
			ghost_mode_extension:teleport_player()
		end
	end
end

return
