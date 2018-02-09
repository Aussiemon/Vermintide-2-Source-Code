require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTErraticFollowAction = class(BTErraticFollowAction, BTNode)
BTErraticFollowAction.init = function (self, ...)
	BTErraticFollowAction.super.init(self, ...)

	return 
end
BTErraticFollowAction.name = "BTErraticFollowAction"
local debug_movement = false
BTErraticFollowAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.remembered_threat_pos = nil
	blackboard.chasing_timer = blackboard.unreachable_timer or 0
	blackboard.active_node = self
	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	local move_state = blackboard.move_state
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local animation_name = AiAnimUtils.get_start_move_animation(unit, target_pos, action.start_anims_name)

	if blackboard.move_state ~= "moving" then
		self._go_moving(self, unit, blackboard, animation_name)
	end

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end

	if not blackboard.random_dirs then
		blackboard.random_dirs = {
			action.move_jump_fwd_anims,
			action.move_jump_right_anims,
			action.move_jump_fwd_anims
		}
	end

	local unit_id = network_manager.unit_game_object_id(network_manager, unit)
	local target_unit_id = network_manager.unit_game_object_id(network_manager, blackboard.target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id)

	blackboard.next_jump_time = t + 1

	return 
end
BTErraticFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
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
	blackboard.active_node = nil

	if blackboard.move_state == "jumping" then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension.set_animation_driven(locomotion_extension, false, true, false)
		locomotion_extension.use_lerp_rotation(locomotion_extension, true)
		locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")
		Managers.state.network:anim_event(unit, "move_fwd")

		blackboard.move_state = "moving"
	end

	return 
end
BTErraticFollowAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	if debug_movement then
		local pos = POSITION_LOOKUP[unit] + Vector3(0, 0, 0.25)
		local fwd = Quaternion.forward(Unit.local_rotation(unit, 0))

		QuickDrawerStay:line(pos, pos + fwd*2, Color(255, 100, 0))
	end

	local move_state = blackboard.move_state

	if move_state == "jumping" then
		if debug_movement then
			QuickDrawerStay:sphere(POSITION_LOOKUP[unit], 0.05, Color(unpack(blackboard.jump_color)))
		end
	else
		self.follow(self, unit, t, dt, blackboard, locomotion_extension)

		if debug_movement then
			QuickDrawerStay:sphere(POSITION_LOOKUP[unit] + Vector3(0, 0, 0.5), 0.1, Color(200, 200, 200))
		end
	end

	blackboard.chasing_timer = blackboard.chasing_timer + dt

	return "running", "evaluate"
end
BTErraticFollowAction._go_idle = function (self, unit, blackboard, locomotion_extension)
	blackboard.move_state = "idle"

	Managers.state.network:anim_event(unit, "idle")

	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

	locomotion_extension.set_wanted_rotation(locomotion_extension, rot)

	return 
end
BTErraticFollowAction._go_moving = function (self, unit, blackboard, move_anim)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, move_anim)

	return 
end
BTErraticFollowAction._go_walking = function (self, unit, blackboard, walk_anim)
	blackboard.move_state = "walking"

	Managers.state.network:anim_event(unit, walk_anim)

	return 
