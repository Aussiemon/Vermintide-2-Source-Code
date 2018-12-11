require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTErraticFollowAction = class(BTErraticFollowAction, BTNode)

BTErraticFollowAction.init = function (self, ...)
	BTErraticFollowAction.super.init(self, ...)
end

BTErraticFollowAction.name = "BTErraticFollowAction"
local debug_movement = false

BTErraticFollowAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.remembered_threat_pos = nil
	blackboard.chasing_timer = blackboard.unreachable_timer or 0
	blackboard.active_node = self
	local move_state = blackboard.move_state
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local animation_name = AiAnimUtils.get_start_move_animation(unit, target_pos, action.start_anims_name)

	if blackboard.move_state ~= "moving" then
		self:_go_moving(unit, blackboard, animation_name)
	end

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]
		local network_manager = Managers.state.network

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end

	if not blackboard.random_dirs then
		blackboard.random_dirs = {
			action.move_jump_fwd_anims,
			action.move_jump_right_anims,
			action.move_jump_fwd_anims
		}
	end

	blackboard.next_jump_time = t + 1
	blackboard.boss_follow_next_line_of_sight_check_t = t
end

BTErraticFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
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
	blackboard.active_node = nil
	blackboard.boss_follow_next_line_of_sight_check_t = nil
	blackboard.has_los_to_any_player = nil

	if blackboard.move_state == "jumping" and not destroy then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_animation_driven(false, true, false)
		locomotion_extension:use_lerp_rotation(true)
		locomotion_extension:set_movement_type("snap_to_navmesh")
		Managers.state.network:anim_event(unit, "move_fwd")

		blackboard.move_state = "moving"
	end
end

BTErraticFollowAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local move_state = blackboard.move_state

	if move_state == "jumping" then
	else
		self:follow(unit, t, dt, blackboard, locomotion_extension)
	end

	blackboard.chasing_timer = blackboard.chasing_timer + dt

	return "running", "evaluate"
end

BTErraticFollowAction._go_idle = function (self, unit, blackboard, locomotion_extension)
	blackboard.move_state = "idle"

	Managers.state.network:anim_event(unit, "idle")

	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

	locomotion_extension:set_wanted_rotation(rot)
end

BTErraticFollowAction._go_moving = function (self, unit, blackboard, move_anim)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, move_anim)
end

BTErraticFollowAction._go_walking = function (self, unit, blackboard, walk_anim)
	blackboard.move_state = "walking"

	Managers.state.network:anim_event(unit, walk_anim)
end

