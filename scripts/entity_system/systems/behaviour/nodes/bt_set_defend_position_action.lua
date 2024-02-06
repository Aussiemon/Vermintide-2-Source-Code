-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_set_defend_position_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSetDefendPositionAction = class(BTSetDefendPositionAction, BTNode)

BTSetDefendPositionAction.init = function (self, ...)
	BTSetDefendPositionAction.super.init(self, ...)
end

BTSetDefendPositionAction.name = "BTSetDefendPositionAction"

BTSetDefendPositionAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data

	blackboard.navigation_extension:set_max_speed(blackboard.breed.run_speed)

	blackboard.next_check = t
end

BTSetDefendPositionAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.defend_get_in_position = nil
end

BTSetDefendPositionAction.run = function (self, unit, blackboard, t)
	if t < blackboard.next_check then
		return "running"
	end

	local action = blackboard.action
	local move_pos = self:find_move_pos(blackboard, action)

	blackboard.next_check = t + action.function_call_interval

	if not move_pos then
		return "running"
	elseif self:has_overlap_at_pos(move_pos, blackboard, action) then
		return "running"
	end

	blackboard.goal_destination = Vector3Box(move_pos)

	return "done"
end

BTSetDefendPositionAction.find_move_pos = function (self, blackboard, action)
	local nav_world = blackboard.nav_world
	local data = action.find_move_pos
	local center_pos = blackboard.destructible_pos:unbox()
	local pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, center_pos, data.radius, data.spread, data.tries, false, nil, nil, data.max_above, data.below)

	return pos
end

local broadphase_query_result = {}

BTSetDefendPositionAction.has_overlap_at_pos = function (self, position, blackboard, action)
	local radius = action.has_overlap_at_pos.radius
	local num_results = Broadphase.query(blackboard.group_blackboard.broadphase, position, radius, broadphase_query_result)

	return num_results > 0
end
