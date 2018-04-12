require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return 
end

BTSelector_storm_vermin_warlord = class(BTSelector_storm_vermin_warlord, BTNode)
BTSelector_storm_vermin_warlord.name = "BTSelector_storm_vermin_warlord"
BTSelector_storm_vermin_warlord.init = function (self, ...)
	BTSelector_storm_vermin_warlord.super.init(self, ...)

	self._children = {}

	return 
end
BTSelector_storm_vermin_warlord.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_storm_vermin_warlord.run = function (self, unit, blackboard, t, dt)
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

	local node_intro_sequence = children[2]
	local t = Managers.time:time("game")
	local condition_result = blackboard.intro_timer and t < blackboard.intro_timer

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_intro_sequence, "aborted")

		local result, evaluate = node_intro_sequence.run(node_intro_sequence, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_intro_sequence == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_switch_weapons = children[3]
	local condition_result = blackboard.switching_weapons and not blackboard.defensive_mode_duration

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_switch_weapons, "aborted")

		local result, evaluate = node_switch_weapons.run(node_switch_weapons, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_switch_weapons == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_jump_to_position = children[4]
	local condition_result = blackboard.jump_from_pos

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_jump_to_position, "aborted")

		local result, evaluate = node_jump_to_position.run(node_jump_to_position, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_jump_to_position == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_falling = children[5]
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

	local node_stagger = children[7]
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

	local node_in_defensive = children[8]
	local condition_result = blackboard.defensive_mode_duration

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_in_defensive, "aborted")

		local result, evaluate = node_in_defensive.run(node_in_defensive, unit, blackboard, t, dt)

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_defensive == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_has_target = children[9]
	local condition_result = unit_alive(blackboard.target_unit) and not blackboard.defensive_mode_duration

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

	local node_defensive_idle = children[10]

	self.set_running_child(self, unit, blackboard, t, node_defensive_idle, "aborted")

	local result, evaluate = node_defensive_idle.run(node_defensive_idle, unit, blackboard, t, dt)

	if result ~= "running" then
		self.set_running_child(self, unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end

	local node_idle = children[11]

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
BTSelector_storm_vermin_warlord.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
