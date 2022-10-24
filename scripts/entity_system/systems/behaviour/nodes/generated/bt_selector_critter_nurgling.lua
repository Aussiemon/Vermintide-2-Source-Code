require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_critter_nurgling = class(BTSelector_critter_nurgling, BTNode)
BTSelector_critter_nurgling.name = "BTSelector_critter_nurgling"

BTSelector_critter_nurgling.init = function (self, ...)
	BTSelector_critter_nurgling.super.init(self, ...)

	self._children = {}
end

BTSelector_critter_nurgling.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_critter_nurgling.run = function (self, unit, blackboard, t, dt)
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

	local node_in_vortex = children[2]
	local condition_result = blackboard.in_vortex

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_in_vortex, "aborted")
		Profiler_start("in_vortex")

		local result, evaluate = node_in_vortex:run(unit, blackboard, t, dt)

		Profiler_stop("in_vortex")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_vortex == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_flee_sequence = children[3]
	local condition_result = unit_alive(blackboard.target_unit) or blackboard.is_fleeing

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_flee_sequence, "aborted")
		Profiler_start("flee_sequence")

		local result, evaluate = node_flee_sequence:run(unit, blackboard, t, dt)

		Profiler_stop("flee_sequence")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_flee_sequence == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_roam_sequence = children[4]
	local condition_result = blackboard.nurgling_spawned_by_altar

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_roam_sequence, "aborted")
		Profiler_start("roam_sequence")

		local result, evaluate = node_roam_sequence:run(unit, blackboard, t, dt)

		Profiler_stop("roam_sequence")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_roam_sequence == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[5]

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

BTSelector_critter_nurgling.add_child = function (self, node)
	self._children[#self._children + 1] = node
end

return
