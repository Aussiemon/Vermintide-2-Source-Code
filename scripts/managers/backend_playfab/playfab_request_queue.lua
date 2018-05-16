PlayFabRequestQueue = class(PlayFabRequestQueue)

PlayFabRequestQueue.init = function (self)
	self._queue = {}
	self._pending_request = false
end

PlayFabRequestQueue.enqueue = function (self, name, request, immediate)
	local entry = {
		name = name,
		request = request
	}

	if immediate then
		self:send_request(entry)

		self._pending_request = false
	else
		print("[PlayFabRequestQueue] Enqueuing request", name, #self._queue)
		table.insert(self._queue, entry)
	end
end

PlayFabRequestQueue.update = function (self)
	if self._pending_request then
		return
	end

	if table.is_empty(self._queue) then
		return
	end

	local entry = table.remove(self._queue, 1)

	self:send_request(entry)
end

PlayFabRequestQueue.send_request = function (self, entry)
	print("[PlayFabRequestQueue] Sending request", entry.name)
	entry.request.callback(entry.request.payload, function ()
		print("[PlayFabRequestQueue] Request processed", entry.name)

		self._pending_request = false
	end)

	self._pending_request = true
end

return
