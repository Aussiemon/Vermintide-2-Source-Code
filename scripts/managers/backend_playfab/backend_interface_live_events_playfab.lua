local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceLiveEventsPlayfab = class(BackendInterfaceLiveEventsPlayfab)

BackendInterfaceLiveEventsPlayfab.init = function (self, backend_mirror)
	self.is_local = false
	self._backend_mirror = backend_mirror
	self._last_id = 0
	self._live_events = {}
	self._completed_live_event_requests = {}
end

BackendInterfaceLiveEventsPlayfab.ready = function (self)
	return true
end

BackendInterfaceLiveEventsPlayfab.update = function (self, dt)
	return
end

BackendInterfaceLiveEventsPlayfab._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

BackendInterfaceLiveEventsPlayfab.request_live_events = function (self)
	local id = self:_new_id()
	local request = {
		FunctionName = "getLiveEvents",
		FunctionParameter = {
			id = id
		}
	}
	local success_callback = callback(self, "request_live_events_cb", id)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, false)

	return id
end

BackendInterfaceLiveEventsPlayfab.request_live_events_cb = function (self, id, result)
	local function_result = result.FunctionResult
	local live_events_json = function_result.live_events
	local live_events = {}

	if live_events_json then
		live_events = cjson.decode(live_events_json)
	end

	self._live_events = live_events
	self._completed_live_event_requests[id] = true
end

BackendInterfaceLiveEventsPlayfab.live_events_request_complete = function (self, id)
	local complete = self._completed_live_event_requests[id]

	return complete
end

BackendInterfaceLiveEventsPlayfab.get_live_events = function (self)
	return self._live_events
end

return
