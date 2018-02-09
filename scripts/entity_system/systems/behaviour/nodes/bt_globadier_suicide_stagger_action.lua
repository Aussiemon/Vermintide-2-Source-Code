require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTGlobadierSuicideStaggerAction = class(BTGlobadierSuicideStaggerAction, BTNode)
BTGlobadierSuicideStaggerAction.name = "BTGlobadierSuicideStaggerAction"
BTGlobadierSuicideStaggerAction.init = function (self, ...)
	BTGlobadierSuicideStaggerAction.super.init(self, ...)

	return 
end
BTGlobadierSuicideStaggerAction.enter = function (self, unit, blackboard, t)
	local damage_type = "kinetic"
	local damage_direction = Vector3(0, 0, -1)

	AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)

	return 
end
BTGlobadierSuicideStaggerAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return 
end
BTGlobadierSuicideStaggerAction.run = function (self, unit, blackboard, t, dt)
	return "done"
end

return 
