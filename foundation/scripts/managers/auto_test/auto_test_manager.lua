AutoTestManager = class(AutoTestManager)

AutoTestManager.init = function (self)
	self._funcs = {}
end

AutoTestManager.schedule_functions = function (self, ...)
	self._funcs = {
		...
	}
end

AutoTestManager.update = function (self, dt, t)
	local _, func = next(self._funcs, nil)

	if func and func(dt, t) then
		table.remove(self._funcs, 1)
	end
end

local SIGNALS = {
	reply = "reply",
	ready = "ready"
}

AutoTestManager.ready = function (self)
	self:_signal(SIGNALS.ready)
end

AutoTestManager.reply = function (self, message)
	self:_signal(SIGNALS.reply, message)
end

AutoTestManager._signal = function (self, signal, message)
	if Application.console_send == nil then
		return
	end

	Application.console_send({
		system = "AutoTester",
		type = "signal",
		signal = signal,
		message = tostring(message)
	})
end

return
