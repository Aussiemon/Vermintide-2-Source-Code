﻿-- chunkname: @scripts/managers/telemetry/telemetry_rpc_listener.lua

local RPCS = {
	"rpc_to_client_sync_session_id",
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

TelemetryRPCListener.rpc_to_client_sync_session_id = function (self, channel_id, session_id)
	print("[TelemetryRPCListener] Receiving session id from server", session_id)
	self._events:server_session_id(session_id)
end
