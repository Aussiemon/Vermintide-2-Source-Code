require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTRatlingGunnerApproachAction = class(BTRatlingGunnerApproachAction, BTNode)

BTRatlingGunnerApproachAction.init = function (self, ...)
	BTRatlingGunnerApproachAction.super.init(self, ...)
end

BTRatlingGunnerApproachAction.name = "BTRatlingGunnerApproachAction"

BTRatlingGunnerApproachAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local attack_pattern_data = blackboard.attack_pattern_data or {}
	blackboard.attack_pattern_data = attack_pattern_data
	blackboard.action = action
	blackboard.lurk_start = blackboard.lurk_start or t
	local move_speed = action.move_speed
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(move_speed)
	navigation_extension:stop()

	if blackboard.move_state == "moving" then
		local move_animation = action.move_anim
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "to_combat")
		network_manager:anim_event(unit, move_animation)
	end

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]

		Managers.state.network.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end
end

BTRatlingGunnerApproachAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason ~= "done" then
		blackboard.move_pos = nil
	end

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
end

BTRatlingGunnerApproachAction.run = function (self, unit, blackboard, t, dt)
	local is_within_check_distance = self:is_within_check_distance(unit, blackboard)

	if is_within_check_distance then
		return "done"
	end

	local move_pos = blackboard.move_pos
	local at_goal = move_pos and blackboard.destination_dist < 0.5

	if not move_pos or at_goal then
		local position = self:calculate_move_position(unit, blackboard)

		if position then
			self:move_to(position, blackboard)

			return "running"
		else
			return "failed"
		end
	end

	local no_path_found = blackboard.no_path_found

	if no_path_found then
		return "failed"
	end

	local is_computing_path = blackboard.is_computing_path

	if blackboard.move_state ~= "moving" and not is_computing_path then
		local action = blackboard.action
		local move_animation = action.move_anim
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "to_combat")
		network_manager:anim_event(unit, move_animation)

		blackboard.move_state = "moving"
	end

	return "running"
end

BTRatlingGunnerApproachAction.is_within_check_distance = function (self, unit, blackboard)
	local action = blackboard.action
	local has_been_attacked = blackboard.previous_attacker
	local target_dist = blackboard.target_dist
	local check_distance = action.check_distance
	local inside_check_distance = target_dist < check_distance
	local is_within_check_distance = inside_check_distance or has_been_attacked

	return is_within_check_distance
end

BTRatlingGunnerApproachAction.move_to = function (self, position, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:move_to(position)

	blackboard.move_pos = Vector3Box(position)
end

BTRatlingGunnerApproachAction.calculate_move_position = function (self, unit, blackboard)
	local action = blackboard.action
	local min_distance = action.check_distance - 2
	local max_distance = action.check_distance
	local min_angle_step = action.min_angle_step
	local max_angle_step = action.max_angle_step
	local position = AiUtils.advance_towards_target(unit, blackboard, min_distance, max_distance, min_angle_step, max_angle_step)

	return position
end

return
