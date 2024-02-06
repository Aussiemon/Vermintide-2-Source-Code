-- chunkname: @scripts/entity_system/systems/behaviour/nodes/skaven_ratling_gunner/bt_ratling_gunner_move_to_shoot_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTRatlingGunnerMoveToShootAction = class(BTRatlingGunnerMoveToShootAction, BTNode)

BTRatlingGunnerMoveToShootAction.init = function (self, ...)
	BTRatlingGunnerMoveToShootAction.super.init(self, ...)
end

BTRatlingGunnerMoveToShootAction.name = "BTRatlingGunnerMoveToShootAction"

BTRatlingGunnerMoveToShootAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local attack_pattern_data = {}

	blackboard.attack_pattern_data = attack_pattern_data
	blackboard.action = action

	local target_unit, node_name = PerceptionUtils.pick_ratling_gun_target(unit, blackboard)

	if target_unit then
		attack_pattern_data.target_unit = target_unit
		attack_pattern_data.target_node_name = node_name
		attack_pattern_data.exit_node = true

		return
	end

	local move_speed = action.move_speed
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(move_speed)
	navigation_extension:stop()

	blackboard.move_pos = nil

	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
	blackboard.move_attempts = 0
end

BTRatlingGunnerMoveToShootAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason ~= "done" then
		blackboard.move_pos = nil
	end

	blackboard.move_attempts = nil

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
end

BTRatlingGunnerMoveToShootAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_pattern_data.exit_node then
		blackboard.attack_pattern_data.exit_node = nil

		return "done"
	end

	local move_pos = blackboard.move_pos

	if not move_pos then
		local position = self:calculate_move_position(unit, blackboard)

		blackboard.move_attempts = blackboard.move_attempts or 0
		blackboard.move_attempts = blackboard.move_attempts + 1

		if position then
			self:move_to(position, unit, blackboard)
		elseif blackboard.move_attempts > 5 then
			return "failed"
		end

		return "running"
	end

	local at_goal = move_pos and blackboard.destination_dist < 0.5

	if at_goal then
		return "done"
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

		network_manager:anim_event(unit, move_animation)

		blackboard.move_state = "moving"
	end

	return "running"
end

BTRatlingGunnerMoveToShootAction.move_to = function (self, position, unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:move_to(position)

	blackboard.move_pos = Vector3Box(position)
end

BTRatlingGunnerMoveToShootAction.calculate_move_position = function (self, unit, blackboard)
	local action = blackboard.action
	local min_distance = action.keep_target_distance[1]
	local max_distance = action.keep_target_distance[2]
	local min_angle_step = 1
	local max_angle_step = 3
	local min_angle = 6
	local position = AiUtils.advance_towards_target(unit, blackboard, min_distance, max_distance, min_angle_step, max_angle_step, min_angle)

	return position
end
