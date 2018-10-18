require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_chaos_tentacle = class(BTSelector_chaos_tentacle, BTNode)
BTSelector_chaos_tentacle.name = "BTSelector_chaos_tentacle"

BTSelector_chaos_tentacle.init = function (self, ...)
	BTSelector_chaos_tentacle.super.init(self, ...)

	self._children = {}
end

BTSelector_chaos_tentacle.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_chaos_tentacle.run = function (self, unit, blackboard, t, dt)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children
	local node_spawn = children[1]
	local condition_result = blackboard.spawn

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_spawn, "aborted")
		Profiler_start("spawn")

		local result, evaluate = node_spawn:run(unit, blackboard, t, dt)

		Profiler_stop("spawn")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_spawn == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_attack = children[2]
	local condition_result = unit_alive(blackboard.target_unit) and not blackboard.tentacle_satisfied

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_attack, "aborted")
		Profiler_start("attack")

		local result, evaluate = node_attack:run(unit, blackboard, t, dt)

		Profiler_stop("attack")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_attack == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[3]

	self:set_running_child(unit, blackboard, t, node_idle, "aborted")
	Profiler_start("idle")

	local result, evaluate = node_idle:run(unit, blackboard, t, dt)

	Profiler_stop("idle")

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_chaos_tentacle.add_child = function (self, node)
	self._children[#self._children + 1] = node
end

return