end
BTErraticFollowAction.follow = function (self, unit, t, dt, blackboard, locomotion_extension)
	local navigation_extension = blackboard.navigation_extension

	if 1 < navigation_extension.number_failed_move_attempts(navigation_extension) then
		blackboard.remembered_threat_pos = false

		if blackboard.move_state ~= "idle" then
			self._go_idle(self, unit, blackboard, locomotion_extension)
		end
	end

	local pos = POSITION_LOOKUP[unit]

	if 10 < blackboard.target_dist and (blackboard.consecutive_jump or blackboard.next_jump_time < t) then
		blackboard.consecutive_jump = false
		local success = self.investigate_jump(self, unit, t, blackboard, pos, locomotion_extension)

		if success then
			blackboard.next_jump_time = t + math.random()*4

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
	local previous_is_on_path = navigation_extension.is_following_path(navigation_extension)
	local new_destination = LocomotionUtils.follow_target_ogre(unit, blackboard, t, dt)

	if new_destination then
		local to_vec = Vector3.flat(new_destination - POSITION_LOOKUP[unit])
		local distance_sq = Vector3.length_squared(to_vec)
		blackboard.wanted_destination = Vector3Box(new_destination)
		blackboard.walking_allowed = not previous_is_on_path and distance_sq <= action.enter_walk_dist_sq
	end

	local walking_allowed = blackboard.walking_allowed
	local to_vec = Vector3.flat(navigation_extension.destination(navigation_extension) - POSITION_LOOKUP[unit])
	local distance_sq = Vector3.length_squared(to_vec)
	local move_anim = nil

	if action.override_move_speed then
		navigation_extension.set_max_speed(navigation_extension, action.override_move_speed)
	else
		local breed = blackboard.breed

		if distance_sq <= action.enter_walk_dist_sq and walking_allowed then
			navigation_extension.set_max_speed(navigation_extension, breed.walk_speed)

			move_anim = action.walk_anim
		elseif action.leave_walk_dist_sq <= distance_sq then
			navigation_extension.set_max_speed(navigation_extension, breed.run_speed)

			move_anim = action.move_anim
		elseif blackboard.move_state == "walking" then
			navigation_extension.set_max_speed(navigation_extension, breed.walk_speed)

			move_anim = action.walk_anim
		else
			navigation_extension.set_max_speed(navigation_extension, breed.run_speed)

			move_anim = action.move_anim
		end
	end

	local is_on_path = navigation_extension.is_following_path(navigation_extension)

	if is_on_path and blackboard.move_state ~= "walking" and distance_sq <= action.enter_walk_dist_sq and walking_allowed then
		self._go_walking(self, unit, blackboard, move_anim)
	elseif is_on_path and blackboard.move_state ~= "moving" and action.leave_walk_dist_sq <= distance_sq then
		self._go_moving(self, unit, blackboard, move_anim)
	elseif blackboard.move_state ~= "idle" and navigation_extension.has_reached_destination(navigation_extension, 0.2) then
		self._go_idle(self, unit, blackboard, locomotion_extension)
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
BTErraticFollowAction.check_for_high_jump = function (self, unit, blackboard)
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local ray_length = 1.2
	local pos = POSITION_LOOKUP[unit]
	local fwd = Vector3.normalize(Quaternion.forward(Unit.world_rotation(unit, 0)))
	local above_pos = pos + Vector3(0, 0, 2)
	local infront_pos = above_pos + fwd*2
	local result, hit_position = PhysicsWorld.immediate_raycast(physics_world, infront_pos, Vector3(0, 0, 1), ray_length, "closest", "collision_filter", "filter_ai_mover")
	local result2, hit_position2 = PhysicsWorld.immediate_raycast(physics_world, above_pos, Vector3(0, 0, 1), ray_length, "closest", "collision_filter", "filter_ai_mover")
	local can_jump_high = (not result or not hit_position) and (not result2 or not hit_position2)

	return can_jump_high
