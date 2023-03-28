require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTEtherealSkullTakeOffAction = class(BTEtherealSkullTakeOffAction, BTNode)

BTEtherealSkullTakeOffAction.init = function (self, ...)
	BTEtherealSkullTakeOffAction.super.init(self, ...)
end

BTEtherealSkullTakeOffAction.name = "BTEtherealSkullTakeOffAction"

BTEtherealSkullTakeOffAction.enter = function (self)
	self._duration = 2
end

BTEtherealSkullTakeOffAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return
end

BTEtherealSkullTakeOffAction.run = function (self, unit, blackboard, t, dt, bt_name)
	if not blackboard.take_off_duration then
		blackboard.take_off_duration = t + 2
	end

	if t < blackboard.take_off_duration then
		return "done"
	end

	return "running"
end
