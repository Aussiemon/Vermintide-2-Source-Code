require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_shadow_totem = class(BTSelector_shadow_totem, BTNode)
BTSelector_shadow_totem.name = "BTSelector_shadow_totem"

BTSelector_shadow_totem.init = function (self, ...)
	BTSelector_shadow_totem.super.init(self, ...)

	self._children = {}
end

BTSelector_shadow_totem.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_shadow_totem.run = function (self, unit, blackboard, t, dt)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children
	local node_idle = children[1]

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

BTSelector_shadow_totem.add_child = function (self, node)
	self._children[#self._children + 1] = node
end

return
