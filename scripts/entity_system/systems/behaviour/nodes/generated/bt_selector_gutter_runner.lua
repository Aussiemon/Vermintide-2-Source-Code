require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_gutter_runner = class(BTSelector_gutter_runner, BTNode)
BTSelector_gutter_runner.name = "BTSelector_gutter_runner"

BTSelector_gutter_runner.init = function (self, ...)
	BTSelector_gutter_runner.super.init(self, ...)

	self._children = {}
end

BTSelector_gutter_runner.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_gutter_runner.run = function (self, unit, blackboard, t, dt)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children
	local node_falling = children[1]
	local condition_result = not blackboard.high_ground_opportunity and not blackboard.pouncing_target and (blackboard.is_falling or blackboard.fall_state ~= nil)

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_falling, "aborted")

		local result, evaluate = node_falling:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_falling == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_stagger = children[2]
	local condition_result = nil

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

	local node_spawn = children[3]
	local condition_result = blackboard.spawn

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_spawn, "aborted")

		local result, evaluate = node_spawn:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_spawn == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_in_vortex = children[4]
	local condition_result = blackboard.in_vortex

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_in_vortex, "aborted")

		local result, evaluate = node_in_vortex:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_vortex == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_smartobject = children[5]
	local condition_result = nil

	if blackboard.jump_data then
		condition_result = false
	end

	if condition_result == nil then
		condition_result = BTConditions.at_smartobject(blackboard)
	end

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_smartobject, "aborted")

		local result, evaluate = node_smartobject:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_smartobject == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_ninja_vanish = children[6]
	local condition_result = blackboard.ninja_vanish

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_ninja_vanish, "aborted")

		local result, evaluate = node_ninja_vanish:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_ninja_vanish == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_quick_jump = children[7]
	local condition_result = blackboard.high_ground_opportunity

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_quick_jump, "aborted")

		local result, evaluate = node_quick_jump:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_quick_jump == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_approach_target = children[8]
	local t = Managers.time:time("game")
	local pounce_timer_is_finished = blackboard.initial_pounce_timer < t
	local condition_result = (blackboard.target_unit or blackboard.comitted_to_target) and pounce_timer_is_finished

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_approach_target, "aborted")

		local result, evaluate = node_approach_target:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_approach_target == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_skulking = children[9]
	local condition_result = unit_alive(blackboard.target_unit)

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_skulking, "aborted")

		local result, evaluate = node_skulking:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_skulking == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_abide = children[10]
	local condition_result = blackboard.secondary_target

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_abide, "aborted")

		local result, evaluate = node_abide:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_abide == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[11]

	self:set_running_child(unit, blackboard, t, node_idle, "aborted")

	local result, evaluate = node_idle:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_gutter_runner.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
