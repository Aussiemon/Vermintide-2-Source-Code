require("scripts/managers/telemetry/curl_token")
require("scripts/managers/telemetry/telemetry_events_dummy")
require("scripts/managers/telemetry/telemetry_rpc_listener")

TelemetryManagerDummy = class(TelemetryManagerDummy)

TelemetryManagerDummy.init = function (self)
	self.events = TelemetryEventsDummy:new(self)
	self.rpc_listener = TelemetryRPCListener:new(self.events)
end

TelemetryManagerDummy.reset = function (self)
	return
end

TelemetryManagerDummy.reload_settings = function (self)
	return
end

TelemetryManagerDummy.update = function (self, dt)
	return
end

TelemetryManagerDummy.register_event = function (self, event_type, event_params)
	return
end

TelemetryManagerDummy.send = function (self)
	return
end

return
