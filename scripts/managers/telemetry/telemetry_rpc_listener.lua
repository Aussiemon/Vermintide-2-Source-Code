local RPCS = {
	"rpc_to_client_session_synch"
}
TelemetryRPCListener = class(TelemetryRPCListener)

TelemetryRPCListener.init = function (self, events)
	self._events = events
end

TelemetryRPCListener.register = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(RPCS))
end

TelemetryRPCListener.unregister = function (self, network_event_delegate)
	network_event_delegate:unregister(self)
end

TelemetryRPCListener.rpc_to_client_session_synch = function (self, sender, session_id)
	self._events:session_id(session_id)
end

return
