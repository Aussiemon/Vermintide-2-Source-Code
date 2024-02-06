﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_dummy_exalted_sorcerer_drachenfels.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_dummy_exalted_sorcerer_drachenfels = class(BTSelector_dummy_exalted_sorcerer_drachenfels, BTNode)
BTSelector_dummy_exalted_sorcerer_drachenfels.name = "BTSelector_dummy_exalted_sorcerer_drachenfels"

BTSelector_dummy_exalted_sorcerer_drachenfels.init = function (self, ...)
	BTSelector_dummy_exalted_sorcerer_drachenfels.super.init(self, ...)

	self._children = {}
end

BTSelector_dummy_exalted_sorcerer_drachenfels.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_dummy_exalted_sorcerer_drachenfels.run = function (self, unit, blackboard, t, dt)
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
		local node_cast_seeking_bomb = children[2]
		local condition_result = not blackboard.anim_cb_escape_finished

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_cast_seeking_bomb, "aborted")

			local result, evaluate = node_cast_seeking_bomb:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_cast_seeking_bomb == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	local node_idle = children[3]

	self:set_running_child(unit, blackboard, t, node_idle, "aborted")

	local result, evaluate = node_idle:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_dummy_exalted_sorcerer_drachenfels.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
