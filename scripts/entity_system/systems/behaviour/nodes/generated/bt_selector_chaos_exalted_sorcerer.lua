require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_chaos_exalted_sorcerer = class(BTSelector_chaos_exalted_sorcerer, BTNode)
BTSelector_chaos_exalted_sorcerer.name = "BTSelector_chaos_exalted_sorcerer"
BTSelector_chaos_exalted_sorcerer.init = function (self, ...)
	BTSelector_chaos_exalted_sorcerer.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_chaos_exalted_sorcerer.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_chaos_exalted_sorcerer.run = function (self, unit, blackboard, t, dt)
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

	local node_intro_sequence = children[2]
	local t = Managers.time:time("game")
	local condition_result = blackboard.intro_timer and t < blackboard.intro_timer

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_intro_sequence, "aborted")
		Profiler_start("intro_sequence")

		local result, evaluate = node_intro_sequence.run(node_intro_sequence, unit, blackboard, t, dt)

		Profiler_stop("intro_sequence")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_intro_sequence == child_running then
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

	local node_falling = children[4]
	local condition_result = blackboard.is_falling or blackboard.fall_state ~= nil

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_falling, "aborted")
		Profiler_start("falling")

		local result, evaluate = node_falling.run(node_falling, unit, blackboard, t, dt)

		Profiler_stop("falling")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_falling == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_stagger = children[5]
	local condition_result = nil

	if blackboard.stagger then
		condition_result = not blackboard.stagger_prohibited
	end

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_stagger, "aborted")
		Profiler_start("stagger")

		local result, evaluate = node_stagger.run(node_stagger, unit, blackboard, t, dt)

		Profiler_stop("stagger")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_stagger == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_smartobject = children[6]
	local smartobject_is_next = blackboard.next_smart_object_data.next_smart_object_id ~= nil
	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local is_smart_objecting = blackboard.is_smart_objecting
	local moving_state = blackboard.move_state == "moving"
	local condition_result = (smartobject_is_next and is_in_smartobject_range and moving_state) or is_smart_objecting

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_smartobject, "aborted")
		Profiler_start("smartobject")

		local result, evaluate = node_smartobject.run(node_smartobject, unit, blackboard, t, dt)

		Profiler_stop("smartobject")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_smartobject == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_setup_mode = children[7]
	local condition_result = blackboard.mode == "setup" and not blackboard.setup_done

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_setup_mode, "aborted")
		Profiler_start("setup_mode")

		local result, evaluate = node_setup_mode.run(node_setup_mode, unit, blackboard, t, dt)

		Profiler_stop("setup_mode")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_setup_mode == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_defensive_mode = children[8]
	local condition_result = blackboard.mode == "defensive" and not blackboard.is_summoning

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_defensive_mode, "aborted")
		Profiler_start("defensive_mode")

		local result, evaluate = node_defensive_mode.run(node_defensive_mode, unit, blackboard, t, dt)

		Profiler_stop("defensive_mode")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_defensive_mode == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_quick_teleport = children[9]
	local condition_result = blackboard.quick_teleport

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_quick_teleport, "aborted")
		Profiler_start("quick_teleport")

		local result, evaluate = node_quick_teleport.run(node_quick_teleport, unit, blackboard, t, dt)

		Profiler_stop("quick_teleport")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_quick_teleport == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_has_target = children[10]
	local condition_result = unit_alive(blackboard.target_unit)

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_has_target, "aborted")
		Profiler_start("has_target")

		local result, evaluate = node_has_target.run(node_has_target, unit, blackboard, t, dt)

		Profiler_stop("has_target")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_has_target == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[11]

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
BTSelector_chaos_exalted_sorcerer.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
