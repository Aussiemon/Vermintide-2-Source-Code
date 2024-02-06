-- chunkname: @scripts/managers/telemetry/telemetry_reporters.lua

require("scripts/managers/telemetry/reporters/heartbeat_reporter")

TelemetryReporters = class(TelemetryReporters)
TelemetryReporters.NAME = "TelemetryReporters"

local REPORTER_CLASS_MAP = {
	heartbeat = HeartbeatReporter,
}

TelemetryReporters.init = function (self)
	self._reporters = {}

	self:start_reporter("heartbeat")
end

TelemetryReporters.start_reporter = function (self, name, params)
	local reporter_class = REPORTER_CLASS_MAP[name]

	self._reporters[name] = reporter_class:new(params)
end

TelemetryReporters.stop_reporter = function (self, name)
	self._reporters[name]:report()
	self._reporters[name]:destroy()

	self._reporters[name] = nil
end

TelemetryReporters.reporter = function (self, name)
	return self._reporters[name]
end

TelemetryReporters.update = function (self, dt, t)
	for _, reporter in pairs(self._reporters) do
		reporter:update(dt, t)
	end
end

TelemetryReporters.destroy = function (self)
	for _, reporter in pairs(self._reporters) do
		reporter:destroy()
	end
end

return TelemetryReporters