BTErraticFollowAction.follow = function (self, unit, t, dt, blackboard, locomotion_extension)
	local navigation_extension = blackboard.navigation_extension

	if navigation_extension:number_failed_move_attempts() > 1 then
		blackboard.remembered_threat_pos = false

		if blackboard.move_state ~= "idle" then
			self:_go_idle(unit, blackboard, locomotion_extension)
		end
	end

	local pos = POSITION_LOOKUP[unit]

	if blackboard.target_dist > 10 and (blackboard.consecutive_jump or blackboard.next_jump_time < t) then
		blackboard.consecutive_jump = false
		local success = self:investigate_jump(unit, t, blackboard, pos, locomotion_extension)

		if success then
			blackboard.next_jump_time = t + math.random() * 4

			return
		else
			blackboard.next_jump_time = t + 2
		end
	end

	local breed = blackboard.breed

	if breed.use_big_boy_turning and blackboard.move_state == "moving" then
		local is_turning = blackboard.is_turning
		local turning = (is_turning and "true") or "false"

		Debug.text("move_state:%s turning:%s", blackboard.move_state, turning)

		if is_turning then
			LocomotionUtils.update_turning(unit, t, dt, blackboard)
		else
			LocomotionUtils.check_start_turning(unit, t, dt, blackboard)
		end
	end

	local action = blackboard.action
	local previous_is_on_path = navigation_extension:is_following_path()
	local new_destination = LocomotionUtils.follow_target_ogre(unit, blackboard, t, dt)

	if new_destination then
		local to_vec = Vector3.flat(new_destination - POSITION_LOOKUP[unit])
		local distance_sq = Vector3.length_squared(to_vec)
		blackboard.wanted_destination = Vector3Box(new_destination)
		blackboard.walking_allowed = not previous_is_on_path and distance_sq <= action.enter_walk_dist_sq
	end

	if blackboard.boss_follow_next_line_of_sight_check_t < t then
		blackboard.has_los_to_any_player = PerceptionUtils.has_line_of_sight_to_any_player(unit)
		blackboard.boss_follow_next_line_of_sight_check_t = t + 2.5
	end

	local walking_allowed = blackboard.walking_allowed
	local to_vec = Vector3.flat(navigation_extension:destination() - POSITION_LOOKUP[unit])
	local distance_sq = Vector3.length_squared(to_vec)
	local move_anim = nil

	if action.override_move_speed then
		navigation_extension:set_max_speed(action.override_move_speed)
	else
		local breed = blackboard.breed

		if distance_sq <= action.enter_walk_dist_sq and walking_allowed then
			navigation_extension:set_max_speed(breed.walk_speed)

			move_anim = action.walk_anim
		elseif breed.catch_up_speed and action.enter_catch_up_dist_sq < distance_sq and not blackboard.has_los_to_any_player then
			navigation_extension:set_max_speed(breed.catch_up_speed)
		elseif action.leave_walk_dist_sq <= distance_sq then
			navigation_extension:set_max_speed(breed.run_speed)

			move_anim = action.move_anim
		elseif blackboard.move_state == "walking" then
			navigation_extension:set_max_speed(breed.walk_speed)

			move_anim = action.walk_anim
		else
			navigation_extension:set_max_speed(breed.run_speed)

			move_anim = action.move_anim
		end
	end

	local is_on_path = navigation_extension:is_following_path()

	if is_on_path and blackboard.move_state ~= "walking" and distance_sq <= action.enter_walk_dist_sq and walking_allowed then
		self:_go_walking(unit, blackboard, move_anim)
	elseif is_on_path and blackboard.move_state ~= "moving" and action.leave_walk_dist_sq <= distance_sq then
		self:_go_moving(unit, blackboard, move_anim)
	elseif blackboard.move_state ~= "idle" and navigation_extension:has_reached_destination(0.2) then
		self:_go_idle(unit, blackboard, locomotion_extension)
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

BTErraticFollowAction.check_for_high_jump = function (self, unit, blackboard)
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local ray_length = 1.2
	local pos = POSITION_LOOKUP[unit]
	local fwd = Vector3.normalize(Quaternion.forward(Unit.world_rotation(unit, 0)))
	local above_pos = pos + Vector3(0, 0, 2)
	local infront_pos = above_pos + fwd * 2
	local result, hit_position = PhysicsWorld.immediate_raycast(physics_world, infront_pos, Vector3(0, 0, 1), ray_length, "closest", "collision_filter", "filter_ai_mover")
	local result2, hit_position2 = PhysicsWorld.immediate_raycast(physics_world, above_pos, Vector3(0, 0, 1), ray_length, "closest", "collision_filter", "filter_ai_mover")
	local can_jump_high = (not result or not hit_position) and (not result2 or not hit_position2)

	return can_jump_high
end

BTErraticFollowAction.check_dir = function (self, p0, travel_dir, nav_world, traverse_logic, data)
	local jump_dir = Quaternion.rotate(Quaternion(Vector3.up(), data.ray_angle), travel_dir)
	local p1 = p0 + jump_dir * data.ray_dist
	local success, hit_pos = GwNavQueries.raycast(nav_world, p0, p1, traverse_logic)
	local num_fields = #data

	if success then
		local j = math.random(num_fields)

		for i = 1, num_fields, 1 do
			local d = data[j]
			local end_dir = Quaternion.rotate(Quaternion(Vector3.up(), d.ray_angle), jump_dir)
			local end_dot = Vector3.dot(travel_dir, end_dir)
			local p2 = p1 + end_dir * d.ray_dist

			if end_dot <= 0 then
				return false
			end

			local success, hit_pos = GwNavQueries.raycast(nav_world, p1, p2, traverse_logic)

			if success then
				return d
			end

			j = j + 1

			if num_fields < j then
				j = 1
			end
		end
	elseif hit_pos then
		return false
	end
end

BTErraticFollowAction.debug_ray_casts = function (self, unit_position, move_dir, nav_world, traverse_logic, action)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_left_anims)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_right_anims)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_fwd_anims)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_left_anims)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_left_anims)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_right_anims)
	self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_right_anims)
