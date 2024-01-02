require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_shadow_skull = class(BTSelector_shadow_skull, BTNode)
BTSelector_shadow_skull.name = "BTSelector_shadow_skull"

BTSelector_shadow_skull.init = function (self, ...)
	BTSelector_shadow_skull.super.init(self, ...)

	self._children = {}
end

BTSelector_shadow_skull.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_shadow_skull.run = function (self, unit, blackboard, t, dt)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children
	local node_homing = children[1]
	local condition_result = unit_alive(blackboard.target_unit)

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_homing, "aborted")

		local result, evaluate = node_homing:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_homing == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end
end

BTSelector_shadow_skull.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
