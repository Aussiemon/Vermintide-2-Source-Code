require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_shield_rat = class(BTSelector_shield_rat, BTNode)
BTSelector_shield_rat.name = "BTSelector_shield_rat"
BTSelector_shield_rat.init = function (self, ...)
	BTSelector_shield_rat.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_shield_rat.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_shield_rat.run = function (self, unit, blackboard, t, dt)
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

	local node_blocked = children[6]
	local condition_result = blackboard.blocked

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_blocked, "aborted")
		Profiler_start("blocked")

		local result, evaluate = node_blocked.run(node_blocked, unit, blackboard, t, dt)

		Profiler_stop("blocked")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_blocked == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_smartobject = children[7]
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

	local node_hesitate = children[8]
	local alerted = unit_alive(blackboard.target_unit) and blackboard.is_alerted and (not blackboard.confirmed_player_sighting or blackboard.hesitating)
	local taunt_hesitate = blackboard.taunt_unit and not blackboard.taunt_hesitate_finished and not blackboard.no_taunt_hesitate
	local condition_result = alerted or taunt_hesitate

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_hesitate, "aborted")
		Profiler_start("hesitate")

		local result, evaluate = node_hesitate.run(node_hesitate, unit, blackboard, t, dt)

		Profiler_stop("hesitate")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_hesitate == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_in_combat = children[9]
	local condition_result = unit_alive(blackboard.target_unit) and blackboard.confirmed_player_sighting

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_in_combat, "aborted")
		Profiler_start("in_combat")

		local result, evaluate = node_in_combat.run(node_in_combat, unit, blackboard, t, dt)

		Profiler_stop("in_combat")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_combat == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_alerted = children[10]
	local condition_result = unit_alive(blackboard.target_unit) and not blackboard.confirmed_player_sighting

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_alerted, "aborted")
		Profiler_start("alerted")

		local result, evaluate = node_alerted.run(node_alerted, unit, blackboard, t, dt)

		Profiler_stop("alerted")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_alerted == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_move_to_goal = children[11]
	local condition_result = blackboard.goal_destination ~= nil

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_move_to_goal, "aborted")
		Profiler_start("move_to_goal")

		local result, evaluate = node_move_to_goal.run(node_move_to_goal, unit, blackboard, t, dt)

		Profiler_stop("move_to_goal")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_move_to_goal == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_interest_point = children[12]
	local condition_result = not blackboard.ignore_interest_points and not blackboard.confirmed_player_sighting

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_interest_point, "aborted")
		Profiler_start("interest_point")

		local result, evaluate = node_interest_point.run(node_interest_point, unit, blackboard, t, dt)

		Profiler_stop("interest_point")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_interest_point == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[13]
	local condition_result = not unit_alive(blackboard.target_unit)

	if condition_result then
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
	elseif node_idle == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_fallback_idle = children[14]

	self.set_running_child(self, unit, blackboard, t, node_fallback_idle, "aborted")
	Profiler_start("fallback_idle")

	local result, evaluate = node_fallback_idle.run(node_fallback_idle, unit, blackboard, t, dt)

	Profiler_stop("fallback_idle")

	if result ~= "running" then
		self.set_running_child(self, unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end

	return 
end
BTSelector_shield_rat.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
