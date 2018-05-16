require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSelector = class(BTSelector, BTNode)
BTSelector.name = "BTSelector"

BTSelector.init = function (self, ...)
	BTSelector.super.init(self, ...)

	self._children = {}
end

BTSelector.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector.run = function (self, unit, blackboard, t, dt)
	local child_running = self:current_running_child(blackboard)

	for index, node in ipairs(self._children) do
		if node:condition(blackboard) then
			self:set_running_child(unit, blackboard, t, node, "aborted")

			local result, evaluate = node:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	if script_data.debug_behaviour_trees and script_data.debug_unit == unit then
		print("BTSelector fail: ", self:id())
	end

	assert(self:current_running_child(blackboard) == nil)

	return "failed"
end

BTSelector.add_child = function (self, node)
	self._children[#self._children + 1] = node
end

return
