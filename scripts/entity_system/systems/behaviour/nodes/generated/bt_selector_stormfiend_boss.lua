require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_stormfiend_boss = class(BTSelector_stormfiend_boss, BTNode)
BTSelector_stormfiend_boss.name = "BTSelector_stormfiend_boss"
BTSelector_stormfiend_boss.init = function (self, ...)
	BTSelector_stormfiend_boss.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_stormfiend_boss.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_stormfiend_boss.run = function (self, unit, blackboard, t, dt)
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

	local node_smartobject = children[2]
	local smartobject_is_next = blackboard.next_smart_object_data.next_smart_object_id ~= nil
	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local is_smart_objecting = blackboard.is_smart_objecting
	local is_in_intro = blackboard.jump_down_intro
	local condition_result = ((smartobject_is_next and is_in_smartobject_range) or is_smart_objecting) and is_in_intro

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

	local node_mount_unit = children[3]
	local condition_result = blackboard.should_mount_unit ~= nil

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_mount_unit, "aborted")

		local result, evaluate = node_mount_unit.run(node_mount_unit, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_mount_unit == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_move_to_goal = children[4]
	local condition_result = blackboard.goal_destination ~= nil

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_move_to_goal, "aborted")

		local result, evaluate = node_move_to_goal.run(node_move_to_goal, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_move_to_goal == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_dual_shoot_intro = children[5]
	local condition_result = blackboard.intro_rage

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_dual_shoot_intro, "aborted")

		local result, evaluate = node_dual_shoot_intro.run(node_dual_shoot_intro, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_dual_shoot_intro == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_stagger = children[6]
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

	local node_has_target = children[7]
	local condition_result = unit_alive(blackboard.target_unit)

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_has_target, "aborted")

		local result, evaluate = node_has_target.run(node_has_target, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_has_target == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[8]

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
BTSelector_stormfiend_boss.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
