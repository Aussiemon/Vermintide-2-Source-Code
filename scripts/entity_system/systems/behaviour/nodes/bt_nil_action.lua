require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTNilAction = class(BTNilAction, BTNode)
BTNilAction.name = "BTNilAction"
BTNilAction.init = function (self, ...)
	BTNilAction.super.init(self, ...)

	return 
end
BTNilAction.enter = function (self)
	return 
end
BTNilAction.leave = function (self)
	return 
end
BTNilAction.run = function (self, unit, blackboard, t, dt, bt_name)
	return 
end

return 
