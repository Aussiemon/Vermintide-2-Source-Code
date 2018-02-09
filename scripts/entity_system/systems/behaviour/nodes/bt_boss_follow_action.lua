require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBossFollowAction = class(BTBossFollowAction, BTNode)
BTBossFollowAction.init = function (self, ...)
	BTBossFollowAction.super.init(self, ...)

	return 
end
BTBossFollowAction.name = "BTBossFollowAction"
BTBossFollowAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.remembered_threat_pos = nil
	blackboard.chasing_timer = blackboard.unreachable_timer or 0
	blackboard.follow_data = blackboard.follow_data or {}
	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	if blackboard.fling_skaven_timer and blackboard.fling_skaven_timer < t then
		blackboard.fling_skaven_timer = t + 0.5
	end

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end

	local unit_id = network_manager.unit_game_object_id(network_manager, unit)
	local target_unit_id = network_manager.unit_game_object_id(network_manager, blackboard.target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id)

	return 
end
BTBossFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	blackboard.move_animation_name = nil
	blackboard.is_turning = nil
	blackboard.animation_rotation_lock = nil
	blackboard.rotate_towards_position = nil
	blackboard.next_turn_at = nil
	blackboard.wanted_destination = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.animation_lean = nil

	return 
end
BTBossFollowAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	self.follow(self, unit, t, dt, blackboard, locomotion_extension)

	blackboard.chasing_timer = blackboard.chasing_timer + dt

	return "running", "evaluate"
end
BTBossFollowAction._go_idle = function (self, unit, blackboard, navigation_extension, locomotion_extension)
	blackboard.move_state = "idle"

	if navigation_extension.is_following_path(navigation_extension) then
		navigation_extension.stop(navigation_extension)
	end

	local action = blackboard.action

	Managers.state.network:anim_event(unit, action.idle_anim or "idle")

	local target_unit = blackboard.target_unit

	if target_unit then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		locomotion_extension.set_wanted_rotation(locomotion_extension, rot)
	end

	if blackboard.linked_unit and action.sync_with_linked_unit then
		Managers.state.network:anim_event(blackboard.linked_unit, action.idle_anim or "idle")
	end

	return 
end
BTBossFollowAction._go_moving = function (self, unit, blackboard, action)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, action.move_anim)

	if blackboard.linked_unit and action.sync_with_linked_unit then
		Managers.state.network:anim_event(blackboard.linked_unit, action.move_anim)
	end

	return 
end
BTBossFollowAction.follow = function (self, unit, t, dt, blackboard, locomotion_extension)
	local navigation_extension = blackboard.navigation_extension

	if 1 < navigation_extension.number_failed_move_attempts(navigation_extension) then
		blackboard.remembered_threat_pos = false

		if blackboard.move_state ~= "idle" then
			self._go_idle(self, unit, blackboard, navigation_extension, locomotion_extension)
		end
	end

	local breed = blackboard.breed

	if breed.use_big_boy_turning and blackboard.move_state == "moving" then
		self._debug_big_boy_turning(self, blackboard)

		local is_turning = blackboard.is_turning

		if is_turning then
			LocomotionUtils.update_turning(unit, t, dt, blackboard)
		else
			LocomotionUtils.check_start_turning(unit, t, dt, blackboard)
		end
	end

	local action = blackboard.action
	local new_destination = self[action.follow_target_function_name](self, unit, blackboard, t, dt)

	if new_destination then
		blackboard.wanted_destination = Vector3Box(new_destination)
	end

	if blackboard.fling_skaven_timer and blackboard.fling_skaven_timer < t then
		blackboard.fling_skaven_timer = t + 0.5

		self.check_fling_skaven(self, unit, blackboard, t)
	end

	local destination = navigation_extension.destination(navigation_extension)
	local to_vec = destination - POSITION_LOOKUP[unit]

	Vector3.set_z(to_vec, 0)

	local distance_sq = Vector3.length_squared(to_vec)

	if action.override_move_speed then
		navigation_extension.set_max_speed(navigation_extension, action.override_move_speed)
	elseif distance_sq < 1 then
		navigation_extension.set_max_speed(navigation_extension, breed.walk_speed)
	elseif 4 < distance_sq then
		navigation_extension.set_max_speed(navigation_extension, breed.run_speed)
	end

	local is_following_path = navigation_extension.is_following_path(navigation_extension)

	if blackboard.move_state ~= "moving" and is_following_path and 0.25 < distance_sq then
		self._go_moving(self, unit, blackboard, action)
	elseif blackboard.move_state ~= "idle" and (not is_following_path or distance_sq < 0.04000000000000001) then
		self._go_idle(self, unit, blackboard, navigation_extension, locomotion_extension)
	end

	local can_rotate = not blackboard.animation_rotation_lock

	if can_rotate then
		if blackboard.target_outside_navmesh then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

			locomotion_extension.set_wanted_rotation(locomotion_extension, rot)
		else
			locomotion_extension.set_wanted_rotation(locomotion_extension, nil)
		end
	end

	return 
