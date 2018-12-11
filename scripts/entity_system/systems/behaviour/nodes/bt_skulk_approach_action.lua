require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSkulkApproachAction = class(BTSkulkApproachAction, BTNode)
BTSkulkApproachAction.name = "BTSkulkApproachAction"

BTSkulkApproachAction.init = function (self, ...)
	BTSkulkApproachAction.super.init(self, ...)
end

BTSkulkApproachAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local target_dist = blackboard.target_dist
	local skulk_start_radius = (target_dist and math.min(action.skulk_init_distance, target_dist)) or action.skulk_init_distance
	local skulk_data = blackboard.skulk_data or {}
	local direction = skulk_data.direction or 1 - math.random(0, 1) * 2
	skulk_data.direction = direction
	skulk_data.radius = skulk_data.radius or skulk_start_radius
	skulk_data.skulk_around_time = skulk_data.skulk_around_time or 0
	skulk_data.next_random_goal_at_radius = skulk_data.radius
	blackboard.skulk_data = skulk_data
	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	local ai_navigation = blackboard.navigation_extension

	ai_navigation:set_max_speed(blackboard.breed.run_speed)
	LocomotionUtils.set_animation_driven_movement(unit, false)

	if blackboard.move_pos then
		local move_pos = blackboard.move_pos:unbox()

		self:move_to(move_pos, unit, blackboard)
	end

	local network_manager = Managers.state.network
	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end
end

BTSkulkApproachAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local skulk_data = blackboard.skulk_data
	skulk_data.animation_state = nil
	blackboard.action = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if reason == "aborted" then
		local path_found = navigation_extension:is_following_path()

		if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
			self:start_move_animation(unit, blackboard)
		end
	end
end

local RADIUS_DECRESE_PER_TEST = 0.5

BTSkulkApproachAction.run = function (self, unit, blackboard, t, dt)
	self:update_skulk_data(unit, blackboard, dt)

	local ai_navigation = blackboard.navigation_extension
	local path_found = ai_navigation:is_following_path()
	local failed_attempts = ai_navigation:number_failed_move_attempts()

	if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
		self:start_move_animation(unit, blackboard)
	end

	local skulk_data = blackboard.skulk_data
	local action = blackboard.action
	local commit_to_target = self:commit_to_target(unit, blackboard, dt)

	if commit_to_target then
		skulk_data.radius = action.skulk_init_distance

		return "done"
	end

	local position = blackboard.move_pos

	if position then
		local at_goal = self:at_goal(unit, blackboard)

		if at_goal or failed_attempts > 0 then
			blackboard.move_pos = nil
		end

		return "running"
	end

	if skulk_data.radius <= skulk_data.next_random_goal_at_radius then
		local position = self:get_random_goal_on_circle(unit, blackboard)

		if position then
			self:move_to(position, unit, blackboard)

			return "running"
		end

		skulk_data.next_random_goal_at_radius = skulk_data.radius - RADIUS_DECRESE_PER_TEST
	end

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	return "running"
end

BTSkulkApproachAction.update_skulk_data = function (self, unit, blackboard, dt)
	local action = blackboard.action
	local start_radius = action.skulk_init_distance
	local skulk_data = blackboard.skulk_data
	local d_radius = nil

	if blackboard.move_pos then
		local decrease_radius_speed = action.decrease_radius_speed
		d_radius = dt * decrease_radius_speed
	else
		d_radius = RADIUS_DECRESE_PER_TEST
	end

	local radius = skulk_data.radius - d_radius
	radius = math.clamp(radius, 0, start_radius)
	skulk_data.radius = radius
	skulk_data.skulk_around_time = skulk_data.skulk_around_time + dt
end

local MINIMUM_SKULK_RADIUS = 5

