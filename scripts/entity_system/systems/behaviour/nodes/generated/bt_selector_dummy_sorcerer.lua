require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_dummy_sorcerer = class(BTSelector_dummy_sorcerer, BTNode)
BTSelector_dummy_sorcerer.name = "BTSelector_dummy_sorcerer"
BTSelector_dummy_sorcerer.init = function (self, ...)
	BTSelector_dummy_sorcerer.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_dummy_sorcerer.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_dummy_sorcerer.run = function (self, unit, blackboard, t, dt)
	local child_running = self.current_running_child(self, blackboard)
	local children = self._children
	local node_spawn = children[1]
	local condition_result = blackboard.spawn

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_spawn, "aborted")

		local result, evaluate = node_spawn.run(node_spawn, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_spawn == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[2]

	self.set_running_child(self, unit, blackboard, t, node_idle, "aborted")

	local result, evaluate = node_idle.run(node_idle, unit, blackboard, t, dt)

	if result ~= "running" then
		self.set_running_child(self, unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end

	return 
end
BTSelector_dummy_sorcerer.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
