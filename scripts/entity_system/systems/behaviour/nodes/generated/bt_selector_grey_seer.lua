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

	return 
end
BTSelector_grey_seer.leave = function (self, unit, blackboard, t, reason)
	self.set_running_child(self, unit, blackboard, t, nil, reason)

	return 
end
BTSelector_grey_seer.run = function (self, unit, blackboard, t, dt)
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

	local node_intro_sequence = children[2]
	local t = Managers.time:time("game")
	local condition_result = blackboard.intro_timer and t < blackboard.intro_timer

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_intro_sequence, "aborted")
		Profiler_start("intro_sequence")

		local result, evaluate = node_intro_sequence.run(node_intro_sequence, unit, blackboard, t, dt)

		Profiler_stop("intro_sequence")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_intro_sequence == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_mount_unit = children[3]
	local condition_result = blackboard.should_mount_unit ~= nil

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_mount_unit, "aborted")
		Profiler_start("mount_unit")

		local result, evaluate = node_mount_unit.run(node_mount_unit, unit, blackboard, t, dt)

		Profiler_stop("mount_unit")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_mount_unit == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_mounted_combat = children[4]
	local condition_result = unit_alive(blackboard.target_unit) and not blackboard.knocked_off_mount

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_mounted_combat, "aborted")
		Profiler_start("mounted_combat")

		local result, evaluate = node_mounted_combat.run(node_mounted_combat, unit, blackboard, t, dt)

		Profiler_stop("mounted_combat")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_mounted_combat == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_stagger = children[5]
	local condition_result = nil

	if blackboard.stagger then
		if blackboard.stagger_prohibited then
			blackboard.stagger = false
		else
			condition_result = not blackboard.about_to_mount
		end
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

	local node_spell_casting = children[6]
	local condition_result = blackboard.ready_to_summon and not blackboard.about_to_mount

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_spell_casting, "aborted")
		Profiler_start("spell_casting")

		local result, evaluate = node_spell_casting.run(node_spell_casting, unit, blackboard, t, dt)

		Profiler_stop("spell_casting")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_spell_casting == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_ground_combat = children[7]
	local condition_result = blackboard.knocked_off_mount or not AiUtils.unit_alive(blackboard.mounted_data.mount_unit)

	if condition_result then
		self.set_running_child(self, unit, blackboard, t, node_ground_combat, "aborted")
		Profiler_start("ground_combat")

		local result, evaluate = node_ground_combat.run(node_ground_combat, unit, blackboard, t, dt)

		Profiler_stop("ground_combat")

		if result ~= "running" then
			self.set_running_child(self, unit, blackboard, t, nil, result)
		end

		if result ~= "failed" then
			return result, evaluate
		end
	elseif node_ground_combat == child_running then
		self.set_running_child(self, unit, blackboard, t, nil, "failed")
	end

	local node_defensive_idle = children[8]

	self.set_running_child(self, unit, blackboard, t, node_defensive_idle, "aborted")
	Profiler_start("defensive_idle")

	local result, evaluate = node_defensive_idle.run(node_defensive_idle, unit, blackboard, t, dt)

	Profiler_stop("defensive_idle")

	if result ~= "running" then
		self.set_running_child(self, unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end

	local node_idle = children[9]

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

	return 
end
BTSelector_grey_seer.add_child = function (self, node)
	self._children[#self._children + 1] = node

	return 
end

return 
