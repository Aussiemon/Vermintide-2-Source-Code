-- chunkname: @scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_training_dummy.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_training_dummy = class(BTSelector_training_dummy, BTNode)
BTSelector_training_dummy.name = "BTSelector_training_dummy"

BTSelector_training_dummy.init = function (self, ...)
	BTSelector_training_dummy.super.init(self, ...)

	self._children = {}
end

BTSelector_training_dummy.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_training_dummy.run = function (self, unit, blackboard, t, dt)
	local Profiler_start, Profiler_stop = Profiler.start, Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children

	do
		local node_stagger = children[1]
		local condition_result

		if blackboard.stagger then
			if blackboard.stagger_prohibited then
				blackboard.stagger = false
			else
				condition_result = true
			end
		end

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_stagger, "aborted")

			local result, evaluate = node_stagger:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_stagger == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	local node_do_nothing = children[2]

	self:set_running_child(unit, blackboard, t, node_do_nothing, "aborted")

	local result, evaluate = node_do_nothing:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_training_dummy.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
