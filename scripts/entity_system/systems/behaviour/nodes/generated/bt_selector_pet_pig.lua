require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_pet_pig = class(BTSelector_pet_pig, BTNode)
BTSelector_pet_pig.name = "BTSelector_pet_pig"

BTSelector_pet_pig.init = function (self, ...)
	BTSelector_pet_pig.super.init(self, ...)

	self._children = {}
end

BTSelector_pet_pig.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_pet_pig.run = function (self, unit, blackboard, t, dt)
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

	local node_avoid_combat = children[2]
	local condition_result = blackboard.player_controller and blackboard.target_is_in_combat

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_avoid_combat, "aborted")
		Profiler_start("avoid_combat")

		local result, evaluate = node_avoid_combat:run(unit, blackboard, t, dt)

		Profiler_stop("avoid_combat")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_avoid_combat == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_is_with_player = children[3]
	local condition_result = blackboard.player_controller and unit_alive(blackboard.player_controller) and not blackboard.target_is_in_combat

	if condition_result then
		self:set_running_child(unit, blackboard, t, node_is_with_player, "aborted")
		Profiler_start("is_with_player")

		local result, evaluate = node_is_with_player:run(unit, blackboard, t, dt)

		Profiler_stop("is_with_player")

		if result ~= "running" then
			self:set_running_child(unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_is_with_player == child_running then
		self:set_running_child(unit, blackboard, t, nil, "failed")
	end

	local node_idle = children[4]

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
end

BTSelector_pet_pig.add_child = function (self, node)
	self._children[#self._children + 1] = node
end

return