end

BTErraticFollowAction.investigate_jump = function (self, unit, t, blackboard, unit_position, locomotion_extension)
	local navigation_extension = blackboard.navigation_extension
	local nav_bot = navigation_extension._nav_bot
	local node_index = GwNavBot.get_path_current_node_index(nav_bot)
	local num_index = GwNavBot.get_path_nodes_count(nav_bot)

	if node_index < 0 or node_index == num_index then
		return false
	end

	local action = blackboard.action
	local sub_goal = GwNavBot.get_path_node_pos(nav_bot, node_index + 1)
	local travel_dir = Vector3.normalize(sub_goal - unit_position)
	local move_dir = Quaternion.forward(Unit.local_rotation(unit, 0))
	local dot = Vector3.dot(move_dir, travel_dir)
	local nav_world = blackboard.nav_world
	local traverse_logic = navigation_extension:traverse_logic()
	local jump_anim, jump_data = nil
	local moving_towards_target = dot > 0.25

	if moving_towards_target then
		local random_dirs = blackboard.random_dirs

		table.shuffle(random_dirs)

		for i = 1, 3, 1 do
			jump_data = self:check_dir(unit_position, move_dir, nav_world, traverse_logic, random_dirs[i])

			if jump_data then
				break
			end
		end
	else
		local right_of_to_goal = Vector3.cross(move_dir, travel_dir)[3] > 0

		if right_of_to_goal then
			print("moving away from target, need to turn left to get back")

			jump_data = self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_left_anims)

			if not jump_data then
				jump_data = self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_left_anims)
			end
		else
			print("moving away from target, need to turn right to get back")

			jump_data = self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_right_anims)
			jump_data = jump_data or self:check_dir(unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_right_anims)

			if not jump_data then
				print("fail! could not turn back with, a jump")
			end
		end
	end

	if jump_data then
		local jump_anim = jump_data[1]

		if action.uses_high_jumps and self:check_for_high_jump(unit, blackboard) then
			jump_anim = jump_anim .. "_high"
		end

		blackboard.current_jump_data = jump_data

		locomotion_extension:set_movement_type("snap_to_navmesh")
		locomotion_extension:set_animation_driven(true, false, false)
		LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))
		locomotion_extension:use_lerp_rotation(false)
		Managers.state.network:anim_event(unit, jump_anim)

		blackboard.jump_color = {
			math.random(100, 255),
			math.random(100, 255),
			math.random(100, 255)
		}
		blackboard.move_state = "jumping"

		return true
	end

	return false
end

BTErraticFollowAction.get_travel_dir = function (self, unit, blackboard, pos)
	local navigation_extension = blackboard.navigation_extension
	local nav_bot = navigation_extension._nav_bot
	local node_index = GwNavBot.get_path_current_node_index(nav_bot)
	local num_index = GwNavBot.get_path_nodes_count(nav_bot)

	if node_index < 0 or node_index == num_index then
		return
	end

	local action = blackboard.action
	local sub_goal = GwNavBot.get_path_node_pos(nav_bot, node_index + 1)
	local travel_dir = Vector3.normalize(sub_goal - pos)

	return travel_dir
end

BTErraticFollowAction.anim_cb_move_jump_finished = function (self, unit, blackboard)
	local pos = POSITION_LOOKUP[unit]
	local locomotion_extension = blackboard.locomotion_extension
	local move_dir = Quaternion.forward(Unit.local_rotation(unit, 0))
	local travel_dir = self:get_travel_dir(unit, blackboard, pos) or move_dir
	local dot = Vector3.dot(move_dir, travel_dir)
	local consecutive_jump = blackboard.target_dist > 10
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:reset_destination(target_pos)

	if consecutive_jump then
		local t = Managers.time:time("game")
		local success = self:investigate_jump(unit, t, blackboard, pos, locomotion_extension)

		if success then
			return
		end
	end

	locomotion_extension:set_animation_driven(false, true, false)
	locomotion_extension:use_lerp_rotation(true)
	locomotion_extension:set_movement_type("snap_to_navmesh")
	Managers.state.network:anim_event(unit, "move_fwd")

	blackboard.move_state = "moving"
end

return
