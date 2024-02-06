﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_grey_seer.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_grey_seer = class(BTSelector_grey_seer, BTNode)
BTSelector_grey_seer.name = "BTSelector_grey_seer"

BTSelector_grey_seer.init = function (self, ...)
	BTSelector_grey_seer.super.init(self, ...)

	self._children = {}
end

BTSelector_grey_seer.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_grey_seer.run = function (self, unit, blackboard, t, dt)
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
		local node_intro_sequence = children[2]
		local t = Managers.time:time("game")
		local condition_result = blackboard.intro_timer and t < blackboard.intro_timer

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_intro_sequence, "aborted")

			local result, evaluate = node_intro_sequence:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_intro_sequence == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_mount_unit = children[3]
		local condition_result = blackboard.should_mount_unit ~= nil

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_mount_unit, "aborted")

			local result, evaluate = node_mount_unit:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_mount_unit == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_waiting_for_pickup_idle = children[4]
		local condition_result = blackboard.waiting_for_pickup

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_waiting_for_pickup_idle, "aborted")

			local result, evaluate = node_waiting_for_pickup_idle:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_waiting_for_pickup_idle == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_mounted_combat = children[5]
		local mount_unit = blackboard.mounted_data.mount_unit
		local condition_result = not blackboard.knocked_off_mount and HEALTH_ALIVE[mount_unit]

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_mounted_combat, "aborted")

			local result, evaluate = node_mounted_combat:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_mounted_combat == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_wounded_idle = children[6]
		local condition_result = blackboard.current_phase == 6

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_wounded_idle, "aborted")

			local result, evaluate = node_wounded_idle:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_wounded_idle == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_grey_seer_death_sequence = children[7]
		local condition_result = blackboard.current_phase == 5

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_grey_seer_death_sequence, "aborted")

			local result, evaluate = node_grey_seer_death_sequence:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_grey_seer_death_sequence == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_grey_seer_call_stormfiend = children[8]
		local condition_result = blackboard.call_stormfiend

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_grey_seer_call_stormfiend, "aborted")

			local result, evaluate = node_grey_seer_call_stormfiend:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_grey_seer_call_stormfiend == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_stagger = children[9]
		local condition_result

		if blackboard.stagger then
			if blackboard.stagger_prohibited then
				blackboard.stagger = false
			else
				condition_result = not blackboard.about_to_mount
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
		local node_spell_casting = children[10]
		local condition_result = blackboard.ready_to_summon and not blackboard.about_to_mount and HEALTH_ALIVE[blackboard.target_unit]

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_spell_casting, "aborted")

			local result, evaluate = node_spell_casting:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_spell_casting == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_ground_combat = children[11]
		local condition_result = (blackboard.knocked_off_mount or not HEALTH_ALIVE[blackboard.mounted_data.mount_unit]) and HEALTH_ALIVE[blackboard.target_unit]

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_ground_combat, "aborted")

			local result, evaluate = node_ground_combat:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_ground_combat == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	local node_defensive_idle = children[12]

	self:set_running_child(unit, blackboard, t, node_defensive_idle, "aborted")

	local result, evaluate = node_defensive_idle:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end

	local node_idle = children[13]

	self:set_running_child(unit, blackboard, t, node_idle, "aborted")

	local result, evaluate = node_idle:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_grey_seer.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
