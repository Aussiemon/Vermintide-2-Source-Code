require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_critter_rat = class(BTSelector_critter_rat, BTNode)
BTSelector_critter_rat.name = "BTSelector_critter_rat"
BTSelector_critter_rat.init = function (self, ...)
	BTSelector_critter_rat.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_critter_rat.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_critter_rat.run = function (self, unit, blackboard, t, dt)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop
	local child_running = self.current_running_child(self, blackboard)
	local children = self._children
	local node_spawn = children[1]
	local condition_result = blackboard.spawn

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_spawn, "aborted")
		Profiler_start("spawn")

		local result, evaluate = node_spawn.run(node_spawn, unit, blackboard, t, dt)

		Profiler_stop("spawn")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_spawn == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_in_vortex = children[2]
	local condition_result = blackboard.in_vortex

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_in_vortex, "aborted")
		Profiler_start("in_vortex")

		local result, evaluate = node_in_vortex.run(node_in_vortex, unit, blackboard, t, dt)

		Profiler_stop("in_vortex")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_vortex == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_in_gravity_well = children[3]
	local condition_result = blackboard.gravity_well_position

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_in_gravity_well, "aborted")
		Profiler_start("in_gravity_well")

		local result, evaluate = node_in_gravity_well.run(node_in_gravity_well, unit, blackboard, t, dt)

		Profiler_stop("in_gravity_well")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_gravity_well == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_under_door = children[4]
	local condition_result = BTConditions.at_smartobject(blackboard) and BTConditions.at_door_smartobject(blackboard)

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_under_door, "aborted")
		Profiler_start("under_door")

		local result, evaluate = node_under_door.run(node_under_door, unit, blackboard, t, dt)

		Profiler_stop("under_door")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_under_door == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_flee_sequence = children[5]
	local condition_result = unit_alive(blackboard.target_unit) or blackboard.is_fleeing

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_flee_sequence, "aborted")
		Profiler_start("flee_sequence")

		local result, evaluate = node_flee_sequence.run(node_flee_sequence, unit, blackboard, t, dt)

		Profiler_stop("flee_sequence")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_flee_sequence == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[6]

	self.set_running_child(self, unit, blackboard, t, node_idle, "aborted")
	Profiler_start("idle")

	local result, evaluate = node_idle.run(node_idle, unit, blackboard, t, dt)

	Profiler_stop("idle")

	if result ~= "running" then
		self.set_running_child(self, unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end

	return 
end
BTSelector_critter_rat.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
