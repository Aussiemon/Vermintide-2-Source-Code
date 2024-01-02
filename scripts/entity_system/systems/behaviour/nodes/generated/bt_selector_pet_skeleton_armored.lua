require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_pet_skeleton_armored = class(BTSelector_pet_skeleton_armored, BTNode)
BTSelector_pet_skeleton_armored.name = "BTSelector_pet_skeleton_armored"

BTSelector_pet_skeleton_armored.init = function (self, ...)
	BTSelector_pet_skeleton_armored.super.init(self, ...)

	self._children = {}
end

BTSelector_pet_skeleton_armored.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_pet_skeleton_armored.run = function (self, unit, blackboard, t, dt)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children
	local node_spawn = children[1]
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

	local node_in_vortex = children[2]
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

	local node_falling = children[3]
	local condition_result = blackboard.is_falling or blackboard.fall_state ~= nil

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

	local node_stagger = children[4]
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

	local node_blocked = children[5]
	local condition_result = blackboard.blocked

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_blocked, "aborted")

		local result, evaluate = node_blocked:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_blocked == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_smartobject = children[6]
	local condition_result = nil
	local next_smart_object_data = blackboard.next_smart_object_data
	local smartobject_is_next = next_smart_object_data.next_smart_object_id ~= nil

	if not smartobject_is_next then
		condition_result = false
	end

	local is_smart_objecting = blackboard.is_smart_objecting
	local nav_graph_system = Managers.state.entity:system("nav_graph_system")
	local smart_object_unit = next_smart_object_data.smart_object_data and next_smart_object_data.smart_object_data.unit
	local has_nav_graph_extension, nav_graph_enabled = nav_graph_system:has_nav_graph(smart_object_unit)

	if has_nav_graph_extension and not nav_graph_enabled and not is_smart_objecting and condition_result == nil then
		condition_result = false
	end

	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local moving_state = blackboard.move_state == "moving"

	if condition_result == nil then
		condition_result = is_in_smartobject_range and moving_state or is_smart_objecting
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

	local node_in_combat = children[7]
	local condition_result = unit_alive(blackboard.target_unit) and blackboard.dist_to_commander and blackboard.target_dist + blackboard.dist_to_commander < blackboard.max_combat_range

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_in_combat, "aborted")

		local result, evaluate = node_in_combat:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_combat == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_alerted = children[8]
	local condition_result = unit_alive(blackboard.target_unit) and not blackboard.confirmed_player_sighting

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_alerted, "aborted")

		local result, evaluate = node_alerted:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_alerted == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_move_to_goal = children[9]
	local condition_result = blackboard.goal_destination ~= nil

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_move_to_goal, "aborted")

		local result, evaluate = node_move_to_goal:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_move_to_goal == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[10]
	local condition_result = not unit_alive(blackboard.target_unit)

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_idle, "aborted")

		local result, evaluate = node_idle:run(unit, blackboard, t, dt)

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_idle == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_fallback_idle = children[11]

	self:set_running_child(unit, blackboard, t, node_fallback_idle, "aborted")

	local result, evaluate = node_fallback_idle:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_pet_skeleton_armored.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
