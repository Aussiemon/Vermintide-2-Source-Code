AIEventHandler = class(AIEventHandler)
AIEventHandler.init = function (self, unit)
	self._unit = unit

	Managers.state.event:register(self, "ai_event_stopped", "ai_stopped", "ai_event_moving", "ai_moving")

	return 
end
AIEventHandler.ai_stopped = function (self, unit)
	if self._unit ~= unit then
		return 
	end

	local brain = ScriptUnit.extension(self._unit, "ai_system"):brain()

	if brain.has_behaviour(brain, "avoidance") then
		brain.change_behaviour(brain, "avoidance", "nil_tree")
	end

	return 
end
AIEventHandler.ai_moving = function (self, unit)
	if self._unit ~= unit then
		return 
	end

	local brain = ScriptUnit.extension(self._unit, "ai_system"):brain()

	if brain.has_behaviour(brain, "avoidance") then
		brain.change_behaviour(brain, "avoidance", "default_avoidance")
	end

	return 
end

return 
