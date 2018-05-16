require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAdvanceTowardsPlayersAction = class(BTAdvanceTowardsPlayersAction, BTNode)
BTAdvanceTowardsPlayersAction.name = "BTAdvanceTowardsPlayersAction"

BTAdvanceTowardsPlayersAction.init = function (self, ...)
	BTAdvanceTowardsPlayersAction.super.init(self, ...)
end

local EVALUATE_TIME = 1

BTAdvanceTowardsPlayersAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	LocomotionUtils.set_animation_driven_movement(unit, false)

	local throw_at_distance = (blackboard.has_thrown and action.throw_at_distance) or action.throw_at_distance_first_time
	local advance_towards_players = blackboard.advance_towards_players or {}
	advance_towards_players.timer = advance_towards_players.timer or 0
	advance_towards_players.time_before_throw_timer = 0
	advance_towards_players.evaluate_timer = EVALUATE_TIME
	advance_towards_players.direction = advance_towards_players.direction or 1 - math.random(0, 1) * 2
	advance_towards_players.time_until_first_throw = AiUtils.random(action.time_until_first_throw[1], action.time_until_first_throw[2])
	advance_towards_players.throw_at_distance = AiUtils.random(throw_at_distance[1], throw_at_distance[2])
	advance_towards_players.goal_get_fails = advance_towards_players.goal_get_fails or 0
	blackboard.advance_towards_players = advance_towards_players

	if blackboard.move_state ~= "idle" then
		self:start_idle_animation(unit, blackboard)
	end

	local ai_navigation_extension = blackboard.navigation_extension

	ai_navigation_extension:set_max_speed(blackboard.breed.walk_speed)

	if blackboard.move_pos then
		local move_pos = blackboard.move_pos:unbox()

		ai_navigation_extension:move_to(move_pos)
	end

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]

		Managers.state.network.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end
end

BTAdvanceTowardsPlayersAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	local navigation_extension = blackboard.navigation_extension

	if reason == "aborted" then
		local path_found = navigation_extension:is_following_path()

		if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
			self:start_move_animation(unit, blackboard)
		end

		blackboard.move_pos = nil
	end

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)

	navigation_extension:set_max_speed(default_move_speed)
end

BTAdvanceTowardsPlayersAction.run = function (self, unit, blackboard, t, dt)
	local ai_navigation = blackboard.navigation_extension
	local breed = blackboard.breed
	local action = blackboard.action
	local advance_towards_players = blackboard.advance_towards_players
	advance_towards_players.evaluate_timer = (blackboard.times_thrown ~= 0 and 0) or advance_towards_players.evaluate_timer - dt
	advance_towards_players.timer = advance_towards_players.timer + dt
	advance_towards_players.time_before_throw_timer = advance_towards_players.time_before_throw_timer + dt
	local failed_attempts = ai_navigation:number_failed_move_attempts()
	local path_found = ai_navigation:is_following_path()

	if not blackboard.move_pos or failed_attempts > 0 then
		local success = self:get_new_goal(unit, blackboard)

		if not success then
			return "failed"
		end

		local goal_pos = blackboard.move_pos:unbox()

		ai_navigation:move_to(goal_pos)

		return "running"
	end

	if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
		self:start_move_animation(unit, blackboard)
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(nil)

	local goal_pos = blackboard.move_pos:unbox()
	local target_unit = blackboard.target_unit
	local goal_distance = Vector3.distance_squared(goal_pos, POSITION_LOOKUP[unit])

	if goal_distance < 0.25 then
		blackboard.move_pos = nil
	end

	if advance_towards_players.evaluate_timer > 0 then
		return "running"
	end

	if action.exit_to_skulk_distance < blackboard.target_dist then
		blackboard.skulk_data.radius = blackboard.target_dist

		return "failed"
	end

	local want_to_throw = self:want_to_throw(unit, blackboard, t)

	if not want_to_throw then
		advance_towards_players.evaluate_timer = EVALUATE_TIME

		return "running"
	end

	local can_throw = self:can_throw(unit, blackboard, t)

	if self:has_valid_target(target_unit) and can_throw and self:_calculate_trajectory_to_target(unit, blackboard.world, blackboard, action) then
		blackboard.has_thrown = true
		blackboard.move_pos = nil

		return "done"
	end

	advance_towards_players.evaluate_timer = EVALUATE_TIME

	return "running"
end

