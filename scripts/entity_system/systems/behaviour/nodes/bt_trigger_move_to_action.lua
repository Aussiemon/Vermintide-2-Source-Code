-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_trigger_move_to_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTriggerMoveToAction = class(BTTriggerMoveToAction, BTNode)

BTTriggerMoveToAction.init = function (self, ...)
	BTTriggerMoveToAction.super.init(self, ...)
end

BTTriggerMoveToAction.name = "BTTriggerMoveToAction"

BTTriggerMoveToAction.enter = function (self, unit, blackboard, t)
	blackboard.trigger_index = blackboard.trigger_index or 0

	blackboard.navigation_extension:set_enabled(false)

	blackboard.skulk_pos = nil
	blackboard.skulk_around_dir = nil
end

BTTriggerMoveToAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)
end

BTTriggerMoveToAction.run = function (self, unit, blackboard, t, dt)
	blackboard.trigger_index = (blackboard.trigger_index + 1) % 8

	local trigger_index = blackboard.trigger_index
	local angle = math.degrees_to_radians(blackboard.trigger_index * 360 / 8)
	local direction = Vector3(math.sin(angle), math.cos(angle), 0)
	local position = POSITION_LOOKUP[unit]
	local target_position = position + direction * 1
	local result = GwNavQueries.raycango(blackboard.nav_world, position, target_position, blackboard.navigation_extension._traverse_logic)

	if not result then
		return "running"
	elseif not blackboard.trigger_wait then
		blackboard.trigger_time = t + 2

		blackboard.navigation_extension:move_to(target_position)

		blackboard.trigger_wait = true
	else
		blackboard.navigation_extension:move_to(position)

		blackboard.trigger_wait = nil

		return "done"
	end
end
