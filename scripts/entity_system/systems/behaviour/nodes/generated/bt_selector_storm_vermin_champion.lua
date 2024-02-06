﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin_champion.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_storm_vermin_champion = class(BTSelector_storm_vermin_champion, BTNode)
BTSelector_storm_vermin_champion.name = "BTSelector_storm_vermin_champion"

BTSelector_storm_vermin_champion.init = function (self, ...)
	BTSelector_storm_vermin_champion.super.init(self, ...)

	self._children = {}
end

BTSelector_storm_vermin_champion.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_storm_vermin_champion.run = function (self, unit, blackboard, t, dt)
	local Profiler_start, Profiler_stop = Profiler.start, Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children

	do
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
	end

	do
		local node_falling = children[2]
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
	end

	do
		local node_smartobject = children[3]
		local condition_result
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
	end

	do
		local node_stagger = children[4]
		local condition_result

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
	end

	do
		local node_defensive_idle = children[5]
		local t = Managers.time:time("game")
		local time_since_surrounding_players = t - blackboard.surrounding_players_last
		local condition_result = blackboard.defensive_mode_duration and time_since_surrounding_players >= 3

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_defensive_idle, "aborted")

			local result, evaluate = node_defensive_idle:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_defensive_idle == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_has_target = children[6]
		local condition_result = unit_alive(blackboard.target_unit)

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_has_target, "aborted")

			local result, evaluate = node_has_target:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_has_target == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	local node_idle = children[7]

	self:set_running_child(unit, blackboard, t, node_idle, "aborted")

	local result, evaluate = node_idle:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_storm_vermin_champion.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
