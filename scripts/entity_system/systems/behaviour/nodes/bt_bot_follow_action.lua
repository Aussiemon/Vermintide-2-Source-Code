require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotFollowAction = class(BTBotFollowAction, BTNode)
BTBotFollowAction.init = function (self, ...)
	BTBotFollowAction.super.init(self, ...)

	return 
end
BTBotFollowAction.name = "BTBotFollowAction"
BTBotFollowAction.enter = function (self, unit, blackboard, t)
	blackboard.has_teleported = false
	local goal_selection = self._tree_node.action_data.goal_selection
	blackboard.follow.goal_selection_func = goal_selection
	blackboard.follow.needs_target_position_refresh = true

	return 
end
BTBotFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.follow.goal_selection_func = nil

	return 
end
BTBotFollowAction.run = function (self, unit, blackboard, t, dt)
	return "running", "evaluate"
end

return 