BTAdvanceTowardsPlayersAction._calculate_trajectory_to_target = function (self, unit, world, blackboard, action)
	local curr_pos = Vector3.copy(POSITION_LOOKUP[unit])
	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)
	local x, y, z = unpack(action.attack_throw_offset)
	local pos = Vector3(x, y, z)
	local throw_offset = Quaternion.rotate(rot, pos)
	local throw_pos = curr_pos + throw_offset
	curr_pos.z = throw_pos.z
	local root_to_throw = throw_pos - curr_pos
	local direction = Vector3.normalize(root_to_throw)
	local length = Vector3.length(root_to_throw)
	local physics_world = World.get_data(world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, curr_pos, direction, length, "closest", "collision_filter", "filter_enemy_ray_projectile")

	if result then
		return false
	end

	local radius = action.radius - 1
	local max_distance = action.range
	local target_position = PerceptionUtils.pick_area_target(unit, blackboard, nil, radius, max_distance)
	local target_vector = Vector3.normalize(target_position - throw_pos)
	local hit, angle, speed = WeaponHelper:calculate_trajectory(world, throw_pos, target_position, ProjectileGravitySettings.default, blackboard.breed.max_globe_throw_speed)

	if hit then
		blackboard.throw_globe_data = blackboard.throw_globe_data or {
			throw_pos = Vector3Box(),
			target_direction = Vector3Box()
		}
		blackboard.throw_globe_data.angle = angle
		blackboard.throw_globe_data.speed = speed

		blackboard.throw_globe_data.throw_pos:store(throw_pos)
		blackboard.throw_globe_data.target_direction:store(target_vector)
	end

	return hit
end

BTAdvanceTowardsPlayersAction.has_valid_target = function (self, target_unit)
	return VALID_TARGETS_PLAYERS_AND_BOTS[target_unit]
end

BTAdvanceTowardsPlayersAction.want_to_throw = function (self, unit, blackboard, t)
	local action = blackboard.action
	local slot_count = blackboard.total_slots_count
	local advance_towards_players = blackboard.advance_towards_players
	local time_until_first_throw = advance_towards_players.time_until_first_throw + action.slot_count_time_modifier * slot_count
	local time_in_approach = advance_towards_players.timer

	if time_in_approach < time_until_first_throw then
		return false
	end

	local throw_globe_data = blackboard.throw_globe_data

	if throw_globe_data and throw_globe_data.next_throw_at and blackboard.target_dist < 4 then
		throw_globe_data.next_throw_at = -math.huge

		return true
	end

	local next_throw_at = throw_globe_data and throw_globe_data.next_throw_at

	if next_throw_at then
		if next_throw_at < t then
			local target_dist = blackboard.target_dist

			if target_dist < action.range then
				return true
			end
		else
			return false
		end
	end

	local time_before_throw_distance_modifier = action.time_before_throw_distance_modifier * advance_towards_players.time_before_throw_timer
	local slot_count_distance_modifier = action.slot_count_distance_modifier * slot_count
	local throw_at_distance = advance_towards_players.throw_at_distance + slot_count_distance_modifier + time_before_throw_distance_modifier
	local target_dist = blackboard.target_dist

	if throw_at_distance < target_dist then
		return false
	end

	return true
end

BTAdvanceTowardsPlayersAction.can_throw = function (self, unit, blackboard, t)
	local action_data = blackboard.action

	if action_data.ignore_LOS_check_after_first_throw and blackboard.has_thrown then
		return true
	end

	local start_pos = POSITION_LOOKUP[unit] + Vector3.up()
	local end_pos = POSITION_LOOKUP[blackboard.target_unit] + Vector3.up() * 2
	local look_vector = end_pos - start_pos
	local direction = Vector3.normalize(look_vector)
	local length = Vector3.length(look_vector)
	local hit, position1, distance1, normal, actor1 = PhysicsWorld.immediate_raycast(World.get_data(blackboard.world, "physics_world"), start_pos, direction, length, "closest", "collision_filter", "filter_ai_line_of_sight_check")

	return not hit
end

BTAdvanceTowardsPlayersAction.get_new_goal = function (self, unit, blackboard)
	local action = blackboard.action
	local min_distance = action.keep_target_distance[1]
	local max_distance = action.keep_target_distance[2]
	local advance_towards_players = blackboard.advance_towards_players
	local fails = advance_towards_players.goal_get_fails
	local above_below = math.min(3 + 5 * fails, 30)
	local position, distance, direction = AiUtils.advance_towards_target(unit, blackboard, min_distance, max_distance, nil, nil, nil, nil, advance_towards_players.direction, above_below, above_below)

	if position then
		blackboard.move_pos = Vector3Box(position)
		blackboard.wanted_distance = distance
		advance_towards_players.direction = direction
		advance_towards_players.goal_get_fails = 0

		return true
	end

	advance_towards_players.goal_get_fails = fails + 1
	advance_towards_players.direction = math.sign(advance_towards_players.direction)

	return false
end

BTAdvanceTowardsPlayersAction.start_idle_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "to_passive")
	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end

BTAdvanceTowardsPlayersAction.start_move_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "to_combat")
	Managers.state.network:anim_event(unit, "move_fwd")

	blackboard.move_state = "moving"
end

return
