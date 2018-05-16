AIEventHandler = class(AIEventHandler)

AIEventHandler.init = function (self, unit)
	self._unit = unit

	Managers.state.event:register(self, "ai_event_stopped", "ai_stopped", "ai_event_moving", "ai_moving")
end

AIEventHandler.ai_stopped = function (self, unit)
	if self._unit ~= unit then
		return
	end

	local brain = ScriptUnit.extension(self._unit, "ai_system"):brain()

	if brain:has_behaviour("avoidance") then
		brain:change_behaviour("avoidance", "nil_tree")
	end
end

AIEventHandler.ai_moving = function (self, unit)
	if self._unit ~= unit then
		return
	end

	local brain = ScriptUnit.extension(self._unit, "ai_system"):brain()

	if brain:has_behaviour("avoidance") then
		brain:change_behaviour("avoidance", "default_avoidance")
	end
end

return