end
local broad_phase_fling_units = {}
BTBossFollowAction.check_fling_skaven = function (self, unit, blackboard, t)
	local forward = Quaternion.forward(Unit.local_rotation(unit, 0))
	local check_pos = POSITION_LOOKUP[unit] + forward*2.6
	local ai_system = Managers.state.entity:system("ai_system")
	local num_units = Broadphase.query(ai_system.broadphase, check_pos, 1, broad_phase_fling_units)

	if 0 < num_units then
		local BLACKBOARDS = BLACKBOARDS

		for i = 1, num_units, 1 do
			local hit_unit = broad_phase_fling_units[i]
			local hit_unit_bb = BLACKBOARDS[hit_unit]
			local hit_unit_breed = hit_unit_bb and hit_unit_bb.breed

			if hit_unit_breed and hit_unit_breed.flingable and AiUtils.unit_alive(hit_unit) then
				blackboard.fling_skaven = true
				blackboard.fling_skaven_timer = t + 5

				break
			end
		end
	end

	return 
end
BTBossFollowAction._follow_target_rat_ogre = function (self, unit, blackboard, t, dt)
	return LocomotionUtils.follow_target_ogre(unit, blackboard, t, dt)
end
local STORMFIEND_TARGET_HAS_MOVED_DISTANCE_SQ = 25
local STORMFIEND_MIN_REQUIRED_DISTANCE_CHANGE_SQ = 0.25
BTBossFollowAction._follow_target_stormfiend = function (self, unit, blackboard, t, dt)
	local nav_world = blackboard.nav_world
	local action = blackboard.action
	local data = action.follow_target_function_data
	local check_distance = data.check_distance
	local target_distance = blackboard.target_dist
	local navigation_extension = blackboard.navigation_extension
	local at_goal = navigation_extension.has_reached_destination(navigation_extension, 0.5)
	local position = nil
	local unit_position = POSITION_LOOKUP[unit]
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]

	if data.check_ray_can_go_to_target then
		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, unit_position, target_position, nil, 1, 1)
	end

	local follow_data = blackboard.follow_data
	local remembered_target_position, target_has_moved = nil

	if follow_data.remembered_target_position then
		remembered_target_position = follow_data.remembered_target_position:unbox()
		local target_distance_diff_sq = Vector3.distance_squared(target_position, remembered_target_position)
		target_has_moved = STORMFIEND_TARGET_HAS_MOVED_DISTANCE_SQ < target_distance_diff_sq
	else
		follow_data.remembered_target_position = Vector3Box(target_position)
		remembered_target_position = target_position
		target_has_moved = false
	end

	if (at_goal and (check_distance < target_distance or blackboard.find_new_shoot_position)) or (not at_goal and target_has_moved) then
		local min_angle = follow_data.min_angle or 0
		local min_angle_step = data.min_angle_step
		local max_angle_step = data.max_angle_step
		local min_distance = follow_data.min_distance or data.min_wanted_distance
		local max_distance = follow_data.max_distance or data.max_wanted_distance

		if blackboard.find_new_shoot_position then
			blackboard.find_new_shoot_position = nil
			min_angle = min_angle + data.failed_move_attempt_angle_increment

			if 360 <= min_angle then
				min_angle = min_angle - 360
				min_distance = min_distance*0.8
				max_distance = max_distance*0.8
			end
		end

		if max_distance < 1 then
			local above = 2
			local below = 2
			position = LocomotionUtils.pos_on_mesh(nav_world, target_position, above, below)

			if position == nil then
				blackboard.target_outside_navmesh = true
			end
		else
			position = AiUtils.advance_towards_target(unit, blackboard, min_distance, max_distance, min_angle_step, max_angle_step, min_angle)
		end

		local distance_sq = position and Vector3.distance_squared(unit_position, position)

		if position and STORMFIEND_MIN_REQUIRED_DISTANCE_CHANGE_SQ < distance_sq then
			navigation_extension.move_to(navigation_extension, position)

			follow_data.min_angle = 0
			follow_data.min_distance = data.min_wanted_distance
			follow_data.max_distance = data.max_wanted_distance

			follow_data.remembered_target_position:store(target_position)
		else
			blackboard.find_new_shoot_position = true
			follow_data.min_angle = min_angle
			follow_data.min_distance = min_distance
			follow_data.max_distance = max_distance
		end
	end

	return position
end
BTBossFollowAction._follow_target_chaos_spawn = function (self, unit, blackboard, t, dt)
	return LocomotionUtils.follow_target_ogre(unit, blackboard, t, dt)
end
BTBossFollowAction._debug_big_boy_turning = function (self, blackboard)
	if script_data.debug_ai_movement then
		local turning = (blackboard.is_turning and "true") or "false"

		Debug.text("move_state:%s turning:%s", blackboard.move_state, turning)
	end

	return 
end

return 
