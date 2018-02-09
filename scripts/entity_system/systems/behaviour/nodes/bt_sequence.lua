require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSequence = class(BTSequence, BTNode)
BTSequence.init = function (self, ...)
	BTSequence.super.init(self, ...)

	self._children = {}

	return 
end
BTSequence.name = "BTSequence"
BTSequence.leave = function (self, unit, blackboard, t)
	self.set_running_child(self, unit, blackboard, t, nil, "aborted")

	blackboard.node_data[self._identifier] = nil

	return 
end
BTSequence.run = function (self, unit, blackboard, t, dt)
	local node_data = blackboard.node_data[self._identifier]
	local child_to_run_index = node_data or 1
	local num_children = #self._children

	for i = child_to_run_index, num_children, 1 do
		local child = self._children[i]

		if not child.condition(child, blackboard) then
			self.set_running_child(self, unit, blackboard, t, nil, "failed")

			return "failed"
		end

		self.set_running_child(self, unit, blackboard, t, child, "aborted")

		local result = child.run(child, unit, blackboard, t, dt)

		if result == "running" then
			blackboard.node_data[self._identifier] = i

			return result
		else
			self.set_running_child(self, unit, blackboard, t, nil, result)

			if result == "failed" then
				return "failed"
			end
		end
	end

	assert(self.current_running_child(self, blackboard) == nil)

	return "done"
end
BTSequence.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
