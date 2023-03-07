require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTentacleSpawnAction = class(BTTentacleSpawnAction, BTNode)

BTTentacleSpawnAction.init = function (self, ...)
	BTTentacleSpawnAction.super.init(self, ...)
end

BTTentacleSpawnAction.name = "BTTentacleSpawnAction"

BTTentacleSpawnAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	if action and action.duration then
		blackboard.spawn_finished_t = t + action.duration
	end

	local network_manager = Managers.state.network

	if action and action.animation then
		network_manager:anim_event(unit, action.animation)
	end
end

BTTentacleSpawnAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.spawn = false
end

BTTentacleSpawnAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action

	if action and action.duration then
		if blackboard.spawn_finished_t < t then
			blackboard.spawn_finished_t = nil

			return "done"
		end

		return "running"
	else
		return "done"
	end
end
