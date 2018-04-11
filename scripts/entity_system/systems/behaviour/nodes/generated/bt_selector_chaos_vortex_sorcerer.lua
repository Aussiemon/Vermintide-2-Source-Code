require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_chaos_vortex_sorcerer = class(BTSelector_chaos_vortex_sorcerer, BTNode)
BTSelector_chaos_vortex_sorcerer.name = "BTSelector_chaos_vortex_sorcerer"
BTSelector_chaos_vortex_sorcerer.init = function (self, ...)
	BTSelector_chaos_vortex_sorcerer.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_chaos_vortex_sorcerer.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_chaos_vortex_sorcerer.run = function (self, unit, blackboard, t, dt)
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

	local node_in_vortex = children[2]
	local condition_result = blackboard.in_vortex

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_in_vortex, "aborted")

		local result, evaluate = node_in_vortex.run(node_in_vortex, unit, blackboard, t, dt)

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

		local result, evaluate = node_in_gravity_well.run(node_in_gravity_well, unit, blackboard, t, dt)

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

		local result, evaluate = node_falling.run(node_falling, unit, blackboard, t, dt)

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

		local result, evaluate = node_stagger.run(node_stagger, unit, blackboard, t, dt)

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

		local result, evaluate = node_smartobject.run(node_smartobject, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_smartobject == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_quick_teleport = children[7]
	local condition_result = blackboard.quick_teleport

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_quick_teleport, "aborted")

		local result, evaluate = node_quick_teleport.run(node_quick_teleport, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_quick_teleport == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_spawn_vortex = children[8]
	local condition_result = blackboard.ready_to_summon and (blackboard.summoning or Unit.alive(blackboard.target_unit))

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_spawn_vortex, "aborted")

		local result, evaluate = node_spawn_vortex.run(node_spawn_vortex, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_spawn_vortex == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_skulk_approach = children[9]
	local condition_result = unit_alive(blackboard.target_unit)

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_skulk_approach, "aborted")

		local result, evaluate = node_skulk_approach.run(node_skulk_approach, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_skulk_approach == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[10]

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
BTSelector_chaos_vortex_sorcerer.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
