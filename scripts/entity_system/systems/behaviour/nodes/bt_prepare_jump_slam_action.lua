require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local position_lookup = POSITION_LOOKUP
BTPrepareJumpSlamAction = class(BTPrepareJumpSlamAction, BTNode)

BTPrepareJumpSlamAction.init = function (self, ...)
	BTPrepareJumpSlamAction.super.init(self, ...)
end

BTPrepareJumpSlamAction.name = "BTPrepareJumpSlamAction"

BTPrepareJumpSlamAction.enter = function (self, unit, blackboard, t)
	blackboard.jump_slam_data = {
		state = "start",
		num_jump_tries = 1,
		segment_list = {}
	}
end

BTPrepareJumpSlamAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason == "aborted" then
		blackboard.jump_slam_data = nil
		blackboard.anim_cb_attack_jump_start_finished = nil

		blackboard.navigation_extension:set_enabled(true)
	end
end

BTPrepareJumpSlamAction.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.jump_slam_data
	local state = data.state

	if state == "take_off" then
		if blackboard.anim_cb_attack_jump_start_finished then
			blackboard.anim_cb_attack_jump_start_finished = nil
			blackboard.chasing_timer = 0
			blackboard.unreachable_timer = 0

			return "done"
		end
	elseif data.num_jump_tries > 0 then
		local success, velocity = BTPrepareJumpSlamAction.prepare_jump_new(blackboard, unit, data, t)

		if success then
			data.initial_velociy_boxed = Vector3Box(velocity)

			BTPrepareJumpSlamAction.start_jump_animation(blackboard, unit)

			data.num_jump_tries = 0
			data.state = "take_off"

			return "running"
		end

		data.num_jump_tries = data.num_jump_tries - 1

		if data.num_jump_tries == 0 then
			blackboard.chasing_timer = 1

			return "failed"
		end
	else
		blackboard.jump_slam_data = nil
		blackboard.anim_cb_attack_jump_start_finished = nil
		blackboard.chasing_timer = 1

		return "failed"
	end

	LocomotionUtils.follow_target_ogre(unit, blackboard, t, dt)

	return "running"
end

BTPrepareJumpSlamAction.start_jump_animation = function (blackboard, unit)
	blackboard.move_state = "attacking"

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity_flat(Vector3.zero())
	Managers.state.network:anim_event(unit, "attack_jump")
	LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
end

BTPrepareJumpSlamAction.try_position = function (nav_world, pos, to_target_normalized)
	local found_impact_pos = nil
	local angle = 0

	for i = 1, 4, 1 do
		local test_pos = pos - Quaternion.rotate(Quaternion(Vector3.up(), angle), to_target_normalized)
		local success, z_height = GwNavQueries.triangle_from_position(nav_world, test_pos, 0.5, 0.5)

		if success then
			found_impact_pos = Vector3(test_pos.x, test_pos.y, z_height)

			break
		end

		angle = angle + math.pi * 0.5
	end

	return found_impact_pos
end

BTPrepareJumpSlamAction.prepare_jump_new = function (blackboard, unit, data, t)
	local p1 = position_lookup[unit]
	local found_impact_pos = nil
	local p2 = position_lookup[blackboard.target_unit]
	local to_target = p2 - p1
	local distance = Vector3.length(to_target)
	local to_target_normalized = Vector3.normalize(Vector3.flat(to_target))
	local test_pos = p2
	local success, velocity, time_of_flight, hit_pos = BTPrepareJumpSlamAction.test_trajectory_new(blackboard, p1, p2, data.segment_list, to_target_normalized, true)

	if success then
		local to_target_rotation = LocomotionUtils.look_at_position_flat(unit, hit_pos)
		data.attack_rotation = QuaternionBox(to_target_rotation)
		data.target_pos = Vector3Box(hit_pos)
		data.time_of_flight = time_of_flight
	end

	return success, velocity
end

BTPrepareJumpSlamAction.test_trajectory_new = function (blackboard, p1, p2, segment_list, to_target_normalized, multiple_raycasts)
	local physics_world = World.physics_world(blackboard.world)
	local gravity = -blackboard.breed.jump_slam_gravity
	local jump_speed = nil
	local jump_angle = math.pi / 4
	local wedge = Vector3(0, 0, 0.05)
	local in_los, velocity, time_of_flight = nil
	local target_locomotion = ScriptUnit.extension(blackboard.target_unit, "locomotion_system")
	local target_velocity = target_locomotion:current_velocity()
	local target_speed_squared = Vector3.length_squared(target_velocity)

	if target_speed_squared < 0.2 then
		p2 = p2 - to_target_normalized * 2
	end

	local hit_pos = nil
	local acceptable_accuracy = 0.6

	if jump_speed then
		jump_angle, hit_pos = WeaponHelper.angle_to_hit_moving_target(p1 + wedge, p2 + wedge, jump_speed, target_velocity, -gravity, acceptable_accuracy)
	else
		jump_speed, hit_pos = WeaponHelper.speed_to_hit_moving_target(p1 + wedge, p2 + wedge, jump_angle, target_velocity, -gravity, acceptable_accuracy)
	end

	if not hit_pos then
		return
	end

	if script_data.debug_ai_movement then
		QuickDrawerStay:sphere(hit_pos, 0.3, Color(255, 255, 0))
	end

	local success, z_height = GwNavQueries.triangle_from_position(blackboard.nav_world, hit_pos, 0.5, 0.5)

	if success then
		Vector3.set_z(hit_pos, z_height)
	else
		hit_pos = BTPrepareJumpSlamAction.try_position(blackboard.nav_world, hit_pos, to_target_normalized)
	end

	if not hit_pos then
		return
	end

	if script_data.debug_ai_movement then
		QuickDrawerStay:sphere(hit_pos, 0.5, Color(128, 255, 255))
	end

	if jump_angle and jump_speed then
		in_los, velocity, time_of_flight = WeaponHelper.test_angled_trajectory(physics_world, p1 + wedge, hit_pos + wedge, gravity, jump_speed, jump_angle, segment_list)

		if multiple_raycasts then
			if not in_los then
				return
			end

			in_los = WeaponHelper.ray_segmented_test(physics_world, segment_list, Vector3(0, 0, 3))

			if not in_los then
				return
			end

			local right = Vector3.cross(Vector3.normalize(p2 - p1), Vector3.up()) * 1
			in_los = WeaponHelper.ray_segmented_test(physics_world, segment_list, Vector3(0, 0, 1.5) + right)

			if not in_los then
				return
			end

			in_los = WeaponHelper.ray_segmented_test(physics_world, segment_list, Vector3(0, 0, 1.5) - right)

			if not in_los then
				return
			end
		end
	end

	return in_los, velocity, time_of_flight, hit_pos
end

return
