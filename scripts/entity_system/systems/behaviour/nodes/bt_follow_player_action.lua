require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTFollowPlayerAction = class(BTFollowPlayerAction, BTNode)

BTFollowPlayerAction.init = function (self, ...)
	BTFollowPlayerAction.super.init(self, ...)
end

BTFollowPlayerAction.name = "BTFollowPlayerAction"

BTFollowPlayerAction.enter = function (self, unit, blackboard, t)
	local locomotion = blackboard.locomotion_extension

	locomotion:enter_state_combat(blackboard, t)
end

BTFollowPlayerAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return
end

BTFollowPlayerAction.run = function (self, unit, blackboard, t)
	if not Unit.alive(blackboard.target_unit) then
		return
	end

	return self
end

BTFollowPlayerAction.exit_running = function (self, unit, blackboard, t)
	local locomotion = blackboard.locomotion_extension

	locomotion:enter_state_onground(blackboard, t)
end
