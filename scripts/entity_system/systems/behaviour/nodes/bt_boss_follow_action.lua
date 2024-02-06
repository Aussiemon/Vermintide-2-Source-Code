﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_boss_follow_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBossFollowAction = class(BTBossFollowAction, BTNode)

BTBossFollowAction.init = function (self, ...)
	BTBossFollowAction.super.init(self, ...)
end

BTBossFollowAction.name = "BTBossFollowAction"

BTBossFollowAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.remembered_threat_pos = nil
	blackboard.chasing_timer = blackboard.unreachable_timer or 0
	blackboard.follow_data = blackboard.follow_data or {}

	if blackboard.fling_skaven_timer and t > blackboard.fling_skaven_timer then
		blackboard.fling_skaven_timer = t + 0.5
	end

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]
		local network_manager = Managers.state.network

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end

	blackboard.boss_follow_next_line_of_sight_check_t = t
end

BTBossFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if blackboard.is_turning and not destroy then
		LocomotionUtils.reset_turning(unit, blackboard)

		blackboard.is_turning = nil
	end

	blackboard.move_animation_name = nil
	blackboard.animation_rotation_lock = nil
	blackboard.rotate_towards_position = nil
	blackboard.next_turn_at = nil
	blackboard.wanted_destination = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.animation_lean = nil
	blackboard.has_los_to_any_player = nil
	blackboard.boss_follow_next_line_of_sight_check_t = nil
end

BTBossFollowAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	self:follow(unit, t, dt, blackboard, locomotion_extension)

	blackboard.chasing_timer = blackboard.chasing_timer + dt

	return "running", "evaluate"
end

BTBossFollowAction._go_idle = function (self, unit, blackboard, navigation_extension, locomotion_extension)
	blackboard.move_state = "idle"

	if navigation_extension:is_following_path() then
		navigation_extension:stop()
	end

	local action = blackboard.action

	Managers.state.network:anim_event(unit, action.idle_anim or "idle")

	local target_unit = blackboard.target_unit

	if target_unit then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		locomotion_extension:set_wanted_rotation(rot)
	end
end

BTBossFollowAction._go_moving = function (self, unit, blackboard, action)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, action.move_anim)
end

BTBossFollowAction.follow = function (self, unit, t, dt, blackboard, locomotion_extension)
	local navigation_extension = blackboard.navigation_extension

	if navigation_extension:number_failed_move_attempts() > 1 then
		blackboard.remembered_threat_pos = false

		if blackboard.move_state ~= "idle" then
			self:_go_idle(unit, blackboard, navigation_extension, locomotion_extension)
		end
	end

	local breed = blackboard.breed

	if breed.use_big_boy_turning and blackboard.move_state == "moving" then
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

	if blackboard.fling_skaven_timer and t > blackboard.fling_skaven_timer then
		blackboard.fling_skaven_timer = t + 0.5

		self:check_fling_skaven(unit, blackboard, t)
	end

	local destination = navigation_extension:destination()
	local self_position = POSITION_LOOKUP[unit]
	local to_vec = destination - self_position

	Vector3.set_z(to_vec, 0)

	local distance_sq = Vector3.length_squared(to_vec)

	if t > blackboard.boss_follow_next_line_of_sight_check_t then
		blackboard.has_los_to_any_player = PerceptionUtils.has_line_of_sight_to_any_player(unit)
		blackboard.boss_follow_next_line_of_sight_check_t = t + 2.5
	end

	if action.override_move_speed then
		if breed.catch_up_speed and distance_sq > 1600 and not blackboard.has_los_to_any_player then
			navigation_extension:set_max_speed(breed.catch_up_speed)
		else
			navigation_extension:set_max_speed(action.override_move_speed)
		end
	elseif distance_sq < 1 then
		navigation_extension:set_max_speed(breed.walk_speed)
	elseif breed.catch_up_speed and distance_sq > 1600 and not blackboard.has_los_to_any_player then
		navigation_extension:set_max_speed(breed.catch_up_speed)
	elseif distance_sq > 4 then
		navigation_extension:set_max_speed(breed.run_speed)
	end

	local is_following_path = navigation_extension:is_following_path()

	if blackboard.move_state ~= "moving" and is_following_path and distance_sq > 0.25 then
		self:_go_moving(unit, blackboard, action)
	elseif blackboard.move_state ~= "idle" and (not is_following_path or distance_sq < 0.04000000000000001) then
		self:_go_idle(unit, blackboard, navigation_extension, locomotion_extension)
	end

	local can_rotate = not blackboard.animation_rotation_lock

	if can_rotate then
		if blackboard.target_outside_navmesh then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

			locomotion_extension:set_wanted_rotation(rot)
		else
			locomotion_extension:set_wanted_rotation(nil)
		end
	end
