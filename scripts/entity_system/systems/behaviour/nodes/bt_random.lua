require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTRandom = class(BTRandom, BTNode)
BTRandom.name = "BTRandom"

BTRandom.init = function (self, ...)
	BTRandom.super.init(self, ...)

	self._children = {}
end

BTRandom.ready = function (self, lua_node)
	local probabilities = {}

	for i = 1, #self._children do
		local child = self._children[i]
		probabilities[i] = child._tree_node.weight
	end

	self.prob, self.alias = LoadedDice.create(probabilities, false)
end

BTRandom.enter = function (self, unit, blackboard, t)
	local child_index = LoadedDice.roll(self.prob, self.alias)
	blackboard.node_data[self._identifier] = child_index
end

BTRandom.leave = function (self, unit, blackboard, t, reason, destroy)
	self:set_running_child(unit, blackboard, t, nil)

	blackboard.node_data[self._identifier] = nil
end

BTRandom.run = function (self, unit, blackboard, t, dt)
	local running_child = self:current_running_child(blackboard)

	if running_child then
		if not running_child:condition(blackboard) then
			return "failed"
		end

		local result = running_child:run(unit, blackboard, t, dt)

		return result
	end

	local node_data = blackboard.node_data[self._identifier]
	local child_to_run_index = node_data
	local num_children = #self._children

	for i = 1, num_children do
		local actual_index = (i + child_to_run_index - 2) % num_children + 1
		local child = self._children[actual_index]

		if child:condition(blackboard) then
			self:set_running_child(unit, blackboard, t, child)

			local result = child:run(unit, blackboard, t, dt)

			return result
		end
	end

	return "failed"
end

BTRandom.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
