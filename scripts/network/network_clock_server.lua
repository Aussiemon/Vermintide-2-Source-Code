NetworkClockServer = class(NetworkClockServer)
local RPCS = {
	"rpc_network_clock_sync_request",
	"rpc_network_current_server_time_request"
}
NetworkClockServer.init = function (self)
	self._clock = 0

	return 
end
NetworkClockServer.register_rpcs = function (self, network_event_delegate)
	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate

	return 
end
NetworkClockServer.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	return 
end
NetworkClockServer.synchronized = function (self)
	return true
end
NetworkClockServer.time = function (self)
	return self._clock
end
NetworkClockServer.update = function (self, dt)
	self._update_clock(self, dt)

	if Development.parameter("network_clock_debug") then
		self._debug_stuff(self, dt)
	end

	return 
end
NetworkClockServer._update_clock = function (self, delta)
	self._clock = self._clock + delta

	return 
end
NetworkClockServer.destroy = function (self)
	return 
end
NetworkClockServer._debug_stuff = function (self, dt)
	local debug_text_manager = Managers.state.debug_text

	if debug_text_manager then
		local text = tostring(math.floor(self._clock))

		debug_text_manager.output_screen_text(debug_text_manager, text, 22, 0.1)
	end

	return 
end
NetworkClockServer.rpc_network_clock_sync_request = function (self, sender, client_time)
	RPC.rpc_network_time_sync_response(sender, client_time, self._clock)

	return 
end
NetworkClockServer.rpc_network_current_server_time_request = function (self, sender, client_time)
	RPC.rpc_network_current_server_time_response(sender, client_time, self._clock)

	return 
end

return 