end
BTErraticFollowAction.check_dir = function (self, p0, travel_dir, nav_world, traverse_logic, data)
	local QD = QuickDrawerStay
	local color_success = Color(0, 255, 0)
	local color_fail = Color(255, 0, 0)
	local jump_dir = Quaternion.rotate(Quaternion(Vector3.up(), data.ray_angle), travel_dir)
	local p1 = p0 + jump_dir*data.ray_dist
	local success, hit_pos = GwNavQueries.raycast(nav_world, p0, p1, traverse_logic)

	if debug_movement then
		QD.line(QD, p0, p1, (success and color_success) or color_fail)
	end

	local num_fields = #data

	if success then
		local j = math.random(num_fields)

		for i = 1, num_fields, 1 do
			local d = data[j]
			local end_dir = Quaternion.rotate(Quaternion(Vector3.up(), d.ray_angle), jump_dir)
			local end_dot = Vector3.dot(travel_dir, end_dir)
			local p2 = p1 + end_dir*d.ray_dist

			if end_dot <= 0 then
				if debug_movement then
					QD.line(QD, p1, p2, color_fail)
				end

				return false
			end

			local success, hit_pos = GwNavQueries.raycast(nav_world, p1, p2, traverse_logic)

			if debug_movement then
				QD.line(QD, p1, p2, (success and color_success) or color_fail)
			end

			if success then
				if debug_movement then
					QD.sphere(QD, hit_pos, 0.1, color_success)
				end

				return d
			end

			j = j + 1

			if num_fields < j then
				j = 1
			end
		end
	elseif hit_pos then
		if debug_movement then
			QD.sphere(QD, hit_pos, 0.1, color_fail)
		end

		return false
	end

	return 
end
BTErraticFollowAction.debug_ray_casts = function (self, unit_position, move_dir, nav_world, traverse_logic, action)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_left_anims)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_right_anims)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_fwd_anims)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_left_anims)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_left_anims)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_right_anims)
	self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_right_anims)

	return 
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
	local traverse_logic = navigation_extension.traverse_logic(navigation_extension)
	local jump_anim, jump_data = nil
	local moving_towards_target = 0.25 < dot

	if moving_towards_target then
		local random_dirs = blackboard.random_dirs

		table.shuffle(random_dirs)

		for i = 1, 3, 1 do
			jump_data = self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, random_dirs[i])

			if jump_data then
				break
			end
		end
	else
		if debug_movement then
			local p = unit_position + Vector3(0, 0, 4)

			QuickDrawerStay:line(unit_position, p, Color(200, 200, 10))
			QuickDrawerStay:line(p, p + move_dir*2, Color(0, 200, 0))
			QuickDrawerStay:line(p, p + travel_dir*2.5, Color(0, 200, 200))
		end

		right_of_to_goal = 0 < Vector3.cross(move_dir, travel_dir)[3]

		if right_of_to_goal then
			print("moving away from target, need to turn left to get back")

			jump_data = self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_left_anims)

			if not jump_data then
				jump_data = self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_left_anims)
			end
		else
			print("moving away from target, need to turn right to get back")

			jump_data = self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_right_anims)
			jump_data = jump_data or self.check_dir(self, unit_position, move_dir, nav_world, traverse_logic, action.move_jump_only_fwd_right_anims)

			if not jump_data then
				print("fail! could not turn back with, a jump")
			end
		end
	end

	if jump_data then
		local jump_anim = jump_data[1]

		if action.uses_high_jumps and self.check_for_high_jump(self, unit, blackboard) then
			jump_anim = jump_anim .. "_high"
		end

		blackboard.current_jump_data = jump_data

		locomotion_extension.set_movement_type(locomotion_extension, "script_driven")
		locomotion_extension.set_animation_driven(locomotion_extension, true, false, false)
		LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))
		locomotion_extension.use_lerp_rotation(locomotion_extension, false)
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
	local travel_dir = self.get_travel_dir(self, unit, blackboard, pos) or move_dir
	local dot = Vector3.dot(move_dir, travel_dir)
	local consecutive_jump = 10 < blackboard.target_dist
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.reset_destination(navigation_extension, target_pos)

	if consecutive_jump then
		local t = Managers.time:time("game")
		local success = self.investigate_jump(self, unit, t, blackboard, pos, locomotion_extension)

		if success then
			return 
		end
	end

	locomotion_extension.set_animation_driven(locomotion_extension, false, true, false)
	locomotion_extension.use_lerp_rotation(locomotion_extension, true)
	locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")
	Managers.state.network:anim_event(unit, "move_fwd")

	blackboard.move_state = "moving"

	return 
end

return 