BTSkulkApproachAction.commit_to_target = function (self, unit, blackboard, dt)
	local action = blackboard.action
	local has_been_attacked = blackboard.previous_attacker
	local target_dist = blackboard.target_dist
	local commit_radius = action.commit_distance
	local inside_commit_radius = target_dist < commit_radius
	local commit_to_target = inside_commit_radius or has_been_attacked or blackboard.skulk_data.radius <= MINIMUM_SKULK_RADIUS

	return commit_to_target
end

BTSkulkApproachAction.at_goal = function (self, unit, blackboard)
	local skulk_data = blackboard.skulk_data
	local position_boxed = blackboard.move_pos

	if not position_boxed then
		return false
	end

	local position = position_boxed:unbox()
	local distance = Vector3.distance_squared(position, POSITION_LOOKUP[unit])

	if distance < 0.25 then
		return true
	end
end

BTSkulkApproachAction.move_to = function (self, position, unit, blackboard)
	local skulk_data = blackboard.skulk_data
	local ai_navigation = blackboard.navigation_extension

	ai_navigation:move_to(position)

	blackboard.move_pos = Vector3Box(position)
end

BTSkulkApproachAction.idle = function (self, unit, blackboard)
	self:anim_event(unit, blackboard, "idle")

	blackboard.move_state = "idle"
end

BTSkulkApproachAction.start_move_animation = function (self, unit, blackboard)
	self:anim_event(unit, blackboard, "move_fwd_run")

	blackboard.move_state = "moving"
end

BTSkulkApproachAction.anim_event = function (self, unit, blackboard, anim)
	local skulk_data = blackboard.skulk_data

	if skulk_data.animation_state ~= anim then
		Managers.state.network:anim_event(unit, anim)

		skulk_data.animation_state = anim
	end
end

local TRIES = 15

BTSkulkApproachAction.get_random_goal_on_circle = function (self, unit, blackboard)
	local skulk_data = blackboard.skulk_data
	local radius = skulk_data.radius
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local unit_position = POSITION_LOOKUP[unit]
	local direction = skulk_data.direction
	local offset = Vector3.up() * 0.2
	local look_at_direction = unit_position - target_position
	local target_to_unit_rotation = Quaternion.look(look_at_direction, Vector3.up())
	local target_to_unit_forward = Quaternion.forward(target_to_unit_rotation)
	local rotation_forward = Vector3.forward()
	local a, angle = AiUtils.get_angle_between_vectors(target_to_unit_forward, rotation_forward)

	for i = 1, TRIES, 1 do
		local random_angle = (i * 3 + Math.random(0, 3)) * direction

		if i == TRIES then
			random_angle = 2 * direction
		end

		local final_angle = angle + random_angle
		local radians = math.degrees_to_radians(final_angle)
		local random_radius = Math.random(-1, 0)
		local final_radius = radius + random_radius
		local rotation = Quaternion.axis_angle(Vector3.up(), radians)
		local forward_vector = Quaternion.forward(rotation)
		local position = target_position + forward_vector * final_radius
		local nav_world = blackboard.nav_world
		local on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, position, 5, 5)

		if on_navmesh then
			position.z = altitude

			if script_data.ai_globadier_behavior then
				QuickDrawerStay:sphere(position + offset, 0.25, Colors.get("aqua_marine"))
			end

			blackboard.wanted_distance = final_radius

			return position
		elseif script_data.ai_globadier_behavior then
			QuickDrawerStay:sphere(position + offset, 0.25, Colors.get_color_with_alpha("aqua_marine", 100))
		end
	end

	return false
end

BTSkulkApproachAction.debug_show_skulk_circle = function (self, unit, blackboard)
	local action = blackboard.action
	local skulk_start_radius = action.skulk_init_distance
	local skulk_data = blackboard.skulk_data
	local radius = skulk_data.radius
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local offset = Vector3.up() * 0.2

	QuickDrawer:circle(target_position + offset, radius, Vector3.up(), Colors.get("light_green"))
	QuickDrawer:circle(target_position + offset, skulk_start_radius, Vector3.up(), Colors.get("light_green"))
end

return
