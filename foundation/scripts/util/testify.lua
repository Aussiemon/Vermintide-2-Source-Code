local SIGNALS = {
	current_request = "current_request",
	request = "request",
	reply = "reply",
	ready = "ready",
	end_suite = "end_suite"
}
Testify = {
	_requests = {},
	_responses = {},
	RETRY = newproxy(false)
}
local __raw_print = print

Testify.init = function (self)
	self._requests = {}
	self._responses = {}
end

Testify.ready = function (self)
	printf("[Testify] Ready!")
	self:_signal(SIGNALS.ready)
end

Testify.ready_signal_received = function (self)
	self._ready_signal_received = true
end

Testify.reply = function (self, message)
	self:_signal(SIGNALS.reply, message)
end

Testify.run_case = function (self, test_case)
	self:init()

	self._test_case = coroutine.create(test_case)
end

Testify.update = function (self, dt, t)
	if script_data.testify and not self._ready_signal_received then
		self:_signal(SIGNALS.ready, nil, false)
	end

	if Development.parameter("testify_time_scale") and not self._time_scaled then
		self:_set_time_scale()
	end

	if self._test_case then
		local success, result, end_suite = coroutine.resume(self._test_case, dt, t)

		if not success then
			error(debug.traceback(self._test_case, result))
		elseif coroutine.status(self._test_case) == "dead" then
			self._test_case = nil

			if end_suite == true then
				self:_signal(SIGNALS.end_suite)
			end

			self:_signal(SIGNALS.reply, result)
		end
	end
end

Testify.make_request = function (self, request_name, ...)
	local request_parameters = {
		...
	}

	self:_print("Requesting %s", request_name)

	self._requests[request_name] = request_parameters
	self._responses[request_name] = nil

	return self:_wait_for_response(request_name)
end

Testify.make_request_to_runner = function (self, request_name, ...)
	local request_parameters = {
		...
	}

	self:_print("Requesting %s to the Testify Runner", request_name)

	self._requests[request_name] = request_parameters
	self._responses[request_name] = nil
	local request = {
		name = request_name,
		parameter = request_parameters
	}

	Testify:_signal(SIGNALS.request, cjson.encode(request))

	return self:_wait_for_response(request_name)
end

Testify._wait_for_response = function (self, request_name)
	self:_print("Waiting for response %s", request_name)

	while true do
		coroutine.yield()

		local response = self._responses[request_name]

		if response ~= nil then
			return unpack(response)
		end
	end
end

Testify.poll_requests_through_handler = function (self, callback_table, ...)
	local RETRY = Testify.RETRY

	for request, callback in pairs(callback_table) do
		local args = Testify:poll_request(request)

		if args then
			local ret = {
				callback(unpack(args), ...)
			}

			if ret[1] ~= RETRY then
				Testify:respond_to_request(request, ret)
			end

			return
		end
	end
end

Testify.poll_request = function (self, request_name)
	return self._requests[request_name]
end

Testify.respond_to_request = function (self, request_name, response_value)
	self:_print("Responding to %s", request_name)

	self._requests[request_name] = nil
	self._responses[request_name] = response_value
end

Testify.respond_to_runner_request = function (self, request_name, response_value)
	local value = {
		response_value
	}

	self:_print("Responding to %s", request_name)

	self._requests[request_name] = nil
	self._responses[request_name] = value
end

Testify.print_test_case_marker = function (self)
	__raw_print("<<testify>>test case<</testify>>")
end

Testify.inspect = function (self)
	printf("[Testify] Test case running? %s", self._test_case ~= nil)
	table.dump(self._requests, "[Testify] Requests", 2)
	table.dump(self._responses, "[Testify] Responses", 2)
end

Testify._set_time_scale = function (self)
	local debug_manager = Managers.state.debug

	if not debug_manager then
		return
	end

	local scale = Development.parameter("testify_time_scale")
	local time_scale_index = table.index_of(debug_manager.time_scale_list, tonumber(scale))
	self._time_scaled = true

	if time_scale_index == -1 then
		printf("[Testify] Time Scale %s is not supported. Please chose a value from the following list:%s", scale, table.dump_string(debug_manager.time_scale_list, 1))

		return
	end

	debug_manager:set_time_scale(time_scale_index)
end

Testify._signal = function (self, signal, message, print_signal)
	if print_signal ~= false then
		self:_print("Replying to signal %s %s", signal, message)
	end

	if Application.console_send == nil then
		return
	end

	Application.console_send({
		system = "Testify",
		type = "signal",
		signal = signal,
		message = tostring(message)
	})
end

Testify._print = function (self, ...)
	if Development.parameter("debug_testify") then
		printf("[Testify] %s", string.format(...))
	end
end

Testify.current_request_name = function (self)
	local requests = self._requests
	local request_name, _ = next(requests)

	self:_print("Current request name: %s", request_name)
	self:_signal(SIGNALS.current_request, request_name)
end
