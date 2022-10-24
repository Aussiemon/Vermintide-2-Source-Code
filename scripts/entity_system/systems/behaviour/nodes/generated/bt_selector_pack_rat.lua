require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_pack_rat = class(BTSelector_pack_rat, BTNode)
BTSelector_pack_rat.name = "BTSelector_pack_rat"

BTSelector_pack_rat.init = function (self, ...)
	BTSelector_pack_rat.super.init(self, ...)

	self._children = {}
end

BTSelector_pack_rat.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_pack_rat.run = function (self, unit, blackboard, t, dt)
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

	local node_falling = children[3]
	local condition_result = blackboard.is_falling or blackboard.fall_state ~= nil

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_falling, "aborted")
		Profiler_start("falling")

		local result, evaluate = node_falling:run(unit, blackboard, t, dt)

		Profiler_stop("falling")

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
		condition_result = not blackboard.stagger_prohibited
	end

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_stagger, "aborted")
		Profiler_start("stagger")

		local result, evaluate = node_stagger:run(unit, blackboard, t, dt)

		Profiler_stop("stagger")

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
		Profiler_start("blocked")

		local result, evaluate = node_blocked:run(unit, blackboard, t, dt)

		Profiler_stop("blocked")

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
		condition_result = (is_in_smartobject_range and moving_state) or is_smart_objecting
	end

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_smartobject, "aborted")
		Profiler_start("smartobject")

		local result, evaluate = node_smartobject:run(unit, blackboard, t, dt)

		Profiler_stop("smartobject")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_smartobject == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_hesitate = children[7]
	local alerted = unit_alive(blackboard.target_unit) and blackboard.is_alerted and (not blackboard.confirmed_player_sighting or blackboard.hesitating)
	local is_taunted = unit_alive(blackboard.taunt_unit)
	local taunt_hesitate = is_taunted and not blackboard.taunt_hesitate_finished and not blackboard.no_taunt_hesitate
	local condition_result = alerted or taunt_hesitate

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_hesitate, "aborted")
		Profiler_start("hesitate")

		local result, evaluate = node_hesitate:run(unit, blackboard, t, dt)

		Profiler_stop("hesitate")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_hesitate == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_in_combat = children[8]
	local condition_result = unit_alive(blackboard.target_unit) and blackboard.confirmed_player_sighting

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_in_combat, "aborted")
		Profiler_start("in_combat")

		local result, evaluate = node_in_combat:run(unit, blackboard, t, dt)

		Profiler_stop("in_combat")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_in_combat == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_alerted = children[9]
	local condition_result = unit_alive(blackboard.target_unit) and not blackboard.confirmed_player_sighting

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_alerted, "aborted")
		Profiler_start("alerted")

		local result, evaluate = node_alerted:run(unit, blackboard, t, dt)

		Profiler_stop("alerted")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_alerted == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_move_to_goal = children[10]
	local condition_result = blackboard.goal_destination ~= nil

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_move_to_goal, "aborted")
		Profiler_start("move_to_goal")

		local result, evaluate = node_move_to_goal:run(unit, blackboard, t, dt)

		Profiler_stop("move_to_goal")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_move_to_goal == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_interest_point = children[11]
	local condition_result = not blackboard.ignore_interest_points and not blackboard.confirmed_player_sighting

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_interest_point, "aborted")
		Profiler_start("interest_point")

		local result, evaluate = node_interest_point:run(unit, blackboard, t, dt)

		Profiler_stop("interest_point")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_interest_point == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[12]
	local condition_result = not unit_alive(blackboard.target_unit)

	if condition_result then
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
	elseif node_idle == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_fallback_idle = children[13]

	self:set_running_child(unit, blackboard, t, node_fallback_idle, "aborted")
	Profiler_start("fallback_idle")

	local result, evaluate = node_fallback_idle:run(unit, blackboard, t, dt)

	Profiler_stop("fallback_idle")

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_pack_rat.add_child = function (self, node)
	self._children[#self._children + 1] = node
end

return
