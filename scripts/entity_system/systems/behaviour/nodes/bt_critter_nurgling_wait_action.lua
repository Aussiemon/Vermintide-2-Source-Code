-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_critter_nurgling_wait_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCritterNurglingWaitAction = class(BTCritterNurglingWaitAction, BTNode)

BTCritterNurglingWaitAction.init = function (self, ...)
	BTCritterNurglingWaitAction.super.init(self, ...)
end

BTCritterNurglingWaitAction.name = "BTCritterNurglingWaitAction"

BTCritterNurglingWaitAction.enter = function (self, unit, blackboard, t)
	local wait_data = self._tree_node.action_data

	blackboard.exit_wait_time = t + Math.random_range(wait_data.wait_time_min, wait_data.wait_time_max)

	if blackboard.move_state ~= "idle" then
		self:start_idle_animation(unit, blackboard)

		blackboard.move_state = "idle"
	end
end

BTCritterNurglingWaitAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.exit_wait_time = nil
end

BTCritterNurglingWaitAction.run = function (self, unit, blackboard, t)
	if t > blackboard.exit_wait_time then
		return "done"
	end

	return "running"
end

BTCritterNurglingWaitAction.start_idle_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end
