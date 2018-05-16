require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTentacleSpawnAction = class(BTTentacleSpawnAction, BTNode)

BTTentacleSpawnAction.init = function (self, ...)
	BTTentacleSpawnAction.super.init(self, ...)
end

BTTentacleSpawnAction.name = "BTTentacleSpawnAction"

BTTentacleSpawnAction.enter = function (self, unit, blackboard, t)
	return
end

BTTentacleSpawnAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.spawn = false
end

BTTentacleSpawnAction.run = function (self, unit, blackboard, t, dt)
	return "done"
end

return
