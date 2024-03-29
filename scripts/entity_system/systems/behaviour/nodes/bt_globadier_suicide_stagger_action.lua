﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_globadier_suicide_stagger_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTGlobadierSuicideStaggerAction = class(BTGlobadierSuicideStaggerAction, BTNode)
BTGlobadierSuicideStaggerAction.name = "BTGlobadierSuicideStaggerAction"

BTGlobadierSuicideStaggerAction.init = function (self, ...)
	BTGlobadierSuicideStaggerAction.super.init(self, ...)
end

BTGlobadierSuicideStaggerAction.enter = function (self, unit, blackboard, t)
	local damage_type = "kinetic"
	local damage_direction = Vector3(0, 0, -1)

	AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)
end

BTGlobadierSuicideStaggerAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return
end

BTGlobadierSuicideStaggerAction.run = function (self, unit, blackboard, t, dt)
	return "done"
end