end

local broad_phase_fling_units = {}

BTBossFollowAction.check_fling_skaven = function (self, unit, blackboard, t)
	local forward = Quaternion.forward(Unit.local_rotation(unit, 0))
	local check_pos = POSITION_LOOKUP[unit] + forward * 2.6
	local ai_system = Managers.state.entity:system("ai_system")
	local num_units = Broadphase.query(ai_system.broadphase, check_pos, 1, broad_phase_fling_units)

	if num_units > 0 then
		local BLACKBOARDS = BLACKBOARDS

		for i = 1, num_units do
			local hit_unit = broad_phase_fling_units[i]
			local hit_unit_bb = BLACKBOARDS[hit_unit]
			local hit_unit_breed = hit_unit_bb and hit_unit_bb.breed

			if hit_unit_breed and hit_unit_breed.flingable and HEALTH_ALIVE[hit_unit] then
				blackboard.fling_skaven = true
				blackboard.fling_skaven_timer = t + 5

				break
			end
		end
	end
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
	local at_goal = navigation_extension:has_reached_destination(0.5)
	local position
	local unit_position = POSITION_LOOKUP[unit]
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]

	if data.check_ray_can_go_to_target then
		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, unit_position, target_position, nil, 1, 1)
	end

	local follow_data = blackboard.follow_data
	local remembered_target_position, target_has_moved

	if follow_data.remembered_target_position then
		remembered_target_position = follow_data.remembered_target_position:unbox()

		local target_distance_diff_sq = Vector3.distance_squared(target_position, remembered_target_position)

		target_has_moved = target_distance_diff_sq > STORMFIEND_TARGET_HAS_MOVED_DISTANCE_SQ
	else
		follow_data.remembered_target_position = Vector3Box(target_position)
		remembered_target_position = target_position
		target_has_moved = false
	end

	if at_goal and (check_distance < target_distance or blackboard.find_new_shoot_position) or not at_goal and target_has_moved then
		local min_angle = follow_data.min_angle or 0
		local min_angle_step = data.min_angle_step
		local max_angle_step = data.max_angle_step
		local min_distance = follow_data.min_distance or data.min_wanted_distance
		local max_distance = follow_data.max_distance or data.max_wanted_distance

		if blackboard.find_new_shoot_position then
			blackboard.find_new_shoot_position = nil
			min_angle = min_angle + data.failed_move_attempt_angle_increment

			if min_angle >= 360 then
				min_angle = min_angle - 360
				min_distance = min_distance * 0.8
				max_distance = max_distance * 0.8
			end
		end

		if max_distance < 1 then
			local above, below = 2, 2

			position = LocomotionUtils.pos_on_mesh(nav_world, target_position, above, below)

			if position == nil then
				blackboard.target_outside_navmesh = true
			end
		else
			position = AiUtils.advance_towards_target(unit, blackboard, min_distance, max_distance, min_angle_step, max_angle_step, min_angle)
		end

		local distance_sq = position and Vector3.distance_squared(unit_position, position)

		if position and distance_sq > STORMFIEND_MIN_REQUIRED_DISTANCE_CHANGE_SQ then
			navigation_extension:move_to(position)

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
		local turning = blackboard.is_turning and "true" or "false"

		Debug.text("move_state:%s turning:%s", blackboard.move_state, turning)
	end
end
